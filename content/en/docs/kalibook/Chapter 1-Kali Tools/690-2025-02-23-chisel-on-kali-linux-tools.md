---
draft: false
title: Chisel on Kali Linux Tools
linkTitle: chisel
translationKey: chisel-on-kali-linux-tools
weight: 690
description: Learn how to use Chisel on Kali Linux for network tunneling, port forwarding, and secure communications.
date: 2025-02-23
url: chisel-on-kali-linux-tools
tags:
  - kali tools
categories:
  - Kali linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords: 
  - chisel
featured_image: /images/kalilinux2.webp
---
## Introduction to Chisel

Chisel is a fast, cross-platform TCP/UDP tunnel that is designed to work as a lightweight yet powerful network tunneling tool. It is often used for penetration testing, red teaming, and bypassing firewalls by allowing traffic to be securely routed through restricted networks. Chisel is unique in that it functions as both a TCP/UDP tunnel and a SOCKS5 proxy, enabling users to exfiltrate data, access internal services, and perform reconnaissance in restricted environments.

Kali Linux, a popular penetration testing distribution, includes Chisel as part of its extensive toolkit. Understanding how to leverage Chisel effectively can be crucial for ethical hackers and cybersecurity professionals.

---

## Key Features of Chisel

- **Port Forwarding & Reverse Tunneling**: Supports client-server connections, allowing traffic to bypass network restrictions.
- **SOCKS5 Proxy**: Provides a dynamic method of tunneling network traffic.
- **Cross-Platform Compatibility**: Works on Windows, Linux, and macOS.
- **Secure Communications**: Uses AES encryption for secure data transmission.
- **Minimal Dependencies**: Written in Go, making it lightweight and easy to deploy.

---

## Installing Chisel on Kali Linux

### Checking for Preinstalled Chisel

Kali Linux may include Chisel by default. To check if it is installed, run:

```bash
chisel -v
```

If Chisel is not installed, you can install it manually.

### Installing Chisel Manually

1. **Download the latest Chisel binary**:

   ```bash
   wget https://github.com/jpillora/chisel/releases/latest/download/chisel_linux_amd64.gz
   ```

2. **Extract the binary**:

   ```bash
   gunzip chisel_linux_amd64.gz
   ```

3. **Rename and move the binary to a system path**:

   ```bash
   mv chisel_linux_amd64 /usr/local/bin/chisel
   chmod +x /usr/local/bin/chisel
   ```

4. **Verify the installation**:

   ```bash
   chisel -v
   ```

   This should return the installed version of Chisel.

---

## Understanding Chisel’s Architecture

Chisel operates in a **client-server model**, where a machine running Chisel as a **server** listens for incoming connections, while another machine (often behind a firewall or NAT) runs the **client** to establish a tunnel.

- **Server**: Runs on a publicly accessible machine and waits for clients to connect.
- **Client**: Connects to the server and forwards traffic through the tunnel.

### Example Use Cases

- **Penetration testers can use Chisel to bypass firewalls and access internal networks.**
- **Red team operators can use Chisel for exfiltrating data securely.**
- **Network administrators can use Chisel to access remote services that are behind NAT.**

---

## Using Chisel for Network Tunneling

### 1. Setting Up a Chisel Server

The server needs to be set up on a system that has an accessible public IP.

```bash
chisel server --reverse --port 8080
```

**Explanation:**

- `server`: Starts Chisel in server mode.
- `--reverse`: Allows reverse connections from clients.
- `--port 8080`: Specifies the port on which Chisel will listen.

### 2. Connecting a Chisel Client

A client behind a restricted network can connect to the server and tunnel traffic.

```bash
chisel client <server-ip>:8080 R:1080:socks
```

**Explanation:**

- `<server-ip>`: Replace this with the public IP of the Chisel server.
- `R:1080:socks`: This creates a reverse SOCKS proxy on port `1080`.

Now, all traffic sent through this proxy will be forwarded via the Chisel tunnel.

---

## Advanced Chisel Usage

### 1. Port Forwarding

Chisel can be used to forward ports to access internal services remotely.

```bash
chisel client <server-ip>:8080 8000:127.0.0.1:22
```

This command allows remote SSH access (port 22) to be forwarded through port 8000.

### 2. Using Chisel with Proxychains

To route applications through the Chisel tunnel, you can use **Proxychains**:

1. Install Proxychains if not already installed:

   ```bash
   apt install proxychains4
   ```

2. Edit the configuration file:

   ```bash
   nano /etc/proxychains.conf
   ```

   Add the following line at the end:

   ```plaintext
   socks5 127.0.0.1 1080
   ```

3. Run any command through Proxychains:

   ```bash
   proxychains firefox
   ```

   This forces Firefox’s traffic through the Chisel tunnel.

### 3. Encrypted Tunneling

Chisel can use encryption for added security:

```bash
chisel server --port 8080 --key mysecurekey
```

On the client side, use:

```bash
chisel client <server-ip>:8080 --key mysecurekey R:1080:socks
```

This ensures that the tunnel is encrypted with a secret key.

---

## Detecting and Mitigating Chisel-Based Tunnels

While Chisel is a powerful tool for penetration testers, it is also important to understand how to detect and mitigate its misuse in an enterprise setting.

### Detection Techniques

- **Network Traffic Analysis**: Monitor for unexpected encrypted traffic on non-standard ports.
- **Firewall Rules**: Block outbound traffic to unknown remote servers.
- **Intrusion Detection Systems (IDS)**: Use tools like Snort to detect suspicious Chisel connections.

### Mitigation Strategies

- **Application Whitelisting**: Prevent unauthorized tools from running.
- **Restrict Outbound Traffic**: Only allow necessary outbound connections.
- **Monitor SOCKS Proxy Activity**: Check for unauthorized proxy use.

---

## Conclusion

Chisel is an incredibly powerful tool for penetration testing and red teaming, allowing users to bypass network restrictions and access internal services securely. Whether you’re using Chisel for ethical hacking or secure remote access, understanding its setup and capabilities is crucial.

However, as with all powerful tools, it’s important to recognize its potential misuse and implement proper security measures to detect and mitigate unauthorized tunnels.

By mastering Chisel on Kali Linux, cybersecurity professionals can improve their penetration testing strategies while ensuring networks remain secure from malicious tunneling attacks.

---

## Further Reading

- [Chisel GitHub Repository](https://github.com/jpillora/chisel)
- [Kali Linux Official Documentation](https://www.kali.org/docs/)
- [Penetration Testing Techniques](https://www.offensive-security.com/)

---
