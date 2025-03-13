---
draft: true
title: How to Set Up Network Monitoring with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Network Monitoring
translationKey: how-to-set-up-network-monitoring-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up network monitoring on Linux Mint with the Cinnamon Desktop. Monitor bandwidth usage, detect suspicious connections, and troubleshoot connectivity issues.
url: how-to-set-up-network-monitoring-with-cinnamon-desktop-on-linux-mint
weight: 90
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - network monitoring
featured_image: /images/linuxmint1.webp
---
Linux Mint is a popular and user-friendly Linux distribution known for its stability, efficiency, and ease of use. If you're using the Cinnamon Desktop environment, you might want to monitor your network activity to track bandwidth usage, detect suspicious connections, or troubleshoot connectivity issues. Fortunately, Linux Mint provides several built-in tools and third-party applications that make network monitoring easy.  

In this guide, we'll walk you through how to set up network monitoring on Linux Mint with the Cinnamon Desktop.  

---

## **Why Monitor Your Network on Linux Mint?**  

Before diving into the setup process, let’s understand why network monitoring is essential:  

- **Bandwidth Usage Tracking**: Keep an eye on data consumption and avoid overusing your internet connection.  
- **Security & Intrusion Detection**: Identify unauthorized access attempts and unusual network activity.  
- **Troubleshooting**: Diagnose and resolve slow internet speeds, dropped connections, and packet loss.  
- **Performance Optimization**: Optimize network configurations for better speed and stability.  

With these benefits in mind, let’s explore different methods to monitor your network on Linux Mint with the Cinnamon Desktop.  

---

## **Method 1: Using System Monitor for Basic Network Monitoring**  

Linux Mint includes a built-in **System Monitor**, which provides basic network statistics.  

### **Steps to Use System Monitor**  

1. **Open System Monitor**:  
   - Press `Super` (Windows key) and type **System Monitor**, then open it.  
2. **Navigate to the Resources Tab**:  
   - Click on the **Resources** tab.  
   - You will see network activity graphs showing incoming and outgoing traffic.  
3. **Interpret Data**:  
   - Observe network usage trends over time.  
   - Identify any unusual spikes in bandwidth consumption.  

> **Limitations**: The built-in System Monitor only provides real-time statistics without historical logging or detailed connection insights.  

---

## **Method 2: Installing and Using "nload" for Real-Time Bandwidth Monitoring**  

If you prefer a command-line tool for lightweight, real-time monitoring, **nload** is a great choice.  

### **Installing nload**  

Open a terminal and type:  

```bash
sudo apt update && sudo apt install nload -y
```  

### **Running nload**  

Once installed, run:  

```bash
nload
```  

This displays two graphs for **incoming (download)** and **outgoing (upload)** bandwidth. It updates in real-time and provides an overview of current and average data rates.  

> **Tip**: Press `q` to exit nload.  

---

## **Method 3: Using "iftop" for Detailed Network Monitoring**  

**iftop** is a powerful tool that shows live network connections, including source and destination IPs and bandwidth usage.  

### **Installing iftop**  

```bash
sudo apt install iftop -y
```  

### **Running iftop**  

To start monitoring your network:  

```bash
sudo iftop
```  

### **Understanding the Output**  

- **Left Column**: Source (your computer's IP).  
- **Right Column**: Destination (external IPs/websites).  
- **Middle**: Bandwidth usage in kbps or Mbps.  

> **Press `q` to exit.**  

> **Pro Tip**: To monitor a specific network interface (e.g., Wi-Fi), use:  

```bash
sudo iftop -i wlan0
```  

---

## **Method 4: Using "NetHogs" for Process-Based Network Monitoring**  

If you want to see which applications consume the most bandwidth, **NetHogs** is the tool to use.  

### **Installing NetHogs**  

```bash
sudo apt install nethogs -y
```  

### **Running NetHogs**  

To start monitoring network usage per application, type:  

```bash
sudo nethogs
```  

It will display:  

- **Process names**  
- **User running the process**  
- **Bandwidth usage in real-time**  

> **Press `q` to exit NetHogs.**  

---

## **Method 5: Setting Up a GUI-Based Network Monitor with "vnStat"**  

If you prefer a graphical representation of network activity, **vnStat** is a fantastic lightweight tool.  

### **Installing vnStat**  

```bash
sudo apt install vnstat -y
```  

### **Starting vnStat**  

Initialize the database for your network interface (replace `eth0` or `wlan0` with your actual interface):  

```bash
sudo vnstat -u -i wlan0
```  

### **Viewing Network Statistics**  

After some usage time, check statistics with:  

```bash
vnstat
```  

For a graphical output, install and use **vnstat GUI**:  

```bash
sudo apt install vnstati -y
```  

Then run:  

```bash
vnstati -s -i wlan0 -o ~/network-usage.png
```  

This generates an image with network statistics.  

---

## **Method 6: Using "Wireshark" for Advanced Network Analysis**  

For deep packet inspection and detailed traffic analysis, **Wireshark** is the best choice.  

### **Installing Wireshark**  

```bash
sudo apt install wireshark -y
```  

During installation, allow non-root users to capture packets by selecting **Yes** when prompted.  

### **Running Wireshark**  

1. **Open Wireshark** from the application menu.  
2. Select your network interface (`eth0` or `wlan0`).  
3. Click **Start** to capture packets.  
4. Use filters like `http`, `tcp`, or `udp` to refine traffic analysis.  

> **Tip**: Use **Ctrl+C** to stop packet capture.  

Wireshark is highly advanced and mainly used by network administrators and security analysts.  

---

## **Which Network Monitoring Tool Should You Use?**  

| Tool       | Use Case |
|------------|----------------------------------------|
| System Monitor | Basic real-time network activity |
| nload      | Live bandwidth monitoring |
| iftop      | Live connection tracking |
| NetHogs    | Monitoring apps using the most bandwidth |
| vnStat     | Long-term network usage tracking |
| Wireshark  | Advanced packet analysis |

Each tool serves a different purpose, so choose based on your needs.  

---

## **Conclusion**  

Setting up network monitoring on Linux Mint with the Cinnamon Desktop is straightforward with various tools available. Whether you prefer **command-line tools like nload and iftop**, or **graphical solutions like Wireshark and vnStat**, Linux Mint offers excellent flexibility for monitoring network traffic.  

For basic usage, **System Monitor** or **nload** should suffice. However, if you need deeper insights, tools like **Wireshark** and **vnStat** provide advanced capabilities.  

By monitoring your network effectively, you can optimize performance, improve security, and troubleshoot connectivity issues on Linux Mint.
