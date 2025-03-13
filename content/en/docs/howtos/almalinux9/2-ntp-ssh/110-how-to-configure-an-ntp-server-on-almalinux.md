---
title: How to Configure an NTP Server on AlmaLinux
description: This guide will walk you through configuring an NTP server on AlmaLinux, step by step.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: NTP server
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 110
translationKey: how-to-configure-an-ntp-server-on-almalinux
keywords:
  - AlmaLinux
  - NTP server on AlmaLinux

featured_image: /images/almalinux.webp
url: configure-ntp-server-almalinux
---
Accurate timekeeping on servers is crucial for ensuring consistent logging, security protocols, and system operations. AlmaLinux, a robust and enterprise-grade Linux distribution, relies on **Chrony** as its default Network Time Protocol (NTP) implementation. This guide will walk you through configuring an NTP server on AlmaLinux step by step.

---

### 1. **What is NTP, and Why is it Important?**

**Network Time Protocol (NTP)** synchronizes system clocks over a network. Accurate time synchronization is essential for:

- Coordinating events across distributed systems.
- Avoiding issues with log timestamps.
- Maintaining secure communication protocols.

---

### 2. **Prerequisites**

Before you begin, ensure:

1. **A fresh AlmaLinux installation** with sudo privileges.
2. **Firewall configuration** is active and manageable.
3. The **Chrony package** is installed. Chrony is ideal for systems with intermittent connections due to its faster synchronization and better accuracy.

---

### 3. **Steps to Configure an NTP Server**

#### **Step 1: Update Your System**

Start by updating the system to ensure all packages are up to date:

```bash
sudo dnf update -y
```

#### **Step 2: Install Chrony**

Install Chrony, the default NTP daemon for AlmaLinux:

```bash
sudo dnf install chrony -y
```

Verify the installation:

```bash
chronyd -v
```

#### **Step 3: Configure Chrony**

Edit the Chrony configuration file to set up your NTP server:

```bash
sudo nano /etc/chrony.conf
```

Make the following changes:

- Comment out the default NTP pool by adding `#`:

  ```bash
  #pool 2.almalinux.pool.ntp.org iburst
  ```

- Add custom NTP servers near your location:

  ```bash
  server 0.pool.ntp.org iburst
  server 1.pool.ntp.org iburst
  server 2.pool.ntp.org iburst
  server 3.pool.ntp.org iburst
  ```

- Allow NTP requests from your local network:

  ```bash
  allow 192.168.1.0/24
  ```

- (Optional) Enable the server to act as a fallback source:

  ```bash
  local stratum 10
  ```

Save and exit the file.

#### **Step 4: Start and Enable Chrony**

Start the Chrony service and enable it to start on boot:

```bash
sudo systemctl start chronyd
sudo systemctl enable chronyd
```

Check the service status:

```bash
sudo systemctl status chronyd
```

#### **Step 5: Adjust Firewall Settings**

To allow NTP traffic through the firewall, open port 123/UDP:

```bash
sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload
```

#### **Step 6: Verify Configuration**

Use Chrony commands to ensure your server is configured correctly:

1. View the active time sources:

   ```bash
   chronyc sources
   ```

2. Check synchronization status:

   ```bash
   chronyc tracking
   ```

---

### 4. **Testing the NTP Server**

To confirm that other systems can sync with your NTP server:

1. Set up a client system with Chrony installed.
2. Edit the client's `/etc/chrony.conf` file, pointing it to your NTP server's IP address:

   ```bash
   server <NTP-server-IP>
   ```

3. Restart the Chrony service:

   ```bash
   sudo systemctl restart chronyd
   ```

4. Verify time synchronization on the client:

   ```bash
   chronyc sources
   ```

---

### 5. **Troubleshooting Tips**

1. **Chrony not starting:**  
   Check logs for details:

   ```bash
   journalctl -xe | grep chronyd
   ```

2. **Firewall blocking traffic:**  
   Ensure port 123/UDP is open and correctly configured.

3. **Clients not syncing:**  
   Verify the `allow` directive in the server’s Chrony configuration and confirm network connectivity.

---

### Conclusion

Configuring an NTP server on AlmaLinux using Chrony is straightforward. With these steps, you can maintain precise time synchronization across your network, ensuring smooth operations and enhanced security. Whether you’re running a small network or an enterprise environment, this setup will provide the reliable timekeeping needed for modern systems.
