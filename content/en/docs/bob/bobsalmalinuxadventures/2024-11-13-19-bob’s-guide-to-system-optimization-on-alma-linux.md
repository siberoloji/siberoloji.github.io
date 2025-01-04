---
title: Bob’s Guide to System Optimization on AlmaLinux
linkTitle: System Optimization
description: Bob will learn advanced techniques to fine-tune his AlmaLinux system for improved performance and responsiveness.
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 190
toc: true
keywords:
  - System Optimization on AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-guide-system-optimization-alma-linux
---

Great! Let’s continue with Chapter 19, *"Bob’s Guide to System Optimization on AlmaLinux"*. In this chapter, Bob will learn advanced techniques to fine-tune his AlmaLinux system for improved performance and responsiveness. He’ll cover CPU, memory, disk, and network optimizations to make his server run faster and more efficiently.

---

## **1. Introduction: Bob’s Optimization Goals**

As Bob’s server workload grows, he notices small slowdowns here and there. He knows it’s time to optimize his AlmaLinux setup to ensure peak performance. With some targeted tweaks, he’ll be able to make his system faster and more responsive, maximizing its capabilities.

> *“Let’s squeeze out every bit of performance!”* Bob says, ready to tune his server.

---

## **2. Optimizing CPU Performance with `cpufreq`**

Bob starts by configuring his CPU to handle high-demand tasks more efficiently.

- **Installing `cpufrequtils`**: This utility allows Bob to adjust CPU frequency and scaling:

  ```bash
  sudo dnf install cpufrequtils
  ```

- **Setting CPU Scaling to Performance Mode**: Bob configures his CPU to prioritize performance over power-saving:

  ```bash
  sudo cpufreq-set -g performance
  ```

  This setting keeps the CPU running at maximum speed rather than throttling down when idle.

- **Checking Current CPU Frequency**: He verifies his CPU scaling with:

  ```bash
  cpufreq-info
  ```

> *“My CPU is now focused on performance!”* Bob says, noticing an immediate improvement in responsiveness.

---

## **3. Managing Memory with `sysctl` Parameters**

Next, Bob tunes his memory settings to optimize how AlmaLinux uses RAM and swap space.

- **Reducing Swappiness**: Swappiness controls how aggressively Linux uses swap space over RAM. Bob reduces it to 10 to make the system use RAM more often:

  ```bash
  sudo sysctl vm.swappiness=10
  ```

  He makes the change persistent by adding it to `/etc/sysctl.conf`:

  ```bash
  vm.swappiness=10
  ```

- **Adjusting Cache Pressure**: Bob tweaks `vm.vfs_cache_pressure` to 50, allowing the system to retain file system caches longer, which speeds up file access:

  ```bash
  sudo sysctl vm.vfs_cache_pressure=50
  ```

> *“With more RAM use and longer cache retention, my system is much snappier!”* Bob notes, happy with the changes.

---

## **4. Disk I/O Optimization with `noatime`**

To reduce disk write overhead, Bob decides to disable `atime`, which tracks file access times.

- **Modifying `fstab` to Disable `atime`**: Bob edits `/etc/fstab` and adds the `noatime` option to his main partitions:

  ```bash
  /dev/sda1 / ext4 defaults,noatime 0 1
  ```

  - This prevents the system from updating access times every time a file is read, reducing unnecessary writes.

- **Remounting Partitions**: He remounts the filesystem to apply the new setting:

  ```bash
  sudo mount -o remount /
  ```

> *“No more unnecessary disk writes—my storage will last longer and work faster!”* Bob says, pleased with the optimization.

---

## **5. Optimizing Disk Usage with `tmpfs`**

Bob learns he can store temporary files in RAM using **`tmpfs`**, reducing disk I/O for temporary data.

- **Creating a `tmpfs` Mount for `/tmp`**: He edits `/etc/fstab` to mount `/tmp` in memory:

  ```bash
  tmpfs /tmp tmpfs defaults,size=512M 0 0
  ```

  - This setting limits `/tmp` to 512 MB of RAM, helping speed up temporary file access.

- **Mounting the `tmpfs`**: Bob mounts `/tmp` as `tmpfs` to activate the change:

  ```bash
  sudo mount -a
  ```

> *“Using RAM for temporary files makes the system feel even faster!”* Bob says, enjoying the performance boost.

---

## **6. Network Optimization with `sysctl`**

Bob optimizes his network settings to improve bandwidth and reduce latency.

- **Increasing Network Buffers**: To handle higher network traffic, he increases buffer sizes with these commands:

  ```bash
  sudo sysctl -w net.core.rmem_max=26214400
  sudo sysctl -w net.core.wmem_max=26214400
  sudo sysctl -w net.core.netdev_max_backlog=5000
  ```

  - These settings increase maximum read and write buffer sizes and improve queue size for network devices, reducing the chance of dropped packets.

- **Making Network Optimizations Persistent**: Bob saves these changes in `/etc/sysctl.conf` for future reboots.

> *“Now my network can handle high traffic more smoothly!”* Bob says, glad for the added stability.

---

## **7. Optimizing Service Startup with `systemd`**

Bob decides to streamline service startup to reduce boot time and improve system responsiveness.

- **Disabling Unused Services**: He lists active services and disables any non-essential ones:

  ```bash
  sudo systemctl list-unit-files --type=service
  sudo systemctl disable <service-name>
  ```

- **Using `systemd-analyze blame`**: Bob runs this command to identify slow-starting services:

  ```bash
  systemd-analyze blame
  ```

  - He notes any services with long startup times and investigates options for optimization.

> *“A faster boot time makes my system ready for action almost instantly!”* Bob says, enjoying the quick start.

---

## **8. Automating Memory and Disk Cleanup with a Script**

To keep his system optimized over time, Bob writes a script to clear caches and free up memory on a regular basis.

- **Creating the Cleanup Script**: He writes `optimize.sh` to clear caches and remove unused files:

  ```bash
  nano optimize.sh
  ```

- **Adding Commands to Free Memory and Clear Caches**:

  ```bash
  #!/bin/bash
  echo "Clearing cache and freeing up memory..."
  sync; echo 3 > /proc/sys/vm/drop_caches
  find /var/log -type f -name "*.log" -mtime +30 -exec rm {} \;
  echo "Optimization complete!"
  ```

- **Scheduling with Cron**: He adds the script to cron to run it weekly:

  ```bash
  0 3 * * 0 /path/to/optimize.sh
  ```

> *“My system will stay optimized automatically!”* Bob says, pleased with his efficient setup.

---

## **9. Fine-Tuning System Limits in `limits.conf`**

Bob learns that increasing user and process limits can help improve system stability under heavy loads.

- **Editing `limits.conf`**: He opens `/etc/security/limits.conf` to increase file descriptor and process limits:

  ```bash
  * soft nofile 1024
  * hard nofile 4096
  * soft nproc 1024
  * hard nproc 4096
  ```

  - These settings improve the maximum number of open files and processes, ensuring his server won’t hit limits during peak loads.

> *“Raising system limits ensures my server can handle the busiest times,”* Bob notes, feeling prepared for high demand.

---

## **10. Conclusion: Bob’s Optimized AlmaLinux System**

With CPU, memory, disk, and network optimizations in place, Bob has turned his AlmaLinux system into a high-performance machine. He’s confident it will handle any load, with automatic cleanups and optimizations ensuring it stays efficient over time.

> Next up, Bob is eager to explore **cloud integration and automation**, taking his skills to the cloud!
