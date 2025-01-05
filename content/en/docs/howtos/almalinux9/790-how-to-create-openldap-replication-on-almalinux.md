---
title: How to Create OpenLDAP Replication on AlmaLinux
linkTitle: null
description: Learn how to configure OpenLDAP replication on AlmaLinux for high availability and fault tolerance. Follow this detailed step-by-step guide to set up and test LDAP replication.
date: 2024-12-14
weight: 790
url: create-openldap-replication-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
---
OpenLDAP is a widely used, open-source directory service protocol that allows administrators to manage and authenticate users across networked systems. As network environments grow, ensuring high availability and fault tolerance becomes essential. OpenLDAP replication addresses these needs by synchronizing directory data between a master server (Provider) and one or more replicas (Consumers).

In this comprehensive guide, we will walk through the process of creating OpenLDAP replication on AlmaLinux, enabling you to maintain a robust, synchronized directory service.

---

### **1. What is OpenLDAP Replication?**

OpenLDAP replication is a process where data from a master LDAP server (Provider) is duplicated to one or more replica servers (Consumers). This ensures data consistency and provides redundancy for high availability.

---

### **2. Why Configure Replication?**

Setting up OpenLDAP replication offers several benefits:

- **High Availability:** Ensures uninterrupted service if the master server becomes unavailable.
- **Load Balancing:** Distributes authentication requests across multiple servers.
- **Disaster Recovery:** Provides a backup of directory data on secondary servers.
- **Geographical Distribution:** Improves performance for users in different locations by placing Consumers closer to them.

---

### **3. Types of OpenLDAP Replication**

OpenLDAP supports three replication modes:

1. **RefreshOnly:** The Consumer periodically polls the Provider for updates.
2. **RefreshAndPersist:** The Consumer maintains an ongoing connection and receives real-time updates.
3. **Delta-SyncReplication:** Optimized for large directories, only changes (not full entries) are replicated.

For this guide, we’ll use the **RefreshAndPersist** mode, which is ideal for most environments.

---

### **4. Prerequisites**

Before configuring replication, ensure the following:

1. **LDAP Installed:** Both Provider and Consumer servers have OpenLDAP installed.

   ```bash
   sudo dnf install openldap openldap-servers -y
   ```

2. **Network Connectivity:** Both servers can communicate with each other.
3. **Base DN and Admin Credentials:** The directory structure and admin DN (Distinguished Name) are consistent across both servers.
4. **TLS Configuration (Optional):** For secure communication, set up TLS on both servers.

---

### **5. Configuring the Provider (Master)**

The Provider server acts as the master, sending updates to the Consumer.

#### **Step 1: Enable Accesslog Overlay**

The Accesslog overlay is used to log changes on the Provider server, which are sent to the Consumer.

Create an LDIF file (`accesslog.ldif`) to configure the Accesslog database:

```ldif
dn: olcOverlay=accesslog,olcDatabase={2}hdb,cn=config
objectClass: olcOverlayConfig
objectClass: olcAccessLogConfig
olcOverlay: accesslog
olcAccessLogDB: cn=accesslog
olcAccessLogOps: writes
olcAccessLogSuccess: TRUE
olcAccessLogPurge: 7+00:00 1+00:00
```

Apply the configuration:

```bash
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f accesslog.ldif
```

#### **Step 2: Configure SyncProvider Overlay**

Create an LDIF file (`syncprov.ldif`) for the SyncProvider overlay:

```ldif
dn: olcOverlay=syncprov,olcDatabase={2}hdb,cn=config
objectClass: olcOverlayConfig
objectClass: olcSyncProvConfig
olcOverlay: syncprov
olcSyncProvCheckpoint: 100 10
olcSyncProvSessionlog: 100
```

Apply the configuration:

```bash
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f syncprov.ldif
```

#### **Step 3: Adjust ACLs**

Update ACLs to allow replication by creating an LDIF file (`provider-acl.ldif`):

```ldif
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcAccess
olcAccess: to * by dn="cn=admin,dc=example,dc=com" write by * read
```

Apply the ACL changes:

```bash
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f provider-acl.ldif
```

#### **Step 4: Restart OpenLDAP**

Restart the OpenLDAP service to apply changes:

```bash
sudo systemctl restart slapd
```

---

### **6. Configuring the Consumer (Replica)**

The Consumer server receives updates from the Provider.

#### **Step 1: Configure SyncRepl**

Create an LDIF file (`consumer-sync.ldif`) to configure synchronization:

```ldif
dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcSyncRepl
olcSyncRepl: rid=001
  provider=ldap://<provider-server-ip>
  bindmethod=simple
  binddn="cn=admin,dc=example,dc=com"
  credentials=admin_password
  searchbase="dc=example,dc=com"
  scope=sub
  schemachecking=on
  type=refreshAndPersist
  retry="60 +"
```

Replace `<provider-server-ip>` with the Provider’s IP or hostname.

Apply the configuration:

```bash
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f consumer-sync.ldif
```

#### **Step 2: Adjust ACLs**

Ensure ACLs on the Provider allow the Consumer to bind using the provided credentials.

#### **Step 3: Test Connectivity**

Test the connection from the Consumer to the Provider:

```bash
ldapsearch -H ldap://<provider-server-ip> -D "cn=admin,dc=example,dc=com" -W -b "dc=example,dc=com"
```

#### **Step 4: Restart OpenLDAP**

Restart the Consumer’s OpenLDAP service:

```bash
sudo systemctl restart slapd
```

---

### **7. Testing OpenLDAP Replication**

#### **Add an Entry on the Provider**

Add a test entry on the Provider:

```ldif
dn: uid=testuser,ou=People,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
cn: Test User
sn: User
uid: testuser
uidNumber: 1001
gidNumber: 1001
homeDirectory: /home/testuser
```

Apply the entry:

```bash
ldapadd -x -D "cn=admin,dc=example,dc=com" -W -f testuser.ldif
```

#### **Check the Entry on the Consumer**

Query the Consumer to confirm the entry is replicated:

```bash
ldapsearch -x -b "dc=example,dc=com" "(uid=testuser)"
```

If the entry appears on the Consumer, replication is successful.

---

### **8. Troubleshooting Common Issues**

#### **Error: Failed to Bind to Provider**

- Verify the Provider’s IP and credentials in the Consumer configuration.
- Ensure the Provider is reachable via the network.

#### **Error: Replication Not Working**

- Check logs on both servers:

  ```bash
  sudo journalctl -u slapd
  ```

- Verify SyncRepl settings and ACLs on the Provider.

#### **TLS Connection Errors**

- Ensure TLS is configured correctly on both Provider and Consumer.
- Update the `ldap.conf` file with the correct CA certificate path.

---

### **9. Conclusion**

Configuring OpenLDAP replication on AlmaLinux enhances directory service reliability, scalability, and availability. By following this guide, you can set up a robust Provider-Consumer replication model, ensuring that your directory data remains synchronized and accessible across your network.

With replication in place, your LDAP infrastructure can handle load balancing, disaster recovery, and high availability, making it a cornerstone of modern network administration.
