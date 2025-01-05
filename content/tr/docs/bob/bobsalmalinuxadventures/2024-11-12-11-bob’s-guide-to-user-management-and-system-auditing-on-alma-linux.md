---
title: Bob’s Guide to User Management and System Auditing
linkTitle: User Management
description: Bob’s Guide to User Management and System Auditing, where Bob will learn to manage user accounts, control access, and keep track of system activity.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 110
toc: true
keywords:
  - User Management
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-guide-user-management-system-auditing-alma-linux
---

Bob’s Guide to User Management and System Auditing, where Bob will learn to manage user accounts, control access, and keep track of system activity.

## 1. Introduction: Bob’s New Challenge with User Management

Bob’s boss tells him that they’ll be adding new team members soon, which means he’ll need to set up user accounts and manage permissions. Plus, he’ll need to keep an eye on activity to ensure everything stays secure. Bob realizes it’s time to master user management and auditing.

> *“Time to get organized and make sure everyone has the right access!”* Bob says, ready for the challenge.

---

##  2. Creating and Managing User Accounts

Bob begins by learning to create user accounts and manage them effectively.

- **Creating a New User**: To add a user, Bob uses the `useradd` command. He sets up an account for a new user, `alice`:

  ```bash
  sudo useradd -m alice
  sudo passwd alice
  ```

  - **`-m`**: Creates a home directory for `alice`.
  - **`passwd`**: Sets a password for the user.

- **Modifying Users**: Bob can modify user details with `usermod`. For instance, to add `alice` to the `devteam` group:

  ```bash
  sudo usermod -aG devteam alice
  ```

- **Deleting Users**: When a user leaves, Bob removes their account with:

  ```bash
  sudo userdel -r alice
  ```

  - **`-r`**: Deletes the user’s home directory along with the account.

> *“Now I can set up and manage user accounts easily,”* Bob notes, feeling organized.

---

## 3. Setting Up User Groups and Permissions

Bob decides to set up groups for different departments to streamline permissions.

- **Creating Groups**: Bob creates groups for different teams:

  ```bash
  sudo groupadd devteam
  sudo groupadd marketing
  ```

- **Assigning Users to Groups**: He then assigns users to the appropriate groups:

  ```bash
  sudo usermod -aG devteam alice
  sudo usermod -aG marketing bob
  ```

- **Setting Group Permissions on Directories**: Bob creates a directory for each group and sets permissions so only group members can access it:

  ```bash
  sudo mkdir /home/devteam
  sudo chown :devteam /home/devteam
  sudo chmod 770 /home/devteam
  ```

> *“With groups, I can control access with a single command!”* Bob says, appreciating the efficiency.

---

## 4. Implementing `sudo` Permissions

Bob knows it’s essential to limit root access to maintain security. He decides to give certain users `sudo` access while controlling what they can do.

- **Adding a User to the `sudo` Group**: To grant a user full sudo privileges, Bob adds them to the `wheel` group:

  ```bash
  sudo usermod -aG wheel alice
  ```

- **Limiting `sudo` Commands**: For finer control, Bob edits the `/etc/sudoers` file to specify allowed commands:

  ```bash
  sudo visudo
  ```

  He adds a rule to let `alice` only use `apt` commands:

  ```bash
  alice ALL=(ALL) /usr/bin/dnf
  ```

> *“Controlled access helps keep the system secure while giving users the tools they need,”* Bob notes, satisfied with the added layer of security.

---

## 5. Monitoring User Activity with Logs

Bob realizes that monitoring logs is essential for understanding user behavior and detecting suspicious activity.

- **Checking `auth.log` for Login Attempts**: To monitor successful and failed login attempts, Bob checks `/var/log/secure`:

  ```bash
  sudo tail /var/log/secure
  ```

  This log shows which users logged in and any failed attempts, helping Bob spot unauthorized access.

- **Viewing Command History with `history`**: He uses `history` to view recent commands run by users:

  ```bash
  history
  ```

  If he needs to check another user’s history, he can look at their `.bash_history` file:

  ```bash
  sudo cat /home/alice/.bash_history
  ```

> *“Regularly checking logs will help me stay on top of any unusual activity,”* Bob says, feeling proactive.

---

## 6. Using `last` and `lastlog` for Login Tracking

Bob decides to track recent and past logins to understand user patterns and detect any unusual behavior.

- **Using `last` to See Recent Logins**: Bob uses `last` to view recent login activity:

  ```bash
  last
  ```

  This command lists recent logins, including the user, login time, and logout time.

- **Using `lastlog` for a Login Summary**: `lastlog` shows the most recent login for each user:

  ```bash
  lastlog
  ```

  If he notices any login attempts from an unexpected IP, he can investigate further.

> *“Now I can quickly see when and where users have logged in,”* Bob says, feeling better prepared to monitor his system.

---

## 7. Setting Up Audit Rules with `auditd`

For a more comprehensive approach to tracking activity, Bob learns about `auditd`, a powerful auditing tool that can log events like file access and user actions.

- **Installing and Enabling `auditd`**: To set up `auditd`, Bob installs and enables it:

  ```bash
  sudo dnf install audit
  sudo systemctl start auditd
  sudo systemctl enable auditd
  ```

- **Creating Audit Rules**: Bob sets up a rule to track changes to a critical configuration file:

  ```bash
  sudo auditctl -w /etc/passwd -p wa -k passwd_changes
  ```

  - **`-w /etc/passwd`**: Watches the `/etc/passwd` file.
  - **`-p wa`**: Logs write and attribute changes.
  - **`-k passwd_changes`**: Adds a label for easier search.

- **Viewing Audit Logs**: To view logged events, Bob checks the audit log:

  ```bash
  sudo ausearch -k passwd_changes
  ```

> *“With `auditd`, I can track critical changes and stay on top of security!”* Bob says, impressed by the depth of logging.

---

## 8. Conclusion: Bob’s User Management and Auditing Skills

With user management and auditing under his belt, Bob feels confident that his system is both organized and secure. He can now set up accounts, control access, and monitor activity to ensure everything runs smoothly and safely.

> Next, Bob wants to dive into **network services and configuration** to expand his knowledge of networking.

*Stay tuned for the next chapter: "Bob’s Journey into Network Services and Configuration!"*
