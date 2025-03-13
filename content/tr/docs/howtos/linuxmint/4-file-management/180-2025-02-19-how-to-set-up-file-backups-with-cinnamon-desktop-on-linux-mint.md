---
draft: true
title: How to Set Up File Backups with Cinnamon Desktop on Linux Mint
linkTitle: File Backups
translationKey: how-to-set-up-file-backups-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up file backups on Cinnamon Desktop in Linux Mint using Timeshift, Déjà Dup, Rsync, and cloud storage solutions.
date: 2025-02-19
url: how-to-set-up-file-backups-with-cinnamon-desktop-on-linux-mint
weight: 180
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - File Backups
featured_image: /images/linuxmint1.webp
---
Backing up your files is crucial to prevent data loss due to system failures, accidental deletions, or cyber threats. If you use **Linux Mint with the Cinnamon desktop**, you have various tools and methods available to set up **automatic and manual backups** easily.  

In this guide, we will cover different ways to back up your files, including using **Timeshift, Déjà Dup (Backup Tool), Rsync**, and cloud storage solutions. We will also discuss best practices for keeping your data safe.  

---

### **Why Backups Are Important**  

Before we get into the setup process, let’s quickly review why backups are essential:  

- **Protection Against Data Loss:** Hardware failures, malware, or accidental deletions can result in lost files.  
- **Easier System Recovery:** A backup allows you to restore files and settings with minimal effort.  
- **Convenience:** Having an automated backup system ensures you always have the latest version of your important files.  

Now, let’s explore how to **set up file backups on Cinnamon Desktop in Linux Mint**.  

---

## **1. Using Timeshift for System Backups**  

Timeshift is a built-in **snapshot tool** in Linux Mint that lets you **restore your system** if something goes wrong. However, Timeshift mainly **backs up system files, not personal files** like documents, photos, and videos.  

### **Installing Timeshift (If Not Installed)**  

Timeshift usually comes pre-installed on Linux Mint, but if it’s missing, install it with:  

```bash
sudo apt update
sudo apt install timeshift
```

### **Setting Up Timeshift**  

1. **Launch Timeshift** from the application menu.  
2. Choose a backup type:  
   - **RSYNC (Recommended):** Creates snapshots efficiently.  
   - **BTRFS:** Used for Btrfs file systems.  
3. Select a destination drive for your backups.  
4. Configure how often you want snapshots to be taken (**daily, weekly, monthly**).  
5. Click **Create** to manually take your first snapshot.  

### **Restoring from a Timeshift Snapshot**  

1. Open Timeshift.  
2. Select a snapshot from the list.  
3. Click **Restore** and follow the on-screen instructions.  

> **Note:** Timeshift does not back up personal files. For personal data, use **Déjà Dup** or **Rsync**.  

---

## **2. Using Déjà Dup for Personal File Backups**  

Déjà Dup (Backup Tool) is a simple **graphical backup solution** that allows you to back up personal files to external drives, network locations, or cloud services.  

### **Installing Déjà Dup**  

If it’s not already installed, run:  

```bash
sudo apt install deja-dup
```

### **Configuring Déjà Dup**  

1. Open **Backup (Déjà Dup)** from the application menu.  
2. Click **Folders to Save** and select directories you want to back up (e.g., **Documents, Pictures, Downloads**).  
3. Click **Folders to Ignore** to exclude unnecessary files.  
4. Choose a backup location:  
   - Local storage (External HDD, USB drive)  
   - Network storage (NAS, FTP, SSH)  
   - Cloud services (Google Drive, Nextcloud)  
5. Set an **automatic backup schedule** (daily, weekly, etc.).  
6. Click **Back Up Now** to start your first backup.  

### **Restoring Files with Déjà Dup**  

1. Open **Backup (Déjà Dup)**.  
2. Click **Restore** and select the backup location.  
3. Follow the on-screen steps to recover your files.  

---

## **3. Using Rsync for Advanced Backups**  

For those who prefer **command-line tools**, **Rsync** is a powerful utility for backing up files efficiently. It only copies changed files, saving both time and disk space.  

### **Installing Rsync**  

Rsync is usually pre-installed. To check, run:  

```bash
rsync --version
```

If it’s not installed, use:  

```bash
sudo apt install rsync
```

### **Creating a Backup with Rsync**  

To back up your **Home folder** to an external drive (`/mnt/backup`), run:  

```bash
rsync -av --progress ~/ /mnt/backup/
```

Explanation of options:  

- `-a` (archive mode): Preserves file permissions, timestamps, and symbolic links.  
- `-v` (verbose): Displays backup progress.  
- `--progress`: Shows detailed progress information.  

### **Automating Rsync with Cron**  

To run Rsync backups automatically, set up a **cron job**:  

1. Open the crontab editor:  

   ```bash
   crontab -e
   ```

2. Add the following line to run Rsync every day at midnight:  

   ```bash
   0 0 * * * rsync -a ~/ /mnt/backup/
   ```

3. Save and exit.  

This will ensure your files are backed up daily.  

---

## **4. Cloud Backup Solutions**  

If you prefer **cloud backups**, consider the following options:  

### **Google Drive with rclone**  

Rclone allows you to sync files with cloud storage like Google Drive, Dropbox, and OneDrive.  

#### **Installing rclone**  

```bash
sudo apt install rclone
```

#### **Configuring Google Drive Backup**  

1. Run `rclone config` and follow the prompts to set up your Google Drive.  
2. Once configured, sync your files with:  

   ```bash
   rclone sync ~/Documents remote:Backup/Documents
   ```

This keeps your **Documents** folder backed up in the cloud.  

---

## **5. Best Practices for Backups**  

To ensure your backups are reliable, follow these best practices:  

✅ **Use Multiple Backup Methods** – Combine **Timeshift, Déjà Dup, and Rsync** for a full backup strategy.  
✅ **Store Backups on an External Drive** – Keep at least one copy outside your main disk.  
✅ **Encrypt Your Backups** – Use tools like **GnuPG (GPG) or VeraCrypt** to protect sensitive data.  
✅ **Test Your Backups Regularly** – Ensure you can restore files successfully.  
✅ **Use Cloud Storage as a Redundant Option** – Services like Google Drive, Nextcloud, or Dropbox provide off-site protection.  

---

## **Final Thoughts**  

Setting up backups in **Linux Mint Cinnamon** is straightforward and ensures that your files and system remain safe from unexpected failures. **Timeshift** is great for system backups, **Déjà Dup** is excellent for personal files, **Rsync** provides flexibility for advanced users, and **cloud storage** adds extra protection.  

By following this guide, you can create a **robust backup strategy** that fits your needs and keeps your data secure.  

Do you have a preferred backup method? Let me know in the comments! 🚀
