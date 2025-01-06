---
draft: false
title: Bob Explores Advanced Networking on AlmaLinux
linkTitle: Advanced Networking
keywords:
  - Advanced Networking on AlmaLinux
description: His manager wanted a server that could handle VLANs, bridging, and advanced network configurations.
date: 2024-11-25
url: bob-explores-advanced-networking-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 760


featured_image: /images/bobs-adventures-with-alma-linux.png
---
### **Bob Explores Advanced Networking on AlmaLinux**

With his file-sharing setup complete, Bob turned his focus to **advanced networking**. His manager wanted a server that could handle **VLANs (Virtual Local Area Networks)**, **bridging**, and advanced network configurations. Bob was eager to learn how to manage and optimize network traffic on AlmaLinux.

> *“Networking is the backbone of any system—I’m ready to become the backbone specialist!”* Bob said, diving into advanced networking.

---

### **Chapter Outline: "Bob Explores Advanced Networking"**

1. **Introduction: Why Advanced Networking?**
   - The importance of VLANs, bridging, and advanced configurations.
   - Tools available on AlmaLinux.

2. **Setting Up VLANs**
   - Understanding VLANs and their use cases.
   - Configuring VLANs on AlmaLinux.

3. **Configuring Network Bridges**
   - What is a network bridge?
   - Setting up a bridge for virtualization.

4. **Using `nmcli` for Advanced Network Management**
   - Configuring connections with `nmcli`.
   - Creating profiles for different network setups.

5. **Testing and Monitoring Network Configurations**
   - Using `tcpdump` and `ping` for testing.
   - Monitoring with `nload` and `iftop`.

6. **Conclusion: Bob Reflects on Networking Mastery**

---

### **Part 1: Introduction: Why Advanced Networking?**

Bob learned that advanced networking concepts like VLANs and bridging are critical for efficient network segmentation, traffic control, and virtualization.

#### **Key Concepts**

- **VLANs**: Separate a physical network into multiple logical networks for better security and performance.
- **Bridges**: Connect multiple network interfaces to allow traffic to flow between them, often used in virtualized environments.

> *“Understanding VLANs and bridges will level up my networking skills!”* Bob thought.

---

### **Part 2: Setting Up VLANs**

#### **Step 1: Installing Required Tools**

- Ensure the `NetworkManager` and `vconfig` tools are installed:

  ```bash
  sudo dnf install -y NetworkManager
  ```

#### **Step 2: Configuring a VLAN Interface**

Bob wanted to create VLAN **ID 100** on the Ethernet interface `enp0s3`.

- Create the VLAN configuration file:

  ```bash
  sudo nano /etc/sysconfig/network-scripts/ifcfg-enp0s3.100
  ```

- Add the following content:

  ```plaintext
  DEVICE=enp0s3.100
  BOOTPROTO=none
  ONBOOT=yes
  VLAN=yes
  IPADDR=192.168.100.1
  PREFIX=24
  ```

- Restart the network:

  ```bash
  sudo nmcli connection reload
  sudo systemctl restart NetworkManager
  ```

- Verify the VLAN interface:

  ```bash
  ip -d link show enp0s3.100
  ```

#### **Step 3: Testing VLAN Connectivity**

Bob ensured the VLAN was working by pinging another device on the same VLAN:

```bash
ping 192.168.100.2
```

> *“VLAN configured—network traffic stays clean and organized!”* Bob said.

---

### **Part 3: Configuring Network Bridges**

#### **Step 1: Creating a Bridge**

Bob needed a bridge named `br0` for connecting virtual machines.

- Create the bridge configuration file:

  ```bash
  sudo nano /etc/sysconfig/network-scripts/ifcfg-br0
  ```

- Add the following content:

  ```plaintext
  DEVICE=br0
  TYPE=Bridge
  BOOTPROTO=dhcp
  ONBOOT=yes
  ```

#### **Step 2: Adding an Interface to the Bridge**

- Edit the configuration file for the interface (`enp0s3`):

  ```bash
  sudo nano /etc/sysconfig/network-scripts/ifcfg-enp0s3
  ```

- Modify it to join the bridge:

  ```plaintext
  DEVICE=enp0s3
  BOOTPROTO=none
  ONBOOT=yes
  BRIDGE=br0
  ```

#### **Step 3: Restarting the Network**

Bob restarted the network to apply the changes:

```bash
sudo systemctl restart NetworkManager
```

#### **Step 4: Verifying the Bridge**

- Check the bridge:

  ```bash
  brctl show
  ```

- Verify the IP address:

  ```bash
  ip addr show br0
  ```

> *“With the bridge configured, my virtual machines can now talk to the external network!”* Bob said.

---

### **Part 4: Using `nmcli` for Advanced Network Management**

Bob discovered that `nmcli` simplifies network configuration and allows scripting for repeatable setups.

#### **Step 1: Listing Available Connections**

- View active and available connections:

  ```bash
  nmcli connection show
  ```

#### **Step 2: Creating a Static IP Configuration**

Bob created a static IP profile for a server interface:

- Add a new connection:

  ```bash
  nmcli connection add con-name static-ip ifname enp0s3 type ethernet ip4 192.168.1.100/24 gw4 192.168.1.1
  ```

- Activate the connection:

  ```bash
  nmcli connection up static-ip
  ```

#### **Step 3: Viewing Connection Details**

- Show detailed information about a connection:

  ```bash
  nmcli connection show static-ip
  ```

> *“`nmcli` is my new go-to tool for network automation!”* Bob said.

---

### **Part 5: Testing and Monitoring Network Configurations**

#### **Step 1: Using `tcpdump` to Capture Packets**

- Install `tcpdump`:

  ```bash
  sudo dnf install -y tcpdump
  ```

- Capture packets on a specific interface:

  ```bash
  sudo tcpdump -i enp0s3
  ```

#### **Step 2: Monitoring Traffic with `nload`**

- Install `nload` for real-time traffic monitoring:

  ```bash
  sudo dnf install -y nload
  ```

- Monitor traffic:

  ```bash
  nload
  ```

#### **Step 3: Checking Bandwidth with `iftop`**

- Install `iftop`:

  ```bash
  sudo dnf install -y iftop
  ```

- View bandwidth usage:

  ```bash
  sudo iftop -i enp0s3
  ```

> *“With these tools, I can monitor and troubleshoot network traffic like a pro!”* Bob said.

---

### **Conclusion: Bob Reflects on Networking Mastery**

Bob successfully configured VLANs, bridges, and advanced network setups, enabling seamless connectivity and traffic management. With tools like `nmcli`, `tcpdump`, and `iftop`, he felt confident diagnosing and optimizing his network.

> Next, Bob plans to explore **Linux Performance Monitoring and Tuning** on AlmaLinux.
