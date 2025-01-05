---
title: Bob Tackles Network Monitoring and Troubleshooting on AlmaLinux
linkTitle: Network Monitoring
description: Bob Tackles Network Monitoring and Troubleshooting where Bob will learn to diagnose and troubleshoot network issues using essential Linux network tools.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 60
toc: true
keywords: 
  - Network Monitoring
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-tackles-network-monitoring-troubleshooting-alma-linux
---

## 1. Introduction: Bob’s Network Challenge

One morning, Bob notices that his AlmaLinux system is having trouble connecting to a few critical servers. Sometimes it’s slow, and other times he can’t connect at all. His first instinct is to check the network, but he realizes he’s never done much troubleshooting for connectivity before.

> *“Time to roll up my sleeves and learn how networks work!”* Bob says with determination.

---

## 2. Network Basics: IP Addresses, DNS, and Subnetting

Bob starts with a crash course on networking. He learns that every device on a network has an **IP address**, a unique identifier for sending and receiving data. He also comes across **DNS** (Domain Name System), which translates website names into IP addresses. To get a basic understanding, Bob explores his network settings and takes note of his IP address, subnet mask, and DNS servers.

- **Checking IP Address**: Bob uses the `ip` command to check his system’s IP configuration:

  ```bash
  ip a
  ```

  He sees details like his **IP address** and **subnet mask**, which help him understand his device’s place in the network.

> *“Alright, I can see my IP address—let’s start troubleshooting!”* he thinks, feeling a little more confident.

---

## 3. Testing Connectivity with `ping`

Bob’s first troubleshooting tool is `ping`, a simple command that checks if a device can reach another device on the network.

- **Testing Internal Connectivity**: Bob tries pinging his router to see if he’s connected to his local network:

  ```bash
  ping 192.168.1.1
  ```

  He receives a response, confirming that his local network connection is working fine.

- **Testing External Connectivity**: Next, he pings a website (e.g., Google) to check his internet connection:

  ```bash
  ping google.com
  ```

  If he sees no response, he knows the issue might be with his DNS or internet connection.

> *“`Ping` is like asking, ‘Are you there?’ Very handy!”* Bob notes.

---

## 4. Tracing Network Paths with `traceroute`

To understand where his connection might be slowing down, Bob uses `traceroute`. This tool shows the path data takes to reach a destination and reveals where the delay might be happening.

- **Running `traceroute`**: Bob tries tracing the route to a website:

  ```bash
  traceroute google.com
  ```

  He sees each “hop” along the path, with IP addresses of intermediate devices and the time it takes to reach them. If any hop takes unusually long, it might be the source of the network slowdown.

> *“Now I can see exactly where the delay is happening—useful!”* Bob realizes, feeling empowered.

---

## 5. Analyzing Open Ports with `netstat`

Bob learns that sometimes network issues arise when certain ports are blocked or not working. He decides to use `netstat` to view active connections and open ports.

- **Listing Open Ports and Connections**: He runs:

  ```bash
  netstat -tuln
  ```

  - **`-t`** and **`-u`**: Show TCP and UDP connections.
  - **`-l`**: Shows only listening ports.
  - **`-n`**: Displays addresses in numerical form.

He sees a list of active ports, helping him identify if the port for a particular service is open or blocked.

> *“This will come in handy when a service won’t connect!”* Bob notes.

---

## 6. Configuring IP with `ifconfig` and `ip`

Bob decides to dig deeper into network settings by using `ifconfig` and `ip` to configure his IP and troubleshoot his network interface.

- **Viewing and Configuring IP with `ifconfig`**: Bob checks his network interface details:

  ```bash
  ifconfig
  ```

  He uses `ifconfig` to reset his IP or manually assign a static IP address if needed. However, he notes that `ifconfig` is a bit older and that `ip` is the modern command for this.

- **Using `ip` for Advanced Configuration**: Bob explores the `ip` command to make more precise configurations:

  ```bash
  ip addr show
  ```

  - **Assigning a New IP**: He can even assign a new IP if needed:

    ```bash
    sudo ip addr add 192.168.1.20/24 dev eth0
    ```

> *“Now I know how to manually set my IP if there’s ever an issue!”* Bob says, feeling prepared.

---

## 7. Checking and Restarting Network Services with `systemctl`

Finally, Bob realizes that sometimes network problems are due to services like `NetworkManager` or DNS that need to be restarted.

- **Checking Network Service Status**: Bob uses `systemctl` to check the status of his network services:

  ```bash
  systemctl status NetworkManager
  ```

  This lets him know if the service is active or has encountered any errors.

- **Restarting the Service**: If there’s an issue, he restarts the service:

  ```bash
  sudo systemctl restart NetworkManager
  ```

  This simple restart often solves connectivity issues by refreshing the network connection.

> *“Now I can restart network services myself—good to know!”* Bob says, happy to have this skill.

---

## 8. Conclusion: Bob’s Network Troubleshooting Toolkit

After learning `ping`, `traceroute`, `netstat`, `ifconfig`, and `systemctl`, Bob feels much more confident with network troubleshooting. He can check connectivity, trace data paths, view open ports, configure IPs, and restart network services—all essential skills for a junior sysadmin.

> But his journey isn’t over yet—next, he’s ready to dive into **system backup and recovery** to ensure his data stays safe.

*Stay tuned for the next adventure: "Bob Learns System Backup and Recovery!"*
