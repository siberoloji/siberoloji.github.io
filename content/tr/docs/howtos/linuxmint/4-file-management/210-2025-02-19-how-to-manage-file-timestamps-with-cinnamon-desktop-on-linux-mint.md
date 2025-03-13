---
draft: true
title: How to Manage File Timestamps with Cinnamon Desktop on Linux Mint
linkTitle: Manage File Timestamps
translationKey: how-to-manage-file-timestamps-with-cinnamon-desktop-on-linux-mint
description: Learn how to manage file timestamps on Linux Mint using the Cinnamon desktop environment. Explore GUI and command-line methods for viewing, modifying, and preserving file timestamps.
url: how-to-manage-file-timestamps-with-cinnamon-desktop-on-linux-mint
weight: 210
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - file timestamps
featured_image: /images/linuxmint1.webp
---

Linux Mint, with its Cinnamon desktop environment, offers a clean and user-friendly interface for managing files and directories. One crucial aspect of file management is handling file timestamps, which include the creation, modification, and access times. These timestamps help track when a file was last used or changed, making them essential for system organization, backups, and troubleshooting.  

In this guide, we’ll explore how to view, modify, and preserve file timestamps on Linux Mint using the Cinnamon desktop. We’ll cover both GUI-based methods and command-line techniques for comprehensive timestamp management.  

---

### **Understanding File Timestamps in Linux**  

In Linux, every file has three primary timestamps:  

1. **Access Time (atime)** – The last time a file was accessed (read).  
2. **Modification Time (mtime)** – The last time the file’s content was modified.  
3. **Change Time (ctime)** – The last time the file’s metadata (such as permissions or ownership) was changed.  

These timestamps are automatically updated when certain operations occur. However, there are scenarios where you might want to modify or preserve them manually.  

---

### **Viewing File Timestamps in Cinnamon Desktop**  

#### **1. Using the File Manager (Nemo)**  

Cinnamon uses **Nemo**, a feature-rich file manager, to display file details.  

- Open **Nemo** from the menu or by pressing `Ctrl + L` and typing `nemo`.  
- Navigate to the file whose timestamp you want to check.  
- Right-click the file and select **Properties**.  
- Under the **Basic** tab, you’ll find the **Modified** timestamp.  

💡 *Nemo does not show the full range of timestamps (atime, ctime) in the properties window. For that, the terminal is required.*  

#### **2. Using the Terminal**  

To view file timestamps in detail, open a terminal (`Ctrl + Alt + T`) and use:  

```bash
stat filename
```  

Example output:  

```
  File: filename.txt  
  Size: 1024        Blocks: 8          IO Block: 4096   regular file  
Device: 802h/2050d Inode: 131072       Links: 1  
Access: 2025-02-19 10:45:00.123456789 +0000  
Modify: 2025-02-18 15:30:00.123456789 +0000  
Change: 2025-02-18 16:00:00.123456789 +0000  
```  

- **Access (atime)** → Last read time  
- **Modify (mtime)** → Last content change  
- **Change (ctime)** → Last metadata change  

For a simple view, use:  

```bash
ls -l --time=atime filename
ls -l --time=ctime filename
ls -l --time=mtime filename
```

---

### **Modifying File Timestamps**  

#### **1. Using the `touch` Command**  

The easiest way to change timestamps is the `touch` command.  

- **Update the modification time (mtime) to the current time:**  

  ```bash
  touch filename.txt
  ```

- **Set a specific timestamp:**  

  ```bash
  touch -t YYYYMMDDhhmm filename.txt
  ```

  Example:  

  ```bash
  touch -t 202402181530 filename.txt
  ```  

  This sets the timestamp to **Feb 18, 2024, at 15:30**.  

- **Update both atime and mtime:**  

  ```bash
  touch -a -m -t 202402181530 filename.txt
  ```

#### **2. Changing Access and Modification Time Separately**  

- **Modify only atime:**  

  ```bash
  touch -a -t 202402181530 filename.txt
  ```

- **Modify only mtime:**  

  ```bash
  touch -m -t 202402181530 filename.txt
  ```

---

### **Preserving File Timestamps**  

By default, copying or moving files may change their timestamps. To preserve them:  

#### **1. Using `cp` Command**  

To copy a file while keeping its timestamps intact:  

```bash
cp --preserve=timestamps source.txt destination.txt
```

Or to preserve all attributes (including ownership and permissions):  

```bash
cp -p source.txt destination.txt
```

#### **2. Using `mv` Command**  

Moving a file generally does not alter timestamps, but if moving across filesystems, use:  

```bash
mv -n source.txt destination.txt
```

The `-n` flag prevents overwriting files and helps in maintaining original timestamps.  

---

### **Using GUI Tools to Modify Timestamps**  

For those who prefer a graphical approach, there are third-party tools available:  

#### **1. Using File Properties in Nemo (Limited)**  

While Nemo provides basic modification timestamps, it does not allow editing them directly.  

#### **2. Using `Bulk Rename` (Nemo Plugin)**  

Nemo has a built-in **Bulk Rename** tool that can modify timestamps:  

- Install it if not present:  

  ```bash
  sudo apt install nemo-rename
  ```  

- Open Nemo, select multiple files, and right-click → Rename.  
- Use advanced options to modify metadata.  

#### **3. Using `SetFileTime` (GUI-based)**  

A GUI-based program like `SetFileTime` (via Wine) can be used to modify timestamps, though it's not natively available for Linux.  

---

### **Advanced Methods for Managing Timestamps**  

#### **1. Using `debugfs` to Edit ctime**  

Unlike atime and mtime, **ctime cannot be changed directly**. However, advanced users can modify it using:  

```bash
sudo debugfs /dev/sdX
```

Then within `debugfs`:  

```bash
stat /path/to/file
set_inode_field /path/to/file ctime YYYYMMDDhhmmss
```

⚠ **Warning:** Be careful when modifying `ctime`, as it affects system integrity.  

#### **2. Using `rsync` to Copy While Preserving Timestamps**  

When syncing files, use `rsync`:  

```bash
rsync -a --times source/ destination/
```

This ensures timestamps remain unchanged.  

---

### **Automating Timestamp Management**  

If you need to maintain timestamps across multiple files or directories automatically, consider using a cron job:  

1. Open crontab:  

   ```bash
   crontab -e
   ```

2. Add a job to set timestamps every day at midnight:  

   ```bash
   0 0 * * * touch -t 202402181530 /path/to/file
   ```

3. Save and exit.  

---

### **Conclusion**  

Managing file timestamps on Linux Mint with Cinnamon is crucial for maintaining an organized system. While Nemo provides basic timestamp visibility, the terminal offers greater control using `stat`, `touch`, and `cp`. For advanced use cases, `debugfs` and `rsync` can help preserve and manipulate timestamps efficiently.  

By understanding these methods, you can better control file metadata, optimize backups, and maintain accurate file histories. Whether through GUI tools or command-line utilities, Linux Mint provides powerful options for timestamp management.  

Do you have any specific timestamp challenges on your Linux Mint system? Let me know in the comments! 🚀
