---
title: How to Set Up and Use SELinux on AlmaLinux
description: This guide walks you through the process of setting up, configuring, and using SELinux on AlmaLinux to secure your system effectively.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SELinux on AlmaLinux
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 30
toc: true
keywords:
  - AlmaLinux
  - SELinux on AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
url: set-selinux-almalinux
---
Security-Enhanced Linux (SELinux) is a mandatory access control (MAC) security mechanism implemented in the Linux kernel. It provides an additional layer of security by enforcing access policies that regulate how processes and users interact with system resources. AlmaLinux, a robust, open-source alternative to CentOS, comes with SELinux enabled by default, but understanding its configuration and management is crucial for optimizing your system's security.

This guide walks you through the process of setting up, configuring, and using SELinux on AlmaLinux to secure your system effectively.

---

### **What Is SELinux and Why Is It Important?**

SELinux enhances security by restricting what actions processes can perform on a system. Unlike traditional discretionary access control (DAC) systems, SELinux applies strict policies that limit potential damage from exploited vulnerabilities. For example, if a web server is compromised, SELinux can prevent it from accessing sensitive files or making unauthorized changes to the system.

**Key Features of SELinux:**

1. **Mandatory Access Control (MAC):** Strict policies dictate access rights.
2. **Confined Processes:** Processes run with the least privilege necessary.
3. **Logging and Auditing:** Monitors unauthorized access attempts.

---

### **Step 1: Check SELinux Status**

Before configuring SELinux, determine its current status using the `sestatus` command:

```bash
sestatus
```

The output will show:

- **SELinux status:** Enabled or disabled.
- **Current mode:** Enforcing, permissive, or disabled.
- **Policy:** The active SELinux policy in use.

---

### **Step 2: Understand SELinux Modes**

SELinux operates in three modes:

1. **Enforcing:** Fully enforces SELinux policies. Unauthorized actions are blocked and logged.
2. **Permissive:** SELinux policies are not enforced but violations are logged. Ideal for testing.
3. **Disabled:** SELinux is completely turned off.

To check the current mode:

```bash
getenforce
```

To switch between modes temporarily:

- Set to permissive:

  ```bash
  sudo setenforce 0
  ```

- Set to enforcing:

  ```bash
  sudo setenforce 1
  ```

---

### **Step 3: Enable or Disable SELinux**

SELinux should always be enabled unless you have a specific reason to disable it. To configure SELinux settings permanently, edit the `/etc/selinux/config` file:

```bash
sudo nano /etc/selinux/config
```

Modify the `SELINUX` directive as needed:

```plaintext
SELINUX=enforcing    # Enforces SELinux policies
SELINUX=permissive   # Logs violations without enforcement
SELINUX=disabled     # Turns off SELinux
```

Save the file and reboot the system to apply changes:

```bash
sudo reboot
```

---

### **Step 4: SELinux Policy Types**

SELinux uses policies to define access rules for various services and processes. The most common policy types are:

- **Targeted:** Only specific processes are confined. This is the default policy in AlmaLinux.
- **MLS (Multi-Level Security):** A more complex policy, typically used in highly sensitive environments.

To view the active policy:

```bash
sestatus
```

---

### **Step 5: Manage File and Directory Contexts**

SELinux assigns security contexts to files and directories to control access. Contexts consist of four attributes:

1. **User:** SELinux user (e.g., `system_u`, `unconfined_u`).
2. **Role:** Defines the role of the user or process.
3. **Type:** Determines how a resource is accessed (e.g., `httpd_sys_content_t` for web server files).
4. **Level:** Used in MLS policies.

To check the context of a file:

```bash
ls -Z /path/to/file
```

#### **Changing SELinux Contexts:**

To change the context of a file or directory, use the `chcon` command:

```bash
sudo chcon -t type /path/to/file
```

For example, to assign the `httpd_sys_content_t` type to a web directory:

```bash
sudo chcon -R -t httpd_sys_content_t /var/www/html
```

---

### **Step 6: Using SELinux Booleans**

SELinux Booleans allow you to toggle specific policy rules on or off without modifying the policy itself. This provides flexibility for administrators to enable or disable features dynamically.

#### **Viewing Booleans:**

To list all SELinux Booleans:

```bash
getsebool -a
```

#### **Modifying Booleans:**

To enable or disable a Boolean temporarily:

```bash
sudo setsebool boolean_name on
sudo setsebool boolean_name off
```

To make changes persistent across reboots:

```bash
sudo setsebool -P boolean_name on
```

Example: Allowing HTTPD to connect to a database:

```bash
sudo setsebool -P httpd_can_network_connect_db on
```

---

### **Step 7: Troubleshooting SELinux Issues**

SELinux logs all violations in the `/var/log/audit/audit.log` file. These logs are invaluable for diagnosing and resolving issues.

#### **Analyzing Logs with `ausearch`:**

The `ausearch` tool simplifies log analysis:

```bash
sudo ausearch -m avc -ts recent
```

#### **Using `sealert`:**

The `sealert` tool, part of the `setroubleshoot-server` package, provides detailed explanations and solutions for SELinux denials:

```bash
sudo yum install setroubleshoot-server
sudo sealert -a /var/log/audit/audit.log
```

---

### **Step 8: Restoring Default Contexts**

If a file or directory has an incorrect context, SELinux may deny access. Restore the default context with the `restorecon` command:

```bash
sudo restorecon -R /path/to/directory
```

---

### **Step 9: SELinux for Common Services**

#### **1. Apache (HTTPD):**

- Ensure web content has the correct type:

  ```bash
  sudo chcon -R -t httpd_sys_content_t /var/www/html
  ```

- Allow HTTPD to listen on non-standard ports:

  ```bash
  sudo semanage port -a -t http_port_t -p tcp 8080
  ```

#### **2. SSH:**

- Restrict SSH access to certain users using SELinux roles.
- Allow SSH to use custom ports:

  ```bash
  sudo semanage port -a -t ssh_port_t -p tcp 2222
  ```

#### **3. NFS:**

- Use the appropriate SELinux type (`nfs_t`) for shared directories:

  ```bash
  sudo chcon -R -t nfs_t /shared/directory
  ```

---

### **Step 10: Disabling SELinux Temporarily**

In rare cases, you may need to disable SELinux temporarily for troubleshooting:

```bash
sudo setenforce 0
```

Remember to revert it back to enforcing mode once the issue is resolved:

```bash
sudo setenforce 1
```

---

### **Conclusion**

SELinux is a powerful tool for securing your AlmaLinux system, but it requires a good understanding of its policies and management techniques. By enabling and configuring SELinux properly, you can significantly enhance your server’s security posture. Use this guide as a starting point to implement SELinux effectively in your environment, and remember to regularly audit and review your SELinux policies to adapt to evolving security needs.
