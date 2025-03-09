---
draft: false
title: How to Set Up Security Alerts with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Security Alerts
translationKey: how-to-set-up-security-alerts-with-cinnamon-desktop-on-linux-mint
description: A step-by-step guide to setting up security alerts on Linux Mint with Cinnamon, ensuring your system remains secure.
url: how-to-set-up-security-alerts-with-cinnamon-desktop-on-linux-mint
weight: 260
date: 2025-03-09
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - security alerts
featured_image: /images/linuxmint1.webp
---
Linux Mint, known for its stability and user-friendliness, is a popular choice for users transitioning from Windows or macOS. While Linux is generally more secure than other operating systems, it is still essential to implement security measures, including setting up alerts for suspicious activity. The Cinnamon desktop environment, which is the default for Linux Mint, provides various tools and configurations to enhance security and monitor system integrity.

This guide will walk you through setting up security alerts on Linux Mint with Cinnamon, leveraging system logs, audit frameworks, and custom scripts to ensure your system remains secure.

## 1. Understanding Security Alerts in Linux Mint

Security alerts help detect unauthorized access, unusual login attempts, system modifications, or unexpected network activity. Unlike Windows, Linux does not have built-in pop-up alerts for security events, but with the right tools and scripts, you can configure Cinnamon to notify you when specific events occur.

### Key Security Aspects to Monitor

- Unauthorized login attempts
- Changes to system files
- Unexpected new user accounts
- Firewall rule modifications
- Unusual network activity

## 2. Installing and Configuring Auditd

One of the best tools for monitoring security-related events on Linux is `auditd`, the Linux Audit Daemon. It logs system calls and security events that can be used for generating alerts.

### Installing Auditd

Open a terminal and install `auditd` with:

```bash
sudo apt update && sudo apt install auditd audispd-plugins
```

Enable and start the service:

```bash
sudo systemctl enable auditd
sudo systemctl start auditd
```

### Configuring Audit Rules

To monitor login attempts, add the following rule:

```bash
sudo auditctl -w /var/log/auth.log -p wa -k auth_logs
```

To track modifications to critical system files, use:

```bash
sudo auditctl -w /etc/passwd -p wa -k passwd_changes
```

To ensure the rules persist after reboot, edit the audit rules file:

```bash
sudo nano /etc/audit/rules.d/audit.rules
```

Add the above rules, save the file, and restart the service:

```bash
sudo systemctl restart auditd
```

## 3. Setting Up Email Alerts with Auditd

To receive email alerts, configure `auditd` to send notifications via mail when specific security events occur.

Install `mailutils` if it's not already installed:

```bash
sudo apt install mailutils
```

Modify the audit rules file to trigger a script:

```bash
echo 'exec /usr/local/bin/audit_alert.sh' | sudo tee -a /etc/audit/rules.d/audit.rules
```

Create the alert script:

```bash
sudo nano /usr/local/bin/audit_alert.sh
```

Paste the following content:

```bash
#!/bin/bash
echo "Security alert: $(tail -n 10 /var/log/audit/audit.log)" | mail -s "Linux Mint Security Alert" your_email@example.com
```

Save the file and make it executable:

```bash
sudo chmod +x /usr/local/bin/audit_alert.sh
```

Restart `auditd`:

```bash
sudo systemctl restart auditd
```

Now, whenever a monitored event occurs, you will receive an email alert.

## 4. Using System Notifications in Cinnamon

If you prefer on-screen alerts instead of emails, you can use Cinnamon’s built-in notification system.

### Creating a Cinnamon Notification Script

Create a script that listens for audit events and displays a notification:

```bash
sudo nano /usr/local/bin/cinnamon_security_alert.sh
```

Paste the following content:

```bash
#!/bin/bash
tail -Fn0 /var/log/audit/audit.log | while read line; do
    notify-send "Security Alert" "$line"
done
```

Save the file and make it executable:

```bash
sudo chmod +x /usr/local/bin/cinnamon_security_alert.sh
```

Run the script in the background:

```bash
nohup /usr/local/bin/cinnamon_security_alert.sh &
```

This script will display a pop-up notification in Cinnamon whenever an audit event is recorded.

## 5. Setting Up Intrusion Detection with Fail2Ban

Fail2Ban is another useful tool that helps block suspicious login attempts.

### Installing Fail2Ban

```bash
sudo apt install fail2ban
```

Create a custom configuration:

```bash
sudo nano /etc/fail2ban/jail.local
```

Add the following content:

```ini
[sshd]
enabled = true
filter = sshd
action = iptables-multiport[name=SSH, port="ssh", protocol=tcp]
logpath = /var/log/auth.log
maxretry = 5
bantime = 600
```

Restart Fail2Ban:

```bash
sudo systemctl restart fail2ban
```

To check banned IPs:

```bash
sudo fail2ban-client status sshd
```

## 6. Monitoring System Logs with Logwatch

Logwatch summarizes system logs and can send reports via email.

### Installing Logwatch

```bash
sudo apt install logwatch
```

Run Logwatch manually:

```bash
sudo logwatch --detail high --mailto your_email@example.com
```

To automate daily reports, add a cron job:

```bash
sudo crontab -e
```

Add the following line:

```bash
0 7 * * * /usr/sbin/logwatch --output mail --mailto your_email@example.com --detail high
```

## 7. Conclusion

Setting up security alerts on Linux Mint with Cinnamon ensures you stay informed about potential threats. By leveraging `auditd`, Cinnamon’s notification system, `fail2ban`, and `logwatch`, you can create a robust monitoring solution. Regularly review security logs and adjust configurations based on new threats to keep your system secure.

If you have any questions or need further assistance, feel free to ask!
