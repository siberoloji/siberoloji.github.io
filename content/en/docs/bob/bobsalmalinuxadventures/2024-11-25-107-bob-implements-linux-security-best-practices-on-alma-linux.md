---
draft: false
title: Bob Implements Linux Security Best Practices on AlmaLinux
linkTitle: Linux Security Best Practices
keywords:
  - Linux Security
description: Secure Linux systems by following best practices for system security.
date: 2024-12-12
url: bob-implements-linux-security-practices-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 1070


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure was to secure his Linux systems by following **best practices for system security**. With growing threats and vulnerabilities, he aimed to strengthen AlmaLinux against unauthorized access, malware, and data breaches.

> *“A secure system is a reliable system—time to lock it down!”* Bob said, determined to ensure maximum protection.

---

### **Chapter Outline: "Bob Implements Linux Security Best Practices"**

1. **Introduction: Why Security Best Practices Matter**
   - The importance of securing Linux systems.
   - Overview of common threats and vulnerabilities.

2. **Securing User Accounts and Authentication**
   - Enforcing password policies.
   - Setting up multi-factor authentication (MFA).

3. **Hardening the System**
   - Disabling unused services and ports.
   - Implementing SELinux and AppArmor.

4. **Protecting Network Communications**
   - Configuring firewalls with `firewalld`.
   - Using SSH securely with key-based authentication.

5. **Monitoring and Logging**
   - Using `auditd` for system auditing.
   - Analyzing logs with tools like Logwatch and Grafana.

6. **Keeping the System Updated**
   - Automating updates and patch management.
   - Monitoring for vulnerabilities with OpenSCAP.

7. **Conclusion: Bob Reflects on Security Mastery**

---

### **Part 1: Why Security Best Practices Matter**

Bob learned that **Linux security** involves multiple layers of protection to defend against evolving threats like unauthorized access, malware, and data theft.

#### **Common Threats**

- Weak or reused passwords.
- Unpatched software vulnerabilities.
- Unsecured network connections.

> *“Security is a continuous process—not a one-time setup!”* Bob noted.

---

### **Part 2: Securing User Accounts and Authentication**

#### **Step 1: Enforcing Password Policies**

- Configure password complexity:

  ```bash
  sudo nano /etc/security/pwquality.conf
  ```

  Add:

  ```plaintext
  minlen = 12
  dcredit = -1
  ucredit = -1
  ocredit = -1
  lcredit = -1
  ```

- Set password expiration policies:

  ```bash
  sudo nano /etc/login.defs
  ```

  Update:

  ```plaintext
  PASS_MAX_DAYS   90
  PASS_MIN_DAYS   1
  PASS_WARN_AGE   7
  ```

#### **Step 2: Setting Up Multi-Factor Authentication**

- Install MFA tools:

  ```bash
  sudo dnf install -y google-authenticator
  ```

- Configure MFA for SSH:

  ```bash
  google-authenticator
  sudo nano /etc/ssh/sshd_config
  ```

  Add:

  ```plaintext
  AuthenticationMethods publickey,keyboard-interactive
  ```

- Restart SSH:

  ```bash
  sudo systemctl restart sshd
  ```

> *“Strong passwords and MFA significantly enhance account security!”* Bob said.

---

### **Part 3: Hardening the System**

#### **Step 1: Disabling Unused Services**

- List and stop unnecessary services:

  ```bash
  sudo systemctl list-unit-files --type=service
  sudo systemctl disable cups
  ```

- Close unused ports:

  ```bash
  sudo firewall-cmd --remove-service=samba --permanent
  sudo firewall-cmd --reload
  ```

#### **Step 2: Implementing SELinux**

- Enable SELinux:

  ```bash
  sudo setenforce 1
  ```

- Check SELinux status:

  ```bash
  sestatus
  ```

- Configure SELinux policies:

  ```bash
  sudo semanage permissive -a httpd_t
  ```

> *“Disabling unused features reduces the system’s attack surface!”* Bob noted.

---

### **Part 4: Protecting Network Communications**

#### **Step 1: Configuring Firewalls**

- Enable and configure `firewalld`:

  ```bash
  sudo systemctl enable firewalld --now
  sudo firewall-cmd --add-service=ssh --permanent
  sudo firewall-cmd --reload
  ```

#### **Step 2: Securing SSH**

- Disable root login:

  ```bash
  sudo nano /etc/ssh/sshd_config
  ```

  Update:

  ```plaintext
  PermitRootLogin no
  ```

- Use key-based authentication:

  ```bash
  ssh-keygen -t rsa -b 4096
  ssh-copy-id user@remote-server
  ```

> *“A properly configured firewall and SSH setup are essential for secure communication!”* Bob said.

---

### **Part 5: Monitoring and Logging**

#### **Step 1: Using `auditd` for System Auditing**

- Install and enable `auditd`:

  ```bash
  sudo dnf install -y audit audit-libs
  sudo systemctl enable auditd --now
  ```

- Add rules to monitor changes:

  ```bash
  sudo nano /etc/audit/audit.rules
  ```

  Add:

  ```plaintext
  -w /etc/passwd -p wa -k user_changes
  -w /var/log/secure -p wa -k login_attempts
  ```

#### **Step 2: Analyzing Logs**

- Install and configure Logwatch:

  ```bash
  sudo dnf install -y logwatch
  sudo logwatch --detail High --service sshd --range today
  ```

- Visualize logs with Grafana:

  ```bash
  sudo grafana-cli plugins install grafana-piechart-panel
  sudo systemctl restart grafana-server
  ```

> *“Auditing and monitoring help detect potential security issues early!”* Bob noted.

---

### **Part 6: Keeping the System Updated**

#### **Step 1: Automating Updates**

- Enable automatic updates:

  ```bash
  sudo dnf install -y dnf-automatic
  sudo systemctl enable dnf-automatic.timer --now
  ```

#### **Step 2: Monitoring Vulnerabilities with OpenSCAP**

- Install OpenSCAP:

  ```bash
  sudo dnf install -y openscap-scanner scap-security-guide
  ```

- Perform a security scan:

  ```bash
  sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

> *“Regular updates and vulnerability scans keep the system secure!”* Bob said.

---

### **Conclusion: Bob Reflects on Security Mastery**

Bob successfully implemented Linux security best practices on AlmaLinux, including securing accounts, hardening the system, protecting network communications, and setting up robust monitoring and update mechanisms. With these measures in place, he was confident his systems were well-protected against threats.

> Next, Bob plans to explore **Linux Performance Tuning**, optimizing systems for speed and efficiency.
