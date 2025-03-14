---
draft: false
title: How to Archive Files with `tar` and `gzip` on FreeBSD Operating System
linkTitle: How to Archive Files with `tar` and `gzip` on FreeBSD Operating System
translationKey: how-to-archive-files-with-tar-and-gzip-on-freebsd-operating-system
description: This blog post covers how to archive files using `tar` and compress them with `gzip` on FreeBSD.
url: how-to-archive-files-with-tar-and-gzip-on-freebsd
date: 2025-03-14
weight: 220
keywords:
  - FreeBSD
  - archive files
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
In the world of system administration and file management, archiving and compressing files are essential tasks. Whether you're backing up important data, transferring files between systems, or simply organizing your storage, knowing how to efficiently archive and compress files is a valuable skill. On FreeBSD, a powerful and versatile Unix-like operating system, the `tar` and `gzip` utilities are commonly used for these purposes.

In this blog post, we'll explore how to archive files using `tar` and compress them with `gzip` on FreeBSD. We'll cover the basics of these tools, provide step-by-step instructions, and discuss some advanced options to help you get the most out of these utilities.

## Table of Contents

1. **Introduction to `tar` and `gzip`**
2. **Installing `tar` and `gzip` on FreeBSD**
3. **Basic Usage of `tar`**
4. **Compressing Archives with `gzip`**
5. **Combining `tar` and `gzip`**
6. **Extracting Archives**
7. **Advanced Options and Tips**
8. **Conclusion**

## 1. Introduction to `tar` and `gzip`

### What is `tar`?

`tar` stands for "Tape Archive," and it is a utility used to create and manipulate archive files. An archive is a single file that contains multiple files and directories, preserving their structure and metadata (such as permissions and timestamps). `tar` is widely used in Unix-like operating systems, including FreeBSD, for creating backups, distributing software, and more.

### What is `gzip`?

`gzip` is a compression utility that reduces the size of files using the DEFLATE algorithm. Compressing files can save disk space and reduce transfer times when sending files over a network. `gzip` is often used in conjunction with `tar` to create compressed archives, commonly referred to as "tarballs."

## 2. Installing `tar` and `gzip` on FreeBSD

FreeBSD comes with `tar` and `gzip` pre-installed as part of the base system, so you typically don't need to install them separately. However, if you find that these utilities are not available on your system, you can install them using the `pkg` package manager.

To check if `tar` and `gzip` are installed, you can run the following commands:

```sh
tar --version
gzip --version
```

If they are installed, you'll see version information. If not, you can install them using:

```sh
sudo pkg install tar gzip
```

## 3. Basic Usage of `tar`

### Creating an Archive with `tar`

The basic syntax for creating a `tar` archive is:

```sh
tar -cvf archive_name.tar files_or_directories
```

- `-c`: Create a new archive.
- `-v`: Verbose mode, which lists the files as they are added to the archive.
- `-f`: Specifies the name of the archive file.

For example, to create an archive of a directory named `my_folder`, you would run:

```sh
tar -cvf my_folder.tar my_folder
```

This command creates an archive named `my_folder.tar` containing all the files and subdirectories within `my_folder`.

### Viewing the Contents of an Archive

To view the contents of a `tar` archive without extracting it, use the `-t` option:

```sh
tar -tvf archive_name.tar
```

For example:

```sh
tar -tvf my_folder.tar
```

This command lists the files and directories contained in `my_folder.tar`.

## 4. Compressing Archives with `gzip`

While `tar` is great for creating archives, it doesn't compress the files by default. This is where `gzip` comes in. You can compress a `tar` archive using `gzip` to reduce its size.

To compress a file with `gzip`, use the following command:

```sh
gzip file_name
```

For example, to compress `my_folder.tar`, you would run:

```sh
gzip my_folder.tar
```

This command creates a compressed file named `my_folder.tar.gz` and removes the original `my_folder.tar` file.

### Decompressing a `.gz` File

To decompress a `.gz` file, use the `-d` option with `gzip`:

```sh
gzip -d file_name.gz
```

For example:

```sh
gzip -d my_folder.tar.gz
```

This command decompresses `my_folder.tar.gz` back to `my_folder.tar`.

## 5. Combining `tar` and `gzip`

While you can use `tar` and `gzip` separately, it's often more convenient to combine them into a single step. `tar` has built-in support for `gzip` compression, allowing you to create a compressed archive in one command.

To create a compressed archive with `tar` and `gzip`, use the `-z` option:

```sh
tar -czvf archive_name.tar.gz files_or_directories
```

For example, to create a compressed archive of `my_folder`, you would run:

```sh
tar -czvf my_folder.tar.gz my_folder
```

This command creates a compressed archive named `my_folder.tar.gz` containing all the files and subdirectories within `my_folder`.

### Viewing the Contents of a Compressed Archive

To view the contents of a compressed archive without extracting it, use the `-tz` option:

```sh
tar -tzvf archive_name.tar.gz
```

For example:

```sh
tar -tzvf my_folder.tar.gz
```

This command lists the files and directories contained in `my_folder.tar.gz`.

## 6. Extracting Archives

### Extracting a `tar` Archive

To extract the contents of a `tar` archive, use the `-x` option:

```sh
tar -xvf archive_name.tar
```

For example:

```sh
tar -xvf my_folder.tar
```

This command extracts the contents of `my_folder.tar` into the current directory.

### Extracting a Compressed Archive

To extract a compressed archive (e.g., `.tar.gz`), use the `-x` and `-z` options:

```sh
tar -xzvf archive_name.tar.gz
```

For example:

```sh
tar -xzvf my_folder.tar.gz
```

This command extracts the contents of `my_folder.tar.gz` into the current directory.

## 7. Advanced Options and Tips

### Excluding Files and Directories

Sometimes, you may want to exclude certain files or directories when creating an archive. You can do this with the `--exclude` option:

```sh
tar -czvf archive_name.tar.gz --exclude="file_or_directory" files_or_directories
```

For example, to exclude a directory named `exclude_me` when creating an archive of `my_folder`, you would run:

```sh
tar -czvf my_folder.tar.gz --exclude="my_folder/exclude_me" my_folder
```

### Preserving Permissions and Ownership

By default, `tar` preserves file permissions and ownership when creating and extracting archives. However, if you're extracting files as a non-root user, you may not be able to restore ownership. To preserve ownership, you need to run `tar` as the root user:

```sh
sudo tar -xzvf archive_name.tar.gz
```

### Creating Incremental Backups

`tar` supports incremental backups, which only archive files that have changed since the last backup. To create an incremental backup, use the `-g` option to specify a snapshot file:

```sh
tar -czvf backup.tar.gz -g snapshot_file files_or_directories
```

For example:

```sh
tar -czvf backup.tar.gz -g snapshot_file my_folder
```

The snapshot file keeps track of the state of the files, allowing `tar` to determine which files have changed since the last backup.

### Splitting Archives into Multiple Parts

If you need to split a large archive into smaller parts, you can use the `split` command in combination with `tar`:

```sh
tar -czvf - my_folder | split -b 100M - my_folder.tar.gz.
```

This command creates a compressed archive of `my_folder` and splits it into 100MB parts named `my_folder.tar.gz.aa`, `my_folder.tar.gz.ab`, etc.

To reassemble the parts, use the `cat` command:

```sh
cat my_folder.tar.gz.* | tar -xzvf -
```

## 8. Conclusion

Archiving and compressing files are fundamental tasks in system administration and file management. On FreeBSD, the `tar` and `gzip` utilities provide a powerful and flexible way to create, compress, and extract archives. By mastering these tools, you can efficiently manage your files, save disk space, and streamline your backup and transfer processes.

In this blog post, we've covered the basics of using `tar` and `gzip`, including creating and extracting archives, compressing files, and some advanced options. Whether you're a seasoned system administrator or a beginner, these skills will serve you well in your FreeBSD journey.

Remember, practice makes perfect. Try out these commands on your FreeBSD system, and don't hesitate to explore the `tar` and `gzip` man pages (`man tar` and `man gzip`) for more options and details. Happy archiving!
