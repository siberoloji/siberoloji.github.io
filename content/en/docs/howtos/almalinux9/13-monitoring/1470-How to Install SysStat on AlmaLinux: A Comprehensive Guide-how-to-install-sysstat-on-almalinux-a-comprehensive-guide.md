---
title: "How to Install SysStat on AlmaLinux: Step-by-Step Guide"
linkTitle: SysStat
description: Learn how to install SysStat on AlmaLinux with this detailed guide. Discover its features and learn to configure performance monitoring tools effectively.
date: 2025-01-07T09:22:09.281Z
weight: 1470
url: install-sysstat-almalinux-step-step-guide
draft: false
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

In the world of Linux system administration, monitoring system performance is crucial. SysStat, a popular collection of performance monitoring tools, provides valuable insights into CPU usage, disk activity, memory consumption, and more. It is a lightweight and robust utility that helps diagnose issues and optimize system performance.

AlmaLinux, a community-driven RHEL-compatible Linux distribution, is an ideal platform for leveraging SysStat’s capabilities. In this detailed guide, we’ll walk you through the process of installing and configuring SysStat on AlmaLinux. Whether you're a beginner or an experienced administrator, this tutorial will ensure you’re equipped to monitor your system efficiently.

---

### **What is SysStat?**

SysStat is a suite of performance monitoring tools for Linux systems. It includes several commands, such as:

- **sar**: Collects and reports system activity.
- **iostat**: Provides CPU and I/O statistics.
- **mpstat**: Monitors CPU usage.
- **pidstat**: Reports statistics of system processes.
- **nfsiostat**: Tracks NFS usage statistics.

These tools work together to provide a holistic view of system performance, making SysStat indispensable for troubleshooting and maintaining system health.

---

### **Prerequisites**

Before we begin, ensure the following:

1. **An AlmaLinux system**: This guide is tested on AlmaLinux 8 but works on similar RHEL-based distributions.
2. **Sudo privileges**: Root or administrative access is required.
3. **Basic terminal knowledge**: Familiarity with Linux commands is helpful.
4. **Internet access**: To download packages and updates.

---

### **Step 1: Update Your AlmaLinux System**

Start by updating the system packages to ensure you have the latest updates and security patches. Run the following commands:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

After completing the update, reboot the system if necessary:

```bash
sudo reboot
```

---

### **Step 2: Install SysStat Package**

SysStat is included in AlmaLinux’s default repository, making installation straightforward. Use the following command to install SysStat:

```bash
sudo dnf install -y sysstat
```

Once installed, verify the version to confirm the installation:

```bash
sar -V
```

The output should display the installed version of SysStat.

---

### **Step 3: Enable SysStat Service**

By default, the SysStat service is not enabled. To begin collecting performance data, activate and start the `sysstat` service:

1. Enable the service to start at boot:

   ```bash
   sudo systemctl enable sysstat
   ```

2. Start the service:

   ```bash
   sudo systemctl start sysstat
   ```

3. Verify the service status:

   ```bash
   sudo systemctl status sysstat
   ```

The output should indicate that the service is running successfully.

---

### **Step 4: Configure SysStat**

The SysStat configuration file is located at `/etc/sysconfig/sysstat`. You can adjust its settings to suit your requirements.

1. Open the configuration file:

   ```bash
   sudo nano /etc/sysconfig/sysstat
   ```

2. Modify the following parameters as needed:
   - `HISTORY`: The number of days to retain performance data (default: 7 days).
   - `ENABLED`: Set this to `true` to enable data collection.

3. Save and exit the file. Restart the SysStat service to apply the changes:

   ```bash
   sudo systemctl restart sysstat
   ```

---

### **Step 5: Schedule Data Collection with Cron**

SysStat collects data at regular intervals using cron jobs. These are defined in the `/etc/cron.d/sysstat` file. By default, it collects data every 10 minutes.

To adjust the frequency:

1. Open the cron file:

   ```bash
   sudo nano /etc/cron.d/sysstat
   ```

2. Modify the interval as needed. For example, to collect data every 5 minutes, change:

   ```bash
   */10 * * * * root /usr/lib64/sa/sa1 1 1
   ```

   to:

   ```bash
   */5 * * * * root /usr/lib64/sa/sa1 1 1
   ```

3. Save and exit the file.

SysStat will now collect performance data at the specified interval.

---

### **Step 6: Using SysStat Tools**

SysStat provides several tools to monitor various aspects of system performance. Here’s a breakdown of commonly used commands:

#### 1. **sar**: System Activity Report

The `sar` command provides a detailed report of system activity. For example:

- CPU usage:

  ```bash
  sar -u
  ```

- Memory usage:

  ```bash
  sar -r
  ```

#### 2. **iostat**: Input/Output Statistics

Monitor CPU usage and I/O statistics:

```bash
iostat
```

#### 3. **mpstat**: CPU Usage

View CPU usage for each processor:

```bash
mpstat
```

#### 4. **pidstat**: Process Statistics

Monitor resource usage by individual processes:

```bash
pidstat
```

#### 5. **nfsiostat**: NFS Usage

Track NFS activity:

```bash
nfsiostat
```

---

### **Step 7: Analyzing Collected Data**

SysStat stores collected data in the `/var/log/sa/` directory. Each day’s data is saved as a file (e.g., `sa01`, `sa02`).

To view historical data, use the `sar` command with the `-f` option:

```bash
sar -f /var/log/sa/sa01
```

This displays system activity for the specified day.

---

### **Step 8: Automating Reports (Optional)**

For automated performance reports:

1. Create a script that runs SysStat commands and formats the output.
2. Use cron jobs to schedule the script, ensuring reports are generated and saved or emailed regularly.

---

### **Step 9: Secure and Optimize SysStat**

1. **Restrict Access**: Limit access to SysStat logs to prevent unauthorized users from viewing system data.

   ```bash
   sudo chmod 600 /var/log/sa/*
   ```

2. **Optimize Log Retention**: Retain only necessary logs by adjusting the `HISTORY` parameter in the configuration file.

3. **Monitor Disk Space**: Regularly check disk space usage in `/var/log/sa/` to ensure logs do not consume excessive storage.

---

### **Troubleshooting Common Issues**

1. **SysStat Service Not Starting**:
   - Check for errors in the log file:

     ```bash
     sudo journalctl -u sysstat
     ```

   - Ensure `ENABLED=true` in the configuration file.

2. **No Data Collected**:
   - Verify cron jobs are running:

     ```bash
     sudo systemctl status cron
     ```

   - Check `/etc/cron.d/sysstat` for correct scheduling.

3. **Incomplete Logs**:
   - Ensure sufficient disk space is available for storing logs.

---

### **Conclusion**

SysStat is a vital tool for Linux administrators, offering powerful insights into system performance on AlmaLinux. By following this guide, you’ve installed, configured, and learned to use SysStat’s suite of tools to monitor CPU usage, I/O statistics, and more.

With proper configuration and usage, SysStat can help you optimize your AlmaLinux system, troubleshoot performance bottlenecks, and maintain overall system health. Explore its advanced features and integrate it into your monitoring strategy for better system management.

Good luck with your installation! Let me know if you need further assistance.
