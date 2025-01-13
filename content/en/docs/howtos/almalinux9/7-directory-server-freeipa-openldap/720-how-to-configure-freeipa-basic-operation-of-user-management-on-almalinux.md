---
title: How to Configure FreeIPA Basic Operation of User Management on AlmaLinux
linkTitle: Configure FreeIPA Basic Operation of User Management
description: FreeIPA is a robust and open-source identity management solution that integrates various services such as LDAP, Kerberos, DNS, and more into a centralized platform.
date: 2024-12-13
weight: 720
url: configure-freeipa-basic-operation-user-management-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---

### **Introduction**

FreeIPA is a robust and open-source identity management solution that integrates various services such as LDAP, Kerberos, DNS, and more into a centralized platform. It simplifies the management of user identities, policies, and access control across a network. AlmaLinux, a popular CentOS alternative, is an excellent choice for hosting FreeIPA due to its enterprise-grade stability and compatibility. In this guide, we will explore how to configure FreeIPA for basic user management on AlmaLinux.

---

#### Prerequisites

Before proceeding, ensure that the following requirements are met:

1. **AlmaLinux Server:** A fresh installation of AlmaLinux 8 or later.
2. **Root Access:** Administrative privileges on the AlmaLinux server.
3. **DNS Setup:** A functioning DNS server or the ability to configure DNS records for FreeIPA.
4. **System Updates:** Update your AlmaLinux system by running:

   ```bash
   sudo dnf update -y
   ```

5. **Hostname Configuration:** Assign a fully qualified domain name (FQDN) to the server. For example:

   ```bash
   sudo hostnamectl set-hostname ipa.example.com
   ```

6. **Firewall:** Ensure that the necessary ports for FreeIPA (e.g., 389, 636, 88, 464, and 80) are open.

---

### Step 1: Install FreeIPA Server

1. **Enable FreeIPA Repository:**

   AlmaLinux provides FreeIPA packages in its default repositories. Begin by enabling the required modules:

   ```bash
   sudo dnf module enable idm:DL1 -y
   ```

2. **Install FreeIPA Server:**

   Install the server packages and their dependencies using the following command:

   ```bash
   sudo dnf install freeipa-server -y
   ```

3. **Install Optional Dependencies:**

   For a complete setup, install additional packages such as the DNS server:

   ```bash
   sudo dnf install freeipa-server-dns -y
   ```

---

### Step 2: Configure FreeIPA Server

1. **Run the Setup Script:**

   FreeIPA provides an interactive script for server configuration. Execute it with:

   ```bash
   sudo ipa-server-install
   ```

   During the installation, you will be prompted for:
   - **Server hostname:** Verify the FQDN.
   - **Domain name:** Provide the domain name, e.g., `example.com`.
   - **Kerberos realm:** Typically the uppercase version of the domain name, e.g., `EXAMPLE.COM`.
   - **DNS configuration:** Choose whether to configure DNS (if not already set up).

   Example output:

   ```bash
   The log file for this installation can be found in /var/log/ipaserver-install.log
   Configuring NTP daemon (chronyd)
   Configuring directory server (dirsrv)
   Configuring Kerberos KDC (krb5kdc)
   Configuring kadmin
   Configuring certificate server (pki-tomcatd)
   ```

2. **Verify Installation:**

   After installation, check the status of FreeIPA services:

   ```bash
   sudo ipa-healthcheck
   ```

---

### Step 3: Basic User Management

#### 3.1 Accessing FreeIPA Interface

FreeIPA provides a web-based interface for management. Access it by navigating to:

```html
https://ipa.example.com
```

Log in with the admin credentials created during the setup.

#### 3.2 Adding a User

1. **Using Web Interface:**
   - Navigate to the **Identity** tab.
   - Select **Users** > **Add User**.
   - Fill in the required fields, such as Username, First Name, and Last Name.
   - Click **Add and Edit** to save the user.

2. **Using Command Line:**

   FreeIPA's CLI allows user management. Use the following command to add a user:

   ```bash
   ipa user-add john --first=John --last=Doe --password
   ```

   You will be prompted to set an initial password.

#### 3.3 Modifying User Information

To update user details, use the CLI or web interface:

- **CLI Example:**

  ```bash
  ipa user-mod john --email=john.doe@example.com
  ```

- **Web Interface:** Navigate to the user's profile, make changes, and save.

#### 3.4 Deleting a User

Remove a user account when it is no longer needed:

```bash
ipa user-del john
```

#### 3.5 User Group Management

Groups allow collective management of permissions. To create and manage groups:

1. **Create a Group:**

   ```bash
   ipa group-add developers --desc="Development Team"
   ```

2. **Add a User to a Group:**

   ```bash
   ipa group-add-member developers --users=john
   ```

3. **View Group Members:**

   ```bash
   ipa group-show developers
   ```

---

### Step 4: Configuring Access Controls

FreeIPA uses HBAC (Host-Based Access Control) rules to manage user permissions. To create an HBAC rule:

1. **Define the Rule:**

   ```bash
   ipa hbacrule-add "Allow Developers"
   ```

2. **Assign Users and Groups:**

   ```bash
   ipa hbacrule-add-user "Allow Developers" --groups=developers
   ```

3. **Define Services:**

   ```bash
   ipa hbacrule-add-service "Allow Developers" --hbacsvcs=ssh
   ```

4. **Apply the Rule to Hosts:**

   ```bash
   ipa hbacrule-add-host "Allow Developers" --hosts=server.example.com
   ```

---

### Step 5: Testing and Maintenance

1. **Test User Login:**
   Use SSH to log in as a FreeIPA-managed user:

   ```bash
   ssh john@server.example.com
   ```

2. **Monitor Logs:**
   Review logs for any issues:

   ```bash
   sudo tail -f /var/log/krb5kdc.log
   sudo tail -f /var/log/httpd/access_log
   ```

3. **Backup FreeIPA Configuration:**
   Regularly back up the configuration using:

   ```bash
   sudo ipa-backup
   ```

4. **Update FreeIPA:**
   Keep FreeIPA updated to the latest version:

   ```bash
   sudo dnf update -y
   ```

---

## **Conclusion**

FreeIPA is a powerful tool for centralizing identity management. By following this guide, you can set up and manage users effectively on AlmaLinux. With features like user groups, access controls, and a web-based interface, FreeIPA simplifies the complexities of enterprise-grade identity management. Regular maintenance and testing will ensure a secure and efficient system. For advanced configurations, explore FreeIPA's documentation to unlock its full potential.
