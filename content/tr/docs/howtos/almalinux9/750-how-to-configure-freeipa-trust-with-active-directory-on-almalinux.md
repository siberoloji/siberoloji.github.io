---
title: How to Configure FreeIPA Trust with Active Directory
linkTitle: FreeIPA trust with Active Directory
description: This guide will take you through the steps to configure FreeIPA trust with Active Directory on AlmaLinux, focusing on ease of implementation and clarity.
date: 2024-12-14
weight: 750
url: configure-freeipa-trust-active-directory-almalinux
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
In a modern enterprise environment, integrating different identity management systems is often necessary for seamless operations. FreeIPA, a robust open-source identity management system, can be configured to establish trust with Microsoft Active Directory (AD). This enables users from AD domains to access resources managed by FreeIPA, facilitating centralized authentication and authorization across hybrid environments.

This guide will take you through the steps to configure FreeIPA trust with Active Directory on AlmaLinux, focusing on ease of implementation and clarity.

---

### **What is FreeIPA-Active Directory Trust?**

FreeIPA-AD trust is a mechanism that allows users from an Active Directory domain to access resources in a FreeIPA domain without duplicating accounts. The trust relationship relies on Kerberos and LDAP protocols to establish secure communication, eliminating the need for complex account synchronizations.

---

### **Prerequisites for Configuring FreeIPA Trust with Active Directory**

Before beginning the configuration, ensure the following prerequisites are met:

#### **System Requirements:**

1. **AlmaLinux Server:** FreeIPA is installed and functioning on AlmaLinux.
2. **Windows Server:** Active Directory is properly set up and operational.
3. **Network Connectivity:** Both FreeIPA and AD servers must resolve each other's hostnames via DNS.

#### **Software Dependencies:**

1. FreeIPA version 4.2 or later.
2. `samba`, `realmd`, and other required packages installed on AlmaLinux.

#### **Administrative Privileges:**

Root access on the FreeIPA server and administrative credentials for Active Directory.

#### **DNS Configuration:**

1. Ensure DNS zones for FreeIPA and AD are correctly configured.
2. Create DNS forwarders if the servers are on different networks.

#### **Time Synchronization:**

1. Use `chronyd` or `ntpd` to synchronize system clocks on both servers.

---

### **Step 1: Install and Configure FreeIPA on AlmaLinux**

If FreeIPA is not already installed on your AlmaLinux server, follow these steps:

1. **Update AlmaLinux:**

   ```bash
   sudo dnf update -y
   ```

2. **Install FreeIPA:**

   ```bash
   sudo dnf install -y freeipa-server freeipa-server-dns
   ```

3. **Set Up FreeIPA:**
   Run the setup script and configure the domain:

   ```bash
   sudo ipa-server-install
   ```

   Provide the necessary details like realm name, domain name, and administrative passwords.

4. **Verify Installation:**
   Ensure all services are running:

   ```bash
   sudo systemctl status ipa
   ```

---

### **Step 2: Prepare Active Directory for Trust**

1. **Log In to the AD Server:**
   Use an account with administrative privileges.

2. **Enable Forest Functional Level:**
   Ensure that the forest functional level is set to at least **Windows Server 2008 R2**. This is required for establishing trust.

3. **Create a DNS Forwarder:**
   In the Active Directory DNS manager, add a forwarder pointing to the FreeIPA server's IP address.

4. **Check Domain Resolution:**
   From the AD server, test DNS resolution for the FreeIPA domain:

   ```powershell
   nslookup ipa.example.com
   ```

---

### **Step 3: Configure DNS Forwarding in FreeIPA**

1. **Update DNS Forwarder:**
   On the FreeIPA server, add a forwarder to resolve the AD domain:

   ```bash
   sudo ipa dnsforwardzone-add ad.example.com --forwarder=192.168.1.1
   ```

   Replace `ad.example.com` and `192.168.1.1` with your AD domain and DNS server IP.

2. **Verify DNS Resolution:**
   Test the resolution of the AD domain from the FreeIPA server:

   ```bash
   dig @localhost ad.example.com
   ```

---

### **Step 4: Install Samba and Trust Dependencies**

To establish trust, you need to install Samba and related dependencies:

1. **Install Required Packages:**

   ```bash
   sudo dnf install -y samba samba-common-tools ipa-server-trust-ad
   ```

2. **Enable Samba Services:**

   ```bash
   sudo systemctl enable smb
   sudo systemctl start smb
   ```

---

### **Step 5: Establish the Trust Relationship**

1. **Prepare FreeIPA for Trust:**
   Enable AD trust capabilities:

   ```bash
   sudo ipa-adtrust-install
   ```

   When prompted, confirm that you want to enable the trust functionality.

2. **Establish Trust with AD:**
   Use the following command to create the trust relationship:

   ```bash
   sudo ipa trust-add --type=ad ad.example.com --admin Administrator --password
   ```

   Replace `ad.example.com` with your AD domain name and provide the AD administrator’s credentials.

3. **Verify Trust:**
   Confirm that the trust was successfully established:

   ```bash
   sudo ipa trust-show ad.example.com
   ```

---

### **Step 6: Test the Trust Configuration**

1. **Create a Test User in AD:**
   Log in to your Active Directory server and create a test user.

2. **Check User Availability in FreeIPA:**
   On the FreeIPA server, verify that the AD user can be resolved:

   ```bash
   id testuser@ad.example.com
   ```

3. **Assign Permissions to AD Users:**
   Add AD users to FreeIPA groups or assign roles:

   ```bash
   sudo ipa group-add-member ipausers --external testuser@ad.example.com
   ```

4. **Test Authentication:**
   Attempt to log in to a FreeIPA-managed system using the AD user credentials.

---

### **Step 7: Troubleshooting Common Issues**

If you encounter problems, consider these troubleshooting tips:

#### **DNS Resolution Issues:**

- Verify forwarders and ensure proper entries in `/etc/resolv.conf`.
- Use `dig` or `nslookup` to test DNS.

#### **Kerberos Authentication Issues:**

- Check the Kerberos configuration in `/etc/krb5.conf`.
- Ensure the AD and FreeIPA realms are properly configured.

#### **Time Synchronization Problems:**

- Verify `chronyd` or `ntpd` is running and synchronized:

  ```bash
  chronyc tracking
  ```

#### **Samba Configuration Errors:**

- Review Samba logs for errors:

  ```bash
  sudo journalctl -u smb
  ```

---

### **Benefits of FreeIPA-AD Trust**

1. **Centralized Management:**
   Simplifies identity and access management across heterogeneous environments.

2. **Reduced Complexity:**
   Eliminates the need for manual account synchronization or duplication.

3. **Enhanced Security:**
   Leverages Kerberos for secure authentication and data integrity.

4. **Improved User Experience:**
   Allows users to seamlessly access resources across domains without multiple credentials.

---

### **Conclusion**

Configuring FreeIPA trust with Active Directory on AlmaLinux can significantly enhance the efficiency and security of your hybrid identity management environment. By following this guide, you can establish a robust trust relationship, enabling seamless integration between FreeIPA and AD domains. Regularly monitor and maintain the setup to ensure optimal performance and security.

Start building your FreeIPA-AD integration today for a streamlined, unified authentication experience.
