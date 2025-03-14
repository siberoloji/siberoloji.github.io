---
draft: false
title: How to Monitor CPU/RAM Usage with `top` and `htop` on FreeBSD Operating System
linkTitle: How to Monitor CPU/RAM Usage
translationKey: how-to-monitor-cpuram-usage-with-top-and-htop-on-freebsd-operating-system
description: This article explains how to use the `top` and `htop` commands to monitor CPU and RAM usage on FreeBSD.
url: how-to-monitor-cpuram-usage-with-top-and-htop-on-freebsd-operating-system
date: 2023-03-05
weight: 90
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Monitoring system resources such as CPU and RAM usage is a critical task for system administrators, developers, and even power users. Understanding how your system is performing can help you diagnose performance bottlenecks, optimize resource allocation, and ensure that your system is running smoothly. On FreeBSD, a powerful and versatile Unix-like operating system, two of the most commonly used tools for monitoring CPU and RAM usage are `top` and `htop`. In this blog post, we’ll explore how to use these tools effectively to monitor system performance.

## Table of Contents

1. **Introduction to FreeBSD and System Monitoring**
2. **What is `top`?**
   - Installing `top` on FreeBSD
   - Basic Usage of `top`
   - Understanding `top` Output
   - Customizing `top`
3. **What is `htop`?**
   - Installing `htop` on FreeBSD
   - Basic Usage of `htop`
   - Understanding `htop` Output
   - Customizing `htop`
4. **Comparing `top` and `htop`**
5. **Best Practices for Monitoring CPU/RAM Usage**
6. **Conclusion**

---

## 1. Introduction to FreeBSD and System Monitoring

FreeBSD is a free and open-source Unix-like operating system known for its performance, scalability, and advanced networking capabilities. It is widely used in servers, embedded systems, and as a desktop operating system. One of the key aspects of maintaining a healthy FreeBSD system is monitoring its resource usage, particularly CPU and RAM.

CPU and RAM are two of the most critical resources in any computing environment. High CPU usage can lead to slow performance, while insufficient RAM can cause excessive swapping, leading to system slowdowns. By monitoring these resources, you can identify processes that are consuming too much CPU or memory and take appropriate action, such as terminating or optimizing those processes.

## 2. What is `top`?

`top` is a command-line utility that provides a real-time, dynamic view of system processes. It displays a summary of system resource usage, including CPU, memory, and swap usage, as well as a list of currently running processes. `top` is available on most Unix-like operating systems, including FreeBSD.

### Installing `top` on FreeBSD

On FreeBSD, `top` is part of the base system, so there is no need to install it separately. You can start using `top` immediately by typing the following command in your terminal:

```bash
top
```

### Basic Usage of `top`

When you run `top`, you’ll see a screen that is divided into two main sections:

1. **Summary Section**: This section provides an overview of system resource usage, including:
   - **Load averages**: The system load averages for the past 1, 5, and 15 minutes.
   - **CPU usage**: The percentage of CPU time spent on user processes, system processes, idle time, and more.
   - **Memory usage**: The amount of physical memory (RAM) used, free, and buffered.
   - **Swap usage**: The amount of swap space used and free.

2. **Process List**: This section lists the currently running processes, sorted by CPU usage by default. Each process is displayed with its PID (Process ID), user, priority, CPU usage, memory usage, and more.

### Understanding `top` Output

Here’s a breakdown of some key fields in the `top` output:

- **PID**: The Process ID of the process.
- **USER**: The username of the user who owns the process.
- **PR**: The priority of the process.
- **NI**: The nice value of the process, which affects its priority.
- **VIRT**: The total amount of virtual memory used by the process.
- **RES**: The amount of physical RAM used by the process.
- **SHR**: The amount of shared memory used by the process.
- **%CPU**: The percentage of CPU time used by the process.
- **%MEM**: The percentage of physical RAM used by the process.
- **TIME+**: The total CPU time used by the process since it started.
- **COMMAND**: The command that started the process.

### Customizing `top`

`top` is highly customizable. You can interact with `top` while it’s running to change its behavior. Here are some useful commands:

- **k**: Kill a process. You’ll be prompted to enter the PID of the process you want to terminate.
- **r**: Renice a process. You can change the priority of a process by entering its PID and the new nice value.
- **f**: Enter the field management screen. Here, you can choose which columns to display in the process list.
- **o**: Change the order of the displayed columns.
- **s**: Change the delay between updates (in seconds).
- **q**: Quit `top`.

## 3. What is `htop`?

`htop` is an interactive process viewer that is similar to `top` but with a more user-friendly interface and additional features. It provides a color-coded display, mouse support, and the ability to scroll horizontally and vertically. `htop` is not part of the FreeBSD base system, so it needs to be installed separately.

### Installing `htop` on FreeBSD

To install `htop` on FreeBSD, you can use the `pkg` package manager:

```bash
sudo pkg install htop
```

Once installed, you can start `htop` by typing:

```bash
htop
```

### Basic Usage of `htop`

When you run `htop`, you’ll see a screen that is similar to `top` but with a more visually appealing layout. The screen is divided into three main sections:

1. **Header Section**: This section provides an overview of system resource usage, including CPU, memory, and swap usage. It also displays the system uptime and load averages.

2. **Process List**: This section lists the currently running processes, sorted by CPU usage by default. Each process is displayed with its PID, user, priority, CPU usage, memory usage, and more.

3. **Footer Section**: This section displays a list of available commands that you can use to interact with `htop`.

### Understanding `htop` Output

The `htop` output is similar to `top`, but it is color-coded and easier to read. Here’s a breakdown of some key fields:

- **PID**: The Process ID of the process.
- **USER**: The username of the user who owns the process.
- **PRI**: The priority of the process.
- **NI**: The nice value of the process.
- **VIRT**: The total amount of virtual memory used by the process.
- **RES**: The amount of physical RAM used by the process.
- **SHR**: The amount of shared memory used by the process.
- **CPU%**: The percentage of CPU time used by the process.
- **MEM%**: The percentage of physical RAM used by the process.
- **TIME+**: The total CPU time used by the process since it started.
- **Command**: The command that started the process.

### Customizing `htop`

`htop` is highly customizable and provides a more interactive experience compared to `top`. Here are some useful commands:

- **F1**: Open the help screen, which lists all available commands.
- **F2**: Enter the setup menu, where you can customize the display, colors, and columns.
- **F3**: Search for a process by name.
- **F4**: Filter processes by name.
- **F5**: Tree view, which displays processes in a hierarchical tree structure.
- **F6**: Sort processes by a specific column.
- **F9**: Kill a process. You’ll be prompted to select a signal to send to the process.
- **F10**: Quit `htop`.

## 4. Comparing `top` and `htop`

Both `top` and `htop` are powerful tools for monitoring system resources, but they have some differences:

- **Interface**: `htop` has a more user-friendly, color-coded interface with mouse support, while `top` has a more traditional, text-based interface.
- **Features**: `htop` offers additional features such as tree view, process filtering, and more interactive customization options.
- **Resource Usage**: `htop` may use slightly more system resources due to its enhanced interface, but the difference is usually negligible on modern systems.
- **Availability**: `top` is part of the FreeBSD base system, while `htop` needs to be installed separately.

## 5. Best Practices for Monitoring CPU/RAM Usage

Here are some best practices for monitoring CPU and RAM usage on FreeBSD:

- **Regular Monitoring**: Make it a habit to regularly monitor your system’s resource usage, especially during peak loads or after making significant changes to your system.
- **Identify Resource Hogs**: Use `top` or `htop` to identify processes that are consuming excessive CPU or memory. Consider optimizing or terminating these processes if necessary.
- **Set Alerts**: Consider setting up alerts or automated scripts to notify you when CPU or memory usage exceeds a certain threshold.
- **Optimize System Configuration**: Based on your monitoring, adjust system settings such as process priorities, memory limits, and swap usage to optimize performance.
- **Use Logs**: Combine real-time monitoring with log analysis to get a comprehensive view of system performance over time.

## 6. Conclusion

Monitoring CPU and RAM usage is essential for maintaining a healthy and efficient FreeBSD system. Both `top` and `htop` are powerful tools that can help you keep an eye on system resources, identify performance bottlenecks, and take appropriate action. While `top` is a reliable and readily available option, `htop` offers a more user-friendly and feature-rich experience. By understanding how to use these tools effectively, you can ensure that your FreeBSD system runs smoothly and efficiently.

Whether you’re a system administrator, developer, or power user, mastering `top` and `htop` will give you valuable insights into your system’s performance and help you make informed decisions about resource management. So, the next time you notice your system slowing down, fire up `top` or `htop` and take control of your system’s resources!
