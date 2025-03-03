---
draft: false
title: How to Configure System Auditing with Cinnamon Desktop on Linux Mint
linkTitle: How to Configure System Auditing
translationKey: how-to-configure-system-auditing-with-cinnamon-desktop-on-linux-mint
description: Learn how to configure system auditing on Linux Mint with the Cinnamon desktop environment.
url: how-to-configure-system-auditing-with-cinnamon-desktop-on-linux-mint
weight: 70
date: 2025-03-03
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - system auditing
featured_image: /images/linuxmint1.webp
---
Linux Mint is a popular Linux distribution known for its ease of use, stability, and sleek Cinnamon desktop environment. While Linux Mint is primarily aimed at desktop users, system security is still a key consideration. One critical aspect of security is system auditing, which helps track user activities, detect unauthorized access, and maintain system integrity.

In this guide, we will explore how to configure system auditing on Linux Mint with the Cinnamon desktop environment. We will cover:

- Understanding system auditing and its importance
- Installing and configuring audit tools
- Setting up audit rules
- Reviewing audit logs
- Monitoring system activities with GUI-based tools

## Understanding System Auditing and Its Importance

System auditing in Linux involves recording and monitoring system activities to detect security breaches, troubleshoot issues, and ensure compliance with security policies. Audit logs provide insights into system access, file modifications, and user actions, making it easier to track down potential security threats.

Linux Mint, like most Linux distributions, supports auditing through the `auditd` daemon, which logs system activities comprehensively. The audit subsystem allows administrators to set rules that track specific events such as login attempts, file modifications, and administrative commands.

## Installing and Configuring Audit Tools

Before setting up system auditing, we need to ensure that the necessary tools are installed on Linux Mint. The primary package for auditing is `auditd`.

### Installing Auditd

To install `auditd`, open a terminal and run:

```bash
sudo apt update
sudo apt install auditd audispd-plugins
```

Once installed, start and enable the audit daemon so that it runs on boot:

```bash
sudo systemctl start auditd
sudo systemctl enable auditd
```

To check the status of `auditd`, use:

```bash
sudo systemctl status auditd
```

If the service is running, you should see an active status.

## Setting Up Audit Rules

Audit rules define which events get logged. Rules can be set temporarily (until reboot) or permanently by adding them to `/etc/audit/rules.d/audit.rules`.

### Adding Temporary Rules

To set a temporary rule that logs all executions of the `passwd` command, run:

```bash
sudo auditctl -w /usr/bin/passwd -p x -k password_change
```

Here:

- `-w /usr/bin/passwd` watches the `passwd` command
- `-p x` logs execute actions
- `-k password_change` assigns a custom key for easier searching

### Adding Persistent Rules

To make audit rules permanent, add them to the audit rules file:

```bash
sudo nano /etc/audit/rules.d/audit.rules
```

Append the following line to track password changes:

```bash
-w /usr/bin/passwd -p x -k password_change
```

Save the file and restart `auditd` for the changes to take effect:

```bash
sudo systemctl restart auditd
```

## Reviewing Audit Logs

Audit logs are stored in `/var/log/audit/audit.log`. You can view the logs using `cat`, `less`, or `ausearch`.

To view the entire log:

```bash
sudo cat /var/log/audit/audit.log
```

To search for specific logs using the key assigned earlier:

```bash
sudo ausearch -k password_change
```

For a more detailed report:

```bash
sudo aureport -au
```

## Monitoring System Activities with GUI Tools

While `auditd` provides robust logging, reviewing logs manually can be cumbersome. Linux Mint's Cinnamon desktop allows integration with GUI-based monitoring tools.

### Using System Log Viewer

Linux Mint includes a system log viewer that allows you to browse log files more conveniently:

1. Open **Menu** > **Administration** > **Log File Viewer**.
2. Navigate to `/var/log/audit/audit.log`.
3. Review logs in a structured format with filtering options.

### Using GNOME System Monitor

GNOME System Monitor can help track resource usage and process activity:

```bash
sudo apt install gnome-system-monitor
```

Open the tool and check system processes for suspicious activity.

## Automating Log Analysis

For automated log analysis, you can use `auditd` along with tools like `fail2ban` or `logwatch`.

### Installing Logwatch

```bash
sudo apt install logwatch
```

Run a log summary:

```bash
sudo logwatch --detail high --logfile /var/log/audit/audit.log
```

### Installing Fail2Ban

```bash
sudo apt install fail2ban
```

Fail2Ban monitors logs for suspicious activity and blocks repeated unauthorized access attempts. Configure it by editing `/etc/fail2ban/jail.local`.

## Conclusion

System auditing is essential for security and system integrity. By setting up `auditd`, defining audit rules, and leveraging log monitoring tools, you can enhance the security of your Linux Mint system running the Cinnamon desktop.

With the combination of command-line and GUI tools, Linux Mint provides a flexible and user-friendly environment for monitoring system activities. Whether you're a beginner or an advanced user, configuring system auditing ensures better control over your system and helps maintain security best practices.
