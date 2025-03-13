---
title: How to Configure BIND DNS Secondary Server on AlmaLinux
description: Learn to set up a secondary BIND DNS server on AlmaLinux. This step-by-step guide covers configuration, zone transfers, and best practices.
date: 2024-12-11
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Configure DNS Secondary Server
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 330
translationKey: how-to-configure-bind-dns-secondary-server-on-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: configure-bind-dns-secondary-server-almalinux
---
### How to Configure BIND DNS Server Secondary Server on AlmaLinux

The **BIND DNS server** is a robust and widely-used tool for managing DNS services in enterprise environments. Setting up a **secondary DNS server** (also called a slave server) is a critical step in ensuring high availability and redundancy for your DNS infrastructure. In this guide, we’ll explain how to configure a secondary BIND DNS server on **AlmaLinux**, providing step-by-step instructions and best practices to maintain a reliable DNS system.

---

### What is a Secondary DNS Server?

A **secondary DNS server** is a backup server that mirrors the DNS records of the primary server (also known as the master server). The secondary server retrieves zone data from the primary server via a zone transfer. It provides redundancy and load balancing for DNS queries, ensuring DNS services remain available even if the primary server goes offline.

---

### Benefits of a Secondary DNS Server

1. **Redundancy**: Provides a backup in case the primary server fails.
2. **Load Balancing**: Distributes query load across multiple servers, improving performance.
3. **Geographical Resilience**: Ensures DNS availability in different regions.
4. **Compliance**: Many regulations require multiple DNS servers for critical applications.

---

### Prerequisites

To configure a secondary DNS server, you’ll need:

1. Two servers running AlmaLinux: one configured as the **primary server** and the other as the **secondary server**.
2. **BIND** installed on both servers.
3. Administrative access (sudo) on both servers.
4. Proper firewall settings to allow DNS traffic (port 53).

---

### Step 1: Configure the Primary DNS Server

Before setting up the secondary server, ensure the primary DNS server is properly configured to allow zone transfers.

#### 1. Update the `named.conf` File

On the primary server, edit the BIND configuration file:

```bash
sudo vim /etc/named.conf
```

Add the following lines to specify the zones and allow the secondary server to perform zone transfers:

```plaintext
acl secondary-servers {
    192.168.1.2;  # Replace with the IP address of the secondary server
};

zone "example.com" IN {
    type master;
    file "/var/named/example.com.db";
    allow-transfer { secondary-servers; };
    also-notify { 192.168.1.2; };  # Notify the secondary server of changes
};
```

- **`allow-transfer`**: Specifies the IP addresses permitted to perform zone transfers.
- **`also-notify`**: Sends notifications to the secondary server when zone data changes.

#### 2. Verify Zone File Configuration

Ensure the zone file exists and is correctly formatted. For example, the file `/var/named/example.com.db` might look like this:

```plaintext
$TTL 86400
@   IN  SOA ns1.example.com. admin.example.com. (
        2023120901 ; Serial
        3600       ; Refresh
        1800       ; Retry
        1209600    ; Expire
        86400 )    ; Minimum TTL

    IN  NS  ns1.example.com.
    IN  NS  ns2.example.com.
ns1 IN  A   192.168.1.1
ns2 IN  A   192.168.1.2
www IN  A   192.168.1.100
```

#### 3. Restart the BIND Service

After saving the changes, restart the BIND service to apply the configuration:

```bash
sudo systemctl restart named
```

---

### Step 2: Configure the Secondary DNS Server

Now, configure the secondary server to retrieve zone data from the primary server.

#### 1. Install BIND on the Secondary Server

If BIND is not installed, use the following command:

```bash
sudo dnf install bind bind-utils
```

#### 2. Update the `named.conf` File

Edit the BIND configuration file on the secondary server:

```bash
sudo vim /etc/named.conf
```

Add the zone configuration for the secondary server:

```plaintext
zone "example.com" IN {
    type slave;
    masters { 192.168.1.1; };  # IP address of the primary server
    file "/var/named/slaves/example.com.db";
};
```

- **`type slave`**: Defines this zone as a secondary zone.
- **`masters`**: Specifies the IP address of the primary server.
- **`file`**: Path where the zone file will be stored on the secondary server.

#### 3. Create the Slave Directory

Ensure the directory for storing slave zone files exists and has the correct permissions:

```bash
sudo mkdir -p /var/named/slaves
sudo chown named:named /var/named/slaves
```

#### 4. Restart the BIND Service

Restart the BIND service to load the new configuration:

```bash
sudo systemctl restart named
```

---

### Step 3: Test the Secondary DNS Server

#### 1. Verify Zone Transfer

Check the logs on the secondary server to confirm the zone transfer was successful:

```bash
sudo tail -f /var/log/messages
```

Look for a message indicating the zone transfer completed, such as:

```plaintext
zone example.com/IN: transferred serial 2023120901
```

#### 2. Query the Secondary Server

Use the `dig` command to query the secondary server and verify it resolves DNS records correctly:

```bash
dig @192.168.1.2 www.example.com
```

The output should include the IP address for `www.example.com`.

---

### Step 4: Configure Firewall Rules

Ensure both servers allow DNS traffic on port 53. Use the following commands on both servers:

```bash
sudo firewall-cmd --add-service=dns --permanent
sudo firewall-cmd --reload
```

---

### Best Practices for Managing a Secondary DNS Server

1. **Monitor Zone Transfers**: Regularly check logs to ensure zone transfers are successful.
2. **Increment Serial Numbers**: Always update the serial number in the primary zone file after making changes.
3. **Use Secure Transfers**: Implement TSIG (Transaction Signature) for secure zone transfers.
4. **Document Changes**: Maintain a record of DNS configurations for troubleshooting and audits.
5. **Test Regularly**: Periodically test failover scenarios to ensure the secondary server works as expected.

---

### Troubleshooting Tips

1. **Zone Transfer Fails**:  
   - Check the `allow-transfer` directive on the primary server.
   - Ensure the secondary server’s IP address is correct in the configuration.

2. **Logs Show Errors**:  
   Review logs on both servers for clues. Common issues include SELinux permissions and firewall rules.

3. **DNS Query Fails**:  
   Verify the secondary server has the correct zone file and is responding on port 53.

4. **Outdated Records**:  
   Check that the `refresh` and `retry` values in the SOA record are appropriate for your environment.

---

### Conclusion

Setting up a **secondary BIND DNS server** on AlmaLinux is essential for ensuring high availability, fault tolerance, and improved performance of your DNS infrastructure. By following this guide, you’ve learned how to configure both the primary and secondary servers, test zone transfers, and apply best practices for managing your DNS system.

Regular maintenance and monitoring will keep your DNS infrastructure robust and reliable, providing seamless name resolution for your network.

For further reading, explore the [official BIND documentation](https://bind9.readthedocs.io/) or AlmaLinux community forums for additional support.
