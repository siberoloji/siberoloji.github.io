---
draft: false
title: How to Enable SSH Access During the First Boot on FreeBSD
linkTitle: How to Enable SSH Access
translationKey: how-to-enable-ssh-access-during-the-first-boot-on-freebsd-operating-system
description: How to Enable SSH Access During the First Boot on FreeBSD Operating System
url: how-to-enable-ssh-access-during-the-first-boot-on-freebsd-operating-system
date: 2025-03-05
weight: 170
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Secure Shell (SSH) is a crucial tool for remote administration, allowing users to securely access and manage FreeBSD systems from any location. If you want to enable SSH access right from the first boot of your FreeBSD system, you need to configure the necessary settings during installation and initial setup.

This guide provides a step-by-step approach to enabling SSH on FreeBSD from the first boot, covering installation, network configuration, service activation, firewall settings, and security best practices.

## 1. Installing FreeBSD and Preparing for SSH Access

### Step 1: Install FreeBSD

If you haven't installed FreeBSD yet, download the latest ISO from the [official FreeBSD website](https://www.freebsd.org/) and follow the installation prompts. During installation, ensure that you set up networking properly since SSH requires network access.

### Step 2: Configure Networking

During installation, FreeBSD will prompt you to configure the network interface. If you missed this step, you can set up networking manually:

1. Identify available network interfaces:

   ```sh
   ifconfig
   ```

2. Assign an IP address if DHCP is not configured:

   ```sh
   ifconfig em0 inet 192.168.1.100 netmask 255.255.255.0
   ```

3. Set up the default gateway:

   ```sh
   route add default 192.168.1.1
   ```

4. Configure DNS by editing `/etc/resolv.conf`:

   ```sh
   echo "nameserver 8.8.8.8" >> /etc/resolv.conf
   ```

Ensure that you can access the network before proceeding.

## 2. Enabling the SSH Service

SSH is included in the base FreeBSD system, but it is disabled by default for security reasons. To enable it at first boot, follow these steps:

### Step 1: Edit `/etc/rc.conf`

Add the following line to enable the SSH daemon:

```sh
echo 'sshd_enable="YES"' >> /etc/rc.conf
```

### Step 2: Start the SSH Service

Once the system boots up, manually start SSH using:

```sh
service sshd start
```

If you want SSH to start automatically on subsequent reboots, ensure the `sshd_enable` setting in `/etc/rc.conf` is correct.

## 3. Configuring the FreeBSD Firewall

FreeBSD includes `pf` (Packet Filter) and `ipfw` as firewall options. If a firewall is enabled, you must allow SSH traffic.

### Step 1: Check Firewall Status

Determine if a firewall is active:

```sh
service ipfw status
```

### Step 2: Allow SSH Traffic

If using `ipfw`, run:

```sh
ipfw add allow tcp from any to any 22 keep-state
```

For `pf`, add this to `/etc/pf.conf`:

```sh
pass in on egress proto tcp to port 22
```

Then reload the firewall rules:

```sh
service pf reload
```

## 4. Setting Up SSH Access for Root or Other Users

By default, FreeBSD does not allow SSH login for the root user. To enable it:

### Step 1: Edit `/etc/ssh/sshd_config`

Modify the following line:

```sh
PermitRootLogin yes
```

For security, it's recommended to allow only key-based authentication and disable password login:

```sh
PasswordAuthentication no
PermitRootLogin prohibit-password
```

Restart SSH to apply changes:

```sh
service sshd restart
```

### Step 2: Create a New User with SSH Access

Instead of enabling root SSH access, create a new user:

```sh
adduser
```

Follow the prompts and then add the user to the `wheel` group for administrative privileges:

```sh
pw groupmod wheel -m username
```

Enable sudo for the new user:

```sh
pkg install sudo
visudo
```

Uncomment the line:

```sh
%wheel ALL=(ALL) ALL
```

Now, the new user can use SSH and escalate privileges when needed.

## 5. Configuring Key-Based Authentication

Password authentication is less secure than SSH keys. To set up SSH key authentication:

### Step 1: Generate an SSH Key Pair

On your local machine:

```sh
ssh-keygen -t rsa -b 4096
```

Copy the public key to the FreeBSD server:

```sh
ssh-copy-id username@freebsd-ip
```

Alternatively, manually copy the public key to `/home/username/.ssh/authorized_keys` on the FreeBSD system.

### Step 2: Disable Password Authentication

Edit `/etc/ssh/sshd_config` and set:

```sh
PasswordAuthentication no
```

Restart SSH:

```sh
service sshd restart
```

## 6. Automating SSH Setup for First Boot

If you are deploying FreeBSD on multiple machines, you can automate SSH setup using a custom startup script:

### Step 1: Create an Initialization Script

Create a file `/usr/local/etc/rc.d/enable_ssh`:

```sh
#!/bin/sh
# PROVIDE: enable_ssh
# REQUIRE: NETWORKING
# BEFORE: sshd

. /etc/rc.subr
name="enable_ssh"
start_cmd="enable_ssh_start"
stop_cmd=":"
enable_ssh_start()
{
    echo 'sshd_enable="YES"' >> /etc/rc.conf
    service sshd start
}
load_rc_config $name
run_rc_command "$1"
```

Make it executable:

```sh
chmod +x /usr/local/etc/rc.d/enable_ssh
```

Enable it:

```sh
sysrc enable_ssh_enable=YES
```

Now, SSH will be enabled automatically during the first boot.

## Conclusion

Enabling SSH access on FreeBSD during the first boot is essential for remote management. By configuring networking, enabling SSH services, setting up a firewall, and securing access with key-based authentication, you can ensure a reliable and secure connection. Automating the setup using a startup script further streamlines the process, making FreeBSD deployments more efficient.

Following these steps ensures that your FreeBSD system is ready for remote access immediately after installation.
