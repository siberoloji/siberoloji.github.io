---
draft: false
title: How to Set Up Monitoring Tools with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Monitoring Tools
translationKey: how-to-set-up-monitoring-tools-with-cinnamon-desktop-on-linux-mint
description: This article explains how to set up monitoring tools with Cinnamon Desktop on Linux Mint.
url: how-to-set-up-monitoring-tools-with-cinnamon-desktop-on-linux-mint
weight: 130
date: 2025-03-11
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - monitoring tools
featured_image: /images/linuxmint1.webp
---
Linux Mint is one of the most popular Linux distributions, known for its stability, ease of use, and the powerful Cinnamon desktop environment. Whether you're a system administrator, developer, or a regular user, monitoring system performance is crucial for maintaining a smooth computing experience. This guide covers how to set up and use various monitoring tools with Cinnamon Desktop on Linux Mint.

## Why Monitor System Performance?

Monitoring tools help you:

- **Detect Performance Issues**: Identify high CPU usage, memory leaks, or slow disk performance.
- **Optimize Resource Allocation**: Ensure that your system is using resources efficiently.
- **Enhance Security**: Detect unusual activity that could indicate security threats.
- **Prevent System Crashes**: Address potential issues before they cause system failures.

## Built-in Monitoring Tools in Linux Mint

Linux Mint comes with several pre-installed tools that provide essential system monitoring:

### 1. **System Monitor**

The built-in System Monitor provides a graphical interface to check CPU usage, memory consumption, disk activity, and running processes.

#### How to Open System Monitor

1. Click on the **Menu** in the bottom-left corner.
2. Search for **System Monitor**.
3. Open the application and navigate through the **Processes**, **Resources**, and **File Systems** tabs.

### 2. **Task Manager**

For a simpler view of running processes and their resource usage:

1. Right-click on the **taskbar**.
2. Select **Task Manager**.

## Installing Advanced Monitoring Tools

While the built-in tools are useful, advanced monitoring tools provide more detailed insights. Below are some recommended tools and how to install them.

### 1. **htop (Advanced Process Manager)**

`htop` is an improved version of `top`, providing a user-friendly, interactive process viewer.

#### Installation

```bash
sudo apt update && sudo apt install htop -y
```

#### Usage

Run `htop` in the terminal:

```bash
htop
```

Use arrow keys or function keys for navigation and sorting processes.

### 2. **Glances (Comprehensive System Monitor)**

Glances provides real-time monitoring of CPU, memory, disk, network, and sensors in a compact interface.

#### Installation

```bash
sudo apt update && sudo apt install glances -y
```

#### Usage

Run `glances` in the terminal:

```bash
glances
```

For web-based monitoring, use:

```bash
glances -w
```

Then access the interface via `http://localhost:61208`.

### 3. **Conky (Graphical System Monitor Widget)**

Conky is a lightweight system monitor that displays information directly on your desktop.

#### Installation

```bash
sudo apt update && sudo apt install conky-all -y
```

#### Running Conky

```bash
conky &
```

To customize, edit the configuration file:

```bash
nano ~/.conkyrc
```

### 4. **Psensor (Hardware Temperature and Fan Speed Monitor)**

Psensor helps monitor CPU, GPU, and motherboard temperatures along with fan speeds.

#### Installation

```bash
sudo apt update && sudo apt install psensor -y
```

#### Usage

1. Open **Psensor** from the application menu.
2. Configure sensors by selecting **Preferences > Sensors**.

### 5. **NetHogs (Network Bandwidth Usage Monitor)**

NetHogs allows you to track network usage per process.

#### Installation

```bash
sudo apt update && sudo apt install nethogs -y
```

#### Usage

Run the following command (use `sudo` for better results):

```bash
sudo nethogs
```

### 6. **Iotop (Disk I/O Usage Monitor)**

Iotop shows which processes are consuming disk I/O.

#### Installation

```bash
sudo apt update && sudo apt install iotop -y
```

#### Usage

Run:

```bash
sudo iotop
```

## Integrating Monitoring Tools with Cinnamon Panel

For real-time monitoring, you can integrate some tools with Cinnamon’s panel.

### Adding System Load Indicator

1. Open the **Menu** and search for **Applets**.
2. Go to the **Download** tab and search for **System Monitor**.
3. Install and enable the applet.
4. You should now see a system monitor icon on the panel.

### Adding Network and CPU Usage Applets

1. Open **Applets** again.
2. Search for **CPU Temperature Indicator** or **Network Usage Monitor**.
3. Install and enable them.

## Automating System Monitoring with Logs

For continuous monitoring and logging, use:

### 1. **sysstat (Collects System Statistics)**

Install sysstat:

```bash
sudo apt update && sudo apt install sysstat -y
```

Enable and start the service:

```bash
sudo systemctl enable sysstat
sudo systemctl start sysstat
```

Check CPU activity logs:

```bash
sar -u 5 10
```

### 2. **Logwatch (Automated System Log Analyzer)**

Install Logwatch:

```bash
sudo apt update && sudo apt install logwatch -y
```

Generate a report:

```bash
sudo logwatch --detail high --mailto your-email@example.com
```

## Conclusion

Monitoring your system ensures a smooth and efficient Linux Mint experience. Whether using built-in tools or advanced options like `htop`, `Glances`, and `Conky`, you can track system performance in real-time. Integrating monitoring applets into the Cinnamon panel adds convenience, while logging tools like `sysstat` and `Logwatch` help with long-term analysis. By setting up these tools, you’ll have full control over your Linux Mint system’s health and performance.
