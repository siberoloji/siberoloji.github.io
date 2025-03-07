---
draft: false
title: How to Change the System Hostname Permanently on FreeBSD Operating System
linkTitle: How to Change the System Hostname
translationKey: how-to-change-the-system-hostname-permanently-on-freebsd-operating-system
description: This article will guide you through the process of changing the system hostname permanently on FreeBSD.
url: how-to-change-the-system-hostname-permanently-on-freebsd-operating-system
date: 2025-03-05
weight: 320
keywords:
  - FreeBSD
  - change hostname
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
The hostname of a system is a crucial identifier that allows it to be recognized on a network. Whether you're managing a server or a personal workstation, setting a meaningful and unique hostname is essential for efficient network management and system administration. FreeBSD, a powerful and versatile Unix-like operating system, provides several methods to change the system hostname. However, ensuring that the change is permanent requires a proper understanding of the system's configuration files and startup processes.

In this blog post, we’ll walk you through the steps to change the system hostname permanently on FreeBSD. We’ll cover the following topics:

1. **Understanding the Hostname in FreeBSD**
2. **Temporarily Changing the Hostname**
3. **Permanently Changing the Hostname**
4. **Verifying the Hostname Change**
5. **Best Practices and Considerations**

By the end of this guide, you’ll have a clear understanding of how to manage the hostname on FreeBSD and ensure that your changes persist across reboots.

---

## 1. Understanding the Hostname in FreeBSD

The hostname is a label assigned to a device on a network. It is used to identify the system in various contexts, such as logging, networking, and system administration. In FreeBSD, the hostname is stored in the kernel and can be accessed or modified using system commands and configuration files.

FreeBSD uses the `hostname` command to display or set the system's hostname temporarily. However, to make the change permanent, you need to modify specific configuration files that are read during the system's boot process.

---

## 2. Temporarily Changing the Hostname

Before making permanent changes, it’s often useful to test a new hostname temporarily. This allows you to verify that the new hostname works as expected without affecting the system’s configuration files.

To change the hostname temporarily, use the `hostname` command followed by the desired hostname. For example, to set the hostname to `freebsd-server`, run the following command as the root user:

```bash
hostname freebsd-server
```

To verify the change, use the `hostname` command without any arguments:

```bash
hostname
```

This will display the current hostname, which should now be `freebsd-server`. However, this change is not persistent and will be lost after a system reboot.

---

## 3. Permanently Changing the Hostname

To ensure that the hostname change persists across reboots, you need to modify the system’s configuration files. FreeBSD uses the `/etc/rc.conf` file to store system configuration settings, including the hostname.

### Step 1: Edit the `/etc/rc.conf` File

Open the `/etc/rc.conf` file in a text editor. You can use `vi`, `ee`, or any other text editor of your choice. For example:

```bash
ee /etc/rc.conf
```

Locate the line that sets the `hostname` variable. If it doesn’t exist, add it. Set the value to your desired hostname. For example:

```bash
hostname="freebsd-server"
```

Save the file and exit the editor.

### Step 2: Update the `/etc/hosts` File

The `/etc/hosts` file maps hostnames to IP addresses. It’s important to ensure that the new hostname is correctly associated with the system’s IP address in this file.

Open the `/etc/hosts` file in a text editor:

```bash
ee /etc/hosts
```

Look for a line that associates the system’s IP address with the old hostname. Update the hostname to match the new one. For example:

```bash
127.0.0.1       localhost
192.168.1.100   freebsd-server
```

Save the file and exit the editor.

### Step 3: Apply the Changes

To apply the changes without rebooting, you can use the `hostname` command again:

```bash
hostname freebsd-server
```

Alternatively, you can restart the networking service to ensure that the new hostname is recognized:

```bash
service netif restart
```

---

## 4. Verifying the Hostname Change

After making the changes, it’s important to verify that the new hostname is correctly set and will persist across reboots.

### Check the Current Hostname

Use the `hostname` command to check the current hostname:

```bash
hostname
```

This should display the new hostname (`freebsd-server` in our example).

### Check the Configuration Files

Ensure that the `/etc/rc.conf` and `/etc/hosts` files contain the correct hostname:

```bash
cat /etc/rc.conf | grep hostname
cat /etc/hosts
```

### Reboot the System

To confirm that the hostname change is permanent, reboot the system:

```bash
reboot
```

After the system restarts, log in and check the hostname again:

```bash
hostname
```

If the hostname remains unchanged, the modification was successful.

---

## 5. Best Practices and Considerations

When changing the hostname on FreeBSD, keep the following best practices in mind:

### Choose a Meaningful Hostname

Select a hostname that is descriptive and easy to remember. Avoid using special characters or spaces, as they can cause issues in networking and system administration.

### Update Network Services

If your system runs network services that rely on the hostname (e.g., SSH, mail servers, or web servers), ensure that they are configured to use the new hostname. Some services may require additional configuration changes or restarts.

### Synchronize with DNS

If your system is part of a larger network with DNS services, update the DNS records to reflect the new hostname. This ensures that other systems can resolve the hostname correctly.

### Document Changes

Keep a record of any changes made to the system’s configuration files. This documentation can be invaluable for troubleshooting or future reference.

### Test in a Staging Environment

If you’re managing a production system, consider testing the hostname change in a staging environment first. This allows you to identify and resolve any issues before applying the change to the live system.

---

## Conclusion

Changing the system hostname on FreeBSD is a straightforward process, but it requires careful attention to ensure that the change is permanent and does not disrupt system functionality. By following the steps outlined in this guide, you can confidently update the hostname and verify that it persists across reboots.

Remember to choose a meaningful hostname, update related configuration files, and test the changes thoroughly. With these best practices in mind, you’ll be well-equipped to manage hostnames on FreeBSD systems effectively.

Whether you’re a system administrator or a FreeBSD enthusiast, mastering hostname management is an essential skill that contributes to the stability and efficiency of your systems.
