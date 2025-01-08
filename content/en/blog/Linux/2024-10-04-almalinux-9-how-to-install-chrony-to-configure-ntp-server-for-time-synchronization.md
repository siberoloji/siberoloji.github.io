---
draft: false
title: "AlmaLinux 9: How to Install Chrony to Configure NTP Server for Time Synchronization"
date: 2024-10-04T17:30:25+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-install-chrony-to-configure-ntp-server-for-time-synchronization/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
  - ntp server
---


Time synchronization is essential for maintaining the accuracy of time across multiple systems, especially in network environments. Consistent time settings are crucial for system logs, security protocols, file timestamps, and even distributed systems. In AlmaLinux 9, **Chrony** is the recommended tool for time synchronization. Chrony is a versatile and lightweight implementation of **Network Time Protocol (NTP)**, offering fast and accurate synchronization, even for systems with occasional network disconnections.



This guide will walk you through the installation of **Chrony**, configuring it as an NTP server, and how to verify that time synchronization is functioning correctly on AlmaLinux 9.
Table of Contents


* Introduction to Time Synchronization and NTP

* Why Choose Chrony over Other NTP Solutions?

* Installing Chrony on AlmaLinux 9

* Configuring Chrony as an NTP Server

* Allowing Client Systems to Sync Time with Chrony

* Verifying Time Synchronization

* Troubleshooting Common Issues with Chrony

* Best Practices for Time Synchronization in AlmaLinux 9

* Conclusion

1. Introduction to Time Synchronization and NTP



**Network Time Protocol (NTP)** is a protocol designed to synchronize clocks across a network. For distributed computing environments, having accurate time across all systems is essential to ensure the smooth functioning of applications, security services, databases, and event logging.



Traditionally, the **ntpd** daemon was used for this purpose. However, **Chrony** has emerged as a faster, more accurate, and flexible replacement, particularly in environments where systems experience periodic network outages or are connected to a network with high latency.
2. Why Choose Chrony Over Other NTP Solutions?



Chrony offers several advantages over traditional NTP solutions like **ntpd**:


* **Faster Synchronization**: Chrony can quickly adjust the system clock to the correct time, even if the initial clock drift is large.

* **Better Performance on Unstable Networks**: Chrony is optimized for environments where the server is disconnected from the network for extended periods, such as laptops or edge devices.

* **Low Resource Usage**: It is lightweight and uses fewer resources compared to other NTP implementations.

* **Robustness**: It can handle large time offsets without requiring a system reboot and adjusts the time smoothly rather than jumping straight to the correct time.




Given these benefits, Chrony is a perfect fit for AlmaLinux 9, ensuring efficient and reliable time management across server fleets.
3. Installing Chrony on AlmaLinux 9



Chrony is included in the default AlmaLinux 9 repositories, so installation is straightforward using the **dnf** package manager.


#### Step 1: Update Your System



Before installing Chrony, ensure your system is updated:


```bash
sudo dnf update -y
```


#### Step 2: Install Chrony



To install Chrony, use the following command:


```bash
sudo dnf install chrony -y
```


#### Step 3: Enable and Start the Chrony Service



Once installed, you need to enable Chrony to start automatically at boot and start the service:


```bash
sudo systemctl enable chronyd
sudo systemctl start chronyd
```


#### Step 4: Verify the Status of Chrony



To confirm that the Chrony service is running:


```bash
sudo systemctl status chronyd
```



You should see a message indicating that the Chrony service is active and running.
4. Configuring Chrony as an NTP Server



Chrony is configured via the **/etc/chrony.conf** file. This configuration file allows you to specify NTP servers, control access to the NTP service, and adjust synchronization parameters.


#### Step 1: Open the Chrony Configuration File



To modify the Chrony configuration, open the file in your favorite text editor:


```bash
sudo nano /etc/chrony.conf```


#### Step 2: Specify NTP Servers



By default, the file will contain a list of public NTP servers. You can add or replace these with your preferred servers. For example, to use the **pool.ntp.org** servers, ensure your configuration includes:


```bash
pool 2.centos.pool.ntp.org iburst```



The `iburst` option ensures that Chrony makes several requests in quick succession when the server is unreachable, improving the speed of initial synchronization.


#### Step 3: Configure Chrony as an NTP Server for Your Network



If you want to configure your AlmaLinux 9 server to serve time for other machines in your network, you will need to allow other systems to synchronize with it. Add the following lines to your **/etc/chrony.conf** file to allow access from a specific subnet:


```bash
allow 192.168.1.0/24```



This example grants access to all machines within the **192.168.1.0/24** subnet.


#### Step 4: Restart the Chrony Service



After making changes to the **/etc/chrony.conf** file, restart Chrony for the changes to take effect:


```bash
sudo systemctl restart chronyd
```
5. Allowing Client Systems to Sync Time with Chrony



If you’ve configured your AlmaLinux server to act as an NTP server, client systems in your network can now synchronize time with it.


#### Step 1: Install Chrony on Client Systems



Just like on the server, install Chrony on the client system:


```bash
sudo dnf install chrony -y
```


#### Step 2: Configure the Client to Use Your NTP Server



On each client, edit the **/etc/chrony.conf** file to include your AlmaLinux 9 server as the NTP server:


```bash
server <your-almalinux-server-ip> iburst```



Replace `<your-almalinux-server-ip>` with the IP address of the server you configured in Step 4.


#### Step 3: Start and Enable Chrony on the Client



Start the Chrony service on the client machine:


```bash
sudo systemctl enable --now chronyd
```
6. Verifying Time Synchronization



Once Chrony is configured, you can verify that the synchronization is working properly.


#### Step 1: Check Chrony Sources



On both the server and client systems, use the following command to view the list of NTP sources Chrony is using:


```bash
chronyc sources
```



You should see your NTP servers listed along with their status.


#### Step 2: Check Synchronization Status



To verify if the system clock is synchronized, use the following command:


```bash
chronyc tracking```



This command shows the current state of time synchronization, including the reference NTP server, current system time offset, and other important metrics.
7. Troubleshooting Common Issues with Chrony



If you run into issues with time synchronization, here are a few troubleshooting steps:


* **Check Firewall Settings**: Ensure that NTP traffic is allowed on your server by configuring your firewall to allow port **123/UDP**. You can use **firewall-cmd** to enable NTP on the firewall:



```bash
sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload
```


* **Verify Network Connectivity**: Ensure that the client can reach the NTP server over the network. Use `ping` or `telnet` to verify connectivity.

* **Check Log Files**: If Chrony is not working as expected, check the logs for more details:



```bash
journalctl -u chronyd
```
8. Best Practices for Time Synchronization in AlmaLinux 9



To ensure reliable time synchronization, follow these best practices:


* **Use Multiple NTP Servers**: Configure more than one NTP server for redundancy, ensuring accurate time even if one server becomes unreachable.

* **Monitor Time Drift**: Use tools like **chronyc tracking** to regularly monitor time drift and ensure accurate synchronization.

* **Ensure Firewall Rules**: Confirm that NTP traffic is allowed through firewalls on both server and client systems to prevent connectivity issues.

9. Conclusion



Chrony is a powerful and efficient tool for time synchronization in AlmaLinux 9, offering numerous advantages over traditional NTP solutions like **ntpd**. By following the steps in this guide, you can easily install and configure Chrony to act as both an NTP client and server. This ensures that your systems have accurate time synchronization, which is crucial for logging, security, and network operations.



By using Chrony, you not only improve the precision of your system’s timekeeping but also make your network more resilient to connection outages and time drifts. Ensure you follow best practices for time synchronization and regularly verify your setup to avoid any future issues.
