---
title: Bob’s Journey into Network Services and Configuration on AlmaLinux
linkTitle: Network Services
description: After learning the basics of network troubleshooting, Bob realizes there’s a lot more to understand about network services. Setting up services like HTTP, FTP, and SSH isn’t just for experienced sysadmins; it’s an essential skill that will make him more versatile.
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 120
toc: true
keywords:
  - Network Services on AlmaLinux
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-journey-network-services-configuration-on-alma-linux
---

Let’s dive into Chapter 12, *“Bob’s Journey into Network Services and Configuration”*, where Bob will learn the basics of configuring network services on AlmaLinux. This chapter will cover setting up essential services, managing them, and troubleshooting network configurations.

---

## **1. Introduction: Bob’s Networking Quest**

After learning the basics of network troubleshooting, Bob realizes there’s a lot more to understand about network services. Setting up services like HTTP, FTP, and SSH isn’t just for experienced sysadmins; it’s an essential skill that will make him more versatile. Today, Bob will dive into configuring and managing network services on AlmaLinux.

> *“Let’s get these services up and running!”* Bob says, ready to level up his networking skills.

---

## **2. Setting Up SSH for Remote Access**

Bob starts by revisiting **SSH (Secure Shell)**, a critical service for remote access and management.

- **Checking SSH Installation**: SSH is usually pre-installed, but Bob confirms it’s active:

  ```bash
  sudo systemctl status sshd
  ```

  If inactive, he starts and enables it:

  ```bash
  sudo systemctl start sshd
  sudo systemctl enable sshd
  ```

- **Configuring SSH**: To improve security, Bob decides to change the default SSH port. He edits the SSH configuration file:

  ```bash
  sudo nano /etc/ssh/sshd_config
  ```

  He changes the line `#Port 22` to a new port, like `Port 2222`, and saves the file.

- **Restarting SSH**: Bob restarts the service to apply changes:

  ```bash
  sudo systemctl restart sshd
  ```

  He notes that his firewall needs to allow the new port to maintain access.

> *“I can customize SSH settings to make remote access safer,”* Bob says, feeling empowered by his control over SSH.

---

## **3. Setting Up an HTTP Server with Apache**

Bob’s next task is setting up an **HTTP server** using Apache, one of the most widely-used web servers.

- **Installing Apache**: To install Apache, he runs:

  ```bash
  sudo dnf install httpd
  ```

- **Starting and Enabling Apache**: He starts Apache and enables it to run at boot:

  ```bash
  sudo systemctl start httpd
  sudo systemctl enable httpd
  ```

- **Configuring Firewall for HTTP**: To allow HTTP traffic, Bob opens port 80 in the firewall:

  ```bash
  sudo firewall-cmd --permanent --add-service=http
  sudo firewall-cmd --reload
  ```

- **Testing the Setup**: Bob opens a web browser and visits `http://localhost`. Seeing the Apache test page confirms that the HTTP server is running.

> *“I’m officially hosting a web server!”* Bob says, excited by his new skill.

---

## **4. Configuring FTP for File Transfers**

Bob’s next goal is to set up **FTP (File Transfer Protocol)** to allow users to upload and download files from his server.

- **Installing vsftpd**: He installs `vsftpd` (Very Secure FTP Daemon), a popular FTP server for Linux:

  ```bash
  sudo dnf install vsftpd
  ```

- **Starting and Enabling vsftpd**: Bob starts the FTP service and enables it to run on startup:

  ```bash
  sudo systemctl start vsftpd
  sudo systemctl enable vsftpd
  ```

- **Configuring Firewall for FTP**: To allow FTP connections, he opens ports 20 and 21:

  ```bash
  sudo firewall-cmd --permanent --add-service=ftp
  sudo firewall-cmd --reload
  ```

- **Testing FTP Access**: Bob tests the FTP connection using the command:

  ```bash
  ftp localhost
  ```

  He successfully connects and can upload/download files as expected.

> *“FTP is a classic, but still useful for quick file transfers,”* Bob notes, happy to have FTP in his toolkit.

---

## **5. Managing Network Services with `systemctl`**

With several network services now running, Bob realizes it’s essential to manage them effectively. He uses **`systemctl`** to start, stop, enable, and disable services as needed.

- **Listing Active Services**: Bob lists all active services to ensure everything is running as expected:

  ```bash
  sudo systemctl list-units --type=service
  ```

- **Stopping and Disabling Unnecessary Services**: To conserve resources, he stops any unneeded services:

  ```bash
  sudo systemctl stop <service-name>
  sudo systemctl disable <service-name>
  ```

> *“With `systemctl`, I have complete control over which services are running,”* Bob says, feeling more organized.

---

## **6. Configuring DNS with `dnsmasq`**

Bob learns that **DNS (Domain Name System)** can also be configured on his system, allowing it to act as a mini-DNS server or cache.

- **Installing dnsmasq**: To configure DNS services, Bob installs `dnsmasq`, a lightweight DNS forwarder and DHCP server:

  ```bash
  sudo dnf install dnsmasq
  ```

- **Configuring dnsmasq**: Bob edits the `dnsmasq` configuration file to enable DNS caching:

  ```bash
  sudo nano /etc/dnsmasq.conf
  ```

  He sets a simple cache limit:

  ```bash
  cache-size=1000
  ```

- **Starting dnsmasq**: After saving changes, he starts `dnsmasq`:

  ```bash
  sudo systemctl start dnsmasq
  sudo systemctl enable dnsmasq
  ```

> *“With DNS caching, I can speed up name resolution and reduce network load,”* Bob notes, proud of his new DNS skills.

---

## **7. Troubleshooting Common Network Issues**

Now that he’s running several network services, Bob wants to be prepared to troubleshoot any connectivity issues.

- **Checking Service Status**: Bob confirms each service is active and running:

  ```bash
  sudo systemctl status httpd
  sudo systemctl status vsftpd
  ```

- **Using `netstat` to View Open Ports**: Bob verifies that the correct ports are open by listing all active connections:

  ```bash
  sudo netstat -tuln
  ```

- **Checking Logs**: If he encounters issues, he checks service logs for error messages:

  ```bash
  sudo journalctl -u httpd
  sudo journalctl -u vsftpd
  ```

> *“Logs are my best friend when it comes to troubleshooting,”* Bob says, feeling prepared for any issues that come his way.

---

## **8. Conclusion: Bob’s Network Services Expertise**

With SSH, HTTP, FTP, and DNS configured, Bob has a solid foundation in network services on AlmaLinux. He’s learned to set up, secure, and troubleshoot services, ensuring his system is well-connected and ready for anything.

> Next, Bob is eager to learn more about **setting up a database server** to expand his server management skills.

*Stay tuned for the next chapter: "Bob Sets Up a Database Server!"*
