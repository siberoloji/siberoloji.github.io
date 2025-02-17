---
draft: false
title: How to Create and Extract Archives with Cinnamon Desktop on Linux Mint
linkTitle: How to Create and Extract Archives
translationKey: how-to-create-and-extract-archives-with-cinnamon-desktop-on-linux-mint
description: Learn how to create and extract archives using Cinnamon Desktop on Linux Mint for efficient file management.
url: how-to-create-and-extract-archives-with-cinnamon-desktop-on-linux-mint
weight: 30
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
  - extract archives
  - create archives
featured_image: /images/linuxmint1.webp
---
Linux Mint, particularly the Cinnamon edition, offers a user-friendly environment for managing files, including the ability to create and extract archives. Archiving is an essential process for file storage, backup, and transfer, allowing users to bundle multiple files into a single compressed file. Cinnamon Desktop provides both graphical and command-line options to handle archives efficiently.

In this guide, we will explore how to create and extract archives using built-in tools and terminal commands on Linux Mint with Cinnamon Desktop.

## Understanding Archive Formats

Before diving into the process, it’s important to understand the different archive formats available. Some common formats include:

- **ZIP (.zip)**: A widely used format that supports lossless compression and is compatible across multiple operating systems.
- **TAR (.tar)**: A standard archive format on Linux that groups files without compression.
- **TAR.GZ (.tar.gz or .tgz)**: A compressed TAR archive using gzip, reducing file size.
- **TAR.BZ2 (.tar.bz2)**: Similar to TAR.GZ but uses the bzip2 compression algorithm.
- **7Z (.7z)**: A highly compressed format often used for large files.
- **RAR (.rar)**: A proprietary format with good compression but requires additional software to extract.

## Creating Archives Using the Cinnamon File Manager (Nemo)

Cinnamon’s default file manager, Nemo, provides a simple way to create archives without needing the terminal. Here’s how:

1. **Select Files or Folders**
   - Open **Nemo** and navigate to the files or folders you want to archive.
   - Select multiple files by holding **Ctrl** while clicking on them.

2. **Right-click and Choose "Create Archive"**
   - Right-click on the selected files or folders.
   - Choose **"Compress…"** from the context menu.

3. **Choose Archive Format and Location**
   - A window will appear, allowing you to name the archive and select the format.
   - Choose the desired format (ZIP, TAR.GZ, etc.).
   - Select the destination folder where the archive will be saved.

4. **Adjust Compression Options (If Available)**
   - Some formats, like TAR.GZ and ZIP, allow adjusting compression levels.
   - Higher compression reduces file size but takes longer to process.

5. **Click "Create" to Generate the Archive**
   - The file manager will process the request and create the archive.
   - Once completed, you will see the archive in the selected location.

## Extracting Archives Using Nemo

Extracting an archive in Cinnamon is just as easy as creating one.

1. **Locate the Archive File**
   - Navigate to the folder containing the archived file.

2. **Right-click the Archive**
   - Right-click on the file and choose **"Extract Here"** to extract files into the same directory.
   - Alternatively, select **"Extract To…"** to specify a different location.

3. **Wait for Extraction to Complete**
   - Depending on the file size and compression type, extraction may take a few seconds to minutes.

Once extracted, you will see the files available for use in the designated directory.

## Creating Archives Using the Terminal

While the graphical method is convenient, the terminal provides more control and automation. Here’s how to create archives using CLI commands:

### 1. Creating a TAR Archive

To create a TAR archive without compression:

```bash
 tar -cvf archive.tar file1 file2 folder1
```

Explanation:

- `-c` creates a new archive.
- `-v` enables verbose mode (optional, shows progress).
- `-f` specifies the archive filename.

### 2. Creating a Compressed TAR.GZ Archive

```bash
 tar -czvf archive.tar.gz file1 file2 folder1
```

- `-z` applies gzip compression.

### 3. Creating a ZIP Archive

```bash
 zip -r archive.zip file1 file2 folder1
```

- `-r` recursively adds files and folders to the archive.

## Extracting Archives Using the Terminal

### 1. Extracting a TAR Archive

```bash
 tar -xvf archive.tar
```

- `-x` extracts files.

### 2. Extracting a TAR.GZ Archive

```bash
 tar -xzvf archive.tar.gz
```

### 3. Extracting a ZIP Archive

```bash
 unzip archive.zip
```

## Installing Additional Tools for Archive Management

Linux Mint comes with most archive tools pre-installed. However, for rar support, you may need to install additional software:

```bash
 sudo apt install rar unrar
```

Once installed, you can extract RAR files using:

```bash
 unrar x archive.rar
```

## Conclusion

Managing archives on Linux Mint with Cinnamon Desktop is straightforward, whether using the Nemo file manager or the command line. The graphical interface is beginner-friendly, while the terminal commands offer more flexibility and automation. By mastering both methods, you can efficiently handle file compression and extraction tasks on your Linux system.
