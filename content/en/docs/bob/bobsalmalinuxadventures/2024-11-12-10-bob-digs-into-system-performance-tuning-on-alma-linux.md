---
title: Bob Digs into System Performance Tuning on AlmaLinux
linkTitle: Performance Tuning
description: Bob Digs into System Performance Tuning, where Bob learns how to monitor and optimize his AlmaLinux system to keep it running smoothly and efficiently.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 100

keywords:
  - Performance Tuning

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-digs-system-performance-tuning-alma-linux
---

Bob Digs into System Performance Tuning, where Bob learns how to monitor and optimize his AlmaLinux system to keep it running smoothly and efficiently.

## 1. Introduction: Bob’s Performance Challenge ##

Bob’s system has been slowing down recently, especially during heavy tasks. Eager to understand why, he decides to explore system performance monitoring and tuning. This will allow him to identify resource hogs and optimize his setup for peak performance.

> *“Time to get to the bottom of what’s slowing things down!”* Bob says, ready for his next learning adventure.

---

## 2. Identifying Bottlenecks with `top`, `htop`, and `iostat` ##

Bob starts by reviewing basic performance metrics to get a snapshot of system health. He focuses on CPU, memory, and disk I/O usage.

- **Using `top` for a Quick Overview**: Bob runs:

  ```bash
  top
  ```

  This shows real-time CPU and memory usage per process. He identifies processes that are using the most resources and notices that a few background tasks are consuming too much CPU.

- **Switching to `htop` for More Details**: To view a more detailed, interactive interface, Bob uses `htop`, which provides color-coded bars and an organized layout:

  ```bash
  htop
  ```

  He sorts by CPU and memory to quickly identify resource-heavy processes.

- **Checking Disk I/O with `iostat`**: Disk performance issues can also slow down a system. To monitor disk activity, Bob uses `iostat`, which is part of the `sysstat` package:

  ```bash
  sudo dnf install sysstat
  iostat -x 2
  ```

  This command shows per-disk statistics, allowing Bob to identify any disk that’s overworked or has high wait times.

> *“Now I can pinpoint which processes and disks are slowing things down!”* Bob says, armed with insights.

---

## 3. Optimizing CPU and Memory Usage ##

Bob notices some processes are consuming more CPU and memory than they should. He decides to tweak his system settings to control resource usage and improve performance.

- **Limiting Process Resources with `ulimit`**: Bob uses `ulimit` to set limits on CPU and memory usage for specific processes:

  ```bash
  ulimit -u 100  # Limits the number of processes a user can start
  ```

  This prevents any single user or application from hogging system resources.

- **Adjusting `sysctl` Parameters**: For more control, Bob uses `sysctl` to modify system parameters. For example, he adjusts swappiness (the kernel’s tendency to swap memory) to reduce unnecessary swapping:

  ```bash
  sudo sysctl vm.swappiness=10
  ```

  Lowering swappiness makes his system prefer RAM over swap space, which improves performance when memory usage is high.

> *“A few tweaks make a big difference in resource usage!”* Bob notes, pleased with his improvements.

---

## 4. Managing Disk I/O and Caching ##

Disk I/O can slow things down, especially when multiple processes compete for disk access. Bob dives into optimizing disk performance to ensure smoother operation.

- **Monitoring with `iostat` and `iotop`**: Bob uses `iotop` to monitor I/O activity by process. This helps him find specific processes causing high disk usage:

  ```bash
  sudo iotop
  ```

- **Tuning Disk Caching with `sysctl`**: To enhance performance, he adjusts disk caching parameters. For instance, increasing read-ahead improves sequential read performance:

  ```bash
  sudo sysctl -w vm.dirty_background_ratio=10
  sudo sysctl -w vm.dirty_ratio=20
  ```

  These values control when data gets written from cache to disk, reducing disk load and improving responsiveness.

> *“Managing disk I/O really smooths things out!”* Bob observes, noticing his system responds faster.

---

## 5. Optimizing File Descriptor and Process Limits ##

Bob learns that systems can hit limits on file descriptors or processes, causing errors or delays. By adjusting these limits, he ensures that his system can handle high demand.

- **Increasing File Descriptors**: File descriptors manage open files, and too few can lead to bottlenecks. Bob increases the limit by adding a line in `/etc/sysctl.conf`:

  ```bash
  fs.file-max = 100000
  ```

  After saving, he applies the change with:

  ```bash
  sudo sysctl -p
  ```

- **Setting Process Limits with `limits.conf`**: Bob edits `/etc/security/limits.conf` to set maximum processes per user:

  ```bash
  bob soft nproc 2048
  bob hard nproc 4096
  ```

  This ensures his account has sufficient resources without overwhelming the system.

> *“Adjusting limits makes sure my system can handle the load during peak times,”* Bob notes, feeling more confident about system stability.

---

## 6. Fine-Tuning System with `tuned`

Bob discovers that AlmaLinux includes `tuned`, a dynamic tuning service that optimizes settings based on various profiles, like "throughput-performance" for servers or "powersave" for laptops.

- **Installing `tuned`**: If it’s not installed, he adds it with:

  ```bash
  sudo dnf install tuned
  ```

- **Choosing a Profile**: Bob starts `tuned` and selects a profile for his setup:

  ```bash
  sudo systemctl start tuned
  sudo tuned-adm profile throughput-performance
  ```

  This profile configures the system for maximum throughput, optimizing network and disk performance.

> *“With `tuned`, I can switch between profiles without manually adjusting settings!”* Bob says, grateful for the simplicity.

---

## 7. Monitoring and Logging with `dstat` and `vmstat`

To track long-term system performance, Bob sets up `dstat` and `vmstat` to monitor CPU, memory, disk, and network usage.

- **Using `dstat` for Live Stats**: Bob installs and runs `dstat`, which combines multiple performance metrics into one view:

  ```bash
  sudo dnf install dstat
  dstat
  ```

- **Tracking Memory and CPU with `vmstat`**: For a snapshot of CPU and memory performance, he uses `vmstat`:

  ```bash
  vmstat 5
  ```

  This command updates every 5 seconds, showing Bob trends in memory usage and CPU load.

> *“These tools give me a full picture of what’s going on over time,”* Bob says, happy to have long-term visibility.

---

## 8. Conclusion: Bob’s System Runs Smoothly

After fine-tuning his system, Bob notices a clear improvement in performance. His CPU, memory, and disk I/O are optimized, and he has tools in place to track performance over time. Bob feels accomplished—he’s learned to tune AlmaLinux for efficiency and responsiveness.

> Next up, Bob wants to explore **user management and system auditing** to keep his system organized and secure.

*Stay tuned for the next chapter: "Bob’s Guide to User Management and System Auditing!"*
