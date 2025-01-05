---
title: How to Set Up SSH Key Pair Authentication on AlmaLinux
description: This guide will walk you through setting up SSH key pair authentication on AlmaLinux, improving your server's security while simplifying your login process.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH Key Pair Authentication
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 160
toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
url: set-ssh-key-pair-authentication-almalinux
---
Secure Shell (SSH) is an indispensable tool for secure remote server management. While password-based authentication is straightforward, it has inherent vulnerabilities. **SSH key pair authentication** provides a more secure and convenient alternative. This guide will walk you through setting up SSH key pair authentication on AlmaLinux, improving your server's security while simplifying your login process.

---

### **1. What is SSH Key Pair Authentication?**

SSH key pair authentication replaces traditional password-based login with cryptographic keys. It involves two keys:

- **Public Key:** Stored on the server and shared with others.
- **Private Key:** Kept securely on the client system. Never share this key.

The client proves its identity by using the private key, and the server validates it against the stored public key. This method offers:

- Stronger security compared to passwords.
- Resistance to brute-force attacks.
- The ability to disable password logins entirely.

---

### **2. Prerequisites**

Before configuring SSH key authentication:

1. A running AlmaLinux server with SSH enabled.
2. Administrative access to the server (root or sudo user).
3. SSH installed on the client system (Linux, macOS, or Windows with OpenSSH or tools like PuTTY).

---

### **3. Step-by-Step Guide to Setting Up SSH Key Pair Authentication**

#### **Step 1: Generate an SSH Key Pair**

On your local machine, generate an SSH key pair using the following command:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

- `-t rsa`: Specifies the RSA algorithm.
- `-b 4096`: Generates a 4096-bit key for enhanced security.
- `-C "your_email@example.com"`: Adds a comment to the key (optional).

Follow the prompts:

1. Specify a file to save the key pair (default: `~/.ssh/id_rsa`).
2. (Optional) Set a passphrase for added security. Press Enter to skip.

This creates two files:

- **Private Key:** `~/.ssh/id_rsa` (keep this secure).
- **Public Key:** `~/.ssh/id_rsa.pub` (shareable).

#### **Step 2: Copy the Public Key to the AlmaLinux Server**

To transfer the public key to the server, use:

```bash
ssh-copy-id username@server-ip
```

Replace:

- `username` with your AlmaLinux username.
- `server-ip` with your server's IP address.

This command:

1. Appends the public key to the `~/.ssh/authorized_keys` file on the server.
2. Sets the correct permissions for the `.ssh` directory and the `authorized_keys` file.

Alternatively, manually copy the key:

1. Display the public key:

   ```bash
   cat ~/.ssh/id_rsa.pub
   ```

2. On the server, paste it into the `~/.ssh/authorized_keys` file:

   ```bash
   echo "your-public-key-content" >> ~/.ssh/authorized_keys
   ```

#### **Step 3: Configure Permissions on the Server**

Ensure the correct permissions for the `.ssh` directory and the `authorized_keys` file:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

#### **Step 4: Test the Key-Based Authentication**

From your local machine, connect to the server using:

```bash
ssh username@server-ip
```

If configured correctly, you won’t be prompted for a password. If a passphrase was set during key generation, you’ll be asked to enter it.

---

### **4. Enhancing Security with SSH Keys**

#### **1. Disable Password Authentication**

Once key-based authentication works, disable password login to prevent brute-force attacks:

1. Open the SSH configuration file on the server:

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Find and set the following options:

   ```bash
   PasswordAuthentication no
   ChallengeResponseAuthentication no
   ```

3. Restart the SSH service:

   ```bash
   sudo systemctl restart sshd
   ```

#### **2. Use SSH Agent for Key Management**

To avoid repeatedly entering your passphrase, use the SSH agent:

```bash
ssh-add ~/.ssh/id_rsa
```

The agent stores the private key in memory, allowing seamless connections during your session.

#### **3. Restrict Access to Specific IPs**

Restrict SSH access to trusted IPs using the firewall:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

#### **4. Configure Two-Factor Authentication (Optional)**

For added security, set up two-factor authentication (2FA) with SSH key-based login.

---

### **5. Troubleshooting Common Issues**

1. **Key-Based Authentication Fails:**
   - Verify the public key is correctly added to `~/.ssh/authorized_keys`.
   - Check permissions on the `.ssh` directory and `authorized_keys` file.

2. **Connection Refused:**
   - Ensure the SSH service is running:

     ```bash
     sudo systemctl status sshd
     ```

   - Check the firewall rules to allow SSH.

3. **Passphrase Issues:**
   - Use the SSH agent to cache the passphrase:

     ```bash
     ssh-add
     ```

4. **Debugging:**
   Use the `-v` option for verbose output:

   ```bash
   ssh -v username@server-ip
   ```

---

### **6. Benefits of SSH Key Authentication**

1. **Enhanced Security:** Stronger than passwords and resistant to brute-force attacks.
2. **Convenience:** Once set up, logging in is quick and seamless.
3. **Scalability:** Ideal for managing multiple servers with centralized keys.

---

### **Conclusion**

SSH key pair authentication is a must-have for anyone managing servers on AlmaLinux. It not only enhances security but also simplifies the login process, saving time and effort. By following this guide, you can confidently transition from password-based authentication to a more secure and efficient SSH key-based setup.

Let me know if you need help with additional configurations or troubleshooting!
