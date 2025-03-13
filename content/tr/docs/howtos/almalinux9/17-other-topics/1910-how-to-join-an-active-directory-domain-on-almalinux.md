---
title: How to Join an Active Directory Domain on AlmaLinux
linkTitle: Join an Active Directory Domain
description: In this guide, we’ll walk you through the steps required to join AlmaLinux to an Active Directory domain.
date: 2025-01-08T11:44:30.435Z
weight: 1910
url: join-active-directory-domain-almalinux
translationKey: how-to-join-active-directory-domain-on-almalinux
draft: true
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - active directory
featured_image: /images/almalinux.webp
---
Active Directory (AD) is a widely-used directory service developed by Microsoft for managing users, computers, and other resources within a networked environment. Integrating AlmaLinux, a robust enterprise-grade Linux distribution, into an Active Directory domain enables centralized authentication, authorization, and user management. By joining AlmaLinux to an AD domain, you can streamline access controls and provide seamless integration between Linux and Windows environments.

In this guide, we’ll walk you through the steps required to join AlmaLinux to an Active Directory domain.

---

### **Why Join an AD Domain?**

Joining an AlmaLinux system to an AD domain provides several benefits:

1. **Centralized Authentication**: Users can log in with their AD credentials, eliminating the need to manage separate accounts on Linux systems.
2. **Unified Access Control**: Leverage AD policies for consistent access management across Windows and Linux systems.
3. **Improved Security**: Enforce AD security policies, such as password complexity and account lockout rules.
4. **Simplified Management**: Manage AlmaLinux systems from the Active Directory Administrative Center or Group Policy.

---

### **Prerequisites**

Before proceeding, ensure the following:

1. **Active Directory Domain**: A configured AD domain with DNS properly set up.
2. **AlmaLinux System**: A fresh or existing installation of AlmaLinux with administrative privileges.
3. **DNS Configuration**: Ensure your AlmaLinux system can resolve the AD domain name.
4. **AD Credentials**: A domain administrator account for joining the domain.
5. **Network Connectivity**: Verify that the Linux system can communicate with the AD domain controller.

---

### **Step 1: Update Your System**

Begin by updating your AlmaLinux system to ensure all packages are up to date:

```bash
sudo dnf update -y
```

---

### **Step 2: Install Required Packages**

AlmaLinux uses the `realmd` utility to join AD domains. Install the necessary packages:

```bash
sudo dnf install -y realmd sssd adcli krb5-workstation oddjob oddjob-mkhomedir samba-common-tools
```

Here’s what these tools do:

- **realmd**: Simplifies domain discovery and joining.
- **sssd**: Provides authentication and access to AD resources.
- **adcli**: Used for joining the domain.
- **krb5-workstation**: Handles Kerberos authentication.
- **oddjob/oddjob-mkhomedir**: Automatically creates home directories for AD users.
- **samba-common-tools**: Provides tools for interacting with Windows shares and domains.

---

### **Step 3: Configure the Hostname**

Set a meaningful hostname for your AlmaLinux system, as it will be registered in the AD domain:

```bash
sudo hostnamectl set-hostname your-system-name.example.com
```

Replace `your-system-name.example.com` with a fully qualified domain name (FQDN) that aligns with your AD domain.

Verify the hostname:

```bash
hostnamectl
```

---

### **Step 4: Configure DNS**

Ensure your AlmaLinux system can resolve the AD domain name by pointing to the domain controller’s DNS server.

#### Update `/etc/resolv.conf`

Edit the DNS configuration file:

```bash
sudo nano /etc/resolv.conf
```

Add your domain controller’s IP address as the DNS server:

```plaintext
nameserver <domain-controller-ip>
```

Replace `<domain-controller-ip>` with the IP address of your AD domain controller.

#### Test DNS Resolution

Verify that the AlmaLinux system can resolve the AD domain and domain controller:

```bash
nslookup example.com
nslookup dc1.example.com
```

Replace `example.com` with your AD domain name and `dc1.example.com` with the hostname of your domain controller.

---

### **Step 5: Discover the AD Domain**

Use `realmd` to discover the AD domain:

```bash
sudo realm discover example.com
```

Replace `example.com` with your AD domain name. The output should display information about the domain, including the domain controllers and supported capabilities.

---

### **Step 6: Join the AD Domain**

Join the AlmaLinux system to the AD domain using the `realm` command:

```bash
sudo realm join --user=Administrator example.com
```

- Replace `Administrator` with a domain administrator account.
- Replace `example.com` with your AD domain name.

You’ll be prompted to enter the password for the AD administrator account.

#### Verify Domain Membership

Check if the system has successfully joined the domain:

```bash
realm list
```

The output should show the domain name and configuration details.

---

### **Step 7: Configure SSSD for Authentication**

The System Security Services Daemon (SSSD) handles authentication and user access to AD resources.

#### Edit SSSD Configuration

Edit the SSSD configuration file:

```bash
sudo nano /etc/sssd/sssd.conf
```

Ensure the file contains the following content:

```plaintext
[sssd]
services = nss, pam
config_file_version = 2
domains = example.com

[domain/example.com]
ad_domain = example.com
krb5_realm = EXAMPLE.COM
realmd_tags = manages-system joined-with-samba
cache_credentials = true
id_provider = ad
fallback_homedir = /home/%u
access_provider = ad
```

Replace `example.com` with your domain name and `EXAMPLE.COM` with your Kerberos realm.

Set the correct permissions for the configuration file:

```bash
sudo chmod 600 /etc/sssd/sssd.conf
```

#### Restart SSSD

Restart the SSSD service to apply the changes:

```bash
sudo systemctl restart sssd
sudo systemctl enable sssd
```

---

### **Step 8: Configure PAM for Home Directories**

To automatically create home directories for AD users during their first login, enable `oddjob`:

```bash
sudo systemctl start oddjobd
sudo systemctl enable oddjobd
```

---

### **Step 9: Test AD Authentication**

Log in as an AD user to test the configuration:

```bash
su - 'domain_user@example.com'
```

Replace `domain_user@example.com` with a valid AD username. If successful, a home directory will be created automatically.

#### Verify User Information

Use the `id` command to confirm that AD user information is correctly retrieved:

```bash
id domain_user@example.com
```

---

### **Step 10: Fine-Tune Access Control**

By default, all AD users can log in to the AlmaLinux system. You can restrict access to specific groups or users.

#### Allow Specific Groups

To allow only members of a specific AD group (e.g., `LinuxAdmins`), update the realm configuration:

```bash
sudo realm permit -g LinuxAdmins
```

#### Revoke All Users

To revoke access for all users:

```bash
sudo realm deny --all
```

---

### **Step 11: Troubleshooting**

1. **Cannot Resolve Domain Name**:
   - Verify DNS settings in `/etc/resolv.conf`.
   - Ensure the domain controller’s IP address is reachable.

2. **Failed to Join Domain**:
   - Check Kerberos configuration in `/etc/krb5.conf`.
   - Verify the domain administrator credentials.

3. **SSSD Fails to Start**:
   - Check the logs: `sudo journalctl -u sssd`.
   - Ensure the configuration file `/etc/sssd/sssd.conf` has correct permissions.

4. **Users Cannot Log In**:
   - Confirm SSSD is running: `sudo systemctl status sssd`.
   - Verify the realm access settings: `realm list`.

---

### **Conclusion**

Joining an AlmaLinux system to an Active Directory domain simplifies user management and enhances network integration by leveraging centralized authentication and access control. By following this guide, you’ve successfully configured your AlmaLinux server to communicate with an AD domain, enabling AD users to log in seamlessly.

AlmaLinux's compatibility with Active Directory, combined with its enterprise-grade stability, makes it an excellent choice for integrating Linux systems into Windows-centric environments. Whether you’re managing a single server or deploying a large-scale environment, this setup ensures a secure and unified infrastructure.
