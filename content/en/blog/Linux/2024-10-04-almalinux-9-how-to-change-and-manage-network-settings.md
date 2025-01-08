---
draft: false
title: "AlmaLinux 9: How to Change and Manage Network Settings"
date: 2024-10-04T14:44:58+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-change-and-manage-network-settings/
post_views_count:
  - "0"
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
---


Network configuration is a critical aspect of managing a server, especially in environments where performance, security, and connectivity are paramount. **AlmaLinux 9**, a stable and reliable CentOS alternative, offers several tools and methods to configure and manage network settings, ranging from command-line utilities to graphical tools. In this blog post, we will walk through how to change and manage network settings in AlmaLinux 9, focusing on both basic and advanced configurations.



Table of Contents


* Introduction to Network Configuration in AlmaLinux 9

* Understanding NetworkManager and Network Tools

* Viewing Current Network Settings

* Configuring Network Interfaces (Static and DHCP)

* Configuring DNS and Hostname

* Managing Network Interfaces Using nmcli

* Troubleshooting Network Issues

* Best Practices for Network Management in AlmaLinux 9

* Conclusion

1. Introduction to Network Configuration in AlmaLinux 9



Configuring network settings in **AlmaLinux 9** involves managing the system's network interfaces, routing, DNS, and hostname settings. These configurations enable your server to communicate effectively with other machines over a network, whether it's a private local area network (LAN) or the broader internet.



AlmaLinux 9 uses **NetworkManager** as its primary tool for managing network settings. NetworkManager simplifies the task of configuring and monitoring network interfaces, allowing administrators to manage connections both through a graphical interface and via the command line.
2. Understanding NetworkManager and Network Tools



**NetworkManager** is the default service for managing network interfaces in AlmaLinux 9. It allows you to manage Ethernet, Wi-Fi, mobile broadband, and VPN connections. It provides both command-line and graphical user interfaces, making it versatile for various use cases.


* **nmcli**: A command-line tool to interact with NetworkManager.

* **nmtui**: A text-based user interface tool that provides an easier, interactive way to manage network settings from the terminal.

* **ifconfig**: A deprecated tool but still available for viewing interface details.

* **ip**: A modern replacement for `ifconfig` that can be used for network interface and routing configurations.




Before changing network settings, it's important to understand the current configuration, which brings us to the next step.
3. Viewing Current Network Settings



Before making any changes, it’s useful to inspect the current network configuration. You can use a variety of commands to do this.


#### Viewing Active Network Interfaces



To list all active network interfaces on your system, use the `nmcli` or `ip` command.


```bash
nmcli device status
```



This will display a list of all network interfaces, along with their connection status.



Alternatively, you can use:


```bash
ip addr```



This command will give you detailed information about all available network interfaces, including their IP addresses.


#### Displaying Routing Table



To view the routing table and see how your network traffic is routed:


```bash
ip route```



This will display the default gateway and other routing information, which is essential for understanding how the network is configured.


#### Checking DNS Configuration



To check the DNS settings, you can inspect the `/etc/resolv.conf` file:


```bash
cat /etc/resolv.conf```



This file lists the nameservers your system uses to resolve domain names to IP addresses.
4. Configuring Network Interfaces (Static and DHCP)



Network interfaces in AlmaLinux 9 can be configured to use either **DHCP (Dynamic Host Configuration Protocol)** or a **static IP address**. In a DHCP setup, the server automatically assigns an IP address, while a static IP configuration requires manual settings for the IP, netmask, gateway, and DNS.


#### Configuring a Static IP Address



To configure a network interface with a static IP address, use `nmcli`. First, identify the network interface you want to configure:


```bash
nmcli device status
```



Assume your network interface is named `ens33`. To assign a static IP, use the following command:


```bash
nmcli con mod ens33 ipv4.addresses 192.168.1.100/24
nmcli con mod ens33 ipv4.gateway 192.168.1.1
nmcli con mod ens33 ipv4.dns 8.8.8.8
nmcli con mod ens33 ipv4.method manual
```



Finally, bring the connection up:


```bash
nmcli con up ens33```



This command sets a static IP address of `192.168.1.100`, with a subnet mask of `/24`, and configures `192.168.1.1` as the default gateway and Google's DNS `8.8.8.8`.


#### Configuring DHCP



To configure the same network interface to use DHCP, you can switch the interface back to automatic configuration:


```bash
nmcli con mod ens33 ipv4.method auto
nmcli con up ens33```



This tells NetworkManager to obtain an IP address automatically from the DHCP server.
5. Configuring DNS and Hostname



Correctly configuring DNS and the system's hostname is crucial for ensuring proper network communication.


#### Changing DNS Servers



DNS servers can be configured using `nmcli`. For example, to set Google's DNS servers (`8.8.8.8` and `8.8.4.4`), you can modify the connection like this:


```bash
nmcli con mod ens33 ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con up ens33```



This updates the DNS servers for the `ens33` interface.


#### Changing Hostname



To change the hostname in AlmaLinux 9, use the `hostnamectl` command:


```bash
sudo hostnamectl set-hostname new-hostname```



Replace `new-hostname` with the desired hostname for your server. This will change the system’s hostname, and you can verify the change by typing:


```bash
hostnamectl
```
6. Managing Network Interfaces Using nmcli



The **nmcli** tool provides extensive capabilities for managing network connections. Let's cover a few common tasks using `nmcli`.


#### Listing All Network Connections



To see all network connections (both active and inactive):


```bash
nmcli con show```



This lists all the available connections configured on your system.


#### Creating a New Network Connection



To create a new connection with a static IP address:


```bash
nmcli con add type ethernet ifname ens33 con-name static-con ipv4.addresses 192.168.1.101/24 ipv4.gateway 192.168.1.1 ipv4.dns 8.8.8.8 ipv4.method manual
```



This command adds a new connection named `static-con` for the `ens33` interface.


#### Bringing Up and Down Network Connections



To bring a connection down (disconnect):


```bash
nmcli con down ens33```



To bring the connection back up:


```bash
nmcli con up ens33```
7. Troubleshooting Network Issues



Even with careful configuration, network issues can arise. Here are some common troubleshooting techniques:


#### Checking the Status of NetworkManager



First, verify that **NetworkManager** is running:


```bash
systemctl status NetworkManager```



If it's not running, you can start it with:


```bash
sudo systemctl start NetworkManager```


#### Testing Connectivity



Use the `ping` command to check basic connectivity:


```bash
ping 8.8.8.8```



This tests whether the server can reach Google’s DNS servers. If this fails, it might indicate a problem with your gateway or ISP.


#### Reviewing Logs



Check system logs for any network-related errors:


```bash
journalctl -xe | grep NetworkManager```



This will show detailed logs of network-related events.
8. Best Practices for Network Management in AlmaLinux 9


* **Use Static IP for Servers**: For production servers, always configure a static IP to ensure consistent access to the system.

* **Minimize Manual Configuration**: Leverage `nmcli` or `nmtui` for most network configurations to avoid manual editing of configuration files.

* **Monitor Network Connections**: Regularly monitor network interfaces, DNS configurations, and routing tables to identify potential misconfigurations.

* **Backup Configurations**: Before making any changes to your network settings, ensure you have a backup of the current configuration to revert to in case something goes wrong.

* **Use NetworkManager**: Stick with **NetworkManager** as it simplifies managing complex networking setups compared to older tools like `ifconfig`.

9. Conclusion



Configuring and managing network settings in **AlmaLinux 9** is straightforward when using the **NetworkManager** service and its associated tools like **nmcli**. By understanding how to configure network interfaces, manage DNS, and troubleshoot potential issues, you can ensure that your AlmaLinux server is well-connected and operating efficiently.



Whether you're setting up a server with a static IP or relying on DHCP for dynamic configurations, following best practices in network management will help keep your AlmaLinux 9 systems stable and secure.
