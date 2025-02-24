---
draft: false
title: How to Set Up Network Authentication with Cinnamon Desktop on Linux Mint
linkTitle: Set Up Network Authentication
translationKey: how-to-set-up-network-authentication-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up network authentication using the Cinnamon desktop environment on Linux Mint.
date: 2025-02-24
url: how-to-set-up-network-authentication-with-cinnamon-desktop-on-linux-mint
weight: 210
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Network Authentication
featured_image: /images/linuxmint1.webp
---
Network authentication is crucial for managing secure access to resources in a networked environment. Whether you're connecting to a corporate domain, a home network with shared resources, or an enterprise setup with centralized authentication, Linux Mint provides robust support for network authentication. This guide will walk you through the process of setting up network authentication using the Cinnamon desktop environment on Linux Mint.

## Understanding Network Authentication in Linux Mint

Network authentication allows users to verify their identity before accessing network resources such as shared files, printers, or remote desktops. Common authentication methods include:

- **LDAP (Lightweight Directory Access Protocol):** Used to authenticate users against a centralized directory service.
- **Active Directory (AD) Authentication:** Common in enterprise environments for centralized user management.
- **Kerberos Authentication:** A network authentication protocol that provides secure authentication over non-secure networks.
- **NIS (Network Information Service):** A system for distributing configuration data such as user accounts across a network.

In this guide, we will focus on integrating Linux Mint Cinnamon with LDAP and Active Directory, two of the most widely used authentication systems.

## Prerequisites

Before proceeding, ensure you have:

- Linux Mint installed with the Cinnamon desktop environment.
- Administrative (sudo) privileges on the system.
- A working network connection.
- Access to an LDAP or Active Directory server.
- The necessary authentication credentials.

## Step 1: Install Required Packages

To integrate network authentication, you need to install specific packages based on your authentication method.

### For LDAP Authentication

Open a terminal and run:

```bash
sudo apt update && sudo apt install libnss-ldap libpam-ldap ldap-utils nscd
```

During installation, you will be prompted to configure LDAP settings:

1. Enter the LDAP server URI (e.g., `ldap://your-server.com`).
2. Specify the base DN (Distinguished Name) for your organization (e.g., `dc=example,dc=com`).
3. Choose whether to use LDAP for authentication.
4. Configure the LDAP administrative account.
5. Set up LDAP authentication with PAM.

### For Active Directory Authentication

If your organization uses Active Directory, install the necessary packages:

```bash
sudo apt update && sudo apt install realmd sssd samba-common-bin adcli krb5-user packagekit
```

After installation, configure Kerberos by editing the `/etc/krb5.conf` file:

```bash
sudo nano /etc/krb5.conf
```

Ensure it contains:

```ini
[libdefaults]
default_realm = EXAMPLE.COM
rdns = false
dns_lookup_kdc = true
dns_lookup_realm = true
```

Replace `EXAMPLE.COM` with your actual domain name.

## Step 2: Join the Network Domain

### Joining an LDAP Domain

If using LDAP, configure the Name Service Switch (NSS) by editing `/etc/nsswitch.conf`:

```bash
sudo nano /etc/nsswitch.conf
```

Modify the following lines to include LDAP:

```ini
passwd: files ldap
group: files ldap
shadow: files ldap
```

Restart the Name Service Cache Daemon:

```bash
sudo systemctl restart nscd
```

### Joining an Active Directory Domain

To join an AD domain, use the `realm` command:

```bash
sudo realm join --user=Administrator example.com
```

Replace `Administrator` with an account that has permission to join computers to the domain and `example.com` with your actual domain name. You will be prompted for the password.

## Step 3: Configure PAM for Authentication

PAM (Pluggable Authentication Modules) needs to be configured to use LDAP or Active Directory for authentication.

### For LDAP

Edit the `/etc/pam.d/common-auth` file:

```bash
sudo nano /etc/pam.d/common-auth
```

Ensure it contains:

```ini
auth sufficient pam_ldap.so
auth required pam_unix.so nullok_secure
```

### For Active Directory

Edit the `/etc/pam.d/common-session` file:

```bash
sudo nano /etc/pam.d/common-session
```

Add the following line:

```ini
session required pam_mkhomedir.so skel=/etc/skel umask=0077
```

This ensures that user home directories are created upon first login.

## Step 4: Configure Login Manager

The Cinnamon desktop environment uses LightDM as its display manager. To allow domain authentication at login, modify its configuration file:

```bash
sudo nano /etc/lightdm/lightdm.conf
```

Add or modify the `[Seat:*]` section:

```ini
[Seat:*]
allow-guest=false
greeter-hide-users=false
greeter-show-manual-login=true
greeter-allow-remote-login=true
```

Restart LightDM to apply the changes:

```bash
sudo systemctl restart lightdm
```

## Step 5: Verify Authentication

After configuration, verify that authentication is working:

### Test LDAP Authentication

Run the following command to check if a user can be authenticated via LDAP:

```bash
getent passwd username
```

Replace `username` with a valid LDAP user. If configured correctly, it should return the user’s information.

### Test Active Directory Authentication

Check if the system recognizes domain users:

```bash
id domainuser@example.com
```

Replace `domainuser@example.com` with a valid AD user.

## Step 6: Enable Automatic Home Directory Creation

To ensure that user home directories are created automatically for new users logging in via LDAP or AD, add this line to `/etc/pam.d/common-session`:

```ini
session required pam_mkhomedir.so skel=/etc/skel umask=0077
```

## Troubleshooting

1. **Cannot Join AD Domain:**

   - Ensure the system’s hostname is correctly set (`sudo hostnamectl set-hostname your-hostname`).
   - Check network connectivity and DNS resolution.
   - Use `realm discover example.com` to verify domain settings.

2. **Users Cannot Authenticate:**

   - Check `/var/log/auth.log` for authentication errors.
   - Test LDAP connectivity using:

     ```bash
     ldapsearch -x -LLL -H ldap://your-server.com -b "dc=example,dc=com"
     ```

3. **Home Directory Not Created Automatically:**

   - Ensure `pam_mkhomedir.so` is enabled in `/etc/pam.d/common-session`.

## Conclusion

Setting up network authentication on Linux Mint with the Cinnamon desktop allows for seamless user access management, especially in enterprise environments. By integrating LDAP or Active Directory authentication, you ensure users can log in securely while maintaining centralized control over credentials. With the right configuration and troubleshooting steps, you can effectively enable network authentication on your system.
