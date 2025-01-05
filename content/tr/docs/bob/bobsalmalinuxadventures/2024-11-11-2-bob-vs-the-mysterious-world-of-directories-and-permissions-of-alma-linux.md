---
title: Bob vs. The Mysterious World of Directories and Permissions of AlmaLinux
linkTitle: Directories and Permissions
description: Understanding Linux file permissions and navigating the filesystem’s depths.
date: 2024-11-08
draft: false
prev: ""
next: ""
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 20
toc: true
keywords:
  - AlmaLinux file permissions
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: /bob-explores-mysterious-world-of-directories-permissions/
---

We’ll follow Bob as he explores permissions, the sticky bit, and hard and soft links.

## 1. Introduction: Bob’s Next Mission

After successfully installing AlmaLinux, Bob feels like he's finally starting to get the hang of this “sysadmin thing.” But today, he faces a new challenge: understanding Linux file permissions and navigating the filesystem’s depths. He knows permissions are essential for security and smooth operations, especially on a shared system, but he’s not entirely sure how they work—or why terms like "sticky bit" keep coming up.

Eager to dive in, Bob sets out on his next adventure!

---

## 2. Exploring the Linux Filesystem

Bob’s first stop is understanding the layout of the Linux filesystem. He discovers that directories like `/home`, `/var`, and `/tmp` each serve specific roles, while directories like `/root` and `/etc` contain critical system files.

- **/home** - This is where user directories live, like `/home/bob`. Here, Bob has free reign, which means it’s a safe playground for his experiments.
- **/root** - Reserved for the root user’s files and commands. Bob learns he should tread carefully here to avoid messing up any system-critical settings.
- **/tmp** - A temporary space for files, often shared among users and cleaned regularly.

As he explores each directory, Bob begins to understand the importance of permissions. But when he tries to access a file outside his home directory, he gets his first permissions error: *“Permission denied.”*

> *“Looks like it’s time to learn about permissions!”* Bob mutters.

---

## 3. File Permissions: Bob Learns the Rules of Access

Bob uses the `ls -l` command and notices that each file has a set of letters at the beginning, like `-rwxr-xr--`. He learns these are file permissions, telling him who can read, write, and execute each file.

Here’s the breakdown:

- **User (u)** - Permissions for the file’s owner.
- **Group (g)** - Permissions for the user group assigned to the file.
- **Others (o)** - Permissions for all other users.

The `rwx` permissions mean:

- **r** (read) - Allows viewing the file’s content.
- **w** (write) - Allows editing or deleting the file.
- **x** (execute) - Allows running the file as a program or script.

Bob decides to experiment by creating a text file and setting different permissions:

```bash
echo "Hello, AlmaLinux!" > hello.txt
ls -l hello.txt  # Check default permissions
```

Then, he tries modifying permissions using `chmod`. For example, he removes write permissions from everyone except himself:

```bash
chmod 744 hello.txt
ls -l hello.txt  # See how permissions changed to rwxr--r--
```

When Bob tries to access his file from another user account he created, he gets another “Permission denied” error, reinforcing that Linux permissions are indeed strict—but for good reason.

---

## 4. Special Permissions: The Sticky Bit

As Bob continues his journey, he stumbles upon a curious directory: `/tmp`. It’s open to all users, yet he learns it has a unique “sticky bit” permission that prevents one user from deleting another’s files.

To test this, Bob tries setting up his own “test” directory with a sticky bit:

```bash
mkdir /tmp/bob_test
chmod +t /tmp/bob_test
ls -ld /tmp/bob_test  # Notice the 't' at the end of permissions (drwxrwxrwt)
```

When he logs in as a different user and tries to delete files in `/tmp/bob_test`, he’s blocked unless he owns the file. This sticky bit is a lifesaver in shared directories, ensuring that only the file’s owner can delete it, even if everyone can access the folder.

> *“Alright, sticky bit—you’re my new friend!”* Bob declares, satisfied with his newfound knowledge.

---

## 5. Hard and Soft Links: Bob’s Double Take

Next, Bob notices something odd: a file in `/home/bob` with what seems to be a “shortcut” to another file. Intrigued, he learns about **links**—specifically, **hard links** and **soft (symbolic) links**.

- **Hard Links**: Bob discovers that a hard link is essentially another name for the same file, pointing to the same data on the disk. Deleting the original file doesn’t affect the hard link because it still references the same data.
- **Soft Links (Symbolic Links)**: A soft link, on the other hand, is like a shortcut pointing to the original file. If the original file is deleted, the soft link “breaks.”

Bob creates a hard link and a soft link to see the difference in action:

```bash
echo "Link test" > original.txt
ln original.txt hardlink.txt
ln -s original.txt softlink.txt
```

He checks his links:

```bash
ls -l original.txt hardlink.txt softlink.txt
```

To test the difference, he deletes the original file:

```bash
rm original.txt
ls -l hardlink.txt  # Hard link still shows content
ls -l softlink.txt  # Soft link now points to a non-existent file
```

Bob marvels at the results. The hard link remains intact, still containing the data, while the soft link now returns an error when he tries to view it. These discoveries give him insights into how links can help organize files and data, especially when working with multiple directories.

> *“Links: more powerful than I thought,”* Bob notes, scribbling this lesson in his growing list of sysadmin tips.

---

## 6. Conclusion: Bob Reflects on Permissions and Links

After a day filled with trials, errors, and “aha!” moments, Bob feels like he’s truly beginning to understand how Linux manages files and users. Between file permissions, the sticky bit, and the subtleties of hard vs. soft links, he’s taken a big step in his journey. Sure, he’s made a few mistakes along the way, but each one taught him something invaluable.

> Bob’s next challenge? Tackling **file ownership and user groups**, learning how to organize users and permissions on a larger scale!

*Stay tuned for the next adventure: "[Bob’s Battle with User Groups and Ownership!](/bobs-battle-with-alma-linux-user-groups-and-ownership/)"
