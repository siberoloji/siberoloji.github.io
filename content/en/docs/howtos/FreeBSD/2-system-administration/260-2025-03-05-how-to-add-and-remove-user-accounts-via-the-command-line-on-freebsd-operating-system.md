---
draft: false
title: How to Add and Remove User Accounts via the Command Line on FreeBSD Operating System
linkTitle: How to Add and Remove User Accounts
translationKey: how-to-add-and-remove-user-accounts-via-the-command-line-on-freebsd-operating-system
description: This article provides a step-by-step guide on how to add and remove user accounts via the command line on FreeBSD operating system.
url: how-to-add-and-remove-user-accounts-via-the-command-line-on-freebsd-operating-system
date: 2023-03-05
weight: 260
keywords:
  - FreeBSD
  - adduser
  - removeuser
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful, open-source Unix-like operating system known for its robustness, scalability, and advanced networking capabilities. It is widely used in servers, desktops, and embedded systems. One of the fundamental tasks for any system administrator is managing user accounts. Whether you're setting up a new server or maintaining an existing system, knowing how to add and remove user accounts via the command line is essential.

In this blog post, we'll walk you through the process of adding and removing user accounts on FreeBSD using the command line. We'll cover the necessary commands, options, and best practices to ensure you can manage user accounts efficiently and securely.

## Table of Contents

1. **Introduction to User Management on FreeBSD**
2. **Adding a User Account**
   - Using the `adduser` Command
   - Using the `pw` Command
3. **Removing a User Account**
   - Using the `rmuser` Command
   - Using the `pw` Command
4. **Modifying User Accounts**
5. **Best Practices for User Management**
6. **Conclusion**

## 1. Introduction to User Management on FreeBSD

User management is a critical aspect of system administration. It involves creating, modifying, and deleting user accounts, as well as assigning appropriate permissions and groups. On FreeBSD, user accounts can be managed using several command-line tools, including `adduser`, `rmuser`, and `pw`.

FreeBSD stores user account information in the `/etc/passwd` file, while group information is stored in the `/etc/group` file. These files are essential for the system to manage user permissions and access control.

## 2. Adding a User Account

### Using the `adduser` Command

The `adduser` command is an interactive tool that simplifies the process of adding a new user account. It prompts you for various details, such as the username, password, and user information.

#### Step-by-Step Guide

1. **Open a Terminal**: Log in to your FreeBSD system and open a terminal.

2. **Run the `adduser` Command**: Type `adduser` and press Enter.

   ```bash
   # adduser
   ```

3. **Follow the Prompts**:
   - **Username**: Enter the desired username.
   - **Full name**: Provide the user's full name.
   - **Uid (Leave empty for default)**: Press Enter to accept the default UID.
   - **Login group**: Press Enter to accept the default group (usually the same as the username).
   - **Additional groups**: Specify any additional groups the user should belong to (e.g., `wheel` for administrative privileges).
   - **Login class**: Press Enter to accept the default login class.
   - **Shell**: Choose the user's default shell (e.g., `/bin/sh`, `/bin/tcsh`, `/usr/local/bin/bash`).
   - **Home directory**: Press Enter to accept the default home directory.
   - **Password**: Set a password for the user.
   - **Confirm password**: Re-enter the password to confirm.

4. **Review and Confirm**: The `adduser` command will display a summary of the information you provided. Confirm by typing `yes` and pressing Enter.

5. **Add Another User?**: If you want to add another user, type `yes`; otherwise, type `no` to exit.

#### Example

```bash
# adduser
Username: johndoe
Full name: John Doe
Uid (Leave empty for default): 
Login group [johndoe]: 
Additional groups (comma separated, or leave empty): wheel
Login class [default]: 
Shell (sh csh tcsh nologin) [sh]: /usr/local/bin/bash
Home directory [/home/johndoe]: 
Password: 
Confirm password: 
OK? (yes/no): yes
Add another user? (yes/no): no
```

### Using the `pw` Command

The `pw` command is a more powerful and flexible tool for managing user accounts. It allows you to add users with a single command, making it ideal for scripting and automation.

#### Step-by-Step Guide

1. **Open a Terminal**: Log in to your FreeBSD system and open a terminal.

2. **Run the `pw` Command**: Use the `pw useradd` command to add a new user.

   ```bash
   # pw useradd <username> -c "<full name>" -s <shell> -m -d <home directory> -G <additional groups>
   ```

   - `<username>`: The desired username.
   - `<full name>`: The user's full name.
   - `<shell>`: The user's default shell.
   - `-m`: Create the user's home directory.
   - `<home directory>`: The path to the user's home directory.
   - `<additional groups>`: A comma-separated list of additional groups.

3. **Set the Password**: Use the `passwd` command to set the user's password.

   ```bash
   # passwd <username>
   ```

#### Example

```bash
# pw useradd johndoe -c "John Doe" -s /usr/local/bin/bash -m -d /home/johndoe -G wheel
# passwd johndoe
```

## 3. Removing a User Account

### Using the `rmuser` Command

The `rmuser` command is an interactive tool that simplifies the process of removing a user account. It prompts you for confirmation and can also remove the user's home directory and mail spool.

#### Step-by-Step Guide

1. **Open a Terminal**: Log in to your FreeBSD system and open a terminal.

2. **Run the `rmuser` Command**: Type `rmuser` followed by the username.

   ```bash
   # rmuser <username>
   ```

3. **Follow the Prompts**:
   - **Remove user's home directory?**: Type `yes` to remove the home directory or `no` to keep it.
   - **Remove user's mail spool?**: Type `yes` to remove the mail spool or `no` to keep it.
   - **Remove user's cron jobs?**: Type `yes` to remove cron jobs or `no` to keep them.
   - **Remove user's at jobs?**: Type `yes` to remove at jobs or `no` to keep them.

4. **Confirm Removal**: The `rmuser` command will display a summary of the actions it will take. Confirm by typing `yes` and pressing Enter.

#### Example

```bash
# rmuser johndoe
Remove user's home directory (/home/johndoe)? yes
Remove user's mail spool? yes
Remove user's cron jobs? yes
Remove user's at jobs? yes
OK? (yes/no): yes
```

### Using the `pw` Command

The `pw` command can also be used to remove a user account. This method is non-interactive and is suitable for scripting.

#### Step-by-Step Guide

1. **Open a Terminal**: Log in to your FreeBSD system and open a terminal.

2. **Run the `pw` Command**: Use the `pw userdel` command to remove a user.

   ```bash
   # pw userdel <username> -r
   ```

   - `<username>`: The username of the account to be removed.
   - `-r`: Remove the user's home directory and mail spool.

#### Example

```bash
# pw userdel johndoe -r
```

## 4. Modifying User Accounts

Sometimes, you may need to modify an existing user account, such as changing the user's shell, home directory, or group membership. The `pw` command is also useful for this purpose.

### Changing the User's Shell

To change a user's default shell, use the `pw usermod` command:

```bash
# pw usermod <username> -s <new_shell>
```

#### Example

```bash
# pw usermod johndoe -s /bin/tcsh
```

### Changing the User's Home Directory

To change a user's home directory, use the `pw usermod` command with the `-d` option:

```bash
# pw usermod <username> -d <new_home_directory> -m
```

The `-m` option moves the contents of the old home directory to the new location.

#### Example

```bash
# pw usermod johndoe -d /home/johndoe_new -m
```

### Adding a User to Additional Groups

To add a user to additional groups, use the `pw usermod` command with the `-G` option:

```bash
# pw usermod <username> -G <additional_groups>
```

#### Example

```bash
# pw usermod johndoe -G wheel,www
```

## 5. Best Practices for User Management

- **Use Strong Passwords**: Always set strong passwords for user accounts to enhance security.
- **Limit Administrative Privileges**: Only grant administrative privileges (e.g., membership in the `wheel` group) to trusted users.
- **Regularly Review User Accounts**: Periodically review and remove unused or unnecessary user accounts.
- **Backup Important Data**: Before removing a user account, ensure that any important data in the user's home directory is backed up.
- **Use SSH Keys for Authentication**: For remote access, consider using SSH keys instead of passwords for added security.

## 6. Conclusion

Managing user accounts is a fundamental task for any FreeBSD system administrator. Whether you're adding new users, removing old ones, or modifying existing accounts, FreeBSD provides powerful command-line tools like `adduser`, `rmuser`, and `pw` to help you get the job done efficiently.

By following the steps outlined in this blog post, you can confidently manage user accounts on your FreeBSD system. Remember to adhere to best practices to ensure the security and stability of your system.
