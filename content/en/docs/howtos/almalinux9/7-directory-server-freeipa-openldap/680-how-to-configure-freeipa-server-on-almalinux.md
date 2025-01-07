---
title: How to Configure FreeIPA Server on AlmaLinux
linkTitle: Configure FreeIPA Server
description: Learn how to configure a FreeIPA server on AlmaLinux with this detailed guide. Includes installation, setup, DNS configuration, user management, and best practices.
date: 2024-12-12
weight: 680
url: configure-freeipa-server-almalinux
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
Identity management is a critical component of modern IT environments, ensuring secure access to systems, applications, and data. **FreeIPA** (Free Identity, Policy, and Audit) is an open-source solution that provides centralized identity and authentication services. It integrates key components like Kerberos, LDAP, DNS, and Certificate Authority (CA) to manage users, groups, hosts, and policies.

**AlmaLinux**, a stable and enterprise-grade Linux distribution, is an excellent platform for deploying FreeIPA Server. This guide will walk you through the process of installing and configuring a FreeIPA Server on AlmaLinux, from setup to basic usage.

---

## **What is FreeIPA?**

FreeIPA is a powerful and feature-rich identity management solution. It offers:

- **Centralized Authentication:** Manages user accounts and authenticates access using Kerberos and LDAP.
- **Host Management:** Controls access to servers and devices.
- **Policy Enforcement:** Configures and applies security policies.
- **Certificate Management:** Issues and manages SSL/TLS certificates.
- **DNS Integration:** Configures and manages DNS records for your domain.

These features make FreeIPA an ideal choice for simplifying and securing identity management in enterprise environments.

---

## **Prerequisites**

Before proceeding, ensure the following:

1. AlmaLinux installed and updated.
2. A valid domain name (e.g., `example.com`).
3. A static IP address configured for the server.
4. Administrative (root) access to the system.
5. At least 2 GB of RAM and sufficient disk space for logs and database files.

---

## **Step 1: Prepare the AlmaLinux System**

### **Update the System**

Ensure your AlmaLinux system is up to date:

```bash
sudo dnf update -y
```

### **Set the Hostname**

Set a fully qualified domain name (FQDN) for the server:

```bash
sudo hostnamectl set-hostname ipa.example.com
```

Verify the hostname:

```bash
hostnamectl
```

### **Configure DNS**

Edit the `/etc/hosts` file to include your server’s static IP and hostname:

```plaintext
192.168.1.10   ipa.example.com ipa
```

---

## **Step 2: Install FreeIPA Server**

### **Enable the FreeIPA Repository**

FreeIPA packages are available in the AlmaLinux repositories. Install the required packages:

```bash
sudo dnf install ipa-server ipa-server-dns -y
```

### **Verify Installation**

Check the version of the FreeIPA package installed:

```bash
ipa-server-install --version
```

---

## **Step 3: Configure the FreeIPA Server**

The `ipa-server-install` script is used to configure the FreeIPA server. Follow these steps:

### **Run the Installation Script**

Execute the installation command:

```bash
sudo ipa-server-install
```

You’ll be prompted to provide configuration details. Below are the common inputs:

1. **Hostname:** It should automatically detect the FQDN set earlier (`ipa.example.com`).
2. **Domain Name:** Enter your domain (e.g., `example.com`).
3. **Realm Name:** Enter your Kerberos realm (e.g., `EXAMPLE.COM`).
4. **Directory Manager Password:** Set a secure password for the LDAP Directory Manager.
5. **IPA Admin Password:** Set a password for the FreeIPA admin account.
6. **DNS Configuration:** If DNS is being managed, configure it here. Provide DNS forwarders or accept defaults.

### **Enable Firewall Rules**

Ensure required ports are open in the firewall:

```bash
sudo firewall-cmd --add-service=freeipa-ldap --permanent
sudo firewall-cmd --add-service=freeipa-ldaps --permanent
sudo firewall-cmd --add-service=freeipa-replication --permanent
sudo firewall-cmd --add-service=dns --permanent
sudo firewall-cmd --reload
```

---

## **Step 4: Verify FreeIPA Installation**

After the installation completes, verify the status of the FreeIPA services:

```bash
sudo ipa-server-status
```

You should see a list of running services, such as `KDC`, `LDAP`, and `HTTP`.

---

## **Step 5: Access the FreeIPA Web Interface**

FreeIPA provides a web-based interface for administration.

1. Open a browser and navigate to:

   ```html
   https://ipa.example.com
   ```

2. Log in using the admin credentials set during installation.

The interface allows you to manage users, groups, hosts, policies, and more.

---

## **Step 6: Configure FreeIPA Clients**

To fully utilize FreeIPA, configure clients to authenticate with the server.

### **Install FreeIPA Client**

On the client machine, install the FreeIPA client:

```bash
sudo dnf install ipa-client -y
```

### **Join the Client to the FreeIPA Domain**

Run the `ipa-client-install` script:

```bash
sudo ipa-client-install --server=ipa.example.com --domain=example.com
```

Follow the prompts to complete the setup. After successful configuration, the client system will be integrated with the FreeIPA domain.

---

## **Step 7: Manage Users and Groups**

### **Add a New User**

To create a new user:

```bash
ipa user-add johndoe --first=John --last=Doe --email=johndoe@example.com
```

### **Set User Password**

Set a password for the user:

```bash
ipa passwd johndoe
```

### **Create a Group**

To create a group:

```bash
ipa group-add developers --desc="Development Team"
```

### **Add a User to a Group**

Add the user to the group:

```bash
ipa group-add-member developers --users=johndoe
```

---

## **Step 8: Configure Policies**

FreeIPA allows administrators to define and enforce security policies.

### **Password Policy**

Modify the default password policy:

```bash
ipa pwpolicy-mod --maxlife=90 --minlength=8 --history=5
```

- **`--maxlife=90`**: Password expires after 90 days.
- **`--minlength=8`**: Minimum password length is 8 characters.
- **`--history=5`**: Prevents reuse of the last 5 passwords.

### **Access Control Policies**

Restrict access to specific hosts:

```bash
ipa hbacrule-add "Allow Developers" --desc="Allow Developers to access servers"
ipa hbacrule-add-user "Allow Developers" --groups=developers
ipa hbacrule-add-host "Allow Developers" --hosts=webserver.example.com
```

---

## **Step 9: Enable Two-Factor Authentication (Optional)**

For enhanced security, enable two-factor authentication (2FA):

1. Install the required packages:

   ```bash
   sudo dnf install ipa-server-authradius -y
   ```

2. Enable 2FA for users:

   ```bash
   ipa user-mod johndoe --otp-only=True
   ```

3. Distribute OTP tokens to users for 2FA setup.

---

## **Troubleshooting Common Issues**

### **1. DNS Resolution Errors**

- Ensure the DNS service is properly configured and running:

  ```bash
  systemctl status named-pkcs11
  ```

- Verify DNS records for the server and clients.

### **2. Kerberos Authentication Fails**

- Check the Kerberos ticket:

  ```bash
  klist
  ```

- Reinitialize the ticket:

  ```bash
  kinit admin
  ```

### **3. Service Status Issues**

- Restart FreeIPA services:

  ```bash
  sudo ipactl restart
  ```

---

## **Best Practices**

1. **Use Secure Passwords:** Enforce password policies to enhance security.
2. **Enable 2FA:** Protect admin and sensitive accounts with two-factor authentication.
3. **Regular Backups:** Backup the FreeIPA database regularly:

   ```bash
   ipa-backup
   ```

4. **Monitor Logs:** Check FreeIPA logs for issues:
   - `/var/log/dirsrv/`
   - `/var/log/krb5kdc.log`

---

## **Conclusion**

Setting up a FreeIPA Server on AlmaLinux simplifies identity and access management in enterprise environments. By centralizing authentication, user management, and policy enforcement, FreeIPA enhances security and efficiency. This guide has provided a step-by-step walkthrough for installation, configuration, and basic administration.

Start using FreeIPA today to streamline your IT operations and ensure secure identity management on AlmaLinux!
