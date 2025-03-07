---
draft: false
title: How to Use the FreeBSD Text-Based Installer for Headless Setups on FreeBSD Operating System
linkTitle: Text-Based Installer for Headless Setups
translationKey: text-based-installer-for-headless-setups-freebsd
description: This guide explains how to use the FreeBSD text-based installer for headless setups on FreeBSD operating system.
url: how-to-use-the-freebsd-text-based-installer-for-headless-setups
date: 2025-02-26
weight: 70
keywords:
  - FreeBSD
  - text-based installer
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
### Introduction  

FreeBSD is a powerful, open-source UNIX-like operating system known for its advanced networking, security, and performance features. While many users install FreeBSD using a graphical or interactive interface, there are scenarios where a **headless setup** is required. A headless setup refers to installing and managing an operating system on a system **without a directly attached keyboard, mouse, or monitor**. This is common for **servers, embedded systems, and remote deployments**.  

In this guide, we will walk through the **step-by-step process** of using FreeBSD’s **text-based installer** for a headless setup. This includes preparing the installation media, configuring the bootloader, connecting via SSH or serial console, and completing the installation process efficiently.  

---

## **1. Prerequisites for a Headless FreeBSD Installation**  

Before we begin, ensure you have the following:  

- A machine or server for installation.  
- A second computer for remote access via SSH or serial console.  
- A bootable **FreeBSD installation image** (ISO).  
- A USB drive or virtual CD for mounting the installation media.  
- A working network connection (wired or wireless).  

### **Choosing the Right FreeBSD Installation Image**  

FreeBSD provides several ISO images. For a headless setup, the most commonly used images are:  

- **FreeBSD-XX.X-RELEASE-amd64-disc1.iso** – Standard installation media.  
- **FreeBSD-XX.X-RELEASE-amd64-memstick.img** – Suitable for USB-based installation.  
- **FreeBSD-XX.X-RELEASE-amd64-mini-memstick.img** – Minimal setup with fewer packages.  

Download the appropriate image from the official FreeBSD repository:  
[https://www.freebsd.org/](https://www.freebsd.org/)  

---

## **2. Preparing the Installation Media**  

### **Creating a Bootable USB Drive (For Physical Machines)**  

To create a bootable USB stick, use the `dd` command (on Linux/macOS) or **Rufus** (on Windows).  

#### **On Linux/macOS:**  

```sh
dd if=FreeBSD-XX.X-RELEASE-amd64-memstick.img of=/dev/sdX bs=1M status=progress
sync
```

> Replace `/dev/sdX` with the correct USB drive path.  

#### **On Windows (Using Rufus):**  

1. Open Rufus.  
2. Select the FreeBSD `.img` file.  
3. Choose **DD Image mode**.  
4. Click **Start** to create the bootable USB.  

### **Mounting the ISO for Virtual Machines**  

If installing FreeBSD on a VM (VirtualBox, VMware, or KVM), simply attach the ISO file as a boot disk in your VM settings.  

---

## **3. Configuring the System for Headless Installation**  

Since there’s no monitor, you need a way to interact with the installer remotely. This can be done using:  

- **SSH (Secure Shell)**  
- **Serial Console (for hardware servers)**  

### **Enabling Serial Console**  

If your system supports serial access, modify the FreeBSD boot configuration before installation:  

1. **Modify the Bootloader Settings**  
   - Mount the installation media.  
   - Edit `/boot/loader.conf`:  

     ```sh
     echo 'console="comconsole"' >> /boot/loader.conf
     ```

2. **Enable Serial Access in the Boot Menu**  
   - When booting, interrupt the FreeBSD bootloader and type:  

     ```sh
     set console=comconsole
     boot
     ```

3. **Set Up Baud Rate (Optional, for Legacy Systems)**  
   - Modify `/boot.config`:  

     ```sh
     echo "-h -S115200" > /boot.config
     ```

   - This ensures compatibility with **115200 baud rate** for serial communication.  

### **Enabling SSH for Remote Installation**  

If using SSH, FreeBSD allows pre-configuring SSH access in the installation media:  

1. **Modify the Bootloader** (For headless SSH setup)  

   ```sh
   echo 'sshd_enable="YES"' >> /etc/rc.conf
   ```

2. **Set Up a Temporary Root Password**  

   ```sh
   echo "root:yourpassword" | chpasswd
   ```

3. **Find the IP Address After Booting**  
   - Use DHCP to get an IP address or set a static IP via:  

     ```sh
     ifconfig em0 inet 192.168.1.100 netmask 255.255.255.0
     ```

4. **Connect via SSH**  

   ```sh
   ssh root@192.168.1.100
   ```

---

## **4. Running the FreeBSD Text-Based Installer**  

Once connected via SSH or serial console, proceed with the **ncurses-based FreeBSD installer**.  

### **Step 1: Select Install Mode**  

- Choose **"Install"** from the main menu.  
- Select keyboard layout (default is fine for most setups).  

### **Step 2: Partitioning the Disk**  

For headless servers, use **Auto (UFS)** or **ZFS (for RAID setups)**.  

- **UFS (for simple setups)**  
- **ZFS (for advanced RAID configurations)**  

### **Step 3: Network Configuration**  

- Set up networking manually or via DHCP.  
- Configure **IPv4 and/or IPv6 settings**.  

### **Step 4: Root Password and User Creation**  

- Set a strong root password.  
- Create an admin user (`wheel` group for sudo access).  

### **Step 5: Package Installation**  

- Choose minimal installation or install extra components (e.g., `ports` and `source`).  

### **Step 6: Post-Installation Configuration**  

After installation:  

- Enable SSH for remote access:  

  ```sh
  sysrc sshd_enable="YES"
  ```

- Enable serial console permanently:  

  ```sh
  echo 'console="comconsole"' >> /boot/loader.conf
  ```

---

## **5. First Boot and Post-Installation Tasks**  

Once installation completes, reboot the system:  

```sh
reboot
```

After booting, reconnect via SSH or serial console and:  

1. **Update the system:**  

   ```sh
   freebsd-update fetch install
   pkg update
   ```

2. **Configure firewall (optional):**  

   ```sh
   sysrc firewall_enable="YES"
   sysrc firewall_type="open"
   ```

3. **Install essential packages:**  

   ```sh
   pkg install nano sudo bash
   ```

---

## **6. Automating Future Headless Deployments**  

For large-scale headless deployments, consider using:  

- **PXE Boot with FreeBSD network installation.**  
- **Preseeded Configuration Files** (via `/etc/rc.conf`).  
- **Ansible or Shell Scripts** for automated FreeBSD deployments.  

---

## **Conclusion**  

Installing FreeBSD on a headless system requires **preparing the installation media, enabling remote access (SSH or serial), and using the text-based installer**. By following the steps above, you can successfully deploy FreeBSD on remote servers, virtual machines, or embedded devices with minimal intervention.  

Whether you're setting up a personal server or deploying FreeBSD at scale, mastering the headless installation process ensures **efficiency, flexibility, and control** over your FreeBSD systems.  

---

## **Frequently Asked Questions (FAQs)**  

### **1. How do I access a FreeBSD system after a headless install?**  

You can access FreeBSD via SSH (`ssh root@IP_ADDRESS`) or use a serial console connection if configured.  

### **2. Can I use ZFS for a headless FreeBSD setup?**  

Yes, FreeBSD supports ZFS for headless installs. Simply choose ZFS during installation and configure disk pools as needed.  

### **3. What if I lose network access after installation?**  

Check network settings with `ifconfig` and restart networking services using:  

```sh
service netif restart
service routing restart
```

### **4. How do I install packages after FreeBSD installation?**  

Use the FreeBSD package manager:  

```sh
pkg install <package-name>
```

### **5. Can I automate headless FreeBSD installations?**  

Yes, you can use PXE booting, preseeded configurations, and tools like **Ansible** for automation.  

### **6. How do I configure firewall after installation?**  

Use the FreeBSD firewall:  

```sh
sysrc firewall_enable="YES"
sysrc firewall_type="open"
```

### **7. How do I configure SSH after installation?**  

Use the FreeBSD SSH service:  

```sh
sysrc sshd_enable="YES"
```

### **8. How do I configure serial console after installation?**  

Add `console="comconsole"` to `/boot/loader.conf` and reboot.

```sh
echo 'console="comconsole"' >> /boot/loader.conf
```
