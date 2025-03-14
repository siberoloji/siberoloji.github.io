---
draft: false
title: How to Grant Sudo Privileges to Users on FreeBSD Operating System
linkTitle: How to Grant Sudo Privileges to Users on FreeBSD
translationKey: how-to-grant-sudo-privileges-to-users-on-freebsd-operating-system
description: This article provides a step-by-step guide on how to grant sudo privileges to users on a FreeBSD operating system.
url: how-to-grant-sudo-privileges-to-users-on-freebsd-operating-system
date: 2025-03-05
weight: 20
keywords:
  - FreeBSD
  - sudo privileges
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful, open-source Unix-like operating system known for its robustness, scalability, and advanced networking capabilities. It is widely used in servers, desktops, and embedded systems. One of the key aspects of managing a FreeBSD system is controlling user privileges, especially when it comes to performing administrative tasks. In Unix-like systems, the `sudo` command is commonly used to grant users the ability to execute commands as the superuser (root) or another user. However, FreeBSD does not include `sudo` by default, unlike some other Unix-like systems such as Linux. Instead, FreeBSD uses a similar tool called `doas` (short for "execute as") or allows administrators to configure `sudo` manually.

In this blog post, we will explore how to grant sudo privileges to users on FreeBSD. We will cover the following topics:

1. **Understanding Sudo and Doas**
2. **Installing Sudo on FreeBSD**
3. **Configuring Sudo for Users**
4. **Using Doas as an Alternative to Sudo**
5. **Best Practices for Managing Sudo Privileges**
6. **Conclusion**

---

## 1. Understanding Sudo and Doas

Before diving into the configuration, it’s important to understand the difference between `sudo` and `doas`.

- **Sudo**: `sudo` is a widely used command in Unix-like systems that allows a permitted user to execute a command as the superuser or another user, as specified by the security policy. It is highly configurable and provides detailed logging and auditing capabilities.

- **Doas**: `doas` is a simpler alternative to `sudo` that was developed for OpenBSD and later ported to FreeBSD. It is lightweight and easier to configure but lacks some of the advanced features of `sudo`.

Both tools serve the same purpose: allowing users to execute commands with elevated privileges. The choice between `sudo` and `doas` depends on your specific needs and preferences.

---

## 2. Installing Sudo on FreeBSD

By default, FreeBSD does not include `sudo` in its base system. To use `sudo`, you need to install it from the FreeBSD ports collection or the package manager.

### Installing Sudo Using the Package Manager

The easiest way to install `sudo` is by using the `pkg` package manager. Follow these steps:

1. **Update the Package Repository**:
   Before installing any software, it’s a good idea to update the package repository to ensure you have the latest versions of the software.

   ```bash
   sudo pkg update
   ```

2. **Install Sudo**:
   Use the following command to install `sudo`:

   ```bash
   sudo pkg install sudo
   ```

3. **Verify the Installation**:
   After the installation is complete, verify that `sudo` is installed by checking its version:

   ```bash
   sudo --version
   ```

### Installing Sudo from the Ports Collection

If you prefer to compile `sudo` from source, you can use the FreeBSD ports collection.

1. **Navigate to the Sudo Port Directory**:

   ```bash
   cd /usr/ports/security/sudo
   ```

2. **Compile and Install Sudo**:
   Run the following commands to compile and install `sudo`:

   ```bash
   make install clean
   ```

3. **Verify the Installation**:
   As before, verify the installation by checking the version:

   ```bash
   sudo --version
   ```

---

## 3. Configuring Sudo for Users

Once `sudo` is installed, you need to configure it to grant privileges to specific users or groups. The configuration file for `sudo` is located at `/usr/local/etc/sudoers`. It is highly recommended to edit this file using the `visudo` command, which ensures proper syntax and prevents configuration errors.

### Granting Sudo Privileges to a User

1. **Open the Sudoers File**:
   Use the `visudo` command to edit the `sudoers` file:

   ```bash
   sudo visudo
   ```

2. **Add a User to the Sudoers File**:
   To grant a user full sudo privileges, add the following line to the file:

   ```bash
   username ALL=(ALL) ALL
   ```

   Replace `username` with the actual username of the user you want to grant privileges to.

   - `username`: The name of the user.
   - `ALL=(ALL)`: Allows the user to run commands as any user.
   - `ALL`: Allows the user to run any command.

3. **Save and Exit**:
   Save the changes and exit the editor. If you used `visudo`, it will automatically check the syntax of the file before saving.

### Granting Sudo Privileges to a Group

You can also grant sudo privileges to an entire group. This is useful if you have multiple users who need the same level of access.

1. **Create a Group (if necessary)**:
   If you don’t already have a group, you can create one using the `pw` command:

   ```bash
   sudo pw groupadd groupname
   ```

2. **Add Users to the Group**:
   Add users to the group using the `pw` command:

   ```bash
   sudo pw usermod username -G groupname
   ```

3. **Edit the Sudoers File**:
   Open the `sudoers` file with `visudo` and add the following line:

   ```bash
   %groupname ALL=(ALL) ALL
   ```

   Replace `groupname` with the name of the group.

4. **Save and Exit**:
   Save the changes and exit the editor.

### Limiting Sudo Privileges

You can also limit the commands that a user or group can run with `sudo`. For example, to allow a user to only run the `shutdown` command, you would add the following line to the `sudoers` file:

```bash
username ALL=(ALL) /sbin/shutdown
```

This restricts the user to only running the `shutdown` command with `sudo`.

---

## 4. Using Doas as an Alternative to Sudo

If you prefer a simpler alternative to `sudo`, you can use `doas`. Here’s how to configure `doas` on FreeBSD.

### Installing Doas

1. **Install Doas**:
   Use the `pkg` package manager to install `doas`:

   ```bash
   sudo pkg install doas
   ```

2. **Configure Doas**:
   The configuration file for `doas` is located at `/usr/local/etc/doas.conf`. Open this file in a text editor:

   ```bash
   sudo nano /usr/local/etc/doas.conf
   ```

3. **Grant Privileges**:
   To grant a user full privileges, add the following line to the `doas.conf` file:

   ```bash
   permit username as root
   ```

   Replace `username` with the actual username.

4. **Save and Exit**:
   Save the changes and exit the editor.

### Using Doas

To use `doas`, simply prefix your command with `doas` instead of `sudo`:

```bash
doas command
```

---

## 5. Best Practices for Managing Sudo Privileges

- **Use Groups**: Instead of granting sudo privileges to individual users, use groups to manage access more efficiently.
- **Limit Privileges**: Only grant the minimum privileges necessary for a user to perform their tasks.
- **Regularly Review the Sudoers File**: Periodically review the `sudoers` file to ensure that only authorized users have access.
- **Use `visudo`**: Always use `visudo` to edit the `sudoers` file to avoid syntax errors.
- **Enable Logging**: Ensure that `sudo` logging is enabled to track usage and detect any unauthorized access.

---

## 6. Conclusion

Granting sudo privileges to users on FreeBSD is a straightforward process, whether you choose to use `sudo` or `doas`. By following the steps outlined in this blog post, you can ensure that your users have the appropriate level of access while maintaining the security and stability of your system. Remember to follow best practices and regularly review your configurations to keep your system secure.

FreeBSD’s flexibility and powerful tools make it an excellent choice for both novice and experienced administrators. Whether you’re managing a single server or a large network, understanding how to control user privileges is an essential skill that will serve you well in your FreeBSD journey.

---

By following this guide, you should now have a solid understanding of how to grant sudo privileges on FreeBSD. Whether you choose `sudo` or `doas`, you can confidently manage user access and maintain a secure and efficient system.
