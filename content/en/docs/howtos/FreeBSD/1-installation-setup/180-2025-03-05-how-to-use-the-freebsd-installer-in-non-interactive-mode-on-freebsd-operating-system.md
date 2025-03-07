---
draft: false
title: How to Use the FreeBSD Installer in Non-Interactive Mode on FreeBSD
linkTitle: How to Use the FreeBSD Installer in Non-Interactive Mode
translationKey: how-to-use-the-freebsd-installer-in-non-interactive-mode
description: Learn how to use the FreeBSD installer in non-interactive mode for streamlined deployments.
url: how-to-use-the-freebsd-installer-in-non-interactive-mode
date: 2025-03-05
weight: 180
keywords:
  - FreeBSD
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful and versatile open-source operating system that is widely used in server environments, embedded systems, and advanced networking applications. One of its key strengths is its flexible installation process, which includes both interactive and non-interactive (or automated) modes. This guide will focus on how to use the FreeBSD installer in non-interactive mode, allowing for streamlined deployments without manual intervention.

## Understanding Non-Interactive Installation

A non-interactive installation of FreeBSD is beneficial in situations where multiple installations need to be performed with a consistent configuration. This method uses predefined configurations to automate the installation process, making it ideal for large-scale deployments, virtual machines, and cloud environments.

Non-interactive installations in FreeBSD are primarily handled using *bsdinstall* and configuration scripts. The process involves:

- Creating an installation script.
- Using a configuration file.
- Executing the installer in an automated fashion.

## Prerequisites

Before starting the non-interactive installation, ensure that you have the following:

- A FreeBSD installation ISO image.
- A machine or virtual machine to install FreeBSD on.
- Basic knowledge of shell scripting and FreeBSD configuration.

## Creating an Auto-Installation Script

The first step in setting up a non-interactive installation is creating an installation script. FreeBSD allows the use of the *auto* script, which is read by *bsdinstall* during installation.

1. **Create a script file**

   ```sh
   #!/bin/sh
   # Auto-installation script for FreeBSD

   export nonInteractive="YES"
   export BSDINSTALL_DISTDIR="/usr/freebsd-dist"
   export BSDINSTALL_SCRIPT="/tmp/install-script.sh"
   ```

2. **Define the installation configuration**
   The script must specify disk partitioning, package selection, user creation, and other settings. For example:

   ```sh
   echo 'PARTITIONS=ada0 { 512M freebsd-boot, 8G freebsd-swap, * freebsd-ufs }' > /tmp/auto-install.conf
   echo 'DISTRIBUTIONS="kernel.txz base.txz"' >> /tmp/auto-install.conf
   ```

3. **Configure networking** (Optional but useful for remote setups):

   ```sh
   echo 'hostname="freebsd-server"' >> /tmp/auto-install.conf
   echo 'ifconfig_em0="DHCP"' >> /tmp/auto-install.conf
   ```

4. **Set up the root password**

   ```sh
   echo 'root_password="mypassword"' >> /tmp/auto-install.conf
   ```

## Using the Installation Configuration File

Once the configuration file is created, it must be referenced during the installation process. This can be done by passing the script as an argument to *bsdinstall*.

1. **Run the installer with automation**
   Boot the FreeBSD installation media and execute:

   ```sh
   bsdinstall script /tmp/auto-install.conf
   ```

2. **Using a pre-configured ISO**
   If you want to embed the script into an ISO image, modify the image with your custom script and place it in a predefined location such as `/etc/installerconfig` so that the installer picks it up automatically.

## Automating Installation via PXE Boot

For large-scale deployments, PXE (Preboot Execution Environment) boot can be used to perform non-interactive installations over a network.

1. **Set up a PXE server with FreeBSD installation files.**
2. **Provide a configuration file to the installer via a network-mounted directory.**
3. **Boot the system via PXE and let the automated installation proceed.**

## Post-Installation Configuration

Once the installation is complete, additional post-installation steps may be required, such as package installation, security configurations, and system updates. This can be automated using a post-installation script:

```sh
echo 'pkg install -y vim sudo bash' > /etc/rc.local
chmod +x /etc/rc.local
```

## Conclusion

Using the FreeBSD installer in non-interactive mode significantly simplifies deployment, particularly for large-scale or repeatable installations. By leveraging automation scripts and PXE boot, administrators can ensure consistency, efficiency, and scalability in their FreeBSD deployments.

Mastering these techniques will not only save time but also enhance your ability to manage FreeBSD environments effectively. Whether deploying a single server or an entire data center, non-interactive installation is a powerful tool for FreeBSD users.
