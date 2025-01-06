---
title: How to Install and Configure Postfix, ClamAV, and Amavisd on AlmaLinux
linkTitle: Postfix, ClamAV, and Amavisd
description: In this guide, we will walk you through installing and configuring Postfix, ClamAV, and Amavisd on AlmaLinux
date: 2024-12-23
weight: 1320
url: install-configure-postfix-clamav-amavisd-almalinux
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

Running a secure and efficient email server requires not just sending and receiving emails but also protecting users from malware and spam. Combining **Postfix** (an open-source mail transfer agent), **ClamAV** (an antivirus solution), and **Amavisd** (a content filter interface) provides a robust solution for email handling and security.  

In this guide, we will walk you through installing and configuring Postfix, ClamAV, and Amavisd on AlmaLinux, ensuring your mail server is optimized for secure and reliable email delivery.  

---

### **Prerequisites**  

Before starting, ensure the following:  

1. **A Fresh AlmaLinux Installation**:  
   - Root or sudo privileges.  
   - Fully qualified domain name (FQDN) configured (e.g., `mail.example.com`).  
2. **DNS Records**:  
   - Properly configured DNS for your domain, including MX and A records.  
3. **Basic Knowledge**:  
   - Familiarity with Linux terminal commands.  

---

### **Step 1: Update Your System**  

Start by updating the AlmaLinux packages to their latest versions:  
```bash
sudo dnf update -y
```  

---

### **Step 2: Install Postfix**  

Postfix is the Mail Transfer Agent (MTA) responsible for sending and receiving emails.  

1. **Install Postfix**:  
   ```bash
   sudo dnf install postfix -y
   ```  

2. **Configure Postfix**:  
   Open the Postfix configuration file:  
   ```bash
   sudo nano /etc/postfix/main.cf
   ```  

   Update the following lines to reflect your mail server’s domain:  
   ```plaintext
   myhostname = mail.example.com
   mydomain = example.com
   myorigin = $mydomain
   inet_interfaces = all
   inet_protocols = ipv4
   mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
   relayhost =
   mailbox_command =
   home_mailbox = Maildir/
   smtpd_tls_cert_file = /etc/ssl/certs/mail.crt
   smtpd_tls_key_file = /etc/ssl/private/mail.key
   smtpd_use_tls = yes
   smtpd_tls_security_level = encrypt
   smtp_tls_note_starttls_offer = yes
   ```  

3. **Start and Enable Postfix**:  
   ```bash
   sudo systemctl start postfix
   sudo systemctl enable postfix
   ```  

4. **Verify Postfix Installation**:  
   Send a test email:  
   ```bash
   echo "Postfix test email" | mail -s "Test Email" user@example.com
   ```  
   Replace `user@example.com` with your email address.  

---

### **Step 3: Install ClamAV**  

ClamAV is a powerful open-source antivirus engine used to scan incoming and outgoing emails for viruses.  

1. **Install ClamAV**:  
   ```bash
   sudo dnf install clamav clamav-update -y
   ```  

2. **Update Virus Definitions**:  
   Run the following command to update ClamAV’s virus database:  
   ```bash
   sudo freshclam
   ```  

3. **Configure ClamAV**:  
   Edit the ClamAV configuration file:  
   ```bash
   sudo nano /etc/clamd.d/scan.conf
   ```  
   Uncomment the following lines:  
   ```plaintext
   LocalSocket /var/run/clamd.scan/clamd.sock
   TCPSocket 3310
   TCPAddr 127.0.0.1
   ```  

4. **Start and Enable ClamAV**:  
   ```bash
   sudo systemctl start clamd@scan
   sudo systemctl enable clamd@scan
   ```  

5. **Test ClamAV**:  
   Scan a file to verify the installation:  
   ```bash
   clamscan /path/to/testfile
   ```  

---

### **Step 4: Install and Configure Amavisd**  

Amavisd is an interface between Postfix and ClamAV, handling email filtering and virus scanning.  

1. **Install Amavisd and Dependencies**:  
   ```bash
   sudo dnf install amavisd-new -y
   ```  

2. **Configure Amavisd**:  
   Edit the Amavisd configuration file:  
   ```bash
   sudo nano /etc/amavisd/amavisd.conf
   ```  
   Update the following lines to enable ClamAV integration:  
   ```perl
   @bypass_virus_checks_maps = (0);  # Enable virus scanning
   $virus_admin = 'postmaster@example.com';  # Replace with your email
   ['ClamAV-clamd'],
   ['local:clamd-socket', "/var/run/clamd.scan/clamd.sock"],
   ```  

3. **Enable Amavisd in Postfix**:  
   Open the Postfix master configuration file:  
   ```bash
   sudo nano /etc/postfix/master.cf
   ```  

   Add the following lines:  
   ```plaintext
   smtp-amavis unix - - n - 2 smtp
       -o smtp_data_done_timeout=1200
       -o smtp_send_xforward_command=yes
       -o disable_dns_lookups=yes
       -o max_use=20

   127.0.0.1:10025 inet n - n - - smtpd
       -o content_filter=
       -o receive_override_options=no_header_body_checks
       -o smtpd_helo_restrictions=
       -o smtpd_client_restrictions=
       -o smtpd_sender_restrictions=
       -o smtpd_recipient_restrictions=permit_mynetworks,reject
       -o smtpd_tls_security_level=may
       -o smtpd_sasl_auth_enable=no
       -o smtpd_relay_restrictions=permit_mynetworks,reject_unauth_destination
   ```  

4. **Restart Services**:  
   Restart the Postfix and Amavisd services to apply changes:  
   ```bash
   sudo systemctl restart postfix
   sudo systemctl restart amavisd
   ```  

---

### **Step 5: Test the Setup**  

1. **Send a Test Email**:  
   Use the `mail` command to send a test email:  
   ```bash
   echo "Test email through Postfix and Amavisd" | mail -s "Test Email" user@example.com
   ```  

2. **Verify Logs**:  
   Check the logs to confirm emails are being scanned by ClamAV:  
   ```bash
   sudo tail -f /var/log/maillog
   ```  

3. **Test Virus Detection**:  
   Download the EICAR test file (a harmless file used to test antivirus):  
   ```bash
   curl -O https://secure.eicar.org/eicar.com
   ```  
   Send the file as an attachment and verify that it is detected and quarantined.  

---

### **Step 6: Configure Firewall Rules**  

Ensure that your firewall allows SMTP and Amavisd traffic:  
```bash
sudo firewall-cmd --add-service=smtp --permanent
sudo firewall-cmd --add-port=10024/tcp --permanent
sudo firewall-cmd --add-port=10025/tcp --permanent
sudo firewall-cmd --reload
```  

---

### **Step 7: Regular Maintenance and Monitoring**  

1. **Update ClamAV Virus Definitions**:  
   Automate updates by scheduling a `cron` job:  
   ```bash
   echo "0 3 * * * /usr/bin/freshclam" | sudo tee -a /etc/crontab
   ```  

2. **Monitor Logs**:  
   Regularly check `/var/log/maillog` and `/var/log/clamav/clamd.log` for errors.  

3. **Test Periodically**:  
   Use test files and emails to verify that the setup is functioning as expected.  

---

### **Conclusion**  

By combining Postfix, ClamAV, and Amavisd on AlmaLinux, you create a secure and reliable email server capable of protecting users from viruses and unwanted content. This guide provided a step-by-step approach to installing and configuring these tools, ensuring seamless email handling and enhanced security.  

With this setup, your mail server is equipped to handle incoming and outgoing emails efficiently while safeguarding against potential threats. For further questions or troubleshooting, feel free to leave a comment below.  
