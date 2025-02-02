---
draft: false
title: Setting Up User Accounts and Passwords on Linux Mint
linkTitle: User Accounts and Passwords
translationKey: setting-up-user-accounts-and-passwords-on-linux-mint
description: Learn how to set up user accounts and passwords on Linux Mint. This comprehensive guide covers creating new accounts, setting strong passwords, managing account security, and troubleshooting common issues.
url: setting-up-user-accounts-and-passwords-on-linux-mint
weight: 90
date: 2025-02-02
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
featured_image: /images/linuxmint1.webp
---
Linux Mint provides a robust user management system that allows you to create, modify, and secure user accounts effectively. This comprehensive guide will walk you through everything you need to know about managing user accounts and passwords in Linux Mint, from basic setup to advanced security configurations.

## Understanding User Account Types

Before diving into the setup process, it's important to understand the two main types of user accounts in Linux Mint:

Regular users have limited permissions and can only modify their own files and settings. They need to use sudo for administrative tasks, making this account type ideal for daily use and enhancing system security.

Administrative users (sudo users) have the ability to perform system-wide changes when needed. The first user account created during Linux Mint installation automatically receives administrative privileges through sudo access.

## Creating New User Accounts

### Using the Graphical Interface

The simplest way to create new user accounts is through Linux Mint's graphical Users and Groups tool:

1. Open the Start Menu and search for "Users and Groups"
2. Click the "Add" button (you'll need to enter your password)
3. Fill in the required information:
   - Username (must be lowercase, no spaces)
   - Full name (the display name)
   - Password
4. Choose the account type (Standard or Administrator)
5. Click "Add User" to create the account

### Using the Command Line

For those who prefer terminal commands, you can create users with these steps:

```bash
# Create a new user
sudo adduser username

# Add user to sudo group (for administrative privileges)
sudo usermod -aG sudo username
```

The adduser command will prompt you for:

- Password
- Full name
- Room number (optional)
- Work phone (optional)
- Home phone (optional)
- Other information (optional)

## Setting Up Strong Passwords

### Password Best Practices

When creating passwords for Linux Mint accounts, follow these security guidelines:

1. Use at least 12 characters
2. Include a mix of:
   - Uppercase letters
   - Lowercase letters
   - Numbers
   - Special characters
3. Avoid common words or personal information
4. Use unique passwords for each account

### Changing Passwords

Users can change their own passwords in several ways:

#### Graphical Method

1. Open System Settings
2. Select "Users and Groups"
3. Click on the password field
4. Enter the current password
5. Enter and confirm the new password

#### Command Line Method

```bash
# Change your own password
passwd

# Change another user's password (requires sudo)
sudo passwd username
```

## Managing Account Security

### Password Policies

To enforce strong passwords, you can set up password policies using the PAM (Pluggable Authentication Modules) system:

1. Install the password quality checking library:

```bash
sudo apt install libpam-pwquality
```

2. Edit the PAM configuration file:

```bash
sudo nano /etc/pam.d/common-password
```

3. Add or modify the password requirements line:

```bash
password requisite pam_pwquality.so retry=3 minlen=12 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1
```

This configuration:

- Allows 3 password change attempts
- Requires minimum 12 characters
- Requires at least 3 character changes in new passwords
- Requires at least 1 uppercase letter
- Requires at least 1 lowercase letter
- Requires at least 1 digit
- Requires at least 1 special character

### Account Lockout Settings

To protect against brute force attacks, configure account lockout:

1. Edit the PAM configuration:

```bash
sudo nano /etc/pam.d/common-auth
```

2. Add the following line:

```bash
auth required pam_tally2.so deny=5 unlock_time=1800
```

This locks accounts for 30 minutes after 5 failed login attempts.

## Managing Existing Accounts

### Modifying User Properties

To modify existing user accounts:

#### Graphical Method

1. Open Users and Groups
2. Select the user to modify
3. Make changes to:
   - Account type
   - Password
   - Language
   - Auto-login settings

#### Command Line Method

```bash
# Change username
sudo usermod -l newname oldname

# Change home directory
sudo usermod -d /home/newname username

# Change shell
sudo usermod -s /bin/bash username
```

### Deleting User Accounts

When removing users, you can choose to keep or delete their home directory and files:

#### Graphical Method

1. Open Users and Groups
2. Select the user
3. Click "Delete"
4. Choose whether to keep home directory files

#### Command Line Method

```bash
# Keep home directory
sudo userdel username

# Delete home directory and mail spool
sudo userdel -r username
```

## Maintaining Account Security

### Regular Security Audits

Perform these security checks regularly:

1. Review user accounts and remove unnecessary ones:

```bash
cat /etc/passwd
```

2. Check sudo users:

```bash
getent group sudo
```

3. Review login attempts:

```bash
sudo lastlog
```

4. Check failed login attempts:

```bash
sudo fail2ban-client status
```

### Password Maintenance

Implement these password security practices:

1. Set password expiration:

```bash
sudo chage -M 90 username  # Expires after 90 days
```

2. Force password change at next login:

```bash
sudo chage -d 0 username
```

3. View password status:

```bash
sudo chage -l username
```

## Troubleshooting Common Issues

If you encounter problems, try these solutions:

1. Forgotten password:
   - Boot into recovery mode
   - Mount the system in read-write mode
   - Use passwd command to reset the password

2. Account locked out:
   - Login as root or another admin user
   - Reset failed login count:

   ```bash
   sudo pam_tally2 --user=username --reset
   ```

3. Sudo access issues:
   - Verify group membership:

   ```bash
   groups username
   ```

   - Add to sudo group if necessary:

   ```bash
   sudo usermod -aG sudo username
   ```

By following these guidelines and best practices, you can maintain a secure and well-organized user account system on your Linux Mint installation. Remember to regularly review and update your security settings to protect against new threats and vulnerabilities.
