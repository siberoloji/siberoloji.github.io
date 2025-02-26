---
draft: false
title: Installing FreeBSD on a Raspberry Pi 4 or 5
linkTitle: Install FreeBSD
translationKey: installing-freebsd-on-a-raspberry-pi-4-or-5
description: This guide provides a step-by-step walkthrough for setting up FreeBSD on a Raspberry Pi 4 or 5, including preparation, installation, and post-installation steps.
url: installing-freebsd-on-a-raspberry-pi-4-or-5
date: 2025-02-26
weight: 60
keywords:
  - FreeBSD
  - Raspberry Pi
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful Unix-like operating system known for its performance, stability, and security. Installing FreeBSD on a Raspberry Pi 4 or 5 allows users to take advantage of these benefits on a small, energy-efficient device. This guide walks you through the entire process, from downloading FreeBSD to configuring it for optimal performance.

---

## **1. Introduction to FreeBSD and Raspberry Pi**  

FreeBSD is a free, open-source operating system with a strong focus on performance, security, and advanced networking features. Raspberry Pi is a low-cost, single-board computer designed for hobbyists, students, and professionals alike. Running FreeBSD on a Raspberry Pi is an excellent way to explore the power of Unix-based systems in an efficient and compact setup.  

---

## **2. Prerequisites**  

Before you begin, make sure you have the following:  

### **Hardware Requirements:**  

- Raspberry Pi 4 or Raspberry Pi 5  
- MicroSD card (at least 16GB, preferably 32GB for more storage)  
- SD card reader  
- Power supply (USB-C for Pi 4/5)  
- HDMI monitor  
- USB keyboard and mouse  
- Ethernet cable or Wi-Fi connection  

### **Software Requirements:**  

- A computer running FreeBSD, Linux, Windows, or macOS  
- A disk imaging tool (`dd`, `Etcher`, or `Raspberry Pi Imager`)  

---

## **3. Downloading the FreeBSD Image**  

FreeBSD provides pre-built images for Raspberry Pi. You can download the latest version from the official FreeBSD website:  

- Visit: [https://www.freebsd.org/where/](https://www.freebsd.org/where/)  
- Look for **Raspberry Pi (arm64) images**  
- Download the latest **FreeBSD-RELEASE-arm64-aarch64-RPI.img.xz**  

---

## **4. Writing the Image to a MicroSD Card**  

Once the FreeBSD image is downloaded, it must be written to a microSD card.  

### **Using `dd` (FreeBSD/Linux/macOS)**  

1. Insert the microSD card into your computer.  
2. Identify the correct device using:  

   ```sh
   lsblk (Linux) or diskutil list (macOS)
   ```

3. Write the image:  

   ```sh
   xz -dc FreeBSD-RELEASE-arm64-aarch64-RPI.img.xz | sudo dd of=/dev/sdX bs=4M status=progress
   ```

   *(Replace `/dev/sdX` with your microSD card's device name.)*  

### **Using Raspberry Pi Imager (Windows/macOS/Linux)**  

1. Download and install **Raspberry Pi Imager** from [https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)  
2. Open the software and select **Use custom image**  
3. Select your downloaded FreeBSD image  
4. Choose your microSD card as the target device  
5. Click **Write**  

---

## **5. Booting FreeBSD on the Raspberry Pi**  

1. Insert the microSD card into the Raspberry Pi.  
2. Connect the monitor, keyboard, and power supply.  
3. Power on the Raspberry Pi.  
4. The system should boot into the FreeBSD command-line interface.  

---

## **6. Initial Setup and Configuration**  

### **Setting a Root Password**  

After booting, log in as `root` (no password by default). Set a new password:  

```sh
passwd
```

### **Creating a New User**  

It is recommended to create a non-root user:  

```sh
adduser
```

Follow the prompts and add the user to the `wheel` group for administrative privileges:  

```sh
pw usermod yourusername -G wheel
```

### **Enabling `sudo`**  

Install and configure `sudo`:  

```sh
pkg install sudo
echo "yourusername ALL=(ALL) ALL" >> /usr/local/etc/sudoers
```

---

## **7. Setting Up Networking**  

### **Wired (Ethernet)**  

If using a wired connection, it should work automatically. Verify with:  

```sh
ifconfig
```

### **Wi-Fi Setup**  

1. Edit the `/etc/wpa_supplicant.conf` file:  

   ```sh
   ee /etc/wpa_supplicant.conf
   ```

2. Add your network details:  

   ```bash
   network={
       ssid="YourWiFiSSID"
       psk="YourWiFiPassword"
   }
   ```

3. Enable Wi-Fi at boot:  

   ```sh
   sysrc ifconfig_wlan0="WPA DHCP"
   service netif restart
   ```

---

## **8. Updating FreeBSD**  

Run the following command to update system packages:  

```sh
freebsd-update fetch install
pkg update && pkg upgrade
```

---

## **9. Installing and Managing Software Packages**  

Use `pkg` to install additional software:  

```sh
pkg install nano htop tmux git
```

For a list of available software:  

```sh
pkg search keyword
```

---

## **10. Enabling a Graphical User Interface (Optional)**  

To install the **Xfce** desktop environment:  

```sh
pkg install xfce slim xorg
```

Enable the display manager:  

```sh
sysrc slim_enable="YES"
```

Start the GUI with:  

```sh
startx
```

---

## **11. Configuring System Services**  

Enable services at boot with `sysrc`:  

```sh
sysrc sshd_enable="YES"
sysrc ntpd_enable="YES"
```

Start them manually:  

```sh
service sshd start
service ntpd start
```

---

## **12. Setting Up External Storage**  

1. List available drives:  

   ```sh
   gpart show
   ```

2. Mount a USB drive:  

   ```sh
   mount /dev/da0s1 /mnt
   ```

3. Add to `/etc/fstab` for auto-mounting.

---

## **13. Performance Optimization**  

- **Increase swap space (if needed):**  

  ```sh
  dd if=/dev/zero of=/swapfile bs=1M count=1024
  chmod 600 /swapfile
  mdconfig -a -t vnode -f /swapfile -u 0
  swapon /dev/md0
  ```

---

## **14. Troubleshooting Common Issues**  

- **Raspberry Pi not booting?**  
  - Ensure the microSD card is properly written and inserted.  
  - Try a different power supply.  
  - Check the `config.txt` file in the boot partition.  

- **No internet?**  
  - Check `ifconfig` to see if an IP address is assigned.  
  - Restart the networking service:  

    ```sh
    service netif restart
    ```

---

## **15. FAQs**  

**Q1: Can I run FreeBSD on Raspberry Pi 5?**  
Yes, but support is still evolving. Check the FreeBSD Wiki for updates.  

**Q2: How do I install a web server on FreeBSD?**  
You can install Apache with:  

```sh
pkg install apache24
service apache24 enable
service apache24 start
```

**Q3: Is FreeBSD better than Linux for Raspberry Pi?**  
It depends on your needs. FreeBSD offers better security and networking but has less hardware support than Linux.  

---

With this guide, you now have a fully functional FreeBSD installation on your Raspberry Pi. Experiment, explore, and enjoy the power of BSD on your compact Raspberry Pi! 🚀
