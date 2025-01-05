---
title: Bob Masters Firewalls and Security Settings on AlmaLinux
linkTitle: Firewalls and Security
description: null
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 90
toc: true
keywords:
  - Firewalls and Security
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-masters-firewalls-security-settings-alma-linux
---

Bob Masters Firewalls and Security Settings, where Bob will learn the essentials of securing his system with firewalls and access control.

## 1. Introduction: Bob’s New Security Mission

One day, Bob receives a message from his boss emphasizing the importance of security on their network. His boss suggests he start with basic firewall setup, so Bob knows it’s time to learn about controlling access to his system and protecting it from unwanted traffic.

> *“Better to lock things down before it’s too late!”* Bob says, determined to set up strong defenses.

---

## 2. Introduction to Firewalls and `firewalld`

Bob learns that AlmaLinux uses **`firewalld`**, a tool for managing firewall rules that can dynamically control traffic flow. `firewalld` organizes these rules using **zones**, each with different security levels.

- **Checking Firewall Status**: Bob checks if `firewalld` is active:

  ```bash
  sudo systemctl status firewalld
  ```

  If it’s inactive, he starts and enables it to run at boot:

  ```bash
  sudo systemctl start firewalld
  sudo systemctl enable firewalld
  ```

- **Understanding Zones**: Bob learns about `firewalld` zones, which define trust levels for network connections:
  - **Public**: Default zone with limited access, ideal for public networks.
  - **Home**: Trusted zone with fewer restrictions, meant for secure, private networks.
  - **Work**: Similar to Home but tailored for work environments.

> *“Zones let me adjust security depending on where my system is connected—smart!”* Bob thinks, ready to set up his firewall.

---

## 3. Setting Up Basic Rules with `firewall-cmd`

Bob’s next task is to set up basic firewall rules, allowing only necessary traffic and blocking everything else.

- **Allowing SSH Access**: Since he needs remote access, he allows SSH traffic:

  ```bash
  sudo firewall-cmd --zone=public --add-service=ssh --permanent
  ```

  - **`--zone=public`**: Applies this rule to the public zone.
  - **`--add-service=ssh`**: Allows SSH connections.
  - **`--permanent`**: Makes the rule persistent across reboots.

- **Reloading Firewall Rules**: After making changes, Bob reloads the firewall to apply his rules:

  ```bash
  sudo firewall-cmd --reload
  ```

> *“Now I can access my system remotely but keep everything else secure,”* Bob notes, feeling a sense of control.

---

## 4. Allowing and Blocking Specific Ports

Bob decides to allow HTTP and HTTPS traffic for web services but block other unnecessary ports.

- **Allowing HTTP and HTTPS**: He enables traffic on ports 80 (HTTP) and 443 (HTTPS):

  ```bash
  sudo firewall-cmd --zone=public --add-service=http --permanent
  sudo firewall-cmd --zone=public --add-service=https --permanent
  ```
  
- **Blocking a Specific Port**: To block an unused port (e.g., port 8080), he specifies:

  ```bash
  sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
  ```

After reloading, he verifies that only the allowed services and ports are open.

> *“Only the necessary doors are open—everything else stays locked!”* Bob says, pleased with his setup.

---

## 5. Creating Custom Rules

Bob’s next step is setting up a custom rule. He learns he can manually open specific ports without relying on predefined services.

- **Allowing a Custom Port**: For a special application on port 3000, Bob runs:

  ```bash
  sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
  ```

  This lets the application work without exposing other unnecessary services.

- **Removing Custom Rules**: If he no longer needs this port open, he can remove it:

  ```bash
  sudo firewall-cmd --zone=public --remove-port=3000/tcp --permanent
  ```

> *“Good to know I can make my own rules if needed!”* Bob says, appreciating the flexibility of `firewalld`.

---

## 6. Monitoring and Logging with `journalctl`

Bob realizes that monitoring firewall activity is just as important as setting up rules. He uses `journalctl` to view logs and check for any unusual access attempts.

- **Viewing Firewall Logs**: He filters `journalctl` output to see only firewall-related entries:

  ```bash
  sudo journalctl -u firewalld
  ```

  This shows him when connections were allowed or blocked, giving him insight into potential security events.

> *“Now I can see if anyone’s trying to get in where they shouldn’t!”* Bob says, relieved to have logging in place.

---

## 7. Testing and Troubleshooting Firewall Rules

To ensure everything’s working as intended, Bob tests his rules by attempting connections and checking for access or denial messages.

- **Testing with `nmap`**: Using a network scanning tool like `nmap`, he scans his system to verify which ports are open:

  ```bash
  nmap localhost
  ```

  This confirms that only his allowed ports (SSH, HTTP, and HTTPS) are accessible.

- **Troubleshooting Connectivity**: If something isn’t working, Bob can temporarily disable the firewall to identify whether it’s causing the issue:

  ```bash
  sudo systemctl stop firewalld
  ```

  Once he’s diagnosed the issue, he can re-enable `firewalld`.

> *“A quick stop and restart can help me troubleshoot access problems!”* Bob notes, adding this to his troubleshooting toolkit.

---

##  8. Conclusion: Bob’s System Feels Secure

With his firewall configured, custom rules in place, and monitoring logs set up, Bob feels that his system is now well-protected. He’s confident in AlmaLinux’s `firewalld` and knows he’s taken a big step in securing his network.

> Next, Bob’s ready to learn more about fine-tuning system performance to keep things running smoothly.

*Stay tuned for the next chapter: "Bob Digs into System Performance Tuning!"*
