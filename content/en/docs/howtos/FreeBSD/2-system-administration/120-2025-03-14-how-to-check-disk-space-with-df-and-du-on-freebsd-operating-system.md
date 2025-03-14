---
draft: false
title: How to Check Disk Space with `df` and `du` on FreeBSD Operating System
linkTitle: How to Check Disk Space
translationKey: how-to-check-disk-space-with-df-and-du-on-freebsd-operating-system
description: This article provides a step-by-step guide on how to use the `df` and `du` commands to check disk space on a FreeBSD.
url: how-to-check-disk-space-with-df-and-du-on-freebsd-operating-system
date: 2025-03-14
weight: 120
keywords:
  - FreeBSD
  - disk space
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Monitoring disk space is a crucial part of system administration, whether you're managing a server or a personal machine. On FreeBSD, the `df` and `du` commands are fundamental tools for checking disk usage and available space. Understanding these commands helps you efficiently manage storage and prevent unexpected system issues.

In this guide, we’ll explore how to use `df` and `du` to check disk space on a FreeBSD system, including practical examples and tips for better disk management.

---

## Understanding `df`: Displaying File System Disk Usage

The `df` (disk free) command provides an overview of disk usage across mounted filesystems. It helps you see how much space is used, available, and the percentage of utilization.

### Basic `df` Usage

To get a quick overview of your disk space usage, run:

```sh
df
```

This will output something like:

```
Filesystem   1K-blocks    Used   Avail Capacity  Mounted on
/dev/ada0p2  101536000  3156000 95000000    3%    /
tmpfs         1024000        0  1024000    0%    /tmp
```

Each column represents:

- **Filesystem**: The disk partition or storage device.
- **1K-blocks**: The total size of the filesystem (in 1KB blocks by default).
- **Used**: The amount of disk space already used.
- **Avail**: The available free space.
- **Capacity**: The percentage of space used.
- **Mounted on**: The mount point (directory where the filesystem is accessible).

### Displaying Human-Readable Output

By default, `df` shows sizes in 1KB blocks, which may not be intuitive. To make the output easier to read, use the `-h` option:

```sh
df -h
```

Example output:

```
Filesystem    Size   Used  Avail Capacity  Mounted on
/dev/ada0p2  100G   3G    95G    3%       /
tmpfs        1G     0B    1G     0%       /tmp
```

Now the sizes are displayed in gigabytes (G) and megabytes (M), making them easier to interpret.

### Checking Specific Filesystems

If you want to check a specific filesystem or mount point, specify it as an argument:

```sh
df -h /home
```

### Displaying Inodes

If you suspect inode exhaustion (which can prevent file creation even if space is available), check inode usage with:

```sh
df -i
```

This output will show the number of inodes used and available, similar to disk space statistics.

---

## Understanding `du`: Checking Directory Disk Usage

While `df` gives an overview of filesystem usage, `du` (disk usage) allows you to check the space used by specific directories and files.

### Basic `du` Usage

To check disk usage of a directory, use:

```sh
du /path/to/directory
```

Example output:

```
4096    /home/user/docs
20480   /home/user/music
102400  /home/user/videos
```

Each line shows the space used by a directory in 1KB blocks.

### Displaying Human-Readable Sizes

Just like `df`, `du` can display output in human-readable format using the `-h` flag:

```sh
du -h /home/user
```

Example output:

```
4.0K    /home/user/docs
20M     /home/user/music
100M    /home/user/videos
```

### Summarizing Total Disk Usage

By default, `du` lists the usage for each subdirectory. To get a single total for a directory, use the `-s` option:

```sh
du -sh /home/user
```

Example output:

```
150M    /home/user
```

### Checking the Largest Directories

To find the largest directories consuming space, sort the `du` output:

```sh
du -ah /home/user | sort -rh | head -10
```

This lists the top 10 largest directories/files within `/home/user`.

### Excluding Certain File Types

If you want to exclude certain file types from the output, use the `--exclude` option:

```sh
du -ah --exclude='*.mp4' /home/user
```

This excludes `.mp4` files from the calculation.

---

## Combining `df` and `du` for Disk Space Management

### Identifying Disk Space Issues

1. Use `df -h` to check overall filesystem usage.
2. If a partition is nearly full, use `du -sh /path` to identify large directories.
3. Use `du -ah /path | sort -rh | head -10` to find the biggest files and directories.
4. Delete or move unnecessary files to free up space.

### Automating Disk Usage Monitoring

For regular monitoring, you can set up a cron job to log disk usage:

```sh
0 2 * * * df -h > /var/log/disk_usage.log
```

This records the disk usage every night at 2 AM.

---

## Conclusion

The `df` and `du` commands are essential tools for managing disk space on FreeBSD. `df` provides a high-level overview of filesystem usage, while `du` allows you to drill down into specific directories to find space-consuming files. By combining these commands and using them effectively, you can maintain a well-managed and optimized storage system on your FreeBSD machine.

Understanding disk space usage is critical for system stability. With these tools, you can monitor and free up space before it becomes a problem, ensuring smooth operation of your FreeBSD system.

If you’re dealing with persistent storage issues, consider additional tools like `ncdu` for a more interactive way to explore disk usage.

Happy system administration!
