---
draft: false
title: How to Set Up a Minimal FreeBSD Server (No GUI)
linkTitle: How to Set Up a Minimal FreeBSD Server (No GUI)
translationKey: how-to-set-up-a-minimal-freebsd-server-no-gui
description: This article provides a step-by-step guide on how to set up a minimal FreeBSD server without a graphical user interface (GUI).
url: how-to-set-up-a-minimal-freebsd-server-no-gui
date: 2025-03-05
weight: 130
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
## Introduction

FreeBSD is a powerful, open-source operating system known for its performance, security, and advanced networking features. It is widely used for servers, firewalls, and embedded systems. Setting up a minimal FreeBSD server without a graphical user interface (GUI) is an excellent way to build a lightweight, efficient system for web hosting, file storage, or network services.

In this guide, we will walk you through the process of installing and configuring a minimal FreeBSD server. We will cover essential steps such as downloading FreeBSD, performing the installation, setting up networking, enabling security features, and installing necessary packages.

---

## Prerequisites

Before we begin, ensure that you have:

- A computer or virtual machine for installation.
- A FreeBSD ISO image (available from [https://www.freebsd.org/downloads/](https://www.freebsd.org/downloads/)).
- A bootable USB drive or installation media.
- Basic familiarity with UNIX/Linux command-line operations.

---

## Step 1: Downloading and Creating Installation Media

1. Visit the FreeBSD official downloads page.
2. Download the appropriate installation ISO for your system architecture (typically `amd64` for modern PCs and servers).
3. Create a bootable USB drive using tools like:
   - `dd` (Linux/macOS):

     ```sh
     dd if=FreeBSD-XX.X-RELEASE-amd64-disc1.iso of=/dev/sdX bs=4M status=progress
     ```

   - Rufus (Windows)

---

## Step 2: Installing FreeBSD

1. Boot from the installation media.
2. Select `Install` from the FreeBSD boot menu.
3. Choose a keymap and set your hostname.
4. Select distributions:
   - Essential: `base-dbg`, `kernel`.
   - Optional (depending on use case): `ports` (for additional software).
5. Configure partitioning:
   - Use `Auto` (ZFS/UFS) for simplicity.
   - Choose `GPT` for modern systems.
6. Set the root password and configure networking (DHCP or manual configuration).
7. Choose optional system hardening features (e.g., disable sendmail, enable security options).
8. Install boot loader and finalize installation.
9. Reboot and remove the installation media.

---

## Step 3: Post-Installation Configuration

### 3.1 Update the System

Once logged in as root, update the system:

```sh
freebsd-update fetch install
pkg update
```

### 3.2 Create a New User

Running as root is not recommended for security reasons. Create a new user:

```sh
adduser
```

Assign appropriate permissions and add the user to the `wheel` group:

```sh
pw groupmod wheel -m yourusername
```

### 3.3 Enable SSH Access

By default, SSH is installed but might not be enabled. Start and enable the SSH daemon:

```sh
sysrc sshd_enable="YES"
service sshd start
```

For security, edit `/etc/ssh/sshd_config` to disable root login:

```sh
PermitRootLogin no
```

Restart SSH to apply changes:

```sh
service sshd restart
```

---

## Step 4: Configuring Networking

### 4.1 Set a Static IP Address

Edit `/etc/rc.conf` to configure a static IP:

```sh
ifconfig_em0="inet 192.168.1.100 netmask 255.255.255.0"
defaultrouter="192.168.1.1"
```

Restart networking:

```sh
service netif restart
service routing restart
```

### 4.2 Configure the Firewall

FreeBSD comes with `pf` (Packet Filter). Enable and configure it by editing `/etc/pf.conf`:

```sh
default deny all
pass in on em0 proto tcp from any to any port 22
pass out all keep state
```

Enable `pf` and start the service:

```sh
sysrc pf_enable="YES"
service pf start
```

---

## Step 5: Installing Essential Packages

Use `pkg` to install necessary software:

```sh
pkg install nano bash sudo htop
```

Set `bash` as the default shell for your user:

```sh
chsh -s /usr/local/bin/bash yourusername
```

To allow your user to execute administrative commands, edit `/usr/local/etc/sudoers`:

```sh
visudo
```

Uncomment the following line:

```sh
%wheel ALL=(ALL) ALL
```

---

## Step 6: Enabling Automatic Security Updates

FreeBSD can automatically install security patches using `freebsd-update`.
Enable it by adding to `/etc/crontab`:

```sh
@daily root freebsd-update cron
```

---

## Step 7: Setting Up Basic Services

### 7.1 NTP Time Synchronization

To ensure accurate timekeeping, install and enable NTP:

```sh
sysrc ntpd_enable="YES"
service ntpd start
```

### 7.2 Setting Up a Simple Web Server (Optional)

If you need a basic web server, install `nginx`:

```sh
pkg install nginx
sysrc nginx_enable="YES"
service nginx start
```

---

## Conclusion

By following these steps, you have successfully set up a minimal FreeBSD server without a GUI. This server is lightweight, secure, and ready for further customization based on your specific use case, whether it be web hosting, file storage, or other network services.

For additional configuration and package installations, refer to the FreeBSD Handbook ([https://docs.freebsd.org/en/books/handbook/](https://docs.freebsd.org/en/books/handbook/)).
