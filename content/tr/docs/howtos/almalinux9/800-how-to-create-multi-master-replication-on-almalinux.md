---
title: How to Create Multi-Master Replication on AlmaLinux
linkTitle: Create Multi-Master Replication
description: Learn how to set up OpenLDAP Multi-Master Replication on AlmaLinux for high availability and fault tolerance. Follow this detailed step-by-step guide.
date: 2024-12-14
weight: 800
url: create-multi-master-replication-almalinux
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
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
OpenLDAP Multi-Master Replication (MMR) is an advanced setup that allows multiple LDAP servers to act as both providers and consumers. This ensures redundancy, fault tolerance, and high availability, enabling updates to be made on any server and synchronized across all others in real-time. In this guide, we will explore how to create a Multi-Master Replication setup on AlmaLinux, a stable, enterprise-grade Linux distribution.

---

### **1. What is Multi-Master Replication?**

Multi-Master Replication (MMR) in OpenLDAP allows multiple servers to operate as masters. This means that changes can be made on any server, and these changes are propagated to all other servers in the replication group.

---

### **2. Benefits of Multi-Master Replication**

MMR offers several advantages:

- **High Availability:** If one server fails, others can continue to handle requests.
- **Load Balancing:** Distribute client requests across multiple servers.
- **Fault Tolerance:** Avoid single points of failure.
- **Geographical Distribution:** Place servers closer to users for better performance.

---

### **3. Prerequisites**

Before setting up Multi-Master Replication, ensure the following:

1. **Two AlmaLinux Servers:** These will act as the masters.
2. **OpenLDAP Installed:** Both servers should have OpenLDAP installed and configured.

   ```bash
   sudo dnf install openldap openldap-servers -y
   ```

3. **Network Connectivity:** Both servers should communicate with each other.
4. **Base DN Consistency:** The same Base DN and schema should be configured on both servers.
5. **Admin Credentials:** Ensure you have admin DN and password for both servers.

---

### **4. Setting Up Multi-Master Replication on AlmaLinux**

The configuration involves setting up replication overlays and ensuring bidirectional synchronization between the two servers.

---

#### **Step 1: Configuring the First Master**

1. **Enable SyncProv Overlay**

Create an LDIF file (`syncprov.ldif`) to enable the SyncProv overlay:

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
ldapadd -Y EXTERNAL -H ldapi:/// -f syncprov.ldif
```

2. **Configure Multi-Master Sync**

Create an LDIF file (`mmr-config.ldif`) for Multi-Master settings:

```ldif
dn: cn=config
changetype: modify
add: olcServerID
olcServerID: 1 ldap://<first-master-ip>

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcSyncRepl
olcSyncRepl: rid=002
  provider=ldap://<second-master-ip>
  bindmethod=simple
  binddn="cn=admin,dc=example,dc=com"
  credentials=admin_password
  searchbase="dc=example,dc=com"
  scope=sub
  schemachecking=on
  type=refreshAndPersist
  retry="60 +"

add: olcMirrorMode
olcMirrorMode: TRUE
```

Replace `<first-master-ip>` and `<second-master-ip>` with the respective IP addresses of the masters. Update the `binddn` and `credentials` values with your LDAP admin DN and password.

Apply the configuration:

```bash
ldapmodify -Y EXTERNAL -H ldapi:/// -f mmr-config.ldif
```

3. **Restart OpenLDAP**

```bash
sudo systemctl restart slapd
```

---

#### **Step 2: Configuring the Second Master**

Repeat the same steps for the second master, with a few adjustments.

1. **Enable SyncProv Overlay**

The SyncProv overlay configuration is the same as the first master.

2. **Configure Multi-Master Sync**

Create an LDIF file (`mmr-config.ldif`) for the second master:

```ldif
dn: cn=config
changetype: modify
add: olcServerID
olcServerID: 2 ldap://<second-master-ip>

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcSyncRepl
olcSyncRepl: rid=001
  provider=ldap://<first-master-ip>
  bindmethod=simple
  binddn="cn=admin,dc=example,dc=com"
  credentials=admin_password
  searchbase="dc=example,dc=com"
  scope=sub
  schemachecking=on
  type=refreshAndPersist
  retry="60 +"

add: olcMirrorMode
olcMirrorMode: TRUE
```

Again, replace `<first-master-ip>` and `<second-master-ip>` accordingly.

Apply the configuration:

```bash
ldapmodify -Y EXTERNAL -H ldapi:/// -f mmr-config.ldif
```

3. **Restart OpenLDAP**

```bash
sudo systemctl restart slapd
```

---

### **5. Testing the Multi-Master Replication**

1. **Add an Entry on the First Master**

Create a test entry on the first master:

```ldif
dn: uid=testuser1,ou=People,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: top
cn: Test User 1
sn: User
uid: testuser1
uidNumber: 1001
gidNumber: 1001
homeDirectory: /home/testuser1
```

Apply the entry:

```bash
ldapadd -x -D "cn=admin,dc=example,dc=com" -W -f testuser1.ldif
```

2. **Verify on the Second Master**

Query the second master for the new entry:

```bash
ldapsearch -x -LLL -b "dc=example,dc=com" "(uid=testuser1)"
```

3. **Add an Entry on the Second Master**

Create a test entry on the second master:

```ldif
dn: uid=testuser2,ou=People,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: top
cn: Test User 2
sn: User
uid: testuser2
uidNumber: 1002
gidNumber: 1002
homeDirectory: /home/testuser2
```

Apply the entry:

```bash
ldapadd -x -D "cn=admin,dc=example,dc=com" -W -f testuser2.ldif
```

4. **Verify on the First Master**

Query the first master for the new entry:

```bash
ldapsearch -x -LLL -b "dc=example,dc=com" "(uid=testuser2)"
```

If both entries are visible on both servers, your Multi-Master Replication setup is working correctly.

---

### **6. Troubleshooting Common Issues**

#### **Error: Changes Not Synchronizing**

- Ensure both servers can communicate over the network.
- Verify that `olcServerID` and `olcSyncRepl` configurations match.

#### **Error: Authentication Failure**

- Confirm the `binddn` and `credentials` are correct.
- Check ACLs to ensure replication binds are allowed.

#### **Replication Conflicts**

- Check logs on both servers for conflict resolution messages.
- Avoid simultaneous edits to the same entry from multiple servers.

#### **TLS/SSL Issues**

- Ensure both servers trust each other’s certificates if using TLS.
- Update `ldap.conf` with the correct CA certificate path.

---

### **7. Conclusion**

Multi-Master Replication on AlmaLinux enhances the reliability and scalability of your OpenLDAP directory service. By following this guide, you can configure a robust MMR setup, ensuring consistent and synchronized data across multiple servers. This configuration is ideal for organizations requiring high availability and fault tolerance for their directory services.

With proper testing and monitoring, your Multi-Master Replication setup will be a cornerstone of your network infrastructure, providing seamless and redundant directory services.
