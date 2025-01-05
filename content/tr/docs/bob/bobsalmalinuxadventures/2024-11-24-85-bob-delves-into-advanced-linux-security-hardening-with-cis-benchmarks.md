---
draft: false
title: Bob Delves into Advanced Linux Security Hardening with CIS Benchmarks
linkTitle: Advanced Linux Security Hardening
keywords:
  - Advanced Linux Security Hardening
description: Bob’s next challenge was to implement advanced security hardening on AlmaLinux using the CIS Benchmarks
date: 2024-12-09
url: bob-delves-advanced-linux-security-hardening-cis-benchmarks
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 850
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to implement **advanced security hardening** on AlmaLinux using the **CIS (Center for Internet Security) Benchmarks**. These benchmarks provide detailed recommendations to secure Linux systems against modern threats while maintaining usability.

> *“A hardened server is a fortress—time to make mine impenetrable!”* Bob declared, diving into the CIS recommendations.

---

### **Chapter Outline: "Bob Delves into Advanced Linux Security Hardening with CIS Benchmarks"**

1. **Introduction: What Are CIS Benchmarks?**
   - Overview of CIS benchmarks.
   - Why they matter for Linux security.

2. **Installing Tools for Security Hardening**
   - Setting up OpenSCAP and SCAP Security Guide (SSG).
   - Understanding the CIS AlmaLinux profile.

3. **Applying CIS Benchmarks**
   - Reviewing and implementing key CIS recommendations.
   - Automating compliance checks with OpenSCAP.

4. **Customizing Hardening Policies**
   - Editing security profiles for specific needs.
   - Managing exceptions and overrides.

5. **Monitoring and Maintaining Compliance**
   - Running periodic scans with OpenSCAP.
   - Keeping systems updated and secure.

6. **Conclusion: Bob Reflects on Security Hardening Mastery**

---

### **Part 1: Introduction: What Are CIS Benchmarks?**

Bob learned that **CIS Benchmarks** are a set of best practices for securing IT systems. They cover a wide range of areas, including user management, file permissions, and network configurations.

#### **Why Use CIS Benchmarks?**

- **Comprehensive**: Covers every aspect of system security.
- **Actionable**: Provides step-by-step implementation guidelines.
- **Standardized**: Recognized by security experts and compliance frameworks.

> *“CIS Benchmarks are like a recipe for a secure server!”* Bob said.

---

### **Part 2: Installing Tools for Security Hardening**

#### **Step 1: Installing OpenSCAP**

- Install OpenSCAP, a tool for auditing and applying security baselines:

  ```bash
  sudo dnf install -y openscap-scanner scap-security-guide
  ```

#### **Step 2: Checking the Available Security Profiles**

- List available security profiles for AlmaLinux:

  ```bash
  oscap info /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

#### **Step 3: Selecting the CIS Profile**

- Identify the CIS Level 1 profile:

  ```plaintext
  Title: CIS AlmaLinux 8 Level 1 - Server
  ```

> *“The tools are ready—let’s harden this system!”* Bob said.

---

### **Part 3: Applying CIS Benchmarks**

#### **Step 1: Running an Initial Scan**

- Perform a compliance scan against the CIS profile:

  ```bash
  sudo oscap xccdf eval \
    --profile xccdf_org.ssgproject.content_profile_cis_server_l1 \
    --results results.xml \
    /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

- Review the results:

  ```bash
  sudo less results.xml
  ```

#### **Step 2: Addressing Key Recommendations**

Bob focused on implementing high-priority fixes from the scan:

1. **Disable Root Login via SSH**:
   - Edit the SSH configuration file:

     ```bash
     sudo nano /etc/ssh/sshd_config
     ```

   - Set:

     ```plaintext
     PermitRootLogin no
     ```

   - Restart SSH:

     ```bash
     sudo systemctl restart sshd
     ```

2. **Set Password Aging Policies**:
   - Configure aging rules in `/etc/login.defs`:

     ```plaintext
     PASS_MAX_DAYS 90
     PASS_MIN_DAYS 7
     PASS_WARN_AGE 14
     ```

3. **Restrict File Permissions**:
   - Fix file permissions for critical directories:

     ```bash
     sudo chmod 700 /root
     sudo chmod 600 /etc/shadow
     ```

4. **Enable Firewall**:
   - Start and enable `firewalld`:

     ```bash
     sudo systemctl enable firewalld --now
     ```

5. **Disable Unused Services**:
   - List active services:

     ```bash
     sudo systemctl list-unit-files --type=service
     ```

   - Disable unnecessary ones:

     ```bash
     sudo systemctl disable cups
     ```

> *“Step by step, my server is becoming bulletproof!”* Bob said.

---

### **Part 4: Customizing Hardening Policies**

#### **Step 1: Editing Security Profiles**

Bob adjusted the security profile to meet specific business needs:

- Open the profile file:

  ```bash
  sudo nano /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

- Modify rules to fit requirements, e.g., relaxing password length for specific users.

#### **Step 2: Managing Exceptions**

- Use OpenSCAP to skip certain rules:

  ```bash
  sudo oscap xccdf eval \
    --profile xccdf_org.ssgproject.content_profile_cis_server_l1 \
    --skip-rule xccdf_org.ssgproject.content_rule_password_pam_minlen \
    --results results.xml \
    /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

> *“Customizing benchmarks ensures security doesn’t clash with usability!”* Bob noted.

---

### **Part 5: Monitoring and Maintaining Compliance**

#### **Step 1: Automating Periodic Scans**

Bob scheduled regular compliance scans:

- Create a cron job:

  ```bash
  crontab -e
  ```

- Add the following:

  ```plaintext
  0 2 * * 0 sudo oscap xccdf eval \
  --profile xccdf_org.ssgproject.content_profile_cis_server_l1 \
  --results /home/bob/scap-results-$(date +\%Y\%m\%d).xml \
  /usr/share/xml/scap/ssg/content/ssg-almalinux.xml
  ```

#### **Step 2: Keeping Systems Updated**

- Configure automatic updates:

  ```bash
  sudo dnf install -y dnf-automatic
  sudo systemctl enable dnf-automatic.timer --now
  ```

> *“Regular audits and updates keep threats at bay!”* Bob said.

---

### **Conclusion: Bob Reflects on Security Hardening Mastery**

By implementing CIS benchmarks, customizing policies, and automating compliance checks, Bob achieved a robust security posture on his AlmaLinux server. He felt confident his system could withstand even sophisticated attacks.

> Next, Bob plans to explore **AlmaLinux for AI/ML Workloads** to see how the platform performs with data-heavy applications.

