---
draft: false
title: How to Configure System Firewall on Linux Mint
linkTitle: How to Configure System Firewall
translationKey: how-to-configure-system-firewall-on-linux-mint
description: Learn how to configure the system firewall on Linux Mint, ensuring your system remains secure without compromising accessibility.
url: how-to-configure-system-firewall-on-linux-mint
weight: 390
date: 2025-02-06
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - firewall
featured_image: /images/linuxmint1.webp
---
Linux Mint is a popular and user-friendly Linux distribution that prioritizes security and stability. One crucial aspect of securing a Linux system is configuring the firewall to control network traffic. Linux Mint uses the Uncomplicated Firewall (UFW) as its default firewall management tool, which provides an easy-to-use interface for iptables, the powerful firewall framework built into the Linux kernel.

In this guide, we will walk through the process of configuring the system firewall on Linux Mint. Whether you are a beginner or an advanced user, this guide will help you set up firewall rules to protect your system from unauthorized access and potential security threats.

## Understanding UFW

UFW (Uncomplicated Firewall) is a front-end for managing iptables, designed to make firewall configuration simple and straightforward. It is installed by default on Linux Mint, making it easy for users to control inbound and outbound connections without extensive knowledge of iptables.

### Checking Firewall Status

Before making any changes to the firewall, it's important to check its current status. Open a terminal and run:

```bash
sudo ufw status verbose
```

If UFW is disabled, you will see output similar to:

```
Status: inactive
```

If it's active, it will show the allowed and denied rules currently configured.

## Enabling UFW

If the firewall is not enabled, you can activate it with the following command:

```bash
sudo ufw enable
```

You should see a confirmation message:

```
Firewall is active and enabled on system startup
```

Once enabled, UFW will start filtering network traffic based on the defined rules.

## Setting Up Basic Firewall Rules

### Allowing Essential Services

Most users need to allow common services such as SSH, HTTP, and HTTPS. Here’s how to allow them:

- **Allow SSH (if you need remote access)**:

  ```bash
  sudo ufw allow ssh
  ```
  
  If SSH is running on a custom port (e.g., 2222), allow it like this:

  ```bash
  sudo ufw allow 2222/tcp
  ```

- **Allow Web Traffic (HTTP and HTTPS)**:

  ```bash
  sudo ufw allow http
  sudo ufw allow https
  ```

- **Allow Specific Applications**:
  Some applications register with UFW and can be allowed by name. To see the list of available applications, run:
  
  ```bash
  sudo ufw app list
  ```
  
  To allow an application, use:
  
  ```bash
  sudo ufw allow "OpenSSH"
  ```

### Blocking Specific Traffic

To block a specific IP address or range, use:

```bash
sudo ufw deny from 192.168.1.100
```

To deny a port, such as port 23 (Telnet), run:

```bash
sudo ufw deny 23/tcp
```

## Configuring Advanced Firewall Rules

### Limiting SSH Attempts

To prevent brute-force attacks on SSH, you can limit the number of connection attempts:

```bash
sudo ufw limit ssh
```

This rule allows SSH connections but restricts repeated attempts, adding a layer of security.

### Allowing a Specific IP Address

If you want to allow only a specific IP to access your system, use:

```bash
sudo ufw allow from 203.0.113.5
```

### Configuring Default Policies

By default, UFW blocks incoming connections and allows outgoing ones. You can reset and reconfigure these settings:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

This ensures that only explicitly allowed connections are permitted.

## Managing Firewall Rules

### Viewing Rules

To see the currently configured rules, run:

```bash
sudo ufw status numbered
```

This will list all rules with numbers assigned to them.

### Deleting Rules

To remove a rule, use:

```bash
sudo ufw delete <rule-number>
```

For example, to delete rule number 3:

```bash
sudo ufw delete 3
```

### Disabling the Firewall

If you need to disable the firewall temporarily, run:

```bash
sudo ufw disable
```

To re-enable it, simply use:

```bash
sudo ufw enable
```

## Using a Graphical Interface

For users who prefer a GUI, Linux Mint provides **GUFW** (Graphical Uncomplicated Firewall). You can install it with:

```bash
sudo apt install gufw
```

Once installed, you can open GUFW from the application menu and configure firewall rules using a user-friendly interface.

## Conclusion

Configuring the firewall on Linux Mint using UFW is a straightforward way to enhance system security. By enabling the firewall, defining clear rules for allowed and blocked traffic, and utilizing advanced options like rate limiting and specific IP filtering, you can protect your system from potential threats.

Regularly reviewing and updating firewall rules ensures your system remains secure against evolving cyber threats. Whether using the command line or a graphical interface, Linux Mint makes firewall management simple and effective.

Would you like to add specific troubleshooting tips or custom rule configurations? Let us know in the comments!
