---
title: How to Add Mail User Accounts Using OS User Accounts on AlmaLinux
linkTitle: Add Mail Users From OS Users
description: This guide will walk you through the process of adding mail user accounts using OS user accounts on AlmaLinux.
date: 2024-12-23
weight: 1290
url: add-mail-user-accounts-os-user-accounts-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
#### **Introduction**  
Managing email services on a Linux server can be streamlined by linking mail user accounts to operating system (OS) user accounts. This approach allows system administrators to manage email users and their settings using standard Linux tools, simplifying configuration and ensuring consistency.  

AlmaLinux, a community-driven enterprise-grade Linux distribution, is a popular choice for hosting mail servers. By configuring your email server (e.g., Postfix and Dovecot) to use OS user accounts for mail authentication and storage, you can create a robust and secure email infrastructure.  

This guide will walk you through the process of adding mail user accounts using OS user accounts on AlmaLinux.

---

### **Prerequisites**  

Before proceeding, ensure the following:  

1. **Mail Server**:  
   - A fully configured mail server running Postfix for sending/receiving emails and Dovecot for POP/IMAP access.  
2. **System Access**:  
   - Root or sudo privileges on an AlmaLinux server.  
3. **DNS Configuration**:  
   - Properly configured MX (Mail Exchange) records pointing to your mail server’s hostname or IP.  

---

### **Step 1: Understand How OS User Accounts Work with Mail Servers**  

When you configure a mail server to use OS user accounts:  

1. **Authentication**:  
   - Users authenticate using their system credentials (username and password).  
2. **Mail Storage**:  
   - Each user’s mailbox is stored in a predefined directory, often `/var/mail/username` or `/home/username/Maildir`.  
3. **Consistency**:  
   - User management tasks, such as adding or deleting users, are unified with system administration.  

---

### **Step 2: Verify Your Mail Server Configuration**  

Before adding users, ensure that your mail server is configured to use system accounts.  

#### **Postfix Configuration**  

1. **Edit Postfix Main Configuration File**:  
   Open `/etc/postfix/main.cf`:  
   ```bash
   sudo nano /etc/postfix/main.cf
   ```  

2. **Set Up the Home Mailbox Directive**:  
   Add or modify the following line to define the location of mailboxes:  
   ```plaintext
   home_mailbox = Maildir/
   ```  

   This stores each user’s mail in the `Maildir` format within their home directory.  

3. **Reload Postfix**:  
   Apply changes by reloading the Postfix service:  
   ```bash
   sudo systemctl reload postfix
   ```  

#### **Dovecot Configuration**  

1. **Edit the Mail Location**:  
   Open `/etc/dovecot/conf.d/10-mail.conf`:  
   ```bash
   sudo nano /etc/dovecot/conf.d/10-mail.conf
   ```  

   Configure the `mail_location` directive:  
   ```plaintext
   mail_location = maildir:~/Maildir
   ```  

2. **Restart Dovecot**:  
   Restart Dovecot to apply the changes:  
   ```bash
   sudo systemctl restart dovecot
   ```  

---

### **Step 3: Add New Mail User Accounts**  

To create a new mail user, you simply need to create an OS user account.  

#### **Create a User**  

1. **Add a New User**:  
   Use the `adduser` command to create a new user:  
   ```bash
   sudo adduser johndoe
   ```  

   Replace `johndoe` with the desired username.  

2. **Set a Password**:  
   Assign a password to the new user:  
   ```bash
   sudo passwd johndoe
   ```  

   The user will use this password to authenticate with the mail server.  

#### **Verify the User Directory**  

1. **Check the Home Directory**:  
   Verify that the user’s home directory exists:  
   ```bash
   ls -l /home/johndoe
   ```  

2. **Create a Maildir Directory (If Not Already Present)**:  
   If the `Maildir` folder is not created automatically, initialize it manually:  
   ```bash
   sudo mkdir -p /home/johndoe/Maildir/{cur,new,tmp}
   sudo chown -R johndoe:johndoe /home/johndoe/Maildir
   ```  

   This ensures the user has the correct directory structure for their emails.  

---

### **Step 4: Test the New User Account**  

#### **Send a Test Email**  

1. **Use the `mail` Command**:  
   Send a test email to the new user:  
   ```bash
   echo "This is a test email." | mail -s "Test Email" johndoe@example.com
   ```  

   Replace `example.com` with your domain name.  

2. **Verify Mail Delivery**:  
   Check the user’s mailbox to confirm the email was delivered:  
   ```bash
   sudo ls /home/johndoe/Maildir/new
   ```  

   The presence of a new file in the `new` directory indicates that the email was delivered successfully.  

#### **Access the Mailbox Using an Email Client**  

1. **Configure an Email Client**:  
   Use an email client like Thunderbird or Outlook to connect to the server:  
   - **Incoming Server**:  
     - Protocol: IMAP or POP3  
     - Server: `mail.example.com`  
     - Port: 143 (IMAP) or 110 (POP3)  
   - **Outgoing Server**:  
     - SMTP Server: `mail.example.com`  
     - Port: 587  

2. **Login Credentials**:  
   Use the system username (`johndoe`) and password to authenticate.  

---

### **Step 5: Automate Maildir Initialization for New Users**  

To ensure `Maildir` is created automatically for new users:  

1. **Install `maildirmake` Utility**:  
   Install the `dovecot` package if not already installed:  
   ```bash
   sudo dnf install dovecot -y
   ```  

2. **Edit the User Add Script**:  
   Modify the default user creation script to include Maildir initialization:  
   ```bash
   sudo nano /etc/skel/.bashrc
   ```  

   Add the following lines:  
   ```bash
   if [ ! -d ~/Maildir ]; then
       maildirmake ~/Maildir
   fi
   ```  

3. **Verify Automation**:  
   Create a new user and check if the `Maildir` structure is initialized automatically.  

---

### **Step 6: Secure Your Mail Server**  

1. **Enforce SSL/TLS Encryption**:  
   Ensure secure communication by enabling SSL/TLS for IMAP, POP3, and SMTP.  

2. **Restrict User Access**:  
   If necessary, restrict shell access for mail users to prevent them from logging in to the server directly:  
   ```bash
   sudo usermod -s /sbin/nologin johndoe
   ```  

3. **Monitor Logs**:  
   Regularly monitor email server logs to identify any unauthorized access attempts:  
   ```bash
   sudo tail -f /var/log/maillog
   ```  

---

### **Step 7: Troubleshooting Common Issues**  

1. **Emails Not Delivered**:  
   - Verify that the Postfix service is running:  
     ```bash
     sudo systemctl status postfix
     ```  
   - Check the logs for errors:  
     ```bash
     sudo tail -f /var/log/maillog
     ```  

2. **User Authentication Fails**:  
   - Ensure the username and password are correct.  
   - Check Dovecot logs for authentication errors.  

3. **Mailbox Directory Missing**:  
   - Confirm the `Maildir` directory exists for the user.  
   - If not, create it manually or reinitialize using `maildirmake`.  

---

### **Conclusion**  

By using OS user accounts to manage mail accounts on AlmaLinux, you simplify email server administration and ensure tight integration between system and email authentication. This approach allows for seamless management of users, mail storage, and permissions.  

In this guide, we covered configuring your mail server, creating mail accounts linked to OS user accounts, and testing the setup. With these steps, you can build a secure, efficient, and scalable mail server that meets the needs of personal or organizational use.  

For any questions or further assistance, feel free to leave a comment below!  
