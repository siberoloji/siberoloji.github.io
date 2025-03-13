---
title: "How to Use SysStat on AlmaLinux: Comprehensive Guide"
linkTitle: Use SysStat
description: Learn how to use SysStat on AlmaLinux to monitor CPU, memory, and disk performance. Discover advanced tools and troubleshooting tips for effective system management.
date: 2025-01-07T09:27:15.266Z
weight: 1480
url: sysstat-almalinux-comprehensive-guide
translationKey: how-to-use-sysstat-on-almalinux-a-comprehensive-guide
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
### Introduction

Performance monitoring is essential for managing Linux systems, especially in environments where optimal resource usage and uptime are critical. SysStat, a robust suite of performance monitoring tools, is a popular choice for tracking CPU usage, memory consumption, disk activity, and more.

AlmaLinux, a community-supported, RHEL-compatible Linux distribution, serves as an ideal platform for utilizing SysStat’s capabilities. This guide explores how to effectively use SysStat on AlmaLinux, providing step-by-step instructions for analyzing system performance and troubleshooting issues.

---

### **What is SysStat?**

SysStat is a collection of powerful monitoring tools for Linux. It includes commands like:

- **sar** (System Activity Report): Provides historical data on CPU, memory, and disk usage.
- **iostat** (Input/Output Statistics): Monitors CPU and I/O performance.
- **mpstat** (Multiprocessor Statistics): Tracks CPU usage by individual processors.
- **pidstat** (Process Statistics): Reports resource usage of processes.
- **nfsiostat** (NFS I/O Statistics): Monitors NFS activity.

With SysStat, you can capture detailed performance metrics and analyze trends to optimize system behavior and resolve bottlenecks.

---

### **Step 1: Verify SysStat Installation**

Before using SysStat, ensure it is installed and running on your AlmaLinux system. If not installed, follow these steps:

1. Install SysStat:

   ```bash
   sudo dnf install -y sysstat
   ```

2. Start and enable the SysStat service:

   ```bash
   sudo systemctl enable sysstat
   sudo systemctl start sysstat
   ```

3. Check the status of the service:

   ```bash
   sudo systemctl status sysstat
   ```

Once confirmed, you’re ready to use SysStat tools.

---

### **Step 2: Configuring SysStat**

SysStat collects data periodically using cron jobs. You can configure its behavior through the `/etc/sysconfig/sysstat` file.

To adjust configuration:

1. Open the file:

   ```bash
   sudo nano /etc/sysconfig/sysstat
   ```

2. Key parameters to configure:
   - `HISTORY`: Number of days to retain data (default: 7).
   - `ENABLED`: Set to `true` to ensure data collection.

3. Save changes and restart the service:

   ```bash
   sudo systemctl restart sysstat
   ```

---

### **Step 3: Collecting System Performance Data**

SysStat records performance metrics periodically, storing them in the `/var/log/sa/` directory. These logs can be analyzed to monitor system health.

#### Scheduling Data Collection

SysStat uses a cron job located in `/etc/cron.d/sysstat` to collect data. By default, it collects data every 10 minutes. Adjust the interval by editing this file:

```bash
sudo nano /etc/cron.d/sysstat
```

For example, to collect data every 5 minutes, change:

```bash
*/10 * * * * root /usr/lib64/sa/sa1 1 1
```

to:

```bash
*/5 * * * * root /usr/lib64/sa/sa1 1 1
```

---

### **Step 4: Using SysStat Tools**

SysStat’s commands allow you to analyze different aspects of system performance. Here’s how to use them effectively:

#### 1. **sar (System Activity Report)**

The `sar` command provides historical and real-time performance data. Examples:

- **CPU Usage**:

  ```bash
  sar -u
  ```

  Output includes user, system, and idle CPU percentages.

- **Memory Usage**:

  ```bash
  sar -r
  ```

  Displays memory metrics, including used and free memory.

- **Disk Usage**:

  ```bash
  sar -d
  ```

  Reports disk activity for all devices.

- **Network Usage**:

  ```bash
  sar -n DEV
  ```

  Shows statistics for network devices.

- **Load Average**:

  ```bash
  sar -q
  ```

  Displays system load averages and running tasks.

#### 2. **iostat (Input/Output Statistics)**

The `iostat` command monitors CPU and I/O usage:

- Display basic CPU and I/O metrics:

  ```bash
  iostat
  ```

- Include device-specific statistics:

  ```bash
  iostat -x
  ```

#### 3. **mpstat (Multiprocessor Statistics)**

The `mpstat` command provides CPU usage for each processor:

- View overall CPU usage:

  ```bash
  mpstat
  ```

- For detailed per-processor statistics:

  ```bash
  mpstat -P ALL
  ```

#### 4. **pidstat (Process Statistics)**

The `pidstat` command tracks individual process resource usage:

- Monitor CPU usage by processes:

  ```bash
  pidstat
  ```

- Check I/O statistics for processes:

  ```bash
  pidstat -d
  ```

#### 5. **nfsiostat (NFS I/O Statistics)**

For systems using NFS, monitor activity with:

```bash
nfsiostat
```

---

### **Step 5: Analyzing Collected Data**

SysStat saves performance logs in `/var/log/sa/`. Each file corresponds to a specific day (e.g., `sa01`, `sa02`).

To analyze past data:

```bash
sar -f /var/log/sa/sa01
```

You can use options like `-u` (CPU usage) or `-r` (memory usage) to focus on specific metrics.

---

### **Step 6: Customizing Reports**

SysStat allows you to customize and automate reports:

1. **Export Data**:
   Save SysStat output to a file:

   ```bash
   sar -u > cpu_usage_report.txt
   ```

2. **Automate Reports**:
   Create a script that generates and emails reports daily:

   ```bash
   #!/bin/bash
   sar -u > /path/to/reports/cpu_usage_$(date +%F).txt
   mail -s "CPU Usage Report" user@example.com < /path/to/reports/cpu_usage_$(date +%F).txt
   ```

   Schedule this script with cron.

---

### **Step 7: Advanced Usage**

#### Monitoring Trends

Use `sar` to identify trends in performance data:

```bash
sar -u -s 09:00:00 -e 18:00:00
```

This command filters CPU usage between 9 AM and 6 PM.

#### Visualizing Data

Export SysStat data to CSV and use tools like Excel or Grafana for visualization:

```bash
sar -u -o cpu_usage_data > cpu_data.csv
```

---

### **Step 8: Troubleshooting Common Issues**

1. **No Data Collected**:
   - Ensure the SysStat service is running:

     ```bash
     sudo systemctl status sysstat
     ```

   - Verify cron jobs are active:

     ```bash
     sudo systemctl status crond
     ```

2. **Incomplete Logs**:
   - Check disk space in `/var/log/sa/`:

     ```bash
     df -h
     ```

3. **Outdated Data**:
   - Adjust the `HISTORY` setting in `/etc/sysconfig/sysstat` to retain data for longer periods.

---

### **Step 9: Best Practices for SysStat Usage**

- **Regular Monitoring**: Schedule daily reports to monitor trends.
- **Integrate with Alert Systems**: Use scripts to send alerts based on thresholds.
- **Optimize Log Retention**: Retain only necessary data to conserve disk space.

---

### **Conclusion**

SysStat is a versatile and lightweight tool that provides deep insights into system performance on AlmaLinux. By mastering its commands, you can monitor key metrics, identify bottlenecks, and maintain optimal system health. Whether troubleshooting an issue or planning capacity upgrades, SysStat equips you with the data needed to make informed decisions.

Explore advanced features, integrate it into your monitoring stack, and unlock its full potential to streamline system management.

Feel free to reach out for more guidance or configuration tips!
