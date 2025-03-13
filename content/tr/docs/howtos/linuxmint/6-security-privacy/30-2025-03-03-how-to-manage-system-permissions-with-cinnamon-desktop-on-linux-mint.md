---
draft: true
title: How to Manage System Permissions with Cinnamon Desktop on Linux Mint
linkTitle: How to Manage System Permissions
translationKey: how-to-manage-system-permissions-with-cinnamon-desktop-on-linux-mint
description: Learn how to manage system permissions using the Cinnamon desktop environment in Linux Mint.
url: how-to-manage-system-permissions-with-cinnamon-desktop-on-linux-mint
weight: 30
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
  - system permissions
  - file permissions
featured_image: /images/linuxmint1.webp
---
Linux Mint, with its sleek and user-friendly Cinnamon desktop environment, offers a balanced blend of power and simplicity. While Linux Mint ensures security and stability, effectively managing system permissions is essential for both security and usability. Whether you're an individual user, a system administrator, or a developer, understanding how to handle permissions properly will help you maintain control over your system and prevent unauthorized access.

This guide will walk you through the various ways you can manage system permissions using the Cinnamon desktop environment in Linux Mint.

## Understanding Linux File Permissions

Linux employs a robust permission system to control access to files and directories. Every file and directory has an associated set of permissions categorized into three groups:

- **Owner:** The user who owns the file.
- **Group:** A set of users who have shared access to the file.
- **Others:** Any user who is not the owner or part of the group.

Each of these categories has three types of access permissions:

- **Read (r)**: Allows reading the file or listing directory contents.
- **Write (w)**: Allows modifying the file or adding/removing files in a directory.
- **Execute (x)**: Allows executing a file or accessing a directory.

### Viewing File Permissions

You can view file permissions using the **ls -l** command in the terminal:

```bash
ls -l filename
```

This will return output like:

```bash
-rw-r--r-- 1 user group 1234 Jan 1 12:34 filename
```

Each character in the first column represents the file type and permission levels for the owner, group, and others.

## Managing Permissions with the Cinnamon Desktop

Linux Mint's Cinnamon desktop provides graphical tools to manage permissions, making it easier for users who prefer not to use the terminal.

### Changing Permissions via the File Manager

1. **Open File Manager (Nemo):**

   - Launch Nemo from the Cinnamon menu or by pressing `Super + E`.

2. **Right-click the file or folder:**

   - Select **Properties** from the context menu.

3. **Navigate to the 'Permissions' tab:**

   - Here, you can modify the permissions for the owner, group, and others.

4. **Adjust read, write, and execute settings:**

   - Use the dropdown menus to set appropriate permissions.

5. **Apply changes:**

   - Click **Close** to save the new permissions.

This method provides a quick and intuitive way to manage file permissions without requiring terminal commands.

## Managing User and Group Permissions

Linux Mint allows you to manage users and groups efficiently through graphical tools and terminal commands.

### Adding or Removing Users

To manage users via GUI:

1. Open **System Settings**.
2. Navigate to **Users and Groups**.
3. Click **Unlock** (you may need to enter your password).
4. Add a new user by clicking **Add** or remove an existing user.

To manage users via terminal:

- Add a new user:

  ```bash
  sudo adduser newuser
  ```

- Remove a user:

  ```bash
  sudo deluser username
  ```

### Managing Group Membership

Groups help organize users and define their access to system resources.

- Add a user to a group:

  ```bash
  sudo usermod -aG groupname username
  ```

- Remove a user from a group:

  ```bash
  sudo deluser username groupname
  ```

### Checking Group Membership

To see which groups a user belongs to, use:

```bash
groups username
```

## Using Polkit for Permission Management

Polkit (PolicyKit) is a framework used in Linux Mint to control system-wide privileges. It allows non-root users to perform administrative tasks securely.

### Managing Polkit Permissions via Terminal

To check available policies, use:

```bash
pkaction
```

To modify policy settings:

1. Create a custom rule file:

   ```bash
   sudo nano /etc/polkit-1/localauthority/50-local.d/10-custom.policy
   ```

2. Add a rule to allow a specific action:

   ```
   [Allow Managing Network]
   Identity=unix-group:network
   Action=org.freedesktop.network-manager-settings.modify.system
   ResultAny=yes
   ```

3. Save and exit (Ctrl + X, then Y, then Enter).

4. Restart the polkit service:

   ```bash
   sudo systemctl restart polkit
   ```

## Advanced File Permission Management

### Changing Ownership

To change file ownership, use:

```bash
sudo chown newowner:newgroup filename
```

Example:

```bash
sudo chown alice:users document.txt
```

### Modifying Permissions with chmod

To change permissions numerically:

```bash
sudo chmod 755 filename
```

Or using symbolic notation:

```bash
sudo chmod u+rwx,g+rx,o+rx filename
```

### Setting Default Permissions with umask

To set default permissions for new files:

```bash
umask 022
```

To make the change permanent, add it to `~/.bashrc` or `/etc/profile`.

## Conclusion

Managing system permissions in Linux Mint with the Cinnamon desktop is crucial for maintaining security and proper system functionality. While graphical tools like Nemo and the **Users and Groups** settings make it easier for beginners, the command line offers more fine-grained control for advanced users. Understanding how to manage file permissions, user and group settings, and polkit policies ensures a secure and efficient Linux Mint experience.

By combining these methods, you can confidently control who can access and modify your system resources, keeping your system secure while maintaining usability.
