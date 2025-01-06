---
draft: false
title: "AlmaLinux: How to Add, Change Privileges, and Remove User Accounts"
date: 2024-10-04T12:54:43+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-how-to-add-change-privileges-and-remove-user-accounts-2/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
---


AlmaLinux, as a robust and enterprise-grade Linux distribution, provides powerful user management capabilities. Whether you're setting up a new server, managing a multi-user workstation, or simply need to modify existing user accounts, understanding how to add, modify, and remove user accounts is crucial. In this comprehensive guide, we'll walk you through the process of managing user accounts on AlmaLinux, covering everything from creating new users to removing old ones, with a focus on changing user privileges.



## Understanding User Accounts in AlmaLinux



Before we dive into the specifics, it's important to understand a few key concepts:


* **Root User**: The superuser account with full system privileges.

* **Regular Users**: Standard accounts with limited permissions.

* **Groups**: Collections of users that can be assigned specific permissions.

* **Home Directories**: Each user typically has their own directory in `/home/`.

* **Shell**: The command-line interface assigned to a user (e.g., bash, zsh).




Now, let's explore how to manage these accounts effectively.



## Adding a New User Account



Creating a new user account in AlmaLinux is a straightforward process. You can do this using either the `useradd` command or the more user-friendly `adduser` command.



Using `useradd`



The basic syntax for `useradd` is:


```bash
sudo useradd [options] username```



Here's an example of creating a new user named "johndoe":


```bash
sudo useradd -m -s /bin/bash johndoe```



In this command:


* `-m` creates a home directory for the user

* `-s /bin/bash` sets bash as the default shell




After creating the user, set a password:


```bash
sudo passwd johndoe```



Using `adduser`



The `adduser` command is more interactive and user-friendly:


```bash
sudo adduser johndoe```



This command will prompt you for various details like password, full name, and other optional information.



## Changing User Privileges



Modifying user privileges is a common task in system administration. There are several ways to adjust a user's permissions in AlmaLinux.



Using `usermod`



The `usermod` command is versatile for modifying user accounts. Here are some common use cases:


* **Adding a user to a group**:



```bash
   sudo usermod -aG groupname username```



For example, to add "johndoe" to the "wheel" group (which typically grants sudo privileges):


```bash
   sudo usermod -aG wheel johndoe```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Changing a user's primary group**:



```bash
   sudo usermod -g newgroup username```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* **Changing a user's home directory**:



```bash
   sudo usermod -d /new/home/directory username```


<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* **Changing a user's shell**:



```bash
   sudo usermod -s /bin/new-shell username```



Using `visudo` to Grant Sudo Privileges



To give a user sudo privileges, you can add them to the sudoers file:


* Open the sudoers file:



```bash
   sudo visudo```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Add the following line to grant full sudo access:



```bash
   johndoe ALL=(ALL) ALl
```



Or, for passwordless sudo:


```bash
   johndoe ALL=(ALL) NOPASSWD: ALl
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Save and exit the file.




Managing Group Memberships



You can also manage privileges by adding or removing users from specific groups:


* To add a user to a group:



```bash
  sudo gpasswd -a username groupname```


* To remove a user from a group:



```bash
  sudo gpasswd -d username groupname```


* To create a new group:



```bash
  sudo groupadd groupname```



## Removing a User Account



When it's time to remove a user account, AlmaLinux provides a few options.



Using `userdel`



The basic command to remove a user is:


```bash
sudo userdel username```



However, this leaves the user's home directory and mail spool intact. To remove these as well, use:


```bash
sudo userdel -r username```



Using `deluser`



The `deluser` command is more interactive and can handle some cleanup tasks:


```bash
sudo deluser --remove-home username```



This removes the user's home directory and mail spool.



## Best Practices for User Management



When managing user accounts on AlmaLinux, consider these best practices:


* **Use Strong Passwords**: Enforce strong password policies using tools like `pam_pwquality`.

* **Principle of Least Privilege**: Only grant users the minimum privileges necessary for their tasks.

* **Regular Audits**: Periodically review user accounts and their privileges.

* **Use Groups**: Organize users into groups for easier permission management.

* **Secure the Root Account**: Avoid using the root account directly; use sudo for administrative tasks.

* **Monitor User Activities**: Use tools like `auditd` to track user actions, especially for privileged accounts.

* **Implement SSH Key Authentication**: For remote access, consider using SSH keys instead of passwords.

* **Set Up Password Aging**: Use the `chage` command to manage password expiration and aging policies.




## Advanced User Management Techniques



For more advanced user management, consider these techniques:



Using Access Control Lists (ACLs)



ACLs provide more fine-grained control over file and directory permissions:


```bash
sudo setfacl -m u:username:rx /path/to/directory
```



Implementing Disk Quotas



To limit the amount of disk space a user can use:


* Enable quotas in `/etc/fstab`

* Use `quotacheck` to initialize the quota database

* Set quotas with `edquota`




Using PAM (Pluggable Authentication Modules)



PAM allows you to set up sophisticated authentication policies. You can configure PAM modules in `/etc/pam.d/` to implement features like:


* Password strength requirements

* Login attempt limits

* Two-factor authentication




## Troubleshooting Common Issues



Here are some common issues you might encounter when managing user accounts and how to resolve them:


* **User can't log in**: Check the user's password, shell, and home directory permissions.

* **Sudo access not working**: Verify the user's entry in the sudoers file and group memberships.

* **Home directory issues**: Ensure proper ownership and permissions on the user's home directory.

* **Group permission problems**: Double-check group memberships and file/directory group permissions.




## Conclusion



Effective user management is crucial for maintaining a secure and efficient AlmaLinux system. By mastering the techniques to add users, modify their privileges, and remove accounts when necessary, you'll be well-equipped to manage your AlmaLinux system with confidence.



Remember, with great power comes great responsibility. Always be cautious when modifying user accounts, especially when dealing with system users or granting elevated privileges. Regular audits and following best practices will help ensure your AlmaLinux system remains secure and well-organized.



Whether you're managing a small personal server or a large enterprise environment, these user management skills will serve you well in your journey with AlmaLinux. Happy administrating!
