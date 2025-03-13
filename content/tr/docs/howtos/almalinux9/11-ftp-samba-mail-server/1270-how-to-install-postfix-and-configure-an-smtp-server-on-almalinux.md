---
title: How to Install Postfix and Configure an SMTP Server on AlmaLinux
linkTitle: Install Postfix and Configure
description: This guide will walk you through installing Postfix on AlmaLinux, configuring it as an SMTP server, and testing it to ensure seamless email delivery.
date: 2024-12-23
weight: 1270
url: install-postfix-configure-smtp-server-almalinux
draft: true
tags:
  - AlmaLinux
  - postfix
  - smtp
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: install-postfix-configure-smtp-server-almalinux
keywords:
  - AlmaLinux
  - postfix
featured_image: /images/almalinux.webp
---
#### **Introduction**  

Postfix is a powerful and efficient open-source mail transfer agent (MTA) used widely for sending and receiving emails on Linux servers. Its simplicity, robust performance, and compatibility with popular email protocols make it a preferred choice for setting up SMTP (Simple Mail Transfer Protocol) servers.  

AlmaLinux, a community-driven enterprise-grade Linux distribution, is an excellent platform for hosting a secure and efficient Postfix-based SMTP server. This guide will walk you through installing Postfix on AlmaLinux, configuring it as an SMTP server, and testing it to ensure seamless email delivery.  

---

### **What is Postfix and Why Use It?**  

Postfix is an MTA that:  

- **Routes Emails**: It sends emails from a sender to a recipient via the internet.  
- **Supports SMTP Authentication**: Ensures secure and authenticated email delivery.  
- **Works with Other Tools**: Easily integrates with Dovecot, SpamAssassin, and other tools to enhance functionality.  

Postfix is known for being secure, reliable, and easy to configure, making it ideal for personal, business, or organizational email systems.  

---

### **Prerequisites**  

To follow this guide, ensure the following:  

1. **Server Access**:  
   - A server running AlmaLinux with sudo/root privileges.  
2. **Domain Name**:  
   - A fully qualified domain name (FQDN), e.g., `mail.example.com`.  
   - DNS records for your domain configured correctly.  
3. **Basic Knowledge**:  
   - Familiarity with terminal commands and text editing on Linux.  

---

### **Step 1: Update the System**  

Before starting, update your system to ensure all packages are current:  

```bash
sudo dnf update -y
```  

---

### **Step 2: Install Postfix**  

1. **Install Postfix**:  
   Use the following command to install Postfix:  

   ```bash
   sudo dnf install postfix -y
   ```  

2. **Start and Enable Postfix**:  
   Once installed, start Postfix and enable it to run at boot:  

   ```bash
   sudo systemctl start postfix
   sudo systemctl enable postfix
   ```  

3. **Verify Installation**:  
   Check the status of the Postfix service:  

   ```bash
   sudo systemctl status postfix
   ```  

---

### **Step 3: Configure Postfix as an SMTP Server**  

1. **Edit the Main Configuration File**:  
   Postfix’s main configuration file is located at `/etc/postfix/main.cf`. Open it with a text editor:  

   ```bash
   sudo nano /etc/postfix/main.cf
   ```  

2. **Update the Configuration**:  
   Add or modify the following lines to configure your SMTP server:  

   ```plaintext
   # Basic Settings
   myhostname = mail.example.com
   mydomain = example.com
   myorigin = $mydomain

   # Network Settings
   inet_interfaces = all
   inet_protocols = ipv4

   # Relay Restrictions
   mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
   mynetworks = 127.0.0.0/8 [::1]/128

   # SMTP Authentication
   smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, defer_unauth_destination
   smtpd_sasl_auth_enable = yes
   smtpd_sasl_security_options = noanonymous
   smtpd_sasl_local_domain = $mydomain
   broken_sasl_auth_clients = yes

   # TLS Encryption
   smtpd_tls_cert_file = /etc/ssl/certs/ssl-cert-snakeoil.pem
   smtpd_tls_key_file = /etc/ssl/private/ssl-cert-snakeoil.key
   smtpd_use_tls = yes
   smtp_tls_security_level = may
   smtp_tls_note_starttls_offer = yes

   # Message Size Limit
   message_size_limit = 52428800
   ```  

   Replace `mail.example.com` and `example.com` with your actual server hostname and domain name.  

3. **Save and Exit**:  
   Save the file (`CTRL+O`, `Enter`) and exit (`CTRL+X`).  

4. **Restart Postfix**:  
   Apply the changes by restarting Postfix:  

   ```bash
   sudo systemctl restart postfix
   ```  

---

### **Step 4: Configure SMTP Authentication**  

To secure your SMTP server, configure SMTP authentication.  

1. **Install SASL Authentication Tools**:  
   Install the required packages for authentication:  

   ```bash
   sudo dnf install cyrus-sasl cyrus-sasl-plain -y
   ```  

2. **Edit the SASL Configuration File**:  
   Create or edit the `/etc/sasl2/smtpd.conf` file:  

   ```bash
   sudo nano /etc/sasl2/smtpd.conf
   ```  

   Add the following content:  

   ```plaintext
   pwcheck_method: saslauthd
   mech_list: plain login
   ```  

3. **Start and Enable SASL Service**:  
   Start and enable the SASL authentication daemon:  

   ```bash
   sudo systemctl start saslauthd
   sudo systemctl enable saslauthd
   ```  

---

### **Step 5: Configure Firewall and Open Ports**  

To allow SMTP traffic, open the required ports in the firewall:  

1. **Open Ports for SMTP**:  

   ```bash
   sudo firewall-cmd --add-service=smtp --permanent
   sudo firewall-cmd --add-port=587/tcp --permanent
   sudo firewall-cmd --reload
   ```  

2. **Verify Firewall Rules**:  
   Check the current firewall rules to confirm:  

   ```bash
   sudo firewall-cmd --list-all
   ```  

---

### **Step 6: Test the SMTP Server**  

1. **Install Mail Utilities**:  
   Install the `mailx` package to send test emails:  

   ```bash
   sudo dnf install mailx -y
   ```  

2. **Send a Test Email**:  
   Use the `mail` command to send a test email:  

   ```bash
   echo "This is a test email." | mail -s "Test Email" recipient@example.com
   ```  

   Replace `recipient@example.com` with your actual email address.  

3. **Check the Logs**:  
   Review Postfix logs to confirm email delivery:  

   ```bash
   sudo tail -f /var/log/maillog
   ```  

---

### **Step 7: Secure the SMTP Server (Optional)**  

To prevent misuse of your SMTP server:  

1. **Enable Authentication for Sending Emails**:  
   Ensure that `permit_sasl_authenticated` is part of the `smtpd_relay_restrictions` in `/etc/postfix/main.cf`.  

2. **Restrict Relaying**:  
   Configure the `mynetworks` directive to include only trusted IP ranges.  

3. **Enable DKIM (DomainKeys Identified Mail)**:  
   Use DKIM to ensure the integrity of outgoing emails. Install and configure tools like `opendkim` to achieve this.  

4. **Set SPF and DMARC Records**:  
   Add SPF (Sender Policy Framework) and DMARC (Domain-based Message Authentication, Reporting, and Conformance) records to your DNS to reduce the chances of your emails being marked as spam.  

---

### **Troubleshooting Common Issues**  

1. **Emails Not Sending**:  
   - Verify Postfix is running:  

     ```bash
     sudo systemctl status postfix
     ```  

   - Check for errors in `/var/log/maillog`.  

2. **SMTP Authentication Failing**:  
   - Confirm SASL is configured correctly in `/etc/sasl2/smtpd.conf`.  
   - Restart `saslauthd` and Postfix:  

     ```bash
     sudo systemctl restart saslauthd
     sudo systemctl restart postfix
     ```  

3. **Emails Marked as Spam**:  
   - Ensure proper DNS records (SPF, DKIM, and DMARC) are configured.  

---

### **Conclusion**  

Postfix is an essential tool for setting up a reliable and efficient SMTP server. By following this guide, you’ve installed and configured Postfix on AlmaLinux, secured it with SMTP authentication, and ensured smooth email delivery.  

With additional configurations such as DKIM and SPF, you can further enhance email security and deliverability, making your Postfix SMTP server robust and production-ready.  

If you have questions or need further assistance, feel free to leave a comment below!  
