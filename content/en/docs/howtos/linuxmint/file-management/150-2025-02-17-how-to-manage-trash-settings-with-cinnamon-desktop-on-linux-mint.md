---
draft: false
title: How to Manage Trash Settings with Cinnamon Desktop on Linux Mint
linkTitle: How to Manage Trash Settings
translationKey: how-to-manage-trash-settings-with-cinnamon-desktop-on-linux-mint
description: Learn how to manage trash settings with Cinnamon Desktop on Linux Mint, including how to configure automatic trash emptying, troubleshoot common issues, and restore or permanently delete files.
url: how-to-manage-trash-settings-with-cinnamon-desktop-on-linux-mint
weight: 150
date: 2025-02-17
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Trash Management
featured_image: /images/linuxmint1.webp
---
Linux Mint, one of the most user-friendly Linux distributions, is well known for its Cinnamon desktop environment. Cinnamon provides an intuitive and familiar experience for users transitioning from Windows, while also being powerful and customizable. One often overlooked but essential feature in any desktop environment is its trash management system. The trash feature ensures that deleted files are not immediately lost but instead stored temporarily until the user decides to either restore or permanently delete them.

In this guide, we'll explore how to manage trash settings with Cinnamon Desktop on Linux Mint effectively. Whether you're looking to customize how your trash functions, automate emptying trash, or troubleshoot common issues, this guide has you covered.

## Understanding the Trash System in Linux Mint

Before diving into the management settings, it’s essential to understand how the trash system works in Linux Mint with Cinnamon.

### How the Trash System Works

When you delete a file in Linux Mint using the graphical file manager (Nemo), the file is not permanently removed. Instead, it is moved to the `~/.local/share/Trash` directory, which consists of:

- `files/` – The actual deleted files.
- `info/` – Metadata about the deleted files, such as original location and deletion time.

These files remain in the trash until manually or automatically emptied.

## Accessing the Trash Folder

You can access the trash in several ways:

1. **Using Nemo (File Manager):**

   - Open Nemo and click on the "Trash" shortcut in the left sidebar.

2. **From the Desktop:**

   - By default, Cinnamon includes a Trash icon on the desktop. Double-clicking it opens the trash folder.

3. **Using the Terminal:**

   - To list trashed files, open a terminal and run:

     ```bash
     ls ~/.local/share/Trash/files/
     ```

   - To open the trash directory:

     ```bash
     nemo ~/.local/share/Trash/files/
     ```

## Managing Trash Settings in Linux Mint (Cinnamon Desktop)

Now that you know how the trash system works and how to access it, let's explore various ways to manage its settings effectively.

### 1. Configuring Automatic Trash Emptying

By default, Linux Mint does not automatically delete trash files. If you want to enable automatic trash emptying to save disk space, you can use built-in tools or scheduled tasks.

#### a) Using System Settings (Graphical Method)

Linux Mint allows users to set up a cleanup schedule via the Disk Usage Analyzer:

1. Open **System Settings**.
2. Navigate to **Privacy** > **Recent Files & Trash**.
3. Enable **Automatically delete old trash and temporary files**.
4. Set a desired retention period (e.g., 30 days).
5. Click **Apply** to save changes.

This method ensures that your trash is cleared at regular intervals without requiring manual intervention.

#### b) Using a Cron Job (Terminal Method)

For advanced users, a cron job can be set up to empty trash automatically:

1. Open a terminal.
2. Type `crontab -e` to edit the crontab file.
3. Add the following line to delete all trash files older than 30 days:

   ```bash
   0 0 * * * find ~/.local/share/Trash/files/ -type f -mtime +30 -exec rm -f {} \;
   ```

4. Save the file and exit the editor.

This will run daily at midnight and remove files older than 30 days from the trash.

### 2. Restoring Deleted Files

If you accidentally delete an important file, you can restore it easily:

#### a) Using Nemo

1. Open the Trash folder in Nemo.
2. Locate the file you want to restore.
3. Right-click on the file and select **Restore**.
4. The file will be moved back to its original location.

#### b) Using the Terminal

To manually restore a file:

```bash
mv ~/.local/share/Trash/files/filename /desired/location/
```

Replace `filename` with the actual file name and `/desired/location/` with where you want to restore it.

### 3. Permanently Deleting Files

To completely remove files from the trash, you have two main options:

#### a) Empty Trash via Nemo

1. Open the Trash folder.
2. Click **Empty Trash** at the top-right corner.
3. Confirm the action.

#### b) Empty Trash via Terminal

Run the following command to permanently delete all files in the trash:

```bash
rm -rf ~/.local/share/Trash/files/*
```

This will free up disk space by removing all deleted files permanently.

## Troubleshooting Common Trash Issues

### 1. Trash Icon Not Updating

Sometimes, the Trash icon on the desktop may not update correctly. If the trash appears full even when empty, try:

- Restarting the Cinnamon desktop:

  ```bash
  cinnamon --replace &
  ```

- Manually refreshing the Trash status:

  ```bash
  nemo -q && nemo
  ```

### 2. Unable to Delete Trash Files

If you encounter issues emptying the trash, try:

- Checking permissions:

  ```bash
  sudo chown -R $USER:$USER ~/.local/share/Trash/
  ```

- Using `sudo` to force deletion:

  ```bash
  sudo rm -rf ~/.local/share/Trash/files/*
  ```

### 3. Trash Folder Not Accessible

If the Trash folder is missing or inaccessible, recreate it with:

```bash
mkdir -p ~/.local/share/Trash/files
mkdir -p ~/.local/share/Trash/info
```

This ensures the trash system works as expected.

## Conclusion

Managing trash settings on Linux Mint with the Cinnamon desktop is straightforward and offers various options for automation, restoration, and permanent deletion. Whether you prefer using graphical tools or command-line methods, you can effectively control your system's trash behavior. By setting up automatic trash emptying, regularly reviewing trashed files, and knowing how to restore or permanently delete files, you can keep your system clean and optimized.

With these tips, you can ensure that your Linux Mint system maintains efficient disk usage while preventing accidental data loss. Happy computing!
