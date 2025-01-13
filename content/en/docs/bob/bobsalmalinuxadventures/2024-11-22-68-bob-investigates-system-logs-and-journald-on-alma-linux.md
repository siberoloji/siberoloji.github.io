---
draft: false
title: Bob Investigates System Logs and journald on AlmaLinux
linkTitle: System Logs and journald
keywords:
  - System Logs and journald
description: Bo knew logs were a vital tool for troubleshooting and auditing, and mastering them would make him a more effective administrator.
date: 2024-11-25T06:32:36.001Z
url: bob-investigates-system-logs-journald-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 680
featured_image: /images/bobs-adventures-with-alma-linux.png
---
After mastering Systemd, Bob turned his attention to **system logs**. He knew logs were a vital tool for troubleshooting and auditing, and mastering them would make him a more effective administrator.

> *“If the server talks, I better learn to listen!”* Bob said, as he prepared to dive into the world of logs and journald.

---

### **Chapter Outline: "Bob Investigates System Logs and journald"**

1. **Introduction: Why Logs Matter**
   - Importance of logs for troubleshooting and auditing.
   - Overview of traditional logging and journald.

2. **Understanding journald**
   - What is journald?
   - Key features and benefits.

3. **Exploring Logs with journalctl**
   - Basic commands for viewing logs.
   - Filtering logs by service, priority, and time.
   - Exporting logs for analysis.

4. **Configuring journald**
   - Customizing journald settings.
   - Setting log retention policies.

5. **Working with rsyslog**
   - Overview of rsyslog alongside journald.
   - Sending logs to a remote server.

6. **Common Log Locations on AlmaLinux**
   - Important directories and files.
   - What to look for in logs.

7. **Conclusion: Bob Reflects on His Log Mastery**

---

### **Part 1: Introduction: Why Logs Matter**

Bob learned that logs are the digital footprints of everything happening on a server. From kernel events to application errors, logs help administrators identify and resolve issues.

#### **Types of Logs**

- **System Logs**: Events related to the operating system (e.g., `auth.log` for authentication).
- **Service Logs**: Logs from individual services like Apache or SSH.
- **Application Logs**: Logs specific to custom applications.

> *“Logs tell the story of my server—time to decode it!”* Bob said.

---

### **Part 2: Understanding journald**

Bob discovered that **journald**, a logging system integrated with Systemd, simplifies log management by centralizing log storage and providing powerful querying tools.

#### **Key Features of journald**

1. **Centralized Logging**: All logs are stored in a single binary format.
2. **Powerful Filtering**: Allows querying logs by time, priority, and service.
3. **Persistence Options**: Logs can be stored in memory or on disk.

---

### **Part 3: Exploring Logs with journalctl**

Bob experimented with `journalctl`, the primary tool for querying journald logs.

#### **Step 1: Viewing All Logs**

- Display all logs:

  ```bash
  sudo journalctl
  ```

- Scroll through logs using arrow keys or `q` to quit.

#### **Step 2: Filtering Logs by Service**

- View logs for a specific service, such as Apache:

  ```bash
  sudo journalctl -u httpd
  ```

- Limit to the last 20 lines:

  ```bash
  sudo journalctl -u httpd -n 20
  ```

#### **Step 3: Filtering Logs by Priority**

Bob learned that logs are categorized by priority levels (e.g., `emergency`, `alert`, `critical`).

- View only critical errors:

  ```bash
  sudo journalctl --priority=crit
  ```

#### **Step 4: Filtering Logs by Time**

- View logs from the last hour:

  ```bash
  sudo journalctl --since "1 hour ago"
  ```

- View logs from a specific date:

  ```bash
  sudo journalctl --since "2024-11-01 12:00:00"
  ```

#### **Step 5: Exporting Logs**

Bob exported logs to a file for sharing or offline analysis:

```bash
sudo journalctl > /home/bob/system-logs.txt
```

> *“With journalctl, I can find exactly what I need in seconds!”* Bob said.

---

### **Part 4: Configuring journald**

Bob wanted to optimize journald for his server.

#### **Step 1: Editing journald Configuration**

- Open the configuration file:

  ```bash
  sudo nano /etc/systemd/journald.conf
  ```

- Key settings:
  - **Log retention**: Set logs to persist on disk:

    ```plaintext
    Storage=persistent
    ```

  - **Maximum size**: Limit disk space used by logs:

    ```plaintext
    SystemMaxUse=500M
    ```

- Restart journald to apply changes:

  ```bash
  sudo systemctl restart systemd-journald
  ```

> *“Now my logs are optimized for performance and storage!”* Bob said.

---

### **Part 5: Working with rsyslog**

Bob learned that **rsyslog** complements journald by enabling advanced logging features like sending logs to a remote server.

#### **Step 1: Installing rsyslog**

- Install rsyslog:

  ```bash
  sudo dnf install -y rsyslog
  ```

- Enable and start the service:

  ```bash
  sudo systemctl enable rsyslog --now
  ```

#### **Step 2: Configuring Remote Logging**

Bob configured rsyslog to forward logs to a central logging server.

- Open the rsyslog configuration file:

  ```bash
  sudo nano /etc/rsyslog.conf
  ```

- Add a line to forward logs to a remote server:

  ```plaintext
  *.* @192.168.1.20:514
  ```

- Restart rsyslog:

  ```bash
  sudo systemctl restart rsyslog
  ```

> *“With remote logging, I can centralize logs for all my servers!”* Bob said.

---

### **Part 6: Common Log Locations on AlmaLinux**

Bob explored the traditional log files stored in `/var/log`:

#### **Key Log Files**

- **Authentication Logs**: `/var/log/secure`
  - Tracks SSH logins and authentication attempts.
- **System Messages**: `/var/log/messages`
  - Contains general system logs.
- **Kernel Logs**: `/var/log/dmesg`
  - Records kernel events during boot and runtime.
- **Apache Logs**: `/var/log/httpd/access_log` and `/var/log/httpd/error_log`
  - Logs web server access and errors.

#### **Analyzing Logs with Command-Line Tools**

- Search for specific events using `grep`:

  ```bash
  grep "Failed password" /var/log/secure
  ```

- Monitor logs in real time with `tail`:

  ```bash
  tail -f /var/log/messages
  ```

> *“Traditional log files still have their place—good to know both journald and rsyslog!”* Bob said.

---

### **Conclusion: Bob Reflects on His Log Mastery**

Bob now understood how to manage and analyze logs using journald, rsyslog, and traditional files. This knowledge made him confident in his ability to troubleshoot issues and monitor server health effectively.

> Next, Bob plans to explore **Linux File System Types and Management** on AlmaLinux.
