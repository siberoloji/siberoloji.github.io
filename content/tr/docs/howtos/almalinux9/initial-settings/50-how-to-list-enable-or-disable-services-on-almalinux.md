---
title: How to List, Enable, or Disable Services on AlmaLinux
description: This guide walks you through listing, enabling, disabling, and managing services on AlmaLinux.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
  - systemd
categories:
  - Linux
  - Linux How-to
linkTitle: Services on AlmaLinux
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 50
toc: true
keywords:
  - AlmaLinux
  - services on almalinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/almalinux.webp
url: list-enable-disable-services-almalinux
---
When managing a server running AlmaLinux, understanding how to manage system services is crucial. Services are the backbone of server functionality, running everything from web servers and databases to networking tools. AlmaLinux, being an RHEL-based distribution, utilizes **systemd** for managing these services. This guide walks you through listing, enabling, disabling, and managing services effectively on AlmaLinux.

---

### What Are Services in AlmaLinux?

A service in AlmaLinux is essentially a program or process running in the background to perform a specific function. For example, Apache (`httpd`) serves web pages, and MySQL or MariaDB manages databases. These services can be controlled using **systemd**, the default init system, and service manager in most modern Linux distributions.

---

### Prerequisites for Managing Services

Before diving into managing services on AlmaLinux, ensure you have the following:

- **Access to the Terminal**: You need either direct access or SSH access to the server.
- **Sudo Privileges**: Administrative rights are required to manage services.
- **Basic Command-Line Knowledge**: Familiarity with the terminal and common commands will be helpful.

---

### 1. How to List Services on AlmaLinux

Listing services allows you to see which ones are active, inactive, or enabled at startup. To do this, use the `systemctl` command.

#### List All Services

To list all available services, run:

```bash
systemctl list-units --type=service
```

This displays all loaded service units, their status, and other details. The key columns to look at are:

- **LOAD**: Indicates if the service is loaded properly.
- **ACTIVE**: Shows if the service is running (active) or stopped (inactive).
- **SUB**: Provides detailed status (e.g., running, exited, or failed).

#### Filter Services by Status

To list only active services:

```bash
systemctl list-units --type=service --state=active
```

To list only failed services:

```bash
systemctl --failed
```

#### Display Specific Service Status

To check the status of a single service, use:

```bash
systemctl status [service-name]
```

For example, to check the status of the Apache web server:

```bash
systemctl status httpd
```

---

### 2. How to Enable Services on AlmaLinux

Enabling a service ensures it starts automatically when the system boots. This is crucial for services you rely on regularly, such as web or database servers.

#### Enable a Service

To enable a service at boot time, use:

```bash
sudo systemctl enable [service-name]
```

Example:

```bash
sudo systemctl enable httpd
```

#### Verify Enabled Services

To confirm that a service is enabled:

```bash
systemctl is-enabled [service-name]
```

#### Enable All Required Dependencies

When enabling a service, systemd automatically handles its dependencies. However, you can manually specify dependencies if needed.

#### Enable a Service for the Current Boot Target

To enable a service specifically for the current runlevel:

```bash
sudo systemctl enable [service-name] --now
```

---

### 3. How to Disable Services on AlmaLinux

Disabling a service prevents it from starting automatically on boot. This is useful for services you no longer need or want to stop from running unnecessarily.

#### Disable a Service

To disable a service:

```bash
sudo systemctl disable [service-name]
```

Example:

```bash
sudo systemctl disable httpd
```

#### Disable and Stop a Service Simultaneously

To disable a service and stop it immediately:

```bash
sudo systemctl disable [service-name] --now
```

#### Verify Disabled Services

To ensure the service is disabled:

```bash
systemctl is-enabled [service-name]
```

If the service is disabled, this command will return `disabled`.

---

### 4. How to Start or Stop Services

In addition to enabling or disabling services, you may need to start or stop them manually.

#### Start a Service

To start a service manually:

```bash
sudo systemctl start [service-name]
```

#### Stop a Service

To stop a running service:

```bash
sudo systemctl stop [service-name]
```

#### Restart a Service

To restart a service, which stops and then starts it:

```bash
sudo systemctl restart [service-name]
```

#### Reload a Service

If a service supports reloading without restarting (e.g., reloading configuration files):

```bash
sudo systemctl reload [service-name]
```

---

### 5. Checking Logs for Services

System logs can help troubleshoot services that fail to start or behave unexpectedly. The `journalctl` command provides detailed logs.

#### View Logs for a Specific Service

To see logs for a particular service:

```bash
sudo journalctl -u [service-name]
```

#### View Recent Logs

To see only the latest logs:

```bash
sudo journalctl -u [service-name] --since "1 hour ago"
```

---

### 6. Masking and Unmasking Services

Masking a service prevents it from being started manually or automatically. This is useful for disabling services that should never run.

#### Mask a Service

To mask a service:

```bash
sudo systemctl mask [service-name]
```

#### Unmask a Service

To unmask a service:

```bash
sudo systemctl unmask [service-name]
```

---

### 7. Using Aliases for Commands

For convenience, you can create aliases for frequently used commands. For example, add the following to your `.bashrc` file:

```bash
alias start-service='sudo systemctl start'
alias stop-service='sudo systemctl stop'
alias restart-service='sudo systemctl restart'
alias status-service='systemctl status'
```

Reload the shell to apply changes:

```bash
source ~/.bashrc
```

---

### Conclusion

Managing services on AlmaLinux is straightforward with **systemd**. Whether you're listing, enabling, disabling, or troubleshooting services, mastering these commands ensures your system runs efficiently. Regularly auditing services to enable only necessary ones can improve performance and security. By following this guide, you’ll know how to effectively manage services on your AlmaLinux system.

For more in-depth exploration, consult the official [AlmaLinux documentation](https://wiki.almalinux.org/) or the `man` pages for `systemctl` and `journalctl`.
