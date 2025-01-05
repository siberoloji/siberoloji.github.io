---
title: 
linkTitle: 
description: 
date: 
weight: 1530
slug: 
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: 
next: 
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
---
# How to Add Audit Rules for Auditd on AlmaLinux  

System administrators and security professionals often face the challenge of monitoring critical activities on their Linux systems. **Auditd**, the Linux Audit daemon, is a vital tool that logs system events, making it invaluable for compliance, security, and troubleshooting. A core feature of auditd is its ability to enforce **audit rules**, which specify what activities should be monitored on a system.  

In this blog post, we’ll explore how to add audit rules for auditd on AlmaLinux. From setting up auditd to defining custom rules, you’ll learn how to harness auditd’s power to keep your system secure and compliant.

---

### **What Are Audit Rules?**

Audit rules are configurations that instruct auditd on what system events to track. These events can include:  

- File accesses (read, write, execute, etc.).  
- Process executions.  
- Privilege escalations.  
- System calls.  
- Login attempts.  

Audit rules can be temporary (active until reboot) or permanent (persist across reboots). Understanding and applying the right rules is crucial for efficient system auditing.  

---

### **Getting Started with auditd**

Before configuring audit rules, ensure auditd is installed and running on your AlmaLinux system.

#### Step 1: Install auditd  

Auditd is typically pre-installed. If it’s missing, install it using:  

```bash
sudo dnf install audit
```

#### Step 2: Start and Enable auditd  

Start the audit daemon and ensure it runs automatically at boot:  

```bash
sudo systemctl start auditd
sudo systemctl enable auditd
```

#### Step 3: Verify Status  

Check if auditd is active:  

```bash
sudo systemctl status auditd
```

#### Step 4: Test Logging  

Generate a test log entry by creating a file or modifying a system file. Then check `/var/log/audit/audit.log` for corresponding entries.

---

### **Types of Audit Rules**

Audit rules are broadly classified into the following categories:  

1. **Control Rules**  
   Define global settings, such as buffer size or failure handling.  

2. **File or Directory Rules**  
   Monitor access or changes to specific files or directories.  

3. **System Call Rules**  
   Track specific system calls, often used to monitor kernel interactions.  

4. **User Rules**  
   Monitor actions of specific users or groups.  

---

### **Adding Temporary Audit Rules**

Temporary rules are useful for testing or short-term monitoring needs. These rules are added using the `auditctl` command and remain active until the system reboots.  

#### Example 1: Monitor File Access  

To monitor all access to `/etc/passwd`, run:  

```bash
sudo auditctl -w /etc/passwd -p rwxa -k passwd_monitor
```

Explanation:  

- `-w /etc/passwd`: Watch the `/etc/passwd` file.  
- `-p rwxa`: Monitor read (r), write (w), execute (x), and attribute (a) changes.  
- `-k passwd_monitor`: Add a key (`passwd_monitor`) for easy identification in logs.  

---

#### Example 2: Monitor Directory Changes  

To track modifications in the `/var/log` directory:  

```bash
sudo auditctl -w /var/log -p wa -k log_monitor
```

---

#### Example 3: Monitor System Calls  

To monitor the `chmod` system call, which changes file permissions:  

```bash
sudo auditctl -a always,exit -F arch=b64 -S chmod -k chmod_monitor
```

Explanation:  

- `-a always,exit`: Log all instances of the event.  
- `-F arch=b64`: Specify the architecture (64-bit in this case).  
- `-S chmod`: Monitor the `chmod` system call.  
- `-k chmod_monitor`: Add a key for identification.

---

### **Making Audit Rules Permanent**

Temporary rules are cleared after a reboot. To make audit rules persistent, you need to add them to the audit rules file.  

#### Step 1: Edit the Rules File  

Open the `/etc/audit/rules.d/audit.rules` file for editing:  

```bash
sudo nano /etc/audit/rules.d/audit.rules
```

#### Step 2: Add Rules  

Enter your audit rules in the file. For example:  

```plaintext
# Monitor /etc/passwd for all access types
-w /etc/passwd -p rwxa -k passwd_monitor

# Monitor the /var/log directory for writes and attribute changes
-w /var/log -p wa -k log_monitor

# Monitor chmod system call
-a always,exit -F arch=b64 -S chmod -k chmod_monitor
```

#### Step 3: Save and Exit  

Save the file and exit the editor.

#### Step 4: Restart auditd  

Apply the rules by restarting auditd:  

```bash
sudo systemctl restart auditd
```

---

### **Viewing Audit Logs for Rules**

Once audit rules are in place, their corresponding logs will appear in `/var/log/audit/audit.log`. Use the `ausearch` utility to query these logs.  

#### Example 1: Search by Key  

To find logs related to the `passwd_monitor` rule:  

```bash
sudo ausearch -k passwd_monitor
```

#### Example 2: Search by Time  

To view logs generated within a specific timeframe:  

```bash
sudo ausearch -ts 12/01/2024 10:00:00 -te 12/01/2024 12:00:00
```

---

### **Advanced Audit Rule Examples**

#### 1. Monitor User Logins  

To monitor login attempts by all users:  

```bash
sudo auditctl -a always,exit -F arch=b64 -S execve -F uid>=1000 -k user_logins
```

#### 2. Track Privileged Commands  

To monitor execution of commands run with `sudo`:  

```bash
sudo auditctl -a always,exit -F arch=b64 -S execve -C uid=0 -k sudo_commands
```

#### 3. Detect Unauthorized File Access  

Monitor unauthorized access to sensitive files:  

```bash
sudo auditctl -a always,exit -F path=/etc/shadow -F perm=rw -F auid!=0 -k unauthorized_access
```

---

### **Best Practices for Audit Rules**

1. **Focus on Critical Areas**  
   Avoid overloading your system with excessive rules. Focus on monitoring critical files, directories, and activities.  

2. **Use Meaningful Keys**  
   Assign descriptive keys to your rules to simplify log searches and analysis.  

3. **Test Rules**  
   Test new rules to ensure they work as expected and don’t generate excessive logs.  

4. **Rotate Logs**  
   Configure log rotation in `/etc/audit/auditd.conf` to prevent log files from consuming too much disk space.  

5. **Secure Logs**  
   Restrict access to audit logs to prevent tampering or unauthorized viewing.  

---

### **Troubleshooting Audit Rules**

1. **Rules Not Applying**  
   If a rule doesn’t seem to work, verify syntax in the rules file and check for typos.  

2. **High Log Volume**  
   Excessive logs can indicate overly broad rules. Refine rules to target specific activities.  

3. **Missing Logs**  
   If expected logs aren’t generated, ensure auditd is running, and the rules file is correctly configured.

---

### **Conclusion**

Audit rules are a cornerstone of effective system monitoring and security on AlmaLinux. By customizing rules with auditd, you can track critical system activities, ensure compliance, and respond quickly to potential threats.  

Start by adding basic rules for file and user activity, and gradually expand to include advanced monitoring as needed. With careful planning and regular review, your audit rules will become a powerful tool in maintaining system integrity.  

Do you need guidance on specific audit rules or integrating audit logs into your security workflows? Let us know, and we’ll help you enhance your audit strategy!
