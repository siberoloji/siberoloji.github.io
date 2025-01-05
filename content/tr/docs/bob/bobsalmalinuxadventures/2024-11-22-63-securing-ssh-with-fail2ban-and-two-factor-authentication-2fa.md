---
draft: false
title: Securing SSH with Fail2Ban and Two-Factor Authentication
linkTitle: Securing SSH with Fail2Ban
keywords:
  - Securing SSH with Fail2Ban
description: To make his setup bulletproof, Bob decided to implement Fail2Ban for brute-force protection and Two-Factor Authentication for an additional security layer.
date: 2024-11-23
url: securing-ssh-fail2ban-factor-authentication
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 630
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
### **Securing SSH with Fail2Ban and Two-Factor Authentication (2FA)**

Bob was thrilled with his newfound SSH mastery, but his manager reminded him of one crucial fact: SSH servers are often targeted by brute-force attacks. To make his setup bulletproof, Bob decided to implement **Fail2Ban** for brute-force protection and **Two-Factor Authentication (2FA)** for an additional security layer.

> *“If they can’t get in with brute force or steal my key, I’ll sleep soundly at night,”* Bob said, ready to take his SSH setup to the next level.

---

### **Part 1: Setting Up Fail2Ban**

---

#### **Step 1: Installing Fail2Ban**

Fail2Ban monitors logs for failed login attempts and automatically blocks suspicious IPs. Bob started by installing it on AlmaLinux.

- To install Fail2Ban:

  ```bash
  sudo dnf install -y fail2ban
  ```

- To verify the installation:

  ```bash
  fail2ban-client --version
  ```

---

#### **Step 2: Configuring Fail2Ban for SSH**

Bob configured Fail2Ban to monitor the SSH log and ban IPs after multiple failed login attempts.

- He created a local configuration file to override the default settings:

  ```bash
  sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
  ```

- Bob edited the `jail.local` file to enable the SSH jail:

  ```plaintext
  [sshd]
  enabled = true
  port = 22
  filter = sshd
  logpath = /var/log/secure
  maxretry = 5
  bantime = 10m
  ```

  > **Explanation**:
  > - `enabled = true`: Activates the SSH jail.
  > - `maxretry = 5`: Permits 5 failed attempts before banning.
  > - `bantime = 10m`: Bans the IP for 10 minutes.

---

#### **Step 3: Starting and Testing Fail2Ban**

- Bob started the Fail2Ban service:

  ```bash
  sudo systemctl enable fail2ban --now
  sudo systemctl status fail2ban
  ```

- To test Fail2Ban, Bob intentionally failed a few login attempts from a test machine. He checked the banned IPs with:

  ```bash
  sudo fail2ban-client status sshd
  ```

- To unban an IP (in case of accidental blocking):

  ```bash
  sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
  ```

> *“No more brute-force attacks on my watch!”* Bob said, admiring Fail2Ban’s effectiveness.

---

### **Part 2: Enabling Two-Factor Authentication (2FA)**

---

#### **Step 1: Installing Google Authenticator**

To enable 2FA for SSH, Bob needed to install the **Google Authenticator PAM module**.

- Install the required package:

  ```bash
  sudo dnf install -y google-authenticator
  ```

---

#### **Step 2: Configuring 2FA for Bob’s User**

Bob enabled 2FA for his account by running the Google Authenticator setup.

- Run the setup command:

  ```bash
  google-authenticator
  ```

- Bob followed the prompts:
  - Answered **Yes** to time-based tokens.
  - Saved the QR code or key to his authenticator app (Google Authenticator, Authy, etc.).
  - Noted the emergency scratch codes (for use if the phone was unavailable).
  - Answered **Yes** to updating the `.google_authenticator` file.
  - Answered **Yes** to rate-limiting login attempts.

---

#### **Step 3: Integrating 2FA with SSH**

Bob edited the SSH PAM configuration file to enable Google Authenticator for SSH logins.

- Open the PAM configuration file:

  ```bash
  sudo nano /etc/pam.d/sshd
  ```

- Add the following line at the top:

  ```plaintext
  auth required pam_google_authenticator.so
  ```

Next, Bob edited the SSH daemon configuration to enable 2FA.

- Open the `sshd_config` file:

  ```bash
  sudo nano /etc/ssh/sshd_config
  ```

- Enable Challenge-Response Authentication:

  ```plaintext
  ChallengeResponseAuthentication yes
  ```

- Disable password authentication to enforce key-based login with 2FA:

  ```plaintext
  PasswordAuthentication no
  ```

- Restart the SSH service to apply changes:

  ```bash
  sudo systemctl restart sshd
  ```

---

#### **Step 4: Testing 2FA**

Bob tested the setup by logging into the server:

1. After entering his SSH key passphrase, Bob was prompted for a verification code from his authenticator app.
2. He entered the code and successfully logged in.

> *“SSH + 2FA = maximum security! No one’s getting in without the key and the code,”* Bob said confidently.

---

### **Troubleshooting Fail2Ban and 2FA**

Bob encountered a few snags during the setup but quickly resolved them:

1. **Fail2Ban not banning IPs**:  
   - Bob checked the logpath in `/etc/fail2ban/jail.local` to ensure it matched `/var/log/secure`.

2. **2FA not prompting for codes**:  
   - Bob confirmed `ChallengeResponseAuthentication yes` was set in `sshd_config`.
   - He checked the PAM file (`/etc/pam.d/sshd`) for the Google Authenticator line.

3. **Locked out by Fail2Ban**:  
   - Bob unbanned his IP with:

     ```bash
     sudo fail2ban-client set sshd unbanip <IP_ADDRESS>
     ```

---

### **Conclusion: A Fortress of SSH Security**

With Fail2Ban and 2FA in place, Bob’s SSH server was as secure as Fort Knox. He leaned back in his chair, knowing that brute-force bots and unauthorized users stood no chance against his fortified defenses.

> Next, Bob planned to venture into the world of web services with **"Configuring Apache on AlmaLinux"**.
