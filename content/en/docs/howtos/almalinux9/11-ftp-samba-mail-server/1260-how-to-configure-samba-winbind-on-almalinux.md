---
title: How to Configure Samba Winbind on AlmaLinux
linkTitle: Configure Samba Winbind
description: This guide will walk you through installing and configuring Samba Winbind on AlmaLinux, allowing Linux users to authenticate using Windows domain credentials.
date: 2024-12-23
weight: 1260
url: configure-samba-winbind-almalinux
draft: false
tags:
  - AlmaLinux
  - samba
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-configure-samba-winbind-on-almalinux
keywords:
  - AlmaLinux
  - samba
featured_image: /images/almalinux.webp
---
#### **Introduction**  

Samba is a versatile tool that enables seamless integration of Linux systems into Windows-based networks, making it possible to share files, printers, and authentication services. One of Samba’s powerful components is **Winbind**, a service that allows Linux systems to authenticate against Windows Active Directory (AD) and integrate user and group information from the domain.  

AlmaLinux, a popular enterprise-grade Linux distribution, is an excellent platform for setting up Winbind to enable Active Directory authentication. This guide will walk you through installing and configuring Samba Winbind on AlmaLinux, allowing Linux users to authenticate using Windows domain credentials.  

---

#### **What is Winbind?**  

Winbind is part of the Samba suite, providing:  

1. **User Authentication**: Allows Linux systems to authenticate users against Windows AD.  
2. **User and Group Mapping**: Maps AD users and groups to Linux equivalents for file permissions and processes.  
3. **Seamless Integration**: Enables centralized authentication for hybrid environments.  

Winbind is particularly useful in environments where Linux servers must integrate tightly with Windows AD for authentication and resource sharing.  

---

#### **Prerequisites**  

To follow this guide, ensure you have:  

1. **A Windows Active Directory Domain**:  
   - Access to a domain controller with necessary credentials.  
   - A working AD environment (e.g., `example.com`).  

2. **An AlmaLinux System**:  
   - A clean installation of AlmaLinux with sudo/root access.  
   - Static IP configuration for reliability in the network.  

3. **Network Configuration**:  
   - The Linux system and the AD server must be able to communicate over the network.  
   - Firewall rules allowing Samba traffic.  

---

#### **Step 1: Install Samba, Winbind, and Required Packages**  

Begin by installing the necessary packages on the AlmaLinux server.  

1. **Update the System**:  
   Update system packages to ensure compatibility:  

   ```bash
   sudo dnf update -y
   ```  

2. **Install Samba and Winbind**:  
   Install Samba, Winbind, and associated utilities:  

   ```bash
   sudo dnf install samba samba-winbind samba-client samba-common oddjob-mkhomedir -y
   ```  

3. **Start and Enable Services**:  
   Start and enable Winbind and other necessary services:  

   ```bash
   sudo systemctl start winbind
   sudo systemctl enable winbind
   sudo systemctl start smb
   sudo systemctl enable smb
   ```  

---

#### **Step 2: Configure Samba for Active Directory Integration**  

The next step is configuring Samba to join the Active Directory domain.  

1. **Edit the Samba Configuration File**:  
   Open the Samba configuration file:  

   ```bash
   sudo nano /etc/samba/smb.conf
   ```  

2. **Modify the Configuration**:  
   Replace or update the `[global]` section with the following:  

   ```plaintext
   [global]
   workgroup = EXAMPLE
   security = ads
   realm = EXAMPLE.COM
   encrypt passwords = yes

   idmap config * : backend = tdb
   idmap config * : range = 10000-20000

   idmap config EXAMPLE : backend = rid
   idmap config EXAMPLE : range = 20001-30000

   winbind use default domain = yes
   winbind enum users = yes
   winbind enum groups = yes

   template shell = /bin/bash
   template homedir = /home/%U
   ```  

   Replace `EXAMPLE` and `EXAMPLE.COM` with your domain name and realm.  

3. **Save and Test Configuration**:  
   Save the file (`CTRL+O`, `Enter`, `CTRL+X`) and test the configuration:  

   ```bash
   sudo testparm
   ```  

---

#### **Step 3: Join the AlmaLinux System to the AD Domain**  

Once Samba is configured, the next step is to join the system to the domain.  

1. **Ensure Proper DNS Resolution**:  
   Verify that the AlmaLinux server can resolve the AD domain:  

   ```bash
   ping -c 4 example.com
   ```  

2. **Join the Domain**:  
   Use the `net` command to join the domain:  

   ```bash
   sudo net ads join -U Administrator
   ```  

   Replace `Administrator` with a user account that has domain-joining privileges.  

3. **Verify the Join**:  
   Check if the system is listed in the AD domain:  

   ```bash
   sudo net ads testjoin
   ```  

---

#### **Step 4: Configure NSS and PAM for Domain Authentication**  

To allow AD users to log in, configure NSS (Name Service Switch) and PAM (Pluggable Authentication Module).  

1. **Edit NSS Configuration**:  
   Update the `/etc/nsswitch.conf` file to include `winbind`:  

   ```plaintext
   passwd:     files winbind
   shadow:     files winbind
   group:      files winbind
   ```  

2. **Configure PAM Authentication**:  
   Use the `authconfig` tool to set up PAM for Winbind:  

   ```bash
   sudo authconfig --enablewinbind --enablewinbindauth \
   --smbsecurity=ads --smbworkgroup=EXAMPLE \
   --smbrealm=EXAMPLE.COM --enablemkhomedir --updateall
   ```  

3. **Create Home Directories Automatically**:  
   The `oddjob-mkhomedir` service ensures home directories are created for domain users:  

   ```bash
   sudo systemctl start oddjobd
   sudo systemctl enable oddjobd
   ```  

---

#### **Step 5: Test Domain Authentication**  

Now that the setup is complete, test authentication for AD users.  

1. **List Domain Users and Groups**:  
   Check if domain users and groups are visible:  

   ```bash
   wbinfo -u  # Lists users
   wbinfo -g  # Lists groups
   ```  

2. **Authenticate a User**:  
   Test user authentication using the `getent` command:  

   ```bash
   getent passwd domain_user
   ```  

   Replace `domain_user` with a valid AD username.  

3. **Log In as a Domain User**:  
   Log in to the AlmaLinux system using a domain user account to confirm everything is working.  

---

#### **Step 6: Securing and Optimizing Winbind Configuration**  

1. **Restrict Access**:  
   Limit access to only specific users or groups by editing `/etc/security/access.conf`:  

   ```plaintext
   + : group_name : ALL
   - : ALL : ALL
   ```  

2. **Firewall Rules**:  
   Ensure the Samba-related ports are open in the firewall:  

   ```bash
   sudo firewall-cmd --add-service=samba --permanent
   sudo firewall-cmd --reload
   ```  

3. **Enable Kerberos Encryption**:  
   Strengthen authentication by using Kerberos with Samba for secure communication.  

---

#### **Step 7: Troubleshooting Common Issues**  

1. **DNS Resolution Issues**:  
   Ensure the server can resolve domain names by updating `/etc/resolv.conf` with your AD DNS server:  

   ```plaintext
   nameserver <AD_DNS_Server_IP>
   ```  

2. **Join Domain Failure**:  
   - Check Samba logs:  

     ```bash
     sudo tail -f /var/log/samba/log.smbd
     ```  

   - Verify time synchronization with the AD server:  

     ```bash
     sudo timedatectl set-ntp true
     ```  

3. **Authentication Issues**:  
   If domain users can’t log in, verify NSS and PAM configurations.  

---

#### **Conclusion**  

Integrating AlmaLinux with Windows Active Directory using Samba Winbind provides a powerful solution for managing authentication and resource sharing in hybrid environments. By following this guide, you’ve learned how to install and configure Winbind, join the Linux server to an AD domain, and enable domain authentication for users.  

This setup streamlines user management, eliminates the need for multiple authentication systems, and ensures seamless collaboration across platforms. For any questions or further assistance, feel free to leave a comment below!  
