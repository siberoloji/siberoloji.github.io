---
title: Bob Learns System Backup and Recovery on AlmaLinux
linkTitle: System Backup
description: Bob's ready to learn how to create, automate, and test backups on AlmaLinux.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 70
keywords:
  - System Backup and Recovery
featured_image: /images/bobs-adventures-with-alma-linux.png
url: /bob-learns-system-backup-recovery-alma-linux/
translationKey: bob-learns-system-backup-recovery-alma-linux
---

"Bob Learns System Backup and Recovery". In this chapter, Bob will learn how to create backups, automate them, and restore data if something goes wrong—a crucial skill for any sysadmin!

## 1. Introduction: Bob’s Backup Awakening

After a long day of setting up scripts and configurations, Bob accidentally deletes a critical file. Thankfully, he recovers it, but the experience serves as a wake-up call—he needs to set up a proper backup system to avoid any future disasters. Bob's ready to learn how to create, automate, and test backups on AlmaLinux.

> *“Better safe than sorry. Time to back everything up!”* Bob says, determined to make sure his data is secure.

---

## 2. Overview of Backup Strategies

Before diving in, Bob researches different backup strategies and learns about the three main types:

- **Full Backups**: A complete copy of all selected files, offering full restoration but using the most storage and time.
- **Incremental Backups**: Only the changes since the last backup are saved, saving storage space but taking longer to restore.
- **Differential Backups**: Copies changes since the last full backup, a middle-ground option that saves storage while providing faster restoration.

After reviewing his options, Bob decides to start with full backups and plans to explore incremental backups later.

> *“I’ll start with full backups, then add automation and incremental backups as I go,”* he notes, feeling organized.

---

## 3. Creating a Basic Backup with `tar`

To practice, Bob learns how to use `tar` to create a compressed backup of his `/home/bob/documents` directory.

- **Creating a Compressed Backup**: He runs the following command to compress his files into a `.tar.gz` archive:

  ```bash
  tar -czf /home/bob/backups/documents_backup_$(date +\%Y-\%m-\%d).tar.gz /home/bob/documents
  ```

  - **`-c`**: Creates a new archive.
  - **`-z`**: Compresses the archive with gzip.
  - **`-f`**: Specifies the filename.
  - **`$(date +\%Y-\%m-\%d)`**: Adds the current date to the filename for easy tracking.

Bob successfully creates a backup file, and he’s pleased to see it listed in his `/home/bob/backups` directory.

> *“Alright, my documents are safe for now,”* he thinks with relief.

---

## 4. Automating Backups with `rsync` and Cron

Bob decides that manual backups are too easy to forget, so he automates the process with `rsync`, a powerful tool for syncing files and directories.

- **Setting Up `rsync` for Incremental Backups**: `rsync` only copies changes, which saves time and space. Bob sets up `rsync` to back up his documents to an external directory:

  ```bash
  rsync -av --delete /home/bob/documents /home/bob/backups/documents
  ```

  - **`-a`**: Archives files, preserving permissions, timestamps, and ownership.
  - **`-v`**: Verbose mode to see what’s being copied.
  - **`--delete`**: Deletes files in the backup that no longer exist in the source.

- **Automating with Cron**: To schedule this task weekly, Bob edits his crontab:

  ```bash
  crontab -e
  ```

  And adds this line:

  ```bash
  0 2 * * 0 rsync -av --delete /home/bob/documents /home/bob/backups/documents
  ```

  This runs `rsync` every Sunday at 2 a.m., ensuring his documents are always backed up without him needing to remember.

> *“Automated backups—now I can sleep easy!”* Bob says, satisfied with his new setup.

---

## 5. Testing and Restoring Backups

Bob knows that a backup system isn’t truly effective until he’s tested it. He decides to simulate a file recovery scenario to ensure he can restore his files if something goes wrong.

- **Deleting a Test File**: He removes a file from his `/home/bob/documents` directory as a test.

- **Restoring the File from Backup**: To restore, Bob uses `rsync` in reverse:

  ```bash
  rsync -av /home/bob/backups/documents/ /home/bob/documents/
  ```

  This command copies the file back to its original location. He confirms that the file is successfully restored.

- **Extracting from `tar` Archive**: Bob also practices restoring files from his `tar` backup. To extract a specific file from the archive, he runs:

  ```bash
  tar -xzf /home/bob/backups/documents_backup_2023-11-10.tar.gz -C /home/bob/documents filename.txt
  ```

  This command restores `filename.txt` to the original directory.

> *“Testing backups is just as important as creating them,”* Bob notes, relieved to see his data safely restored.

---

## 6. Conclusion: Bob’s Backup Confidence

Now that he has a reliable backup system in place, Bob feels prepared for anything. Between his scheduled `rsync` backups, `tar` archives, and his ability to restore files, he knows he can handle unexpected data loss.

> Next, he’s ready to dive into AlmaLinux’s package management and repositories, learning to install and manage software with ease.

*Stay tuned for the next chapter: "Bob Explores Package Management and Repositories!"*
