---
draft: false
title: Bob Configures DNS Services with BIND on AlmaLinux
linkTitle: DNS Services with BIND
keywords:
  - DNS Services with BIND
description: A DNS server translates human-readable domain names into IP addresses, making it an essential component of any network infrastructure.
date: 2024-11-25
url: bob-configures-dns-services-bind-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 740


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to set up a **Domain Name System (DNS) server** using **BIND (Berkeley Internet Name Domain)**. A DNS server translates human-readable domain names into IP addresses, making it an essential component of any network infrastructure.

> *“DNS is the phonebook of the internet—time to run my own!”* Bob said, ready to tackle BIND configuration.

---

### **Chapter Outline: "Bob Configures DNS Services with BIND"**

1. **Introduction: What Is BIND?**
   - Overview of DNS and BIND.
   - Use cases for running a local DNS server.

2. **Installing and Setting Up BIND**
   - Installing the BIND package.
   - Configuring the basic settings.

3. **Configuring a Forward Lookup Zone**
   - Creating zone files for a domain.
   - Testing forward name resolution.

4. **Configuring a Reverse Lookup Zone**
   - Creating reverse zone files for IP-to-name resolution.
   - Testing reverse name resolution.

5. **Securing and Optimizing BIND**
   - Restricting queries to specific networks.
   - Setting up logging and monitoring.

6. **Testing and Troubleshooting DNS**
   - Using `dig` and `nslookup` to verify configurations.
   - Diagnosing common DNS issues.

7. **Conclusion: Bob Reflects on DNS Mastery**

---

### **Part 1: Introduction: What Is BIND?**

Bob discovered that **BIND** is one of the most widely used DNS servers, known for its flexibility and reliability.

#### **Use Cases for Running BIND**

- Host a private DNS server for a local network.
- Set up authoritative DNS for a domain.
- Provide caching and forwarding services.

> *“With BIND, I can control how names and IPs are resolved!”* Bob said.

---

### **Part 2: Installing and Setting Up BIND**

#### **Step 1: Installing BIND**

- Install the BIND server package:

  ```bash
  sudo dnf install -y bind bind-utils
  ```

#### **Step 2: Starting and Enabling BIND**

- Enable and start the BIND service:

  ```bash
  sudo systemctl enable named --now
  ```

- Check the service status:

  ```bash
  sudo systemctl status named
  ```

#### **Step 3: Basic Configuration**

Bob edited the main configuration file `/etc/named.conf` to set up a basic DNS server.

- Open the file:

  ```bash
  sudo nano /etc/named.conf
  ```

- Allow queries from the local network:

  ```plaintext
  options {
      listen-on port 53 { 127.0.0.1; 192.168.1.0/24; };
      allow-query { localhost; 192.168.1.0/24; };
      recursion yes;
  };
  ```

- Save and restart BIND:

  ```bash
  sudo systemctl restart named
  ```

> *“BIND is up and ready—now let’s configure zones!”* Bob said.

---

### **Part 3: Configuring a Forward Lookup Zone**

Bob set up a **forward lookup zone** to resolve names to IP addresses for the `example.com` domain.

#### **Step 1: Define the Zone in `named.conf`**

Bob added a zone definition to `/etc/named.conf`:

```plaintext
zone "example.com" IN {
    type master;
    file "/var/named/example.com.zone";
};
```

#### **Step 2: Create the Zone File**

- Bob created the zone file `/var/named/example.com.zone`:

  ```bash
  sudo nano /var/named/example.com.zone
  ```

- Example zone file content:

  ```plaintext
  $TTL 86400
  @   IN  SOA ns1.example.com. admin.example.com. (
          2023111101 ; Serial
          3600       ; Refresh
          1800       ; Retry
          1209600    ; Expire
          86400 )    ; Minimum TTL

      IN  NS  ns1.example.com.
  ns1 IN  A   192.168.1.10
  www IN  A   192.168.1.20
  ```

#### **Step 3: Verify Zone File Syntax**

- Check the configuration for errors:

  ```bash
  sudo named-checkconf
  sudo named-checkzone example.com /var/named/example.com.zone
  ```

- Restart BIND:

  ```bash
  sudo systemctl restart named
  ```

---

### **Part 4: Configuring a Reverse Lookup Zone**

Bob added a **reverse lookup zone** to resolve IP addresses back to names.

#### **Step 1: Define the Reverse Zone in `named.conf`**

- Add a reverse zone for `192.168.1.0/24`:

  ```plaintext
  zone "1.168.192.in-addr.arpa" IN {
      type master;
      file "/var/named/1.168.192.in-addr.arpa.zone";
  };
  ```

#### **Step 2: Create the Reverse Zone File**

- Bob created the file `/var/named/1.168.192.in-addr.arpa.zone`:

  ```bash
  sudo nano /var/named/1.168.192.in-addr.arpa.zone
  ```

- Example reverse zone file content:

  ```plaintext
  $TTL 86400
  @   IN  SOA ns1.example.com. admin.example.com. (
          2023111101 ; Serial
          3600       ; Refresh
          1800       ; Retry
          1209600    ; Expire
          86400 )    ; Minimum TTL

      IN  NS  ns1.example.com.
  10  IN  PTR ns1.example.com.
  20  IN  PTR www.example.com.
  ```

- Check and restart:

  ```bash
  sudo named-checkzone 1.168.192.in-addr.arpa /var/named/1.168.192.in-addr.arpa.zone
  sudo systemctl restart named
  ```

---

### **Part 5: Securing and Optimizing BIND**

#### **Restrict Queries to Specific Networks**

Bob ensured that only trusted networks could query the server:

```plaintext
allow-query { 192.168.1.0/24; localhost; };
```

#### **Enable Logging**

Bob configured logging to track DNS activity:

- Edit `/etc/named.conf`:

  ```plaintext
  logging {
      channel query_log {
          file "/var/log/named_queries.log";
          severity info;
      };
      category queries { query_log; };
  };
  ```

- Create the log file and restart BIND:

  ```bash
  sudo touch /var/log/named_queries.log
  sudo chmod 640 /var/log/named_queries.log
  sudo systemctl restart named
  ```

---

### **Part 6: Testing and Troubleshooting DNS**

#### **Testing with `dig`**

Bob tested forward and reverse lookups:

- Forward lookup:

  ```bash
  dig @192.168.1.10 www.example.com
  ```

- Reverse lookup:

  ```bash
  dig @192.168.1.10 -x 192.168.1.20
  ```

#### **Common Issues and Solutions**

1. **Zone file errors**:
   - Check syntax with:

     ```bash
     sudo named-checkzone example.com /var/named/example.com.zone
     ```

2. **Firewall blocking port 53**:
   - Allow DNS traffic:

     ```bash
     sudo firewall-cmd --permanent --add-port=53/tcp
     sudo firewall-cmd --permanent --add-port=53/udp
     sudo firewall-cmd --reload
     ```

---

### **Conclusion: Bob Reflects on DNS Mastery**

Bob successfully configured BIND to handle both forward and reverse DNS lookups. With DNS services in place, his network was more efficient, and he gained a deeper understanding of how the internet’s phonebook works.

> Next, Bob plans to explore **File Sharing with Samba and NFS** on AlmaLinux.
