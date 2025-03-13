---
title: How to Manage Users on AlmaLinux Add, Remove, and Modify
description: Learn how to add, remove, and modify users on AlmaLinux. Detailed examples and best practices for permissions, quotas, and user management.
date: 2024-11-29
draft: false
tags:
  - AlmaLinux
  - adduser
  - chmod
categories:
  - Linux
  - Linux How-to
linkTitle: Manage Users
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 10
keywords:
  - Manage Users
featured_image: /images/almalinux.webp
url: manage-users-almalinux-add-remove-modify
translationKey: manage-users-almalinux-add-remove-modify
---

### **1. Understanding User Management in AlmaLinux**

User management in AlmaLinux involves controlling who can access the system, what they can do, and managing their resources. This includes adding new users, setting passwords, assigning permissions, and removing users when no longer needed. AlmaLinux uses the Linux kernel's built-in user management commands like `adduser`, `usermod`, `passwd`, and `deluser`.

---

### **2. Adding a New User**

AlmaLinux provides the `useradd` command for creating a new user. This command allows you to add a user while specifying their home directory, default shell, and other options.

### **Steps to Add a New User:**

1. Open your terminal and switch to the root user or a user with sudo privileges.
2. Run the following command to add a user:

```bash
sudo useradd -m -s /bin/bash newusername

```

- `m`: Creates a home directory for the user.
- `s`: Specifies the shell (default: `/bin/bash`).

3. Set a password for the new user:

```bash
sudo passwd newusername

```

{{% alert title="Warning" color="warning" %}}
 [The danger of passwordless accounts](/security-implications-passwordless-user-accounts-almalinux/) is that anyone can log in without a password.
{{% /alert %}}

1. Verify the user has been created:

```bash
cat /etc/passwd | grep newusername

```

This displays details of the newly created user, including their username, home directory, and shell.

---

### **3. Modifying User Details**

Sometimes, you need to update user information such as their shell, username, or group. AlmaLinux uses the `usermod` command for this.

### **Changing a User’s Shell**

To change the shell of an existing user:

```bash
sudo usermod -s /usr/bin/zsh newusername

```

Verify the change:

```bash
cat /etc/passwd | grep newusername

```

### **Renaming a User**

To rename a user:

```bash
sudo usermod -l newusername oldusername

```

Additionally, rename their home directory:

```bash
sudo mv /home/oldusername /home/newusername
sudo usermod -d /home/newusername newusername

```

### **Adding a User to a Group**

Groups allow better management of permissions. To add a user to an existing group:

```bash
sudo usermod -aG groupname newusername

```

For example, to add the user `newusername` to the `wheel` group (which provides sudo access):

```bash
sudo usermod -aG wheel newusername

```

---

### **4. Removing a User**

Removing a user from AlmaLinux involves deleting their account and optionally their home directory. Use the `userdel` command for this purpose.

### **Steps to Remove a User:**

1. To delete a user without deleting their home directory:

```bash
sudo userdel newusername

```

2. To delete a user along with their home directory:

```bash
sudo userdel -r newusername

```

3. Verify the user has been removed:

```bash
cat /etc/passwd | grep newusername

```

---

### **5. Managing User Permissions**

User permissions in Linux are managed using file permissions, which are categorized as **read (r)**, **write (w)**, and **execute (x)** for three entities: **owner**, **group**, and **others**.

### **Checking Permissions**

Use the `ls -l` command to view file permissions:

```bash
ls -l filename

```

The output might look like:

```bash
-rw-r--r-- 1 owner group 1234 Nov 28 10:00 filename

```

- `rw-`: Owner can read and write.
- `r--`: Group members can only read.
- `r--`: Others can only read.

### **Changing Permissions**

- Use `chmod` to modify file permissions:

```bash
sudo chmod 750 filename

```

- `750` sets permissions to:
  - Owner: read, write, execute.
  - Group: read and execute.
  - Others: no access.

- Use `chown` to change file ownership:

```bash
sudo chown newusername:groupname filename

```

---

### **6. Advanced User Management**

### **Managing User Quotas**

AlmaLinux supports user quotas to restrict disk space usage. To enable quotas:

- Install the quota package:

```bash
sudo dnf install quota

```

- Edit `/etc/fstab` to enable quotas on a filesystem. For example:

```bash
/dev/sda1 / ext4 defaults,usrquota,grpquota 0 1

```

- Remount the filesystem:

```bash
sudo mount -o remount /

```

- Initialize quota tracking:

```bash
sudo quotacheck -cug /

```

- Assign a quota to a user:

```bash
sudo setquota -u newusername 50000 55000 0 0 /

```

This sets a soft limit of 50MB and a hard limit of 55MB for the user.

---

### **7. Creating and Using Scripts for User Management**

For repetitive tasks like adding multiple users, scripts can save time.

### **Example Script to Add Multiple Users**

Create a script file:

```bash
sudo nano add_users.sh

```

Add the following code:

```bash
#!/bin/bash
while read username; do
    sudo useradd -m -s /bin/bash "$username"
    echo "User $username added successfully!"
done < user_list.txt

```

Save and exit, then make the script executable:

```bash
chmod +x add_users.sh

```

Run the script with a file containing a list of usernames (`user_list.txt`).

---

### **8. Best Practices for User Management**

1. **Use Groups:** Assign users to groups for better permission management.
2. **Enforce Password Policies:** Use tools like `pam_pwquality` to enforce strong passwords.
3. **Audit User Accounts:** Periodically check for inactive or unnecessary accounts.
4. **Backup Configurations:** Before making major changes, back up important files like `/etc/passwd` and `/etc/shadow`.

---

### **Conclusion**

Managing users on AlmaLinux is straightforward when you understand the commands and concepts involved. By following the steps and examples provided, you can effectively add, modify, and remove users, as well as manage permissions and quotas. AlmaLinux's flexibility ensures that administrators have the tools they need to maintain a secure and organized system.

Do you have any specific user management challenges on AlmaLinux? Let us know in the comments below!
