---
title: Bob and the Art of Process Monitoring on AlmaLinux
linkTitle: Process Monitoring
description: This time, we’ll introduce Bob to essential Linux tools for tracking system performance and managing processes, helping him understand resource usage and troubleshoot performance issues.
date: 2024-11-11
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
weight: 50
toc: true
keywords: ""
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: /bob-and-art-of-process-monitoring-in-alma-linux/
---

Alright, let’s dive into Bob’s next adventure, *"Bob and the Art of Process Monitoring!"* This time, we’ll introduce Bob to essential Linux tools for tracking system performance and managing processes, helping him understand resource usage and troubleshoot performance issues.

---

## 1. Introduction: Bob’s New Objective

After mastering cron jobs and automating several tasks, Bob’s feeling efficient. But soon, he encounters a common challenge: his system occasionally slows down, and he’s not sure what’s causing it. His boss tells him it’s time to learn how to monitor and manage processes in Linux, so he can pinpoint which programs are consuming resources.

> *“Alright, time to understand what’s happening under the hood!”* Bob mutters, determined to take control of his system’s performance.

---

## 2. Introducing Process Monitoring with `top`

Bob begins his journey with a tool called `top`, which provides real-time information about running processes, including their CPU and memory usage.

- **Launching `top`**: Bob types `top` in the terminal, and the screen fills with information: process IDs, user names, CPU and memory usage, and more.

  ```bash
  top
  ```

- **Interpreting the Output**: He learns that:
  - **PID** (Process ID): Each process has a unique identifier.
  - **%CPU** and **%MEM**: Show how much CPU and memory each process is using.
  - **TIME+**: Tracks how much CPU time each process has consumed since it started.

- **Filtering with `top`**: Bob learns he can press `u` to filter processes by the user, allowing him to view only his processes if he’s troubleshooting user-specific issues.

> *“This makes it so easy to see who’s hogging resources!”* Bob exclaims, excited about his new tool.

---

## 3. Killing Unresponsive Processes with `kill`

While running `top`, Bob notices a process that’s consuming an unusual amount of CPU. It’s a script he was testing earlier that’s gone rogue. He decides it’s time to use the `kill` command to terminate it.

- **Identifying the PID**: Using `top`, Bob notes the **PID** of the unresponsive process.
- **Using `kill`**: He runs:

  ```bash
  kill 12345
  ```

  (where `12345` is the PID). The process stops, freeing up resources.

- **Escalating with `kill -9`**: Sometimes, a process won’t respond to the regular `kill` command. In these cases, Bob uses `kill -9` to forcefully terminate it:

  ```bash
  kill -9 12345
  ```

  He learns that `-9` sends a **SIGKILL** signal, which immediately stops the process without cleanup.

> *“Good to know I have backup options if a process won’t quit!”* Bob notes, relieved.

---

## 4. Monitoring System Load with `htop`

Bob discovers that there’s a more advanced version of `top` called **`htop`**, which provides a friendlier, color-coded interface.

- **Installing `htop`**: He installs it with:

  ```bash
  sudo dnf install htop
  ```

- **Using `htop`**: When he types `htop`, Bob is greeted by a more organized view of system resources, with options to scroll, sort, and filter processes. He finds it especially useful for identifying processes that are draining memory or CPU.

> *“`htop` makes it so much easier to find resource-heavy processes!”* Bob says, impressed with its visual layout.

---

## 5. Keeping Tabs on Memory with `free`

As Bob dives deeper into performance monitoring, he realizes that understanding memory usage is key. He learns about the `free` command, which provides a snapshot of his system’s memory.

- **Running `free`**: Bob types:

  ```bash
  free -h
  ```

  Using `-h` makes the output human-readable, showing memory usage in MB and GB rather than bytes.

- **Interpreting Memory Info**: He learns that `free` shows:
  - **Total**: Total physical memory available.
  - **Used**: Currently used memory.
  - **Free**: Unused memory.
  - **Buffers/Cached**: Memory set aside for system caching, which is used but easily freed when needed.

> *“So if my ‘used’ memory is high but cache is available, I don’t need to panic!”* Bob concludes, feeling more confident about memory management.

---

## 6. Checking Disk Usage with `df` and `du`

Bob’s next stop is disk usage. Occasionally, disk space runs low, so he needs tools to quickly check which directories are consuming space.

- **Checking File System Usage with `df`**: To get a quick overview, Bob uses:

  ```bash
  df -h
  ```

  This shows disk usage for each filesystem in human-readable format, helping him see where his space is allocated.

- **Finding Directory Sizes with `du`**: When he needs to track down specific directories consuming too much space, Bob runs:

  ```bash
  du -sh /home/bob/*
  ```

  The `-s` option provides a summary, and `-h` gives readable output. This command shows the total size of each item in his home directory.

> *“`df` for the big picture, and `du` for details—got it!”* Bob adds to his notes.

---

**7. Monitoring Logs with `tail`**

Bob knows logs are crucial for troubleshooting, but they can get quite long. To avoid scrolling through pages of data, he learns to use `tail` to monitor only the most recent entries in a log file.

- **Using `tail`**: Bob tries viewing the last 10 lines of the system log:

  ```bash
  tail /var/log/messages
  ```

- **Following Logs in Real-Time**: For live monitoring, he uses `tail -f` to follow new log entries as they appear:

  ```bash
  tail -f /var/log/messages
  ```

> *“Real-time logs will be great for catching errors as they happen,”* Bob realizes, appreciating the simplicity of `tail`.

---

## 8. Conclusion: Bob’s Process Monitoring Skills

Armed with `top`, `htop`, `free`, `df`, `du`, and `tail`, Bob now has a solid foundation in monitoring his system’s performance. He can check memory, kill unresponsive processes, track CPU load, and quickly pinpoint disk space issues.

> But he knows there’s still more to learn—next, he’ll dive into **network monitoring** and learn to troubleshoot network performance issues.

*Stay tuned for the next adventure: "Bob Tackles Network Monitoring and Troubleshooting!"*
