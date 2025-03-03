---
draft: false
title: How to Manage Password Policies with Cinnamon Desktop on Linux Mint
linkTitle: Manage Password Policies
translationKey: how-to-manage-password-policies-with-cinnamon-desktop-on-linux-mint
description: A guide to managing password policies on Linux Mint, including system-wide settings, user password management, and additional security measures.
url: how-to-manage-password-policies-with-cinnamon-desktop-on-linux-mint
weight: 60
date: 2025-03-03
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - password policies
featured_image: /images/linuxmint1.webp
---
Linux Mint, particularly with its flagship Cinnamon desktop environment, is a popular choice for users who seek a balance between stability, ease of use, and customization. Security is a fundamental concern for any Linux user, and managing password policies effectively is crucial to ensuring both personal and system-wide security.

This blog post will guide you through managing password policies on Linux Mint running Cinnamon Desktop, covering system-wide password policies, user password management, and additional security measures to enhance your password strategy.

---

## Understanding Password Policies in Linux Mint

Password policies define the rules that dictate password complexity, expiration, and history. These policies help prevent weak passwords and enforce security best practices.

On Linux Mint, password management primarily revolves around the **Pluggable Authentication Module (PAM)**, **passwd** command, and **shadow file settings**. Cinnamon itself does not directly handle password policies but provides tools to modify and manage user passwords.

### Key Aspects of Password Policies

- **Minimum and Maximum Password Length**
- **Complexity Requirements (uppercase, lowercase, numbers, special characters)**
- **Expiration and Rotation Policies**
- **Account Lockout and Failed Login Attempts**
- **Password History to Prevent Reuse**

---

## Configuring Password Policies in Linux Mint

### 1. Setting Password Aging Policies

The `chage` command allows administrators to define password expiration rules for users.

#### Checking Current Password Aging Policies

To check the password policy for a user, run:

```bash
chage -l username
```

This displays information such as password expiration date and the number of days before a password change is required.

#### Enforcing Password Expiration

To require a user to change their password every 60 days, use:

```bash
sudo chage -M 60 username
```

Other options include:

- `-m` (minimum days before changing passwords)
- `-M` (maximum days a password is valid)
- `-W` (warning period before password expiry)
- `-I` (inactivity period before disabling the account)

Example:

```bash
sudo chage -M 60 -m 7 -W 5 username
```

This forces a password change every 60 days, requires at least 7 days before another change, and provides a 5-day warning before expiration.

---

### 2. Enforcing Strong Password Policies with PAM

Linux Mint relies on the **Pluggable Authentication Module (PAM)** system for enforcing password security. The `pam_pwquality` module is responsible for enforcing password complexity.

#### Configuring `pam_pwquality`

Open the PAM password quality configuration file:

```bash
sudo nano /etc/security/pwquality.conf
```

Modify or add the following lines to enforce strong passwords:

```bash
minlen = 12
ucredit = -1
lcredit = -1
dcredit = -1
ocredit = -1
difok = 5
retry = 3
```

- `minlen = 12` → Minimum password length of 12 characters.
- `ucredit = -1` → At least one uppercase letter.
- `lcredit = -1` → At least one lowercase letter.
- `dcredit = -1` → At least one digit.
- `ocredit = -1` → At least one special character.
- `difok = 5` → Requires at least 5 different characters from the old password.
- `retry = 3` → Allows users three attempts before rejection.

Save and exit the file (`CTRL+X`, then `Y`, then `Enter`).

#### Applying the Policy

Ensure the `common-password` PAM file includes the `pam_pwquality` module. Edit it with:

```bash
sudo nano /etc/pam.d/common-password
```

Locate the line containing `pam_pwquality.so` and ensure it includes `retry=3` for enforcement:

```bash
password requisite pam_pwquality.so retry=3
```

Save and exit.

---

### 3. Preventing Password Reuse

To prevent users from reusing their last N passwords, configure the `pam_unix` module.

Edit the `common-password` file:

```bash
sudo nano /etc/pam.d/common-password
```

Modify the line:

```bash
password sufficient pam_unix.so remember=5
```

This ensures the last five passwords cannot be reused.

Save and exit.

---

### 4. Locking Accounts After Failed Login Attempts

To protect against brute force attacks, configure `pam_tally2` or `pam_faillock`.

#### Using `pam_tally2`

Edit the authentication file:

```bash
sudo nano /etc/pam.d/common-auth
```

Add the following lines:

```bash
auth required pam_tally2.so deny=5 unlock_time=900
```

This locks the account after 5 failed attempts and unlocks it after 15 minutes (900 seconds).

#### Unlocking a Locked Account

If a user is locked out, reset the failed attempt counter:

```bash
sudo pam_tally2 --reset --user=username
```

---

### 5. Managing Passwords via Cinnamon’s GUI

While most password policy configurations occur at the system level, Cinnamon provides a user-friendly way to manage passwords:

1. Open **System Settings** in the Cinnamon menu.
2. Navigate to **Users and Groups**.
3. Select a user and click **Change Password**.
4. Follow the prompts to update the password.

This method does not enforce system-wide password policies unless configured via PAM.

---

## Additional Security Measures

Beyond password policies, consider these additional security steps:

- **Enable Automatic Updates:** Keep your system updated to patch security vulnerabilities.
- **Use a Password Manager:** Tools like **Bitwarden** or **KeepassXC** help manage strong passwords.
- **Enable Full-Disk Encryption:** Encrypt your disk using **LUKS** for added protection.
- **Use Two-Factor Authentication (2FA):** If supported by your authentication systems.
- **Monitor Logins:** Check authentication logs with:

  ```bash
  sudo cat /var/log/auth.log | grep 'authentication failure'
  ```

---

## Conclusion

Managing password policies on Linux Mint with the Cinnamon desktop involves configuring system-wide settings via PAM, enforcing strong password rules, and leveraging built-in GUI tools for user convenience. By setting expiration rules, enforcing complexity, preventing reuse, and implementing account lockout mechanisms, you can significantly enhance security.

With these steps, you ensure your Linux Mint system remains both user-friendly and secure, balancing convenience with necessary security measures.
