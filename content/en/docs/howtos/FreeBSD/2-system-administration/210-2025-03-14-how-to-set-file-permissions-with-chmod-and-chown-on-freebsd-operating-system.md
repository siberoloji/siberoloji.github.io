---
draft: false
title: How to Set File Permissions with `chmod` and `chown` on FreeBSD
linkTitle: How to Set File Permissions with `chmod` and `chown`
translationKey: how-to-set-file-permissions-with-chmod-and-chown-on-freebsd
description: This article provides a detailed guide on how to set file permissions and ownership using the `chmod` and `chown` commands on FreeBSD.
url: how-to-set-file-permissions-with-chmod-and-chown-on-freebsd
date: 2025-03-14
weight: 210
keywords:
  - FreeBSD
  - file permissions
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
File permissions are a cornerstone of security in Unix-like operating systems, including FreeBSD. Understanding how to properly set and manage permissions is essential for system administrators to maintain a secure environment while ensuring users and applications have the access they need. This guide provides a comprehensive exploration of file permissions on FreeBSD, focusing on the two primary tools used to manage them: `chmod` (change mode) and `chown` (change owner).

## Understanding FreeBSD File Permissions

Before diving into the commands, it's important to understand how file permissions work in FreeBSD.

### The Permission Model

FreeBSD, like other Unix-like systems, uses a permission model based on three types of users:

1. **Owner** (u): The user who owns the file
2. **Group** (g): The group associated with the file
3. **Others** (o): Everyone else on the system

For each of these user types, there are three basic permission types:

1. **Read** (r): Permission to read the file or list directory contents
2. **Write** (w): Permission to modify the file or create/delete files within a directory
3. **Execute** (x): Permission to run the file as a program or traverse a directory

These permissions are represented both symbolically (rwx) and numerically (4-2-1):

- Read (r) = 4
- Write (w) = 2
- Execute (x) = 1

### Special Permission Bits

Beyond the basic rwx permissions, FreeBSD supports special permission bits:

1. **Setuid** (SUID): When set on an executable, it runs with the permissions of the file owner instead of the user executing it
2. **Setgid** (SGID): When set on an executable, it runs with the permissions of the file group; when set on a directory, new files created in that directory inherit the directory's group
3. **Sticky Bit**: When set on a directory, files within can only be deleted or renamed by their owner (commonly used for `/tmp`)

### Viewing Current Permissions

Before changing permissions, you should check the current status. The `ls -l` command displays permissions in the following format:

```
$ ls -l
-rw-r--r--  1 user  group  1024 Mar 14 10:30 example.txt
```

The first character indicates the file type (`-` for regular file, `d` for directory), followed by three permission triads (rwx) for owner, group, and others.

## The `chmod` Command

The `chmod` command (change mode) is used to modify file permissions. It can be used with either symbolic notation or numeric (octal) notation.

### Symbolic Notation

Symbolic notation uses letters to represent users and permissions:

```sh
chmod [who][operation][permissions] file
```

Where:

- `who` is `u` (user/owner), `g` (group), `o` (others), or `a` (all)
- `operation` is `+` (add permission), `-` (remove permission), or `=` (set exact permission)
- `permissions` is any combination of `r` (read), `w` (write), and `x` (execute)

#### Examples of Symbolic Notation

1. Add execute permission for the owner:

   ```sh
   chmod u+x script.sh
   ```

2. Remove write permission for group and others:

   ```sh
   chmod go-w important.conf
   ```

3. Set read and execute permissions for everyone:

   ```sh
   chmod a=rx program
   ```

4. Add read permission for group, but remove it for others:

   ```sh
   chmod g+r,o-r document.pdf
   ```

### Numeric (Octal) Notation

Numeric notation uses three or four digits to set permissions for owner, group, and others:

```sh
chmod [options] mode file
```

Where `mode` is a three or four-digit octal number representing permissions.

For a three-digit number:

- First digit: Owner permissions
- Second digit: Group permissions
- Third digit: Others permissions

Each digit is calculated by adding the values for the desired permissions:

- Read (4)
- Write (2)
- Execute (1)

For a four-digit number, the first digit represents special permissions:

- SUID (4)
- SGID (2)
- Sticky bit (1)

#### Examples of Numeric Notation

1. Set read, write, execute for owner; read, execute for group; and read for others:

   ```sh
   chmod 754 script.sh
   ```

   (7=4+2+1 for owner, 5=4+1 for group, 4 for others)

2. Set read, write for owner; read for group and others:

   ```sh
   chmod 644 document.txt
   ```

   (6=4+2 for owner, 4 for group, 4 for others)

3. Set SUID, read, write, execute for owner; read, execute for group and others:

   ```sh
   chmod 4755 program
   ```

   (4 for SUID, 7=4+2+1 for owner, 5=4+1 for group, 5=4+1 for others)

### Recursive Permission Changes

To apply permissions recursively to all files and directories within a directory, use the `-R` flag:

```sh
chmod -R 755 /path/to/directory
```

However, this approach applies the same permissions to both files and directories, which is often not desirable. For more control, consider using `find` with `chmod`:

```sh
# Set 755 for directories and 644 for files
find /path/to/directory -type d -exec chmod 755 {} \;
find /path/to/directory -type f -exec chmod 644 {} \;
```

### Special Permission Examples

1. Set SUID:

   ```sh
   chmod u+s executable
   # or
   chmod 4755 executable
   ```

2. Set SGID on a directory (files created will inherit the directory's group):

   ```sh
   chmod g+s shared_directory
   # or
   chmod 2775 shared_directory
   ```

3. Set sticky bit on a directory:

   ```sh
   chmod +t public_directory
   # or
   chmod 1777 public_directory
   ```

## The `chown` Command

While `chmod` changes permissions, `chown` (change owner) changes the owner and/or group of files and directories.

### Basic Usage

```sh
chown [options] owner[:group] file
```

Where:

- `owner` is the user who will own the file
- `group` is the group that will be associated with the file (optional)

### Examples

1. Change the owner of a file:

   ```sh
   chown alice file.txt
   ```

2. Change both owner and group:

   ```sh
   chown alice:developers file.txt
   ```

3. Change only the group (two equivalent methods):

   ```sh
   chown :developers file.txt
   # or
   chgrp developers file.txt
   ```

### Recursive Ownership Changes

To change ownership recursively, use the `-R` flag:

```sh
chown -R alice:developers /path/to/project
```

### Changing Ownership by Reference

You can copy ownership from one file to another using the `--reference` option:

```sh
chown --reference=reference_file target_file
```

## Common Permission Scenarios

Let's examine several common scenarios and the appropriate permission settings for each:

### Web Server Files

For files served by a web server like Nginx or Apache:

```sh
# Configuration files (only administrators should modify)
chown root:wheel /usr/local/etc/nginx/nginx.conf
chmod 644 /usr/local/etc/nginx/nginx.conf

# Web content files (www user needs read access)
chown root:www /usr/local/www/example.com/index.html
chmod 644 /usr/local/www/example.com/index.html

# For directories
chmod 755 /usr/local/www/example.com

# For content that needs to be written by the web server (e.g., uploads)
chown www:www /usr/local/www/example.com/uploads
chmod 775 /usr/local/www/example.com/uploads
```

### Home Directories

For user home directories:

```sh
# Base home directory
chown alice:alice /home/alice
chmod 750 /home/alice

# Public web directory (if needed)
mkdir /home/alice/public_html
chown alice:www /home/alice/public_html
chmod 755 /home/alice/public_html
```

### Shared Directories

For directories shared between users:

```sh
# Create a shared group
pw groupadd project_team

# Add users to the group
pw groupmod project_team -m alice,bob,charlie

# Set up the shared directory
mkdir /projects/shared_project
chown root:project_team /projects/shared_project
chmod 2775 /projects/shared_project
```

The `2` in `2775` sets the SGID bit, ensuring that new files created in the directory inherit the `project_team` group.

## Advanced Permission Topics

### Access Control Lists (ACLs)

For more granular control than the traditional Unix permissions model allows, FreeBSD supports Access Control Lists (ACLs).

To use ACLs, first ensure your filesystem is mounted with ACL support. Add the `acls` option to the relevant filesystem entry in `/etc/fstab`:

```
/dev/ada0p2    /home    ufs    rw,acls    2    2
```

After remounting the filesystem or rebooting, you can use the `setfacl` and `getfacl` commands to manage ACLs:

```sh
# View ACLs for a file
getfacl file.txt

# Set an ACL for a specific user
setfacl -m u:bob:rw file.txt

# Set an ACL for a specific group
setfacl -m g:project_team:r file.txt
```

### Mandatory Access Control (MAC)

FreeBSD includes the MAC framework for implementing mandatory access controls. This provides additional security beyond standard Unix permissions and is configured through kernel modules and the `/etc/mac.conf` file.

To enable MAC:

1. Add the following to `/boot/loader.conf`:

   ```
   mac_biba_load="YES"
   mac_seeotheruids_load="YES"
   ```

2. Configure policies in `/etc/rc.conf`:

   ```
   mac_seeotheruids_enabled="YES"
   ```

## Permission Best Practices

### Security Principles

1. **Principle of Least Privilege**: Grant only the permissions necessary for users or processes to perform their tasks.

2. **Default Deny**: Start with restrictive permissions and add access as needed rather than starting with open permissions.

3. **Regular Audits**: Periodically review permissions, especially on sensitive files and directories.

### Common Permission Sets

These standard permission sets work well for most situations:

1. **Regular files**: `644` (owner can read/write, everyone else can read)

   ```sh
   chmod 644 regular_file.txt
   ```

2. **Executable files**: `755` (owner can read/write/execute, everyone else can read/execute)

   ```sh
   chmod 755 script.sh
   ```

3. **Configuration files**: `640` (owner can read/write, group can read, others have no access)

   ```sh
   chmod 640 config.conf
   ```

4. **Directories**: `755` (owner can read/write/access, everyone else can read/access)

   ```sh
   chmod 755 directory_name
   ```

5. **Private directories**: `700` (only owner has access)

   ```sh
   chmod 700 private_directory
   ```

### Automation and Consistency

For maintaining consistent permissions across a system, consider using:

1. **Default umask**: Set system-wide or user-specific umask values in `/etc/login.conf` or shell initialization files:

   ```
   # In .profile, .cshrc, etc.
   umask 022  # Files created with 644, directories with 755
   ```

2. **Periodic maintenance**: Create scripts to verify and reset permissions on critical system areas:

   ```sh
   #!/bin/sh
   # Reset permissions on config files
   find /usr/local/etc -type f -exec chmod 644 {} \;
   find /usr/local/etc -type d -exec chmod 755 {} \;
   ```

## Troubleshooting Permission Issues

### Common Issues and Solutions

1. **"Permission denied" when executing a script**:

   ```sh
   chmod +x script.sh
   ```

2. **Cannot access a directory**:

   ```sh
   # Check permissions on the directory and all parent directories
   ls -ld /path /path/to /path/to/directory
   ```

3. **Files created with wrong permissions**:

   ```sh
   # Check your umask setting
   umask
   ```

4. **Ownership problems after restoring files**:

   ```sh
   # Fix ownership recursively
   chown -R correct_user:correct_group /restored/files
   ```

### Diagnostic Commands

When troubleshooting permission issues, these commands can help:

```sh
# Who am I and what groups do I belong to?
id

# What processes are accessing a file?
fstat /path/to/file

# Check capabilities of a running process
procstat -p PID

# Trace system calls related to file access
truss command_with_permission_problems
```

## Conclusion

Understanding and properly managing file permissions is fundamental to maintaining a secure and functional FreeBSD system. The `chmod` and `chown` commands provide powerful, flexible tools for controlling access to files and directories. By mastering these commands and understanding the underlying permission concepts, administrators can implement robust security policies while ensuring appropriate access for users and applications.

Remember that good permission management is not a one-time task but an ongoing process that requires regular attention, particularly as system configurations change and new users and applications are added. Following best practices and principles like least privilege will help maintain a secure environment without unnecessarily restricting legitimate system use.

FreeBSD's permission system, while rooted in traditional Unix concepts, offers additional features like ACLs and MAC for environments that require more granular control. For most everyday administration tasks, however, the standard tools—`chmod` and `chown`—remain the primary means of managing who can do what with the files on your system.
