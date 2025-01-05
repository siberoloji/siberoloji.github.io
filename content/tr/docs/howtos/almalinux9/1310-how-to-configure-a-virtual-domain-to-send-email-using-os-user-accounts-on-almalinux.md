---
title: How to Configure a Virtual Domain to Send Email Using OS User Accounts on AlmaLinux
linkTitle: Virtual Domain to Send Email
description: This guide walks you through the process of configuring a virtual domain with Postfix and Dovecot on AlmaLinux, ensuring reliable email delivery while leveraging OS user accounts for authentication
date: 2024-12-23
weight: 1310
url: configure-virtual-domain-send-email-os-user-accounts-almalinux
draft: false
tags:
   - AlmaLinux
categories:
   - Linux
   - Linux How-to
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
   - AlmaLinux
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
#### **Introduction**  

Setting up a virtual domain for email services allows you to host multiple email domains on a single server, making it an ideal solution for businesses or organizations managing multiple brands. AlmaLinux, a robust enterprise-grade Linux distribution, is an excellent platform for implementing a virtual domain setup.  

By configuring a virtual domain to send emails using OS user accounts, you can simplify user management and streamline the integration between the operating system and your mail server. This guide walks you through the process of configuring a virtual domain with Postfix and Dovecot on AlmaLinux, ensuring reliable email delivery while leveraging OS user accounts for authentication.  

---

### **What is a Virtual Domain?**  

A virtual domain allows a mail server to handle email for multiple domains, such as `example.com` and `anotherdomain.com`, on a single server. Each domain can have its own set of users and email addresses, but these users can be authenticated and managed using system accounts, simplifying administration.  

---

### **Prerequisites**  

Before starting, ensure the following:  

1. **A Clean AlmaLinux Installation**:  
   - Root or sudo access to the server.  
2. **DNS Configuration**:  
   - MX (Mail Exchange), A, and SPF records for your domains correctly configured.  
3. **Installed Mail Server Software**:  
   - Postfix as the Mail Transfer Agent (MTA).  
   - Dovecot for POP3/IMAP services.  
4. **Basic Knowledge**:  
   - Familiarity with terminal commands and email server concepts.  

---

### **Step 1: Update Your System**  

Ensure your AlmaLinux system is updated to the latest packages:  

```bash
sudo dnf update -y
```  

---

### **Step 2: Install and Configure Postfix**  

Postfix is a powerful and flexible MTA that supports virtual domain configurations.  

#### **Install Postfix**  

If not already installed, install Postfix:  

```bash
sudo dnf install postfix -y
```  

#### **Edit Postfix Configuration**  

Modify the Postfix configuration file to support virtual domains.  

1. Open the main configuration file:  

   ```bash
   sudo nano /etc/postfix/main.cf
   ```  

2. Add or update the following lines:  

   ```plaintext
   # Basic Settings
   myhostname = mail.example.com
   mydomain = example.com
   myorigin = $mydomain

   # Virtual Domain Settings
   virtual_alias_domains = anotherdomain.com
   virtual_alias_maps = hash:/etc/postfix/virtual

   # Mailbox Configuration
   home_mailbox = Maildir/
   mailbox_command =

   # Network Settings
   inet_interfaces = all
   inet_protocols = ipv4

   # SMTP Authentication
   smtpd_sasl_auth_enable = yes
   smtpd_sasl_security_options = noanonymous
   smtpd_tls_security_level = may
   smtpd_relay_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination
   ```  

3. **Save and Exit** the file (`CTRL+O`, `Enter`, `CTRL+X`).  

#### **Create the Virtual Alias Map**  

Define virtual aliases to route email addresses to the correct system accounts.  

1. Create the `virtual` file:  

   ```bash
   sudo nano /etc/postfix/virtual
   ```  

2. Map virtual email addresses to OS user accounts:  

   ```plaintext
   admin@example.com admin
   user1@example.com user1
   admin@anotherdomain.com admin
   user2@anotherdomain.com user2
   ```  

3. Save and exit, then compile the map:  

   ```bash
   sudo postmap /etc/postfix/virtual
   ```  

4. Reload Postfix to apply changes:  

   ```bash
   sudo systemctl restart postfix
   ```  

---

### **Step 3: Configure Dovecot**  

Dovecot will handle user authentication and email retrieval for the virtual domains.  

#### **Edit Dovecot Configuration**  

1. Open the main Dovecot configuration file:  

   ```bash
   sudo nano /etc/dovecot/dovecot.conf
   ```  

2. Ensure the following line is present:  

   ```plaintext
   protocols = imap pop3 lmtp
   ```  

3. Save and exit.  

#### **Set Up Mail Location**  

1. Open the mail configuration file:  

   ```bash
   sudo nano /etc/dovecot/conf.d/10-mail.conf
   ```  

2. Configure the mail location:  

   ```plaintext
   mail_location = maildir:/home/%u/Maildir
   ```  

   - `%u`: Refers to the OS username.  

3. Save and exit.  

#### **Enable User Authentication**  

1. Open the authentication configuration file:  

   ```bash
   sudo nano /etc/dovecot/conf.d/10-auth.conf
   ```  

2. Modify the following lines:  

   ```plaintext
   disable_plaintext_auth = no
   auth_mechanisms = plain login
   ```  

3. Save and exit.  

#### **Restart Dovecot**  

Restart the Dovecot service to apply the changes:  

```bash
sudo systemctl restart dovecot
```  

---

### **Step 4: Add OS User Accounts for Mail**  

Each email user corresponds to a system user account.  

1. **Create a New User**:  

   ```bash
   sudo adduser user1
   sudo passwd user1
   ```  

2. **Create Maildir for the User**:  
   Initialize the Maildir structure for the new user:  

   ```bash
   sudo maildirmake /home/user1/Maildir
   sudo chown -R user1:user1 /home/user1/Maildir
   ```  

Repeat these steps for all users associated with your virtual domains.  

---

### **Step 5: Configure DNS Records**  

Ensure that your DNS is correctly configured to handle email for the virtual domains.  

1. **MX Record**:  
   Create an MX record pointing to your mail server:  

   ```plaintext
   example.com.       IN    MX   10   mail.example.com.
   anotherdomain.com. IN    MX   10   mail.example.com.
   ```  

2. **SPF Record**:  
   Add an SPF record to specify authorized mail servers:  

   ```plaintext
   example.com.       IN    TXT   "v=spf1 mx -all"
   anotherdomain.com. IN    TXT   "v=spf1 mx -all"
   ```  

3. **DKIM and DMARC**:  
   Configure DKIM and DMARC records for enhanced email security.  

---

### **Step 6: Test the Configuration**  

1. **Send a Test Email**:  
   Use the `mail` command to send a test email from a virtual domain:  

   ```bash
   echo "Test email content" | mail -s "Test Email" user1@example.com
   ```  

2. **Verify Delivery**:  
   Check the user’s mailbox to confirm the email was delivered:  

   ```bash
   sudo ls /home/user1/Maildir/new
   ```  

3. **Test with an Email Client**:  
   Configure an email client (e.g., Thunderbird or Outlook):  
   - **Incoming Server**:  
     - Protocol: IMAP or POP3  
     - Server: `mail.example.com`  
     - Port: 143 (IMAP) or 110 (POP3)  
   - **Outgoing Server**:  
     - Protocol: SMTP  
     - Server: `mail.example.com`  
     - Port: 587  

---

### **Step 7: Enhance Security**  

1. **Enable SSL/TLS**:  
   - Configure SSL/TLS for both Postfix and Dovecot. Refer to [How to Configure Postfix and Dovecot with SSL/TLS on AlmaLinux](#).  

2. **Restrict Access**:  
   - Use firewalls to restrict access to email ports.  

3. **Monitor Logs**:  
   - Regularly check `/var/log/maillog` for issues.  

---

### **Conclusion**  

Configuring a virtual domain to send emails using OS user accounts on AlmaLinux simplifies email server management, allowing seamless integration between system users and virtual email domains. This setup is ideal for hosting multiple domains while maintaining flexibility and security.  

By following this guide, you’ve created a robust email infrastructure capable of handling multiple domains with ease. Secure the setup further by implementing SSL/TLS encryption, and regularly monitor server logs for a smooth email service experience.  

For any questions or further assistance, feel free to leave a comment below!  
