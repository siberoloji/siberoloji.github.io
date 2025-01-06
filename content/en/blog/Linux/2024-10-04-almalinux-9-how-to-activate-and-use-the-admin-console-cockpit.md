---
draft: false
title: "AlmaLinux 9: How to Activate and Use the Admin Console Cockpit"
date: 2024-10-04T17:25:34+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-activate-and-use-the-admin-console-cockpit/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - cockpit
  - how-to guides
  - linux how-to
---


**AlmaLinux 9**, a popular RHEL-based Linux distribution, is known for its stability, enterprise-ready environment, and security features. One powerful tool that administrators can leverage for managing AlmaLinux systems is the **Cockpit Admin Console**. Cockpit provides a web-based graphical interface that simplifies system monitoring and management tasks. Whether you're managing a single server or an entire fleet of systems, Cockpit makes essential tasks like managing storage, services, logs, and network settings more accessible.



In this blog post, we'll cover how to activate and use the **Cockpit Admin Console** in AlmaLinux 9, walking you through everything from installation to its various use cases.





Table of Contents


* Introduction to Cockpit in AlmaLinux 9

* Why Use Cockpit?

* How to Install and Activate Cockpit in AlmaLinux 9

* Accessing the Cockpit Web Interface

* Managing Services Using Cockpit

* Monitoring System Resources

* Networking and Firewall Management with Cockpit

* Storage and File System Management

* Security Features in Cockpit

* Conclusion






1. Introduction to Cockpit in AlmaLinux 9



**Cockpit** is a web-based server management tool that allows administrators to manage Linux systems via a browser-based interface. It provides an easy-to-use interface while still giving users the ability to execute common administrative tasks such as managing services, configuring network settings, monitoring system performance, and much more.



For AlmaLinux 9, Cockpit offers the following features:


* System monitoring with CPU, memory, and disk usage insights.

* Management of services, containers, and users.

* Network and firewall configuration.

* Log management and troubleshooting.






2. Why Use Cockpit?



While many administrators prefer the command-line interface (CLI) for system management, Cockpit offers several advantages:


* **Ease of Use**: Cockpit provides a user-friendly graphical interface accessible from a web browser.

* **Remote Management**: You can manage your AlmaLinux 9 system from any remote location using a secure web interface.

* **Live Updates**: Cockpit offers real-time monitoring of system status, including logs, system metrics, and storage information.

* **No Learning Curve for New Users**: Beginners or users unfamiliar with Linux can easily navigate the interface to manage the system without diving deep into complex CLI commands.






3. How to Install and Activate Cockpit in AlmaLinux 9



By default, Cockpit might already be installed on your AlmaLinux 9 system. However, if it's not, the installation process is straightforward.


#### Step 1: Install Cockpit



First, check whether Cockpit is already installed:


```bash
sudo systemctl status cockpit```



If it’s not installed, you can install it using the **dnf** package manager:


```bash
sudo dnf install cockpit```


#### Step 2: Enable the Cockpit Service



Once installed, you need to enable Cockpit so that it starts on boot. Use the following command to enable and start the Cockpit service:


```bash
sudo systemctl enable --now cockpit.socket```



The `--now` flag ensures that the service is started immediately.


#### Step 3: Allow Cockpit in the Firewall



Cockpit uses port **9090** to provide access to its web interface. Ensure that your firewall allows access to this port:


```bash
sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload
```



With Cockpit installed, enabled, and the firewall configured, you are now ready to access the web interface.





4. Accessing the Cockpit Web Interface



After setting up Cockpit, you can access it through your web browser.


#### Step 1: Open the Cockpit Web Interface



Open a browser and navigate to the following URL:


```bash
https://&lt;your-server-ip&gt;:9090```



Replace `&lt;your-server-ip&gt;` with the IP address or hostname of your AlmaLinux 9 server. If you’re working locally, you can use `https://localhost:9090`.


#### Step 2: Log in to Cockpit



You will be prompted to enter the **root** credentials or a user account with **sudo** privileges. If your system has SELinux enabled, ensure that SELinux policies allow web-based administrative tools to function properly.



You may also see a warning about the security certificate. Since Cockpit uses a self-signed certificate by default, you can proceed by adding an exception in your browser.





5. Managing Services Using Cockpit



Once logged in, you will be greeted with the Cockpit dashboard, where you can monitor and manage various system functions.


#### Viewing and Controlling Services



From the main dashboard, click on the **Services** section. Here you can:


* **Start**, **stop**, **restart**, or **disable** services.

* View the status of each service (whether running or inactive).

* Manage systemd services, which makes it easy to perform tasks without needing to memorize or type commands in the terminal.




For example, if you want to restart the **Apache HTTP Server** (`httpd`), you can do it with a single click in Cockpit’s interface, instead of using the command:


```bash
sudo systemctl restart httpd
```





6. Monitoring System Resources



One of the key features of Cockpit is real-time system monitoring. This includes:


* **CPU usage**: Displays the current and historical CPU load.

* **Memory usage**: Shows the current memory allocation and swap usage.

* **Disk I/O**: Provides insights into disk operations per second and throughput.

* **Processes**: Allows you to monitor active processes and their resource consumption.




This section is particularly useful for diagnosing performance bottlenecks or monitoring long-term resource usage trends.





7. Networking and Firewall Management with Cockpit



Managing networking through Cockpit is another major feature.


#### Configuring Network Interfaces



In the **Networking** tab, you can:


* View active and inactive network interfaces.

* Configure static IP addresses or switch to **DHCP**.

* Monitor real-time network traffic on each interface.




This is especially helpful for administrators managing remote servers, as it eliminates the risk of losing SSH access due to misconfigured network settings.


#### Managing Firewall Rules



Cockpit integrates firewall management, allowing you to:


* Add or remove **firewall rules**.

* Open or close ports.

* Enable or disable specific services (like SSH, HTTP, etc.).




Instead of running commands like `firewall-cmd`, you can handle all firewall settings visually through the web interface.





8. Storage and File System Management



Cockpit simplifies storage management tasks that might otherwise involve a series of complex commands.


#### Viewing Disks and File Systems



In the **Storage** section, you can:


* View mounted file systems and available disk space.

* Create, format, and manage partitions.

* Monitor **RAID** arrays, if applicable.




Additionally, you can configure LVM (Logical Volume Management) to manage volumes, making it easier to resize file systems without using the CLI.





9. Security Features in Cockpit



Cockpit provides several security-related features to help you manage and protect your system.


#### User Management



In the **Accounts** section, you can:


* Add or remove users.

* Set user privileges (standard user or admin).

* Enable or disable **sudo** access for specific users.



#### Viewing System Logs



The **Logs** section aggregates all system logs in one place, allowing you to review security events, errors, and other important messages. This centralized log viewing feature simplifies troubleshooting and system auditing.


#### System Updates



Cockpit also allows you to manage system updates. You can check for updates, apply them, and even schedule updates to ensure that your system remains secure and up to date.





10. Conclusion



The **Cockpit Admin Console** in AlmaLinux 9 is a powerful tool that simplifies server management by providing a clean, easy-to-use graphical interface. From monitoring system performance and managing services to configuring network settings and securing your server, Cockpit offers a comprehensive management solution that can benefit both seasoned administrators and newcomers alike.



By enabling and using Cockpit, you can reduce the time spent on routine maintenance tasks and make system administration more efficient—whether you're working on a single server or managing an entire infrastructure.



Now that you know how to activate and use Cockpit, take advantage of this tool to streamline your workflow and ensure your AlmaLinux 9 system remains healthy and secure.
