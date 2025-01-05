---
title: How to Set Up Firewalld, Ports, and Zones on AlmaLinux
description: Learn how to configure firewalld on AlmaLinux. Open ports, manage zones, and apply advanced firewall rules with this comprehensive guide.
date: 2024-11-29
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Firewalld, Ports, and Zones
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 20
toc: true
keywords:
  - AlmaLinux
  - firewalld
excludeSearch: false


featured_image: /images/almalinux.webp
url: set-firewalld-ports-zones-almalinux
---
A properly configured firewall is essential for securing any Linux system, including AlmaLinux. Firewalls control the flow of traffic to and from your system, ensuring that only authorized communications are allowed. AlmaLinux leverages the powerful and flexible **firewalld** service to manage firewall settings. This guide will walk you through setting up and managing firewalls, ports, and zones on AlmaLinux with detailed examples.

---

## **1. Introduction to firewalld**

Firewalld is the default firewall management tool on AlmaLinux. It uses the concept of **zones** to group rules and manage network interfaces, making it easy to configure complex firewall settings. Here's a quick breakdown:

- **Zones** define trust levels for network connections (e.g., public, private, trusted).

- **Ports** control the allowed traffic based on specific services or applications.

- **Rich Rules** enable advanced configurations like IP whitelisting or time-based access.

Before proceeding, ensure that firewalld is installed and running on your AlmaLinux system.

---

## **2. Installing and Starting firewalld**

Firewalld is typically pre-installed on AlmaLinux. If it isn’t, you can install it using the following commands:

```bash

sudo dnf install firewalld

```

Once installed, start and enable the firewalld service to ensure it runs on boot:

```bash

sudo systemctl start firewalld

sudo systemctl enable firewalld

```

To verify its status, use:

```bash

sudo systemctl status firewalld

```

---

## **3. Understanding Zones in firewalld**

Firewalld zones represent trust levels assigned to network interfaces. Common zones include:

- **Public:** Minimal trust; typically used for public networks.

- **Private:** Trusted zone for personal or private networks.

- **Trusted:** Highly trusted zone; allows all connections.

To view all available zones, run:

```bash

sudo firewall-cmd --get-zones

```

To check the current zone of your active network interface:

```bash

sudo firewall-cmd --get-active-zones

```

### **Assigning a Zone to an Interface**

To assign a specific zone to a network interface (e.g., `eth0`):

```bash

sudo firewall-cmd --zone=public --change-interface=eth0 --permanent

sudo firewall-cmd --reload

```

The `--permanent` flag ensures the change persists after reboots.

---

## **4. Opening and Managing Ports**

A firewall controls access to services using **ports**. For example, SSH uses port 22, while HTTP and HTTPS use ports 80 and 443 respectively.

### **Opening a Port**

To open a specific port, such as HTTP (port 80):

```bash

sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

```

Reload the firewall to apply the change:

```bash

sudo firewall-cmd --reload

```

### **Listing Open Ports**

To view all open ports in a specific zone:

```bash

sudo firewall-cmd --zone=public --list-ports

```

### **Closing a Port**

To remove a previously opened port:

```bash

sudo firewall-cmd --zone=public --remove-port=80/tcp --permanent

sudo firewall-cmd --reload

```

---

## **5. Enabling and Disabling Services**

Instead of opening ports manually, you can allow services by name. For example, to enable SSH:

```bash

sudo firewall-cmd --zone=public --add-service=ssh --permanent

sudo firewall-cmd --reload

```

To view enabled services for a zone:

```bash

sudo firewall-cmd --zone=public --list-services

```

To disable a service:

```bash

sudo firewall-cmd --zone=public --remove-service=ssh --permanent

sudo firewall-cmd --reload

```

---

## **6. Advanced Configurations with Rich Rules**

Rich rules provide granular control over traffic, allowing advanced configurations like IP whitelisting, logging, or time-based rules.

### **Example 1: Allow Traffic from a Specific IP**

To allow traffic only from a specific IP address:

```bash

sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.100" accept' --permanent

sudo firewall-cmd --reload

```

### **Example 2: Log Dropped Packets**

To log packets dropped by the firewall for debugging:

```bash

sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" log prefix="Firewall:" level="info" drop' --permanent

sudo firewall-cmd --reload

```

---

## **7. Using firewalld in GUI (Optional)**

For those who prefer a graphical interface, firewalld provides a GUI tool. Install it using:

```bash

sudo dnf install firewall-config

```

Launch the GUI tool:

```bash

firewall-config

```

The GUI allows you to manage zones, ports, and services visually.

---

## **8. Backing Up and Restoring Firewall Configurations**

It’s a good practice to back up your firewall settings to avoid reconfiguring in case of system issues.

### **Backup**

```bash

sudo firewall-cmd --runtime-to-permanent

tar -czf firewall-backup.tar.gz /etc/firewalld

```

### **Restore**

```bash

tar -xzf firewall-backup.tar.gz -C /

sudo systemctl restart firewalld

```

---

## **9. Testing and Troubleshooting Firewalls**

### **Testing Open Ports**

You can use tools like `telnet` or `nmap` to verify open ports:

```bash

nmap -p 80 localhost

```

### **Checking Logs**

Firewall logs are helpful for troubleshooting. Check them using:

```bash

sudo journalctl -xe | grep firewalld

```

---

## **10. Best Practices for Firewall Management on AlmaLinux**

1. **Minimize Open Ports:** Only open necessary ports for your applications.

2. **Use Appropriate Zones:** Assign interfaces to zones based on trust level.

3. **Enable Logging:** Use logging for troubleshooting and monitoring unauthorized access attempts.

4. **Automate with Scripts:** For repetitive tasks, create scripts to manage firewall rules.

5. **Regularly Audit Settings:** Periodically review firewall rules and configurations.

---

## **Conclusion**

Configuring the firewall, ports, and zones on AlmaLinux is crucial for maintaining a secure system. Firewalld’s flexibility and zone-based approach simplify the process, whether you’re managing a single server or a complex network. By following this guide, you can set up and use firewalld effectively, ensuring your AlmaLinux system remains secure and functional.

Do you have any questions or tips for managing firewalls on AlmaLinux? Share them in the comments below!
