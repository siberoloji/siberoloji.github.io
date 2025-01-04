---
draft: false
title: Systemd Understanding Units and Services on AlmaLinux
linkTitle: Understanding Units and Services
keywords:
  - Units and Services
description: As a junior sysadmin, he realized that understanding Systemd was crucial for managing services, troubleshooting boot issues, and creating custom workflows.
date: 2024-11-25
url: systemd-understanding-units-services-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 670
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next task was to master **Systemd**, the default service manager on AlmaLinux. As a junior sysadmin, he realized that understanding Systemd was crucial for managing services, troubleshooting boot issues, and creating custom workflows.

> *“If I can control Systemd, I can control my system!”* Bob declared, ready to take on this essential skill.

---

### **Chapter Outline: "Bob’s Adventures with Systemd"**

1. **Introduction: What Is Systemd?**
   - Overview of Systemd and its role in Linux.
   - Understanding units, targets, and dependencies.

2. **Managing Services with Systemctl**
   - Starting, stopping, and restarting services.
   - Checking the status of services.
   - Enabling and disabling services at boot.

3. **Exploring Systemd Logs with Journalctl**
   - Viewing logs for specific services.
   - Filtering logs by time or priority.
   - Troubleshooting boot issues with `journalctl`.

4. **Understanding Unit Files**
   - Anatomy of a unit file.
   - Editing and overriding unit files.

5. **Creating Custom Service Files**
   - Writing a custom Systemd service.
   - Managing dependencies and restart policies.

6. **Using Targets to Control System States**
   - Understanding default, multi-user, and graphical targets.
   - Switching targets and troubleshooting startup issues.

7. **Conclusion: Bob Reflects on His Systemd Mastery**

---

### **Part 1: Introduction: What Is Systemd?**

Bob discovered that Systemd is not just a service manager but a complete system and session manager. It controls how services start, stop, and interact with each other during boot and runtime.

#### **Key Concepts**

- **Units**: The building blocks of Systemd. Each service, mount, or timer is represented as a unit (e.g., `httpd.service` for Apache).
- **Targets**: Groups of units that define system states (e.g., `multi-user.target` for a non-graphical interface).
- **Dependencies**: Define how units rely on or interact with each other.

> *“Units, targets, dependencies—it’s all starting to make sense!”* Bob said.

---

### **Part 2: Managing Services with Systemctl**

Bob began experimenting with Systemd’s `systemctl` command to manage services.

#### **Step 1: Checking the Status of a Service**

- To check if Apache (`httpd.service`) was running:

  ```bash
  sudo systemctl status httpd
  ```

#### **Step 2: Starting, Stopping, and Restarting Services**

- Start the Apache service:

  ```bash
  sudo systemctl start httpd
  ```

- Stop the service:

  ```bash
  sudo systemctl stop httpd
  ```

- Restart the service:

  ```bash
  sudo systemctl restart httpd
  ```

#### **Step 3: Enabling and Disabling Services at Boot**

- Enable Apache to start at boot:

  ```bash
  sudo systemctl enable httpd
  ```

- Disable it:

  ```bash
  sudo systemctl disable httpd
  ```

Bob also confirmed which services were enabled:

```bash
sudo systemctl list-unit-files --type=service --state=enabled
```

> *“Systemctl makes managing services easy and intuitive!”* Bob noted.

---

### **Part 3: Exploring Systemd Logs with Journalctl**

Bob learned that Systemd logs all events using `journalctl`, a powerful tool for debugging.

#### **Step 1: Viewing Logs for a Specific Service**

- View logs for Apache:

  ```bash
  sudo journalctl -u httpd
  ```

- Show only the last 20 lines:

  ```bash
  sudo journalctl -u httpd -n 20
  ```

#### **Step 2: Filtering Logs by Time**

- View logs from the last hour:

  ```bash
  sudo journalctl --since "1 hour ago"
  ```

- View logs from a specific boot session:

  ```bash
  sudo journalctl --boot
  ```

#### **Step 3: Debugging Boot Issues**

Bob viewed logs from the last system boot to diagnose startup problems:

```bash
sudo journalctl --priority=emergency --boot
```

> *“With journalctl, I can trace every hiccup!”* Bob said.

---

### **Part 4: Understanding Unit Files**

Bob realized that unit files define how Systemd manages services.

#### **Step 1: Viewing Unit Files**

- To see the unit file for Apache:

  ```bash
  sudo systemctl cat httpd
  ```

- Unit files are typically located in `/etc/systemd/system/` or `/lib/systemd/system/`.

#### **Step 2: Anatomy of a Unit File**

Bob explored the main sections of a unit file:

- `[Unit]`: Metadata and dependencies.

  ```plaintext
  Description=The Apache HTTP Server
  After=network.target
  ```

- `[Service]`: How the service runs.

  ```plaintext
  ExecStart=/usr/sbin/httpd -DFOREGROUND
  Restart=always
  ```

- `[Install]`: Configurations for enabling the service.

  ```plaintext
  WantedBy=multi-user.target
  ```

---

### **Part 5: Creating Custom Service Files**

#### **Step 1: Writing a Custom Service File**

Bob created a simple service to run a Python script.

- Create a new unit file:

  ```bash
  sudo nano /etc/systemd/system/myscript.service
  ```

- Add the following content:

  ```plaintext
  [Unit]
  Description=My Custom Script
  After=network.target

  [Service]
  ExecStart=/usr/bin/python3 /home/bob/myscript.py
  Restart=on-failure

  [Install]
  WantedBy=multi-user.target
  ```

#### **Step 2: Enabling and Testing the Service**

- Reload Systemd to recognize the new service:

  ```bash
  sudo systemctl daemon-reload
  ```

- Start the service:

  ```bash
  sudo systemctl start myscript
  ```

- Enable it to start at boot:

  ```bash
  sudo systemctl enable myscript
  ```

> *“I can automate anything with custom services!”* Bob said.

---

### **Part 6: Using Targets to Control System States**

Bob explored Systemd targets to manage system states.

#### **Step 1: Viewing Available Targets**

- List all targets:

  ```bash
  sudo systemctl list-units --type=target
  ```

- The most common targets:
  - `multi-user.target`: Non-graphical mode.
  - `graphical.target`: Graphical mode.

#### **Step 2: Switching Targets**

- Switch to multi-user (CLI only):

  ```bash
  sudo systemctl isolate multi-user.target
  ```

- Switch back to graphical mode:

  ```bash
  sudo systemctl isolate graphical.target
  ```

> *“Targets help me control the system’s behavior at a high level!”* Bob noted.

---

### **Conclusion: Bob Reflects on His Systemd Mastery**

Bob felt empowered by his Systemd knowledge. He could now manage services, debug issues, and even create custom workflows. With these skills, he was ready to tackle any system administration challenge.

> Next, Bob plans to dive into **Log Files and journald** on AlmaLinux.
