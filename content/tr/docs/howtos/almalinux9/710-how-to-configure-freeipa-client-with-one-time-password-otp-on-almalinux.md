---
title: How to Configure FreeIPA Client with One-Time Password on AlmaLinux
linkTitle: FreeIPA Client with One-Time Password
description: Learn how to configure a FreeIPA client with OTP on AlmaLinux. This detailed guide covers installation, OTP setup, testing, troubleshooting, and best practices for secure authentication.
date: 2024-12-12
weight: 710
url: configure-freeipa-client-time-password-almalinux
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
In an era where security is paramount, integrating **One-Time Password (OTP)** with centralized authentication systems like FreeIPA enhances protection against unauthorized access. FreeIPA, an open-source identity management solution, supports OTP, enabling an additional layer of security for user authentication. Configuring a FreeIPA client on AlmaLinux to use OTP ensures secure, single-use authentication for users while maintaining centralized identity management.

This guide explains how to configure a FreeIPA client with OTP on AlmaLinux, including step-by-step instructions, testing, and troubleshooting.

---

## **What is OTP and Why Use It with FreeIPA?**

### **What is OTP?**

OTP, or One-Time Password, is a password valid for a single login session or transaction. Generated dynamically, OTPs reduce the risk of password-related attacks such as phishing or credential replay.

### **Why Use OTP with FreeIPA?**

Integrating OTP with FreeIPA provides several advantages:

- **Enhanced Security:** Requires an additional factor for authentication.
- **Centralized Management:** OTP configuration is managed within the FreeIPA server.
- **Convenient User Experience:** Supports various token generation methods, including mobile apps.

---

## **Prerequisites**

Before proceeding, ensure the following:

1. A working **FreeIPA Server** setup.
2. FreeIPA server configured with OTP support.
3. **AlmaLinux installed and updated.**
4. A FreeIPA admin account and user accounts configured for OTP.
5. Administrative (root) access to the client machine.
6. A time-synchronized system using NTP or Chrony.

---

## **Step 1: Prepare the AlmaLinux Client**

### **Update the System**

Start by updating the AlmaLinux client to the latest packages:

```bash
sudo dnf update -y
```

### **Set the Hostname**

Assign a fully qualified domain name (FQDN) to the client machine:

```bash
sudo hostnamectl set-hostname client.example.com
```

Verify the hostname:

```bash
hostnamectl
```

### **Configure DNS**

Ensure the client system can resolve the FreeIPA server's domain. Edit `/etc/hosts` to include the server’s IP and hostname:

```plaintext
192.168.1.10   ipa.example.com ipa
```

---

## **Step 2: Install FreeIPA Client**

Install the FreeIPA client package on the AlmaLinux machine:

```bash
sudo dnf install ipa-client -y
```

---

## **Step 3: Configure FreeIPA Client**

Run the FreeIPA client configuration script:

```bash
sudo ipa-client-install --mkhomedir
```

### **Key Options:**

- **`--mkhomedir`:** Automatically creates a home directory for authenticated users on login.

### **Respond to Prompts**

You will be prompted for:

1. **FreeIPA Server Address:** Enter the FQDN of the server (e.g., `ipa.example.com`).
2. **Domain Name:** Enter your FreeIPA domain (e.g., `example.com`).
3. **Admin Credentials:** Provide the admin username and password.

The script configures Kerberos, SSSD, and other dependencies.

---

## **Step 4: Enable OTP Authentication**

### **1. Set Up OTP for a User**

Log in to the FreeIPA server and enable OTP for a specific user. Use either the web interface or the CLI.

#### **Using the Web Interface**

1. Navigate to **Identity** → **Users**.
2. Select a user and edit their account.
3. Enable OTP authentication by checking the **OTP Only** option.

#### **Using the CLI**

Run the following command:

```bash
ipa user-mod username --otp-only=True
```

Replace `username` with the user’s FreeIPA username.

---

### **2. Generate an OTP Token**

Generate a token for the user to use with OTP-based authentication.

#### **Add a Token for the User**

On the FreeIPA server, generate a token using the CLI:

```bash
ipa otptoken-add --owner=username
```

#### **Configure Token Details**

Provide details such as:

- **Type:** Choose between `totp` (time-based) or `hotp` (event-based).
- **Algorithm:** Use a secure algorithm like SHA-256.
- **Digits:** Specify the number of digits in the OTP (e.g., 6).

The output includes the OTP token's details, including a QR code or secret key for setup.

#### **Distribute the Token**

Share the QR code or secret key with the user for use in an OTP app like Google Authenticator or FreeOTP.

---

## **Step 5: Test OTP Authentication**

### **1. Test Kerberos Authentication**

Log in as the user with OTP:

```bash
kinit username
```

When prompted for a password, enter the OTP generated by the user’s app.

### **2. Verify Kerberos Ticket**

Check the Kerberos ticket:

```bash
klist
```

The ticket should include the user’s principal, confirming successful OTP authentication.

---

## **Step 6: Configure SSH with OTP**

FreeIPA supports SSH authentication with OTP. Configure the client machine to use this feature.

### **1. Edit SSH Configuration**

Ensure that GSSAPI authentication is enabled. Edit `/etc/ssh/sshd_config`:

```plaintext
GSSAPIAuthentication yes
GSSAPICleanupCredentials yes
```

Restart the SSH service:

```bash
sudo systemctl restart sshd
```

### **2. Test SSH Access**

Attempt SSH login using a FreeIPA user account with OTP:

```bash
ssh username@client.example.com
```

Enter the OTP when prompted for a password.

---

## **Step 7: Configure Time Synchronization**

OTP requires accurate time synchronization between the client and server to validate time-based tokens.

### **1. Install Chrony**

Ensure Chrony is installed and running:

```bash
sudo dnf install chrony -y
sudo systemctl start chronyd
sudo systemctl enable chronyd
```

### **2. Verify Time Synchronization**

Check the status of Chrony:

```bash
chronyc tracking
```

Ensure the system’s time is synchronized with the NTP server.

---

## **Step 8: Troubleshooting Common Issues**

### **1. OTP Authentication Fails**

- Verify the user account is OTP-enabled:

  ```bash
  ipa user-show username
  ```

- Ensure the correct OTP is being used. Re-synchronize the OTP token if necessary.

### **2. Kerberos Ticket Not Issued**

- Check Kerberos logs for errors:

  ```bash
  sudo journalctl -u krb5kdc
  ```

- Verify the time synchronization between the client and server.

### **3. SSH Login Fails**

- Check SSH logs for errors:

  ```bash
  sudo journalctl -u sshd
  ```

- Ensure the SSH configuration includes GSSAPI authentication settings.

---

## **Best Practices for OTP Configuration**

1. **Use Secure Algorithms:** Configure tokens with secure algorithms like SHA-256 for robust encryption.
2. **Regularly Rotate Tokens:** Periodically update OTP secrets to reduce the risk of compromise.
3. **Enable 2FA for Admin Accounts:** Require OTP for privileged accounts to enhance security.
4. **Backup Configuration:** Save backup copies of OTP token settings and FreeIPA configuration files.
5. **Monitor Logs:** Regularly review authentication logs for suspicious activity.

---

## **Conclusion**

Configuring a FreeIPA client with OTP on AlmaLinux enhances authentication security by requiring single-use passwords in addition to the usual credentials. By following this guide, you’ve set up the FreeIPA client, enabled OTP for users, and tested secure login methods like Kerberos and SSH.

This configuration provides a robust, centralized identity management solution with an added layer of security. Start integrating OTP into your FreeIPA environment today and take your authentication processes to the next level.
