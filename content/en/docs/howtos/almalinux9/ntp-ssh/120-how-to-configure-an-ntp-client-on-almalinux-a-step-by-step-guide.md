---
title: How to Configure an NTP Client on AlmaLinux
description: we will walk through the process of configuring an NTP (Network Time Protocol) client on AlmaLinux, ensuring your system is in sync with a reliable time server.
date: 2024-12-08
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
linkTitle: NTP Client
type: docs
prev: null
next: null
authors:
   - name: İbrahim Korucuoğlu
     link: https://github.com/siberoloji
     image: https://github.com/siberoloji.png
weight: 120
toc: true
keywords:
   - AlmaLinux
   - NTP Client on AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
url: configure-ntp-client-almalinux
---
In modern computing environments, maintaining precise system time is critical. From security protocols to log accuracy, every aspect of your system depends on accurate synchronization. In this guide, we will walk through the process of configuring an **NTP (Network Time Protocol) client** on AlmaLinux, ensuring your system is in sync with a reliable time server.

---

### **What is NTP?**

NTP is a protocol used to synchronize the clocks of computers to a reference time source, like an atomic clock or a stratum-1 NTP server. Configuring your AlmaLinux system as an NTP client enables it to maintain accurate time by querying a specified NTP server.

---

### **Prerequisites**

Before diving into the configuration process, ensure the following:

1. **AlmaLinux is installed** and up-to-date.
2. You have **sudo privileges** on the system.
3. Your server has **network access to an NTP server**, either a public server or one in your local network.

---

### **Step 1: Update Your System**

Begin by updating your AlmaLinux system to ensure all installed packages are current:

```bash
sudo dnf update -y
```

---

### **Step 2: Install Chrony**

AlmaLinux uses Chrony as its default NTP implementation. Chrony is efficient, fast, and particularly suitable for systems with intermittent connections.

To install Chrony, run:

```bash
sudo dnf install chrony -y
```

Verify the installation by checking the version:

```bash
chronyd -v
```

---

### **Step 3: Configure Chrony as an NTP Client**

Chrony’s main configuration file is located at `/etc/chrony.conf`. Open this file with your preferred text editor:

```bash
sudo nano /etc/chrony.conf
```

#### Key Configurations

1. **Specify the NTP Servers**  
By default, Chrony includes public NTP pool servers. Replace or append your desired NTP servers:

   ```bash
   server 0.pool.ntp.org iburst
   server 1.pool.ntp.org iburst
   server 2.pool.ntp.org iburst
   server 3.pool.ntp.org iburst
   ```

   The `iburst` option ensures faster initial synchronization.

2. **Set Time Zone (Optional)**  
Ensure your system time zone is correct:

   ```bash
   timedatectl set-timezone <your-time-zone>
   ```

   Replace `<your-time-zone>` with your region, such as `America/New_York`.

3. **Optional: Add Local Server**  
If you have an NTP server in your network, replace the pool servers with your server's IP:

   ```bash
   server 192.168.1.100 iburst
   ```

4. **Other Useful Parameters**  
   - **Minimizing jitter:** Adjust poll intervals to reduce variations:

     ```bash
     maxpoll 10
     minpoll 6
     ```

   - **Enabling NTP authentication** (for secure environments):

     ```bash
     keyfile /etc/chrony.keys
     ```

     Configure keys for your setup.

Save and exit the editor.

---

### **Step 4: Start and Enable Chrony Service**

Start the Chrony service to activate the configuration:

```bash
sudo systemctl start chronyd
```

Enable the service to start at boot:

```bash
sudo systemctl enable chronyd
```

Check the service status to ensure it’s running:

```bash
sudo systemctl status chronyd
```

---

### **Step 5: Test NTP Synchronization**

Verify that your client is correctly synchronizing with the configured NTP servers.

1. **Check Time Sources:**

   ```bash
   chronyc sources
   ```

   This command will display a list of NTP servers and their synchronization status:

   ```bash
   MS Name/IP address         Stratum Poll Reach LastRx Last sample
   ===============================================================================
   ^* 0.pool.ntp.org               2     6    37    8   -0.543ms   +/- 1.234ms
   ```

   - `^*` indicates the server is the current synchronization source.
   - `Reach` shows the number of recent responses (value up to 377 indicates stable communication).

2. **Track Synchronization Progress:**

   ```bash
   chronyc tracking
   ```

   This provides detailed information about synchronization, including the server’s stratum, offset, and drift.

3. **Sync Time Manually:**
   If immediate synchronization is needed:

   ```bash
   sudo chronyc -a makestep
   ```

---

### **Step 6: Configure Firewall (If Applicable)**

If your server runs a firewall, ensure it allows NTP traffic through port 123 (UDP):

```bash
sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload
```

---

### **Step 7: Automate Time Sync with Boot**

Ensure your AlmaLinux client synchronizes time automatically after boot. Run:

```bash
sudo timedatectl set-ntp true
```

---

### **Troubleshooting Common Issues**

1. **No Time Sync:**
   - Check the network connection to the NTP server.
   - Verify `/etc/chrony.conf` for correct server addresses.

2. **Chrony Service Fails to Start:**
   - Inspect logs for errors:

     ```bash
     journalctl -xe | grep chronyd
     ```

3. **Client Can’t Reach NTP Server:**
   - Ensure port 123/UDP is open on the server-side firewall.
   - Verify the client has access to the server via `ping <server-ip>`.

4. **Offset Too High:**
   - Force synchronization:

     ```bash
     sudo chronyc -a burst
     ```

---

### **Conclusion**

Configuring an NTP client on AlmaLinux using Chrony ensures that your system maintains accurate time synchronization. Following this guide, you’ve installed Chrony, configured it to use reliable NTP servers, and verified its functionality. Whether you’re working in a small network or a larger infrastructure, precise timekeeping is now one less thing to worry about!

For additional customization or troubleshooting, refer to [Chrony documentation](https://chrony.tuxfamily.org/documentation.html).
