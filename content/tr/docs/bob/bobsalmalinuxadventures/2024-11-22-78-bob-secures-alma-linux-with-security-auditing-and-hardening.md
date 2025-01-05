---
draft: false
title: Bob Secures AlmaLinux with Security Auditing and Hardening
linkTitle: Security Auditing and Hardening
keywords:
  - Security Auditing and Hardening
description: From identifying vulnerabilities to implementing robust security measures, Bob learned how to perform comprehensive audits and apply hardening techniques.
date: 2024-12-09
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 780
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-secures-almalinux-security-auditing-hardening
---
Bob’s next task was to fortify his AlmaLinux server against potential threats. From identifying vulnerabilities to implementing robust security measures, Bob learned how to perform comprehensive audits and apply hardening techniques.

> *“A secure server is a strong server—time to lock it down!”* Bob said as he began his security journey.

---

### **Chapter Outline: "Bob Secures AlmaLinux with Security Auditing and Hardening"**

1. **Introduction: Why Security Matters**
   - The importance of proactive security.
   - Key areas to audit and harden.

2. **Performing a Security Audit**
   - Using `lynis` for comprehensive system audits.
   - Checking for open ports with `nmap`.

3. **Hardening SSH Access**
   - Configuring key-based authentication.
   - Restricting root login and IP access.

4. **Strengthening File System Security**
   - Setting file permissions and attributes.
   - Mounting file systems with secure options.

5. **Implementing Network Security**
   - Configuring `firewalld` rules.
   - Using fail2ban to block malicious attempts.

6. **Applying SELinux Policies**
   - Enforcing strict policies.
   - Creating custom rules for specific needs.

7. **Automating Security Monitoring**
   - Setting up `auditd` for real-time auditing.
   - Scheduling security scans with cron.

8. **Conclusion: Bob Reflects on Server Security**

---

### **Part 1: Introduction: Why Security Matters**

Bob learned that proactive security measures reduce the risk of unauthorized access, data breaches, and system downtime. By auditing and hardening his server, he could stay ahead of potential threats.

#### **Key Security Areas**

- **Access Control**: Restrict who can log in and what they can do.
- **File System Protection**: Prevent unauthorized access to critical files.
- **Network Security**: Control incoming and outgoing traffic.

> *“A secure server gives me peace of mind!”* Bob said.

---

### **Part 2: Performing a Security Audit**

#### **Step 1: Using `lynis` for System Audits**

- Install `lynis`:

  ```bash
  sudo dnf install -y lynis
  ```

- Run a security audit:

  ```bash
  sudo lynis audit system
  ```

- Review the results for recommendations:

  ```plaintext
  Hardening Index: 72/100
  Suggestions: Disable unused services, configure firewalld.
  ```

#### **Step 2: Checking for Open Ports with `nmap`**

- Install `nmap`:

  ```bash
  sudo dnf install -y nmap
  ```

- Scan for open ports:

  ```bash
  nmap -sS -p- 192.168.1.10
  ```

- Review the output for unexpected services:

  ```plaintext
  PORT    STATE SERVICE
  22/tcp  open  ssh
  80/tcp  open  http
  111/tcp open  rpcbind
  ```

> *“An audit tells me where to focus my hardening efforts!”* Bob said.

---

### **Part 3: Hardening SSH Access**

#### **Step 1: Configuring Key-Based Authentication**

- Generate an SSH key pair:

  ```bash
  ssh-keygen -t rsa -b 4096
  ```

- Copy the public key to the server:

  ```bash
  ssh-copy-id bob@192.168.1.10
  ```

- Test the key-based login:

  ```bash
  ssh bob@192.168.1.10
  ```

#### **Step 2: Restricting Root Login and IP Access**

- Edit the SSH configuration:

  ```bash
  sudo nano /etc/ssh/sshd_config
  ```

- Update these settings:

  ```plaintext
  PermitRootLogin no
  AllowUsers bob
  ```

- Restart SSH:

  ```bash
  sudo systemctl restart sshd
  ```

---

### **Part 4: Strengthening File System Security**

#### **Step 1: Setting Secure Permissions**

- Use `chmod` to secure files:

  ```bash
  sudo chmod 600 /etc/ssh/sshd_config
  sudo chmod 700 /root
  ```

#### **Step 2: Mounting File Systems with Secure Options**

- Add secure mount options in `/etc/fstab`:

  ```plaintext
  /dev/sda1 / ext4 defaults,noexec,nosuid,nodev 0 1
  ```

- Remount the file systems:

  ```bash
  sudo mount -o remount /
  ```

---

### **Part 5: Implementing Network Security**

#### **Step 1: Configuring Firewalld Rules**

- List active rules:

  ```bash
  sudo firewall-cmd --list-all
  ```

- Allow only necessary services:

  ```bash
  sudo firewall-cmd --permanent --add-service=ssh
  sudo firewall-cmd --permanent --add-service=http
  sudo firewall-cmd --reload
  ```

#### **Step 2: Using Fail2ban to Block Malicious IPs**

- Install `fail2ban`:

  ```bash
  sudo dnf install -y fail2ban
  ```

- Enable the SSH jail:

  ```bash
  sudo nano /etc/fail2ban/jail.local
  ```

- Add the following:

  ```plaintext
  [sshd]
  enabled = true
  port = 22
  filter = sshd
  logpath = /var/log/secure
  maxretry = 3
  ```

- Restart Fail2ban:

  ```bash
  sudo systemctl restart fail2ban
  ```

---

### **Part 6: Applying SELinux Policies**

#### **Step 1: Enforcing SELinux**

- Verify SELinux is in enforcing mode:

  ```bash
  sudo setenforce 1
  sestatus
  ```

#### **Step 2: Creating Custom SELinux Rules**

- Use `audit2allow` to create rules for blocked actions:

  ```bash
  sudo grep "denied" /var/log/audit/audit.log | audit2allow -M custom_rule
  sudo semodule -i custom_rule.pp
  ```

---

### **Part 7: Automating Security Monitoring**

#### **Step 1: Setting Up `auditd`**

- Install `auditd`:

  ```bash
  sudo dnf install -y audit
  ```

- Enable and start the service:

  ```bash
  sudo systemctl enable auditd --now
  ```

#### **Step 2: Scheduling Security Scans**

- Add a cron job to run a Lynis audit weekly:

  ```bash
  crontab -e
  ```

- Add the following line:

  ```plaintext
  0 3 * * 0 sudo lynis audit system > /home/bob/lynis-report.txt
  ```

---

### **Conclusion: Bob Reflects on Server Security**

With security audits and hardening measures in place, Bob’s AlmaLinux server was more resilient against attacks. By automating monitoring and applying SELinux policies, he achieved a balance between usability and robust security.

> Next, Bob plans to explore **Linux Backup Strategies with AlmaLinux**, focusing on tools like `rsync`, snapshots, and automated backups.
