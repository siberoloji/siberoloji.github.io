---
title: 
linkTitle: 
description: 
date: 
weight: 1520
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
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
toc: true
keywords:
  - AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
---
# How to Display Auditd Summary Logs with aureport on AlmaLinux  

System administrators rely on robust tools to monitor, secure, and troubleshoot their Linux systems. AlmaLinux, a popular RHEL-based distribution, offers excellent capabilities for audit logging through **auditd**, the Linux Audit daemon. While tools like `ausearch` allow for detailed, event-specific queries, sometimes a higher-level summary of audit logs is more useful for gaining quick insights. This is where **aureport** comes into play.  

In this blog post, we’ll explore how to use **aureport**, a companion utility of auditd, to display summary logs on AlmaLinux. From generating user activity reports to identifying anomalies, we’ll cover everything you need to know to effectively use aureport.

---

### **Understanding auditd and aureport**

#### What is auditd?  

Auditd is the backbone of Linux auditing. It logs system events such as user logins, file accesses, system calls, and privilege escalations. These logs are stored in `/var/log/audit/audit.log` and are invaluable for system monitoring and forensic analysis.  

#### What is aureport?  

Aureport is a reporting tool designed to summarize audit logs. It transforms raw log data into readable summaries, helping administrators identify trends, anomalies, and compliance issues without manually parsing the logs.

---

### **Installing and Configuring auditd on AlmaLinux**

Before using aureport, ensure that auditd is installed, configured, and running on your AlmaLinux system.

#### Step 1: Install auditd  

Auditd may already be installed on AlmaLinux. If not, install it using:  

```bash
sudo dnf install audit
```

#### Step 2: Start and Enable auditd  

Ensure auditd starts automatically and runs continuously:  

```bash
sudo systemctl start auditd
sudo systemctl enable auditd
```

#### Step 3: Verify auditd Status  

Confirm the service is active:  

```bash
sudo systemctl status auditd
```

#### Step 4: Test Logging  

Generate some audit logs to test the setup. For example, create a new user or modify a file, then check the logs in `/var/log/audit/audit.log`.

With auditd configured, you’re ready to use aureport.

---

### **Basic aureport Syntax**  

The basic syntax for aureport is straightforward:  

```bash
aureport [options]
```

Each option specifies a type of summary report, such as user login events or system anomalies. Reports are formatted for readability, making them ideal for system analysis and compliance verification.

---

### **Common aureport Use Cases**

#### 1. **Summary of All Audit Events**  

To get a high-level overview of all audit events, run:  

```bash
aureport
```

This generates a general report that includes various event types and their counts, giving you a snapshot of overall system activity.

---

#### 2. **User Login Report**  

To analyze user login activities, use:  

```bash
aureport -l
```

This report displays details such as:  

- User IDs (UIDs)
- Session IDs
- Login times
- Logout times
- Source IP addresses (for remote logins)

For example:  

```
Event Type  Login UID  Session ID  Login Time        Logout Time       Source
USER_LOGIN   1000      5           12/01/2024 10:00  12/01/2024 12:00  192.168.1.10
```

---

#### 3. **File Access Report**  

To identify files accessed during a specific timeframe:  

```bash
aureport -f
```

This report includes:  

- File paths  
- Event IDs  
- Access types (e.g., read, write, execute)

---

#### 4. **Summary of Failed Events**  

To review failed actions such as unsuccessful logins or unauthorized file accesses, run:  

```bash
aureport --failed
```

This report is particularly useful for spotting security issues, like brute-force login attempts or access violations.

---

#### 5. **Process Execution Report**  

To track processes executed on your system:  

```bash
aureport -p
```

The report displays:  

- Process IDs (PIDs)  
- Command names  
- User IDs associated with the processes  

---

#### 6. **System Call Report**  

To summarize system calls logged by auditd:  

```bash
aureport -s
```

This report is helpful for debugging and identifying potentially malicious activity.

---

#### 7. **Custom Timeframe Reports**  

By default, aureport processes the entire log file. To restrict it to a specific timeframe, use the `--start` and `--end` options. For example:  

```bash
aureport -l --start 12/01/2024 10:00:00 --end 12/01/2024 12:00:00
```

---

### **Generating Reports in CSV Format**  

To save reports for external analysis or documentation, you can generate them in CSV format using the `-x` option. For example:  

```bash
aureport -l -x > login_report.csv
```

The CSV format allows for easy import into spreadsheets or log analysis tools.

---

### **Advanced aureport Techniques**

#### Combining aureport with Other Tools  

You can combine aureport with other command-line tools to refine or extend its functionality. For example:  

1. **Filtering Output**: Use `grep` to filter specific keywords:  

   ```bash
   aureport -l | grep "FAILED"
   ```

2. **Chaining with ausearch**: After identifying a suspicious event in aureport, use `ausearch` for a deeper investigation. For instance, to find details of a failed login event:  

   ```bash
   aureport --failed | grep "FAILED_LOGIN"
   ausearch -m USER_LOGIN --success no
   ```

---

### **Best Practices for Using aureport on AlmaLinux**

1. **Run Regular Reports**  
Incorporate aureport into your system monitoring routine. Automated scripts can generate and email reports daily or weekly, keeping you informed of system activity.

2. **Integrate with SIEM Tools**  
If your organization uses Security Information and Event Management (SIEM) tools, export aureport data to these platforms for centralized monitoring.

3. **Focus on Failed Events**  
Prioritize the review of failed events to identify potential security breaches, misconfigurations, or unauthorized attempts.

4. **Rotate Audit Logs**  
Configure auditd to rotate logs automatically to prevent disk space issues. Update `/etc/audit/auditd.conf` to manage log size and retention policies.

5. **Secure Audit Files**  
Ensure audit logs and reports are only accessible by authorized personnel. Use file permissions and encryption to protect sensitive data.

---

### **Troubleshooting Tips**

1. **Empty Reports**:  
   If aureport returns no data, ensure auditd is running and has generated logs. Also, verify that `/var/log/audit/audit.log` contains data.  

2. **Time Misalignment**:  
   If reports don’t cover expected events, check the system time and timezone settings. Logs use system time for timestamps.  

3. **High Log Volume**:  
   If logs grow too large, optimize audit rules to focus on critical events. Use keys and filters to avoid unnecessary logging.

---

### **Conclusion**

Aureport is a powerful tool for summarizing and analyzing audit logs on AlmaLinux. By generating high-level summaries, it allows administrators to quickly identify trends, investigate anomalies, and ensure compliance with security policies. Whether you’re monitoring user logins, file accesses, or failed actions, aureport simplifies the task with its flexible reporting capabilities.

By incorporating aureport into your system monitoring and security routines, you can enhance visibility into your AlmaLinux systems and stay ahead of potential threats.  

Are you ready to dive deeper into advanced auditd configurations or automate aureport reporting? Let’s discuss how you can take your audit log management to the next level!
