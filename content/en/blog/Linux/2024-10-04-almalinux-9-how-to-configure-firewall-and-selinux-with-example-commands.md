---
draft: false
title: "AlmaLinux 9: How to Configure Firewall and SELinux with Example Commands"
date: 2024-10-04T14:40:54+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-configure-firewall-and-selinux-with-example-commands/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
  - selinux
---


When setting up a server, security is a top priority, and two essential tools for system security in **AlmaLinux 9** are the **firewall** and **SELinux (Security-Enhanced Linux)**. Both tools protect your system from unauthorized access and vulnerabilities. In this blog, we'll walk through the steps to configure and manage the firewall and SELinux in AlmaLinux 9, using practical example commands.



Table of Contents


* Introduction to Firewalls and SELinux

* Installing and Enabling the Firewall

* Configuring Firewall with Example Commands

* Understanding SELinux in AlmaLinux 9

* Configuring SELinux with Example Commands

* Best Practices for Managing Firewall and SELinux

* Conclusion






1. Introduction to Firewalls and SELinux


#### What is a Firewall?



A **firewall** is a system that monitors and controls incoming and outgoing network traffic based on security rules. In AlmaLinux, the firewall is managed using `firewalld`, a dynamic tool that allows you to configure firewall rules without disrupting network connections.


#### What is SELinux?



**Security-Enhanced Linux (SELinux)** is a mandatory access control system that provides a robust mechanism for defining and enforcing security policies on your system. It restricts programs and services to only the resources they are supposed to access, providing an additional layer of protection.



Both firewall and SELinux are crucial for server security. While the firewall focuses on network traffic, SELinux controls permissions within the operating system. Let's start with configuring the firewall on AlmaLinux 9.





2. Installing and Enabling the Firewall



By default, AlmaLinux 9 comes with **`firewalld`** installed. However, if it's missing for any reason, you can easily install it using the package manager.


#### Install firewalld:


```bash
sudo dnf install firewalld
```



Once installed, enable and start the service to ensure it runs automatically upon system boot.


#### Enable and start firewalld:


```bash
sudo systemctl enable firewalld
sudo systemctl start firewalld
```



You can verify the firewall status using:


```bash
sudo firewall-cmd --state```



If everything is configured correctly, it should display `running`.





3. Configuring Firewall with Example Commands



Now that the firewall service is running, let's dive into configuring it. In AlmaLinux 9, `firewalld` is zone-based, which means it applies different rules based on zones (such as public, home, work, etc.). You can also define services, ports, and protocols within these zones.


#### List Available Zones:



To see all available zones, run:


```bash
sudo firewall-cmd --get-zones
```



By default, the firewall is set to the `public` zone. You can check the active zone with:


```bash
sudo firewall-cmd --get-active-zones
```


#### Allowing a Service



Let's say you want to allow SSH access. To do this, you'll need to enable the SSH service in the active zone.



Allow SSH in the public zone:


```bash
sudo firewall-cmd --zone=public --add-service=ssh --permanent```



The `--permanent` flag ensures that the rule persists after reboot. Without this flag, the change would only apply until the next system restart. After adding a service, reload the firewall to apply the changes:


```bash
sudo firewall-cmd --reload
```


#### Allowing a Port



Instead of allowing services, you can also open specific ports. For example, to allow traffic on port 8080 (commonly used by web applications), use:


```bash
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```


#### Blocking a Service or Port



To block a service or port, use the `--remove` option. For instance, to block HTTP access:


```bash
sudo firewall-cmd --zone=public --remove-service=http --permanent
sudo firewall-cmd --reload
```



You can use the same command to remove ports:


```bash
sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
sudo firewall-cmd --reload
```


#### Listing Active Rules



To check which services and ports are currently allowed:


```bash
sudo firewall-cmd --list-all
```



This will show a detailed breakdown of the services, ports, and protocols in the active zone.





4. Understanding SELinux in AlmaLinux 9


#### SELinux Modes



SELinux operates in three modes:


* **Enforcing:** SELinux policies are strictly enforced, and unauthorized actions are blocked.

* **Permissive:** SELinux allows actions but logs policy violations. This mode is useful for troubleshooting.

* **Disabled:** SELinux is turned off completely (not recommended for production environments).




To check the current SELinux mode, use:


```bash
sestatus
```



This will display whether SELinux is enforcing, permissive, or disabled.





5. Configuring SELinux with Example Commands


#### Changing SELinux Modes



To change the SELinux mode temporarily (until the next reboot), use the `setenforce` command. For example, to switch to **permissive** mode:


```bash
sudo setenforce 0```



To switch back to **enforcing** mode:


```bash
sudo setenforce 1```



If you want to make a permanent change, edit the SELinux configuration file located at `/etc/selinux/config`:


```bash
sudo nano /etc/selinux/config```



Find the line that begins with `SELINUX=` and change it to one of the following values:


* `SELINUX=enforcing`

* `SELINUX=permissive`

* `SELINUX=disabled`




After making changes, save the file and reboot the system for the new mode to take effect.


#### Managing SELinux Policies



SELinux policies define what actions are allowed for each process and service. If SELinux is blocking legitimate actions, you can modify policies to allow those actions.



For example, suppose you're hosting a web server, and SELinux is blocking HTTP access. You can set the appropriate SELinux context for the web directory with the following command:


```bash
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"
sudo restorecon -Rv /var/www/html
```



In this case, `httpd_sys_content_t` is the default type for files that the web server (`httpd`) can access.


#### Viewing SELinux Alerts



To view SELinux alerts (denials), use the following command:


```bash
sudo ausearch -m avc```



This will show a log of denied actions, which is helpful for troubleshooting when SELinux is blocking legitimate processes.





6. Best Practices for Managing Firewall and SELinux



To ensure maximum security and efficiency, consider the following best practices when managing your firewall and SELinux in AlmaLinux 9:


* **Minimize Open Ports:** Only open necessary ports and services to reduce your system’s attack surface.

* **Use Zones Effectively:** Assign different zones for different network interfaces (e.g., public, trusted) to apply appropriate rules.

* **Monitor SELinux Logs:** Regularly check SELinux logs to identify and address potential issues without compromising security.

* **Test Before Enforcing:** When configuring SELinux policies, use permissive mode to test before switching to enforcing mode.

* **Regular Updates:** Keep both your firewall rules and SELinux policies up to date with the latest security patches.






7. Conclusion



Configuring the firewall and SELinux in AlmaLinux 9 is essential for securing your server. The firewall helps you control network traffic, while SELinux adds another layer of defense by enforcing strict access controls within the operating system. With the example commands provided in this guide, you should be able to configure both tools to meet your security needs.



Always remember that security is a continuous process, and maintaining a secure system requires regular monitoring, updating rules, and adjusting policies as needed.



By following the steps in this guide, you'll significantly enhance the security of your AlmaLinux 9 system.
