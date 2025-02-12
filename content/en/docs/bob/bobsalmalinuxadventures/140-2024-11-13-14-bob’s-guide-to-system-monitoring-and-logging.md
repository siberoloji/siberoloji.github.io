---
title: Bob’s Guide to System Monitoring and Logging on AlmaLinux
linkTitle: System Logging
description: Bob will learn how to monitor his system's health, track user activity, and analyze logs for any signs of issues on AlmaLinux.
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 140
keywords:
  - AlmaLinux
  - Logging
  - System Monitoring
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-guide-system-monitoring-logging-alma-linux
translationKey: bobs-guide-system-monitoring-logging-alma-linux
---

Alright, let’s continue with Chapter 14, *"Bob’s Guide to System Monitoring and Logging"*. In this chapter, Bob will learn how to monitor his system's health, track user activity, and analyze logs for any signs of issues on AlmaLinux.

---

## **1. Introduction: Bob’s Next Mission in Monitoring**

With several services now running on his AlmaLinux server, Bob wants to make sure everything stays healthy and operational. He decides to learn about system monitoring tools and logging to track performance and spot any unusual activity. This chapter will cover essential tools like `journalctl`, `dmesg`, and other monitoring utilities to help him keep a close watch on his system.

> *“If I can keep track of everything happening on my server, I’ll be ready for anything!”* Bob says, feeling motivated.

---

## **2. Using `journalctl` for System Logs**

Bob starts with `journalctl`, a tool that lets him view logs for almost every service on his system. He learns that `journalctl` is particularly useful for tracking system events and troubleshooting.

- **Viewing System Logs**: Bob types the following command to view all recent log entries:

  ```bash
  sudo journalctl
  ```

- **Filtering Logs by Time**: To narrow down logs, he uses time-based filters. For example, to view logs from the past hour:

  ```bash
  sudo journalctl --since "1 hour ago"
  ```

- **Checking Service Logs**: Bob can also view logs for specific services. For instance, to see logs for Apache:

  ```bash
  sudo journalctl -u httpd
  ```

> *“Now I can keep an eye on each service individually—very helpful!”* Bob notes, appreciating the flexibility of `journalctl`.

---

## **3. Monitoring Kernel Events with `dmesg`**

Bob learns that `dmesg` is a command for viewing kernel messages, which are useful for identifying hardware and boot issues.

- **Viewing Kernel Logs**: To see recent kernel messages, he types:

  ```bash
  dmesg
  ```

- **Filtering for Specific Errors**: Bob filters for errors in the kernel logs by piping `dmesg` with `grep`:

  ```bash
  dmesg | grep -i error
  ```

  This shows any messages that contain the word “error,” helping him spot potential hardware or boot problems quickly.

> *“With `dmesg`, I can check for hardware issues right from the command line,”* Bob says, relieved to have a way to troubleshoot hardware problems.

---

## **4. Checking System Health with `top` and `htop`**

For real-time monitoring, Bob revisits **`top`** and **`htop`**, which help him keep an eye on CPU, memory, and process activity.

- **Using `top` for an Overview**: Bob runs `top` to get a quick view of his system’s CPU and memory usage, sorting processes by resource consumption:

  ```bash
  top
  ```

- **Switching to `htop` for More Details**: For an enhanced view, he uses `htop`, which provides a user-friendly interface:

  ```bash
  htop
  ```

  This allows him to interactively sort, filter, and kill processes, making it easier to manage system load.

> *“These tools let me respond immediately if something starts using too much CPU or memory,”* Bob says, feeling in control.

---

## **5. Monitoring Disk Usage with `df` and `du`**

To prevent his disk from filling up, Bob uses `df` and `du` to monitor disk space and file sizes.

- **Checking Disk Space with `df`**: Bob uses `df` to get an overview of disk usage by filesystem:

  ```bash
  df -h
  ```

  The `-h` option makes the output human-readable, showing space in MB/GB.

- **Finding Large Files with `du`**: To see which directories are using the most space, he uses `du`:

  ```bash
  du -sh /var/log/*
  ```

  This shows the sizes of each item in `/var/log`, helping him identify any large log files that need attention.

> *“Now I know exactly where my disk space is going!”* Bob says, happy to have control over his storage.

---

## **6. Setting Up Automated Alerts with `psacct`**

Bob learns that `psacct` (process accounting) can log user activity and help monitor usage patterns. This is useful for tracking user logins, commands, and resource consumption.

- **Installing `psacct`**: To start tracking user activity, Bob installs `psacct`:

  ```bash
  sudo dnf install psacct
  ```

- **Starting `psacct`**: He starts the service and enables it at boot:

  ```bash
  sudo systemctl start psacct
  sudo systemctl enable psacct
  ```

- **Tracking User Activity**: With `psacct` running, Bob can use commands like `lastcomm` to view recent commands used by each user:

  ```bash
  lastcomm
  ```

  - He also uses `ac` to view user login times, helping him monitor login patterns.

> *“With `psacct`, I have a detailed view of who’s doing what on the system,”* Bob says, feeling reassured about his ability to monitor activity.

---

## **7. Monitoring System Metrics with `sar`**

Bob learns that `sar` (part of the `sysstat` package) can collect data on CPU, memory, disk, and network usage over time, helping him analyze performance trends.

- **Installing `sysstat`**: If not already installed, Bob adds the `sysstat` package:

  ```bash
  sudo dnf install sysstat
  ```

- **Viewing CPU Usage with `sar`**: Bob runs `sar` to check historical CPU usage:

  ```bash
  sar -u 1 5
  ```

  This command displays CPU usage every second for five intervals, showing trends in real time.

- **Checking Memory Usage**: He can also view memory stats with:

  ```bash
  sar -r 1 5
  ```

  This helps him monitor memory usage and identify any unexpected increases.

> *“With `sar`, I can see if my system load is spiking over time,”* Bob says, realizing the importance of tracking metrics.

---

## **8. Analyzing Logs with Log Rotation and `logrotate`**

Bob knows that logs can quickly take up disk space, so he sets up **`logrotate`** to automatically manage log files and prevent his disk from filling up.

- **Configuring `logrotate`**: He checks the default `logrotate` configuration in `/etc/logrotate.conf` and sees settings for daily rotation, compression, and retention.

- **Customizing Log Rotation for a Specific Service**: Bob creates a custom log rotation file for Apache logs in `/etc/logrotate.d/httpd`:

  ```bash
  /var/log/httpd/*.log {
      daily
      rotate 7
      compress
      missingok
      notifempty
  }
  ```

  This configuration rotates Apache logs daily, keeps seven days of logs, and compresses old logs.

> *“Log rotation keeps my system clean without losing important logs,”* Bob notes, relieved to have an automated solution.

---

## **9. Conclusion: Bob’s System is Under Control**

With tools like `journalctl`, `dmesg`, `top`, `df`, and `sar`, Bob has a full suite of monitoring and logging tools. He feels confident that he can keep track of system performance, user activity, and log storage, ensuring his AlmaLinux server runs smoothly and securely.

> Next up, Bob wants to explore **configuring network file sharing** to allow his team to share files easily and securely.
