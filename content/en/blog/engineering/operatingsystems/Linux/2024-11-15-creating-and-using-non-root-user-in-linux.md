---
title: Creating and Using Non-Root User in Linux
description: In this blog post, we'll explore the process of creating and using non-root user in Linux.
date: 2024-11-15T18:54:24.613Z
draft: false
tags:
  - non-root user
  - create use on linux
categories:
  - Linux
linkTitle: Using Non-Root User
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - Non-root user
featured_image: /images/programming2.webp
url: creating-non-root-user-linux
---
## Introduction

When working in a Linux environment, it's important to understand the concept of user privileges and the distinction between the root user and non-root users. The root user, also known as the superuser, has the highest level of access and control over the system. While the root user can perform any action, including potentially destructive ones, it's generally considered best practice to avoid logging in and performing day-to-day tasks as the root user.

Instead, Linux system administrators and users should create and utilize non-root user accounts for most activities. Non-root users have limited permissions and access, which helps prevent accidental or unauthorized modifications to the system. In this blog post, we'll explore the process of creating and using non-root user accounts in Linux.

## Understanding User Privileges in Linux

In Linux, each user account is associated with a unique user ID (UID) and group ID (GID). The root user, also known as the superuser, has a UID of 0 and is part of the "root" group. Non-root user accounts are typically assigned UIDs starting from 1000 or higher, depending on the Linux distribution.

The root user has the highest level of privileges and can perform any action on the system, including installing software, modifying system files, and even deleting critical components. Non-root users, on the other hand, have limited permissions and can only perform actions that their assigned privileges allow.

It's important to note that some commands and actions may require elevated privileges, which can be obtained by using the `sudo` command or by temporarily switching to the root user using the `su` command.

## Creating a Non-Root User Account

To create a non-root user account in Linux, you can use the `useradd` command. Here's an example:

```bash
sudo useradd -m -G users,wheel username
```

Let's break down the options used in this command:

- `sudo`: Executes the command with root privileges, as non-root users typically don't have permission to create new user accounts.
- `useradd`: The command used to create a new user account.
- `-m`: Creates a home directory for the new user.
- `-G users,wheel`: Adds the new user to the "users" and "wheel" groups. The "wheel" group is often used to grant users the ability to use the `sudo` command.
- `username`: The username for the new non-root user account.

After running this command, you'll need to set a password for the new user using the `passwd` command:

```bash
sudo passwd username
```

This will prompt you to enter and confirm a new password for the user.

## Managing User Privileges

Once you've created a non-root user account, you can manage the user's privileges and permissions. Here are a few common tasks:

### Granting `sudo` Access

To allow the non-root user to execute commands with root privileges using the `sudo` command, you'll need to add the user to the "sudoers" file. You can do this by running the following command:

```bash
sudo visudo
```

This will open the sudoers file in a text editor. Locate the line that says `%wheel ALL=(ALL:ALL) ALL` and uncomment it (remove the leading `#` symbol) to grant `sudo` access to users in the "wheel" group.

Alternatively, you can add the user directly to the sudoers file by adding the following line:

```bash
username ALL=(ALL:ALL) ALL
```

Replace `username` with the name of the non-root user account.

### Modifying Group Memberships

You can add or remove a non-root user from groups using the `usermod` command. For example, to add a user to the "audio" group:

```bash
sudo usermod -a -G audio username
```

The `-a` option appends the user to the specified group, while `-G` specifies the group(s) to add the user to.

To remove a user from a group, you can use the same command but omit the `-a` option:

```bash
sudo usermod -G audio,another_group username
```

This will remove the user from the "audio" group and add them to the "another_group" group.

### Checking User Permissions

You can use the `id` command to view the groups a non-root user belongs to and their associated permissions:

```bash
id username
```

This will output information such as the user's UID, GID, and the groups they are a member of.

## Using the Non-Root User Account

Once you've created the non-root user account and granted the necessary permissions, you can switch to the new user using the `su` command:

```bash
su - username
```

The `-` option ensures that the new user's environment is properly set up, including variables like `$HOME` and `$PATH`.

Now, when you're logged in as the non-root user, you can perform most day-to-day tasks without the risk of accidentally modifying critical system files or settings. If you need to execute a command with elevated privileges, you can use the `sudo` command:

```bash
sudo command_to_execute
```

This will prompt you for the non-root user's password (if configured) and execute the command with root privileges.

## Benefits of Using Non-Root User Accounts

Using non-root user accounts offers several benefits:

1. **Improved Security**: By limiting the privileges of non-root users, you reduce the potential for accidental or unauthorized system modifications, which can help prevent security breaches or system instability.

2. **Isolation of Responsibilities**: Non-root users are restricted to their own home directories and cannot access or modify files and directories that they don't have permission to. This helps maintain a clear separation of responsibilities and prevents one user's actions from affecting the entire system.

3. **Easier Troubleshooting**: When issues arise, it's easier to identify the source of the problem when non-root users are responsible for their own actions, rather than having everything occur under the root user's permissions.

4. **Compliance and Auditing**: Many organizations have security policies that require the use of non-root user accounts for day-to-day tasks. This can help with compliance and allows for better auditing of user activities.

## Conclusion

In this blog post, we've explored the importance of creating and using non-root user accounts in a Linux environment. By understanding user privileges, creating non-root user accounts, and properly managing their permissions, you can enhance the security, stability, and maintainability of your Linux systems. Remember, the principle of least privilege is a fundamental security best practice, and using non-root user accounts is a crucial part of that approach.
