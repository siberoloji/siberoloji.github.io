---
draft: false
title: Bob Masters Performance Monitoring and Tuning on AlmaLinux
linkTitle: Performance Monitoring
keywords:
  - Performance Monitoring
description: From monitoring resource usage to tuning critical system parameters, Bob learned how to optimize performance for demanding workloads.
date: 2024-11-26
url: bob-masters-performance-monitoring-tuning-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 770
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next task was to ensure his AlmaLinux server was running at peak efficiency. From monitoring resource usage to tuning critical system parameters, Bob learned how to optimize performance for demanding workloads.

> *“A fast server is a happy server—let’s make mine the best it can be!”* Bob declared, ready to dive into performance tuning.

---

### **Chapter Outline: "Bob Masters Performance Monitoring and Tuning"**

1. **Introduction: Why Performance Monitoring Matters**
   - The importance of identifying and addressing bottlenecks.
   - Tools available on AlmaLinux.

2. **Monitoring System Performance**
   - Using `top`, `htop`, and `vmstat`.
   - Monitoring disk usage with `iostat` and `df`.

3. **Analyzing System Logs**
   - Using `journalctl` and log files for performance-related insights.

4. **Tuning CPU and Memory Performance**
   - Adjusting CPU scheduling and priorities with `nice` and `ionice`.
   - Managing swap space and virtual memory.

5. **Optimizing Disk I/O**
   - Monitoring disk performance with `iotop`.
   - Tuning file system parameters.

6. **Configuring Network Performance**
   - Monitoring network traffic with `nload` and `iftop`.
   - Tweaking TCP settings for faster connections.

7. **Automating Performance Monitoring**
   - Setting up `collectl` and `sysstat` for continuous monitoring.
   - Using `cron` to schedule performance reports.

8. **Conclusion: Bob Reflects on Optimization**

---

### **Part 1: Introduction: Why Performance Monitoring Matters**

Bob learned that monitoring and tuning performance ensures systems remain responsive, even under heavy loads. Proactively addressing issues reduces downtime and improves user experience.

#### **Key Concepts**

- **Bottlenecks**: Areas where resources (CPU, memory, disk, or network) become constrained.
- **Baseline Metrics**: Normal system performance levels to compare against during troubleshooting.

> *“If I can find the bottleneck, I can fix it!”* Bob said.

---

### **Part 2: Monitoring System Performance**

#### **Step 1: Monitoring CPU and Memory with `top` and `htop`**

- **`top`**: Displays real-time system performance.

  ```bash
  top
  ```

  Key metrics:
  - CPU usage.
  - Memory and swap usage.
  - Running processes.

- **`htop`**: A more user-friendly alternative to `top`.

  ```bash
  sudo dnf install -y htop
  htop
  ```

#### **Step 2: Monitoring Disk Usage with `iostat` and `df`**

- **`iostat`**: Displays disk I/O statistics.

  ```bash
  sudo dnf install -y sysstat
  iostat -x 1
  ```

- **`df`**: Shows disk space usage.

  ```bash
  df -h
  ```

#### **Step 3: Monitoring Overall System Health with `vmstat`**

- **`vmstat`**: Provides a snapshot of system performance.

  ```bash
  vmstat 5
  ```

> *“Monitoring tools are my eyes into the server’s soul!”* Bob said.

---

### **Part 3: Analyzing System Logs**

Bob used logs to identify performance-related issues.

- **`journalctl`**: Review systemd logs for performance insights.

  ```bash
  sudo journalctl --since "1 hour ago"
  ```

- Check specific logs for disk or memory issues:

  ```bash
  sudo grep -i "error" /var/log/messages
  sudo grep -i "oom" /var/log/messages
  ```

> *“Logs don’t lie—they’re my first stop for troubleshooting!”* Bob noted.

---

### **Part 4: Tuning CPU and Memory Performance**

#### **Step 1: Adjusting Process Priorities**

- Use `nice` to set process priorities:

  ```bash
  nice -n 10 command
  ```

- Change the priority of a running process:

  ```bash
  renice -n 5 -p <PID>
  ```

#### **Step 2: Managing Swap Space**

- Check swap usage:

  ```bash
  free -h
  ```

- Add a swap file for additional memory:

  ```bash
  sudo fallocate -l 2G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  ```

- Make it permanent:

  ```plaintext
  /swapfile swap swap defaults 0 0
  ```

---

### **Part 5: Optimizing Disk I/O**

#### **Step 1: Monitoring Disk I/O with `iotop`**

- Install `iotop`:

  ```bash
  sudo dnf install -y iotop
  ```

- Run `iotop` to view I/O activity:

  ```bash
  sudo iotop
  ```

#### **Step 2: Tuning File System Parameters**

- Enable write caching for better performance:

  ```bash
  sudo hdparm -W1 /dev/sda
  ```

- Adjust file system mount options in `/etc/fstab`:

  ```plaintext
  /dev/sda1 / ext4 defaults,noatime 0 1
  ```

---

### **Part 6: Configuring Network Performance**

#### **Step 1: Monitoring Network Traffic**

- Use `nload` for real-time bandwidth usage:

  ```bash
  sudo dnf install -y nload
  nload
  ```

- Monitor active connections with `iftop`:

  ```bash
  sudo dnf install -y iftop
  sudo iftop -i enp0s3
  ```

#### **Step 2: Tweaking TCP Settings**

- Adjust TCP parameters for better performance:

  ```bash
  sudo nano /etc/sysctl.conf
  ```

- Add the following lines:

  ```plaintext
  net.core.rmem_max = 16777216
  net.core.wmem_max = 16777216
  net.ipv4.tcp_window_scaling = 1
  ```

- Apply the changes:

  ```bash
  sudo sysctl -p
  ```

> *“With these tweaks, my server flies through network traffic!”* Bob said.

---

### **Part 7: Automating Performance Monitoring**

#### **Step 1: Setting Up `collectl`**

- Install `collectl` for comprehensive performance monitoring:

  ```bash
  sudo dnf install -y collectl
  ```

- Run `collectl`:

  ```bash
  sudo collectl -scmd
  ```

#### **Step 2: Scheduling Reports with `sysstat`**

- Use `sysstat` to collect periodic performance data:

  ```bash
  sudo systemctl enable sysstat --now
  ```

- Generate reports:

  ```bash
  sar -u 5 10
  ```

#### **Step 3: Scheduling Tasks with `cron`**

- Add a cron job to run a performance report daily:

  ```bash
  crontab -e
  ```

- Add the following line:

  ```plaintext
  0 1 * * * sar -u > /home/bob/performance_report.txt
  ```

> *“Automation ensures I’m always ahead of potential issues!”* Bob said.

---

### **Conclusion: Bob Reflects on Optimization**

Bob now had a toolkit for monitoring and tuning every aspect of system performance. By addressing bottlenecks and optimizing resource usage, he ensured his AlmaLinux server was ready for any workload.

> Next, Bob plans to explore **Linux Security Auditing and Hardening** on AlmaLinux.
