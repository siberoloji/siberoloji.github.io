---
draft: false
title: Bob Masters Firewalld for Network Security on AlmaLinux
linkTitle: Firewalld for Network Security
keywords:
  - Firewalld for Network Security
description: Bob’s next challenge was securing his AlmaLinux server with Firewalld, a powerful and flexible firewall management tool.
date: 2024-11-25
url: bob-masters-firewalld-network-security-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 660
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was securing his AlmaLinux server with **Firewalld**, a powerful and flexible firewall management tool. As a junior sysadmin, he understood that a well-configured firewall was critical for preventing unauthorized access and protecting sensitive services.

> *“A good firewall is like a moat around my server castle—time to make mine impenetrable!”* Bob said, ready to dive into Firewalld.

---

### **Chapter Outline: "Bob Masters Firewalld for Network Security"**

1. **Introduction: What Is Firewalld?**
   - Overview of Firewalld and its role in Linux security.
   - Zones, rules, and services explained.

2. **Installing and Enabling Firewalld**
   - Checking if Firewalld is installed.
   - Starting and enabling Firewalld.

3. **Working with Zones**
   - Default zones and their use cases.
   - Assigning network interfaces to zones.

4. **Managing Services and Ports**
   - Adding and removing services.
   - Opening and closing specific ports.

5. **Creating and Applying Rich Rules**
   - Crafting custom rules for specific needs.
   - Allowing traffic from specific IPs or ranges.

6. **Testing and Troubleshooting Firewalld**
   - Verifying rules with `firewall-cmd`.
   - Diagnosing connection issues.

7. **Conclusion: Bob Reflects on His Firewalld Configuration**

---

### **Part 1: Introduction: What Is Firewalld?**

Bob learned that Firewalld is a **dynamic firewall** that manages network traffic based on predefined zones. Each zone has a set of rules dictating which traffic is allowed or blocked. This flexibility allows administrators to tailor security to their network’s requirements.

#### **Key Concepts**

- **Zones**: Define trust levels for network interfaces (e.g., public, home, work).
- **Services**: Predefined rules for common applications (e.g., SSH, HTTP).
- **Rich Rules**: Custom rules for fine-grained control.

> *“Zones are like bouncers, and rules are their instructions—time to put them to work!”* Bob said.

---

### **Part 2: Installing and Enabling Firewalld**

#### **Step 1: Check if Firewalld Is Installed**

On AlmaLinux, Firewalld is installed by default. Bob verified this with:

```bash
sudo dnf list installed firewalld
```

If not installed, he added it:

```bash
sudo dnf install -y firewalld
```

#### **Step 2: Start and Enable Firewalld**

Bob enabled Firewalld to start at boot and launched the service:

```bash
sudo systemctl enable firewalld --now
sudo systemctl status firewalld
```

> *“Firewalld is live and ready to defend my server!”* Bob said, seeing the active status.

---

### **Part 3: Working with Zones**

#### **Step 1: Listing Available Zones**

Bob checked the predefined zones available in Firewalld:

```bash
sudo firewall-cmd --get-zones
```

The common zones included:

- **public**: Default zone for public networks.
- **home**: For trusted home networks.
- **work**: For work environments.
- **dmz**: For servers exposed to the internet.

#### **Step 2: Assigning Interfaces to Zones**

Bob assigned his network interface (`eth0`) to the **public** zone:

```bash
sudo firewall-cmd --zone=public --change-interface=eth0
```

He verified the interface assignment:

```bash
sudo firewall-cmd --get-active-zones
```

> *“Now my server knows which traffic to trust!”* Bob said.

---

### **Part 4: Managing Services and Ports**

#### **Step 1: Listing Active Rules**

Bob checked which services and ports were currently allowed:

```bash
sudo firewall-cmd --zone=public --list-all
```

#### **Step 2: Allowing Services**

Bob enabled the **SSH** service to ensure remote access:

```bash
sudo firewall-cmd --zone=public --add-service=ssh --permanent
```

- The `--permanent` flag ensures the rule persists after a reboot.
- Reload the rules to apply changes:

  ```bash
  sudo firewall-cmd --reload
  ```

#### **Step 3: Opening Specific Ports**

To allow HTTP traffic on port 80:

```bash
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
```

> *“Allowing only the ports I need keeps things tight and secure!”* Bob noted.

---

### **Part 5: Creating and Applying Rich Rules**

Bob needed to allow SSH access only from a specific IP range while blocking others.

#### **Step 1: Adding a Rich Rule**

He crafted a custom rule to allow SSH from `192.168.1.0/24`:

```bash
sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
```

He also blocked all other SSH traffic:

```bash
sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" service name="ssh" drop'
```

#### **Step 2: Reloading Rules**

Bob reloaded the firewall to apply the rich rules:

```bash
sudo firewall-cmd --reload
```

> *“Rich rules give me precise control—exactly what I need!”* Bob said.

---

### **Part 6: Testing and Troubleshooting Firewalld**

#### **Step 1: Verifying Rules**

Bob listed all active rules to ensure they were applied correctly:

```bash
sudo firewall-cmd --list-all
```

#### **Step 2: Testing Connectivity**

- Bob tested access using `curl` or `telnet` to verify open ports:

  ```bash
  curl http://<server-ip>
  telnet <server-ip> 80
  ```

#### **Step 3: Checking Logs**

If something didn’t work, Bob checked the logs for clues:

```bash
sudo journalctl -u firewalld
```

---

### **Conclusion: Bob Reflects on His Firewalld Configuration**

With Firewalld configured, Bob’s server was well-protected from unwanted traffic. By using zones, rich rules, and careful port management, he achieved a balance between security and accessibility.

> Next, Bob planned to explore **Systemd and Service Management** on AlmaLinux.
