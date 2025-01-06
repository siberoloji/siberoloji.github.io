---
title: How to Install ProFTPD on AlmaLinux
linkTitle: Install ProFTPD
description: This guide will walk you through the installation, configuration, and optimization of ProFTPD on AlmaLinux.
date: 2024-12-22
weight: 1180
url: install-proftpd-almalinux
draft: false
tags:
  - AlmaLinux
  - ProFTPD
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
  - Install ProFTPD


featured_image: /images/almalinux.webp
---
ProFTPD is a highly configurable and secure FTP server that is widely used for transferring files between servers and clients. Its ease of use, flexible configuration, and compatibility make it a great choice for administrators. AlmaLinux, a stable and community-driven Linux distribution, is an excellent platform for hosting ProFTPD. This guide will walk you through the installation, configuration, and optimization of ProFTPD on AlmaLinux.

---

### **Prerequisites**  

Before starting, ensure the following are ready:  

1. **AlmaLinux Server**:  
   - A fresh installation of AlmaLinux 8 or newer.  
2. **Root or Sudo Access**:  
   - Privileges to execute administrative commands.  
3. **Stable Internet Connection**:  
   - Required for downloading packages.  
4. **Basic Command-Line Knowledge**:  
   - Familiarity with terminal operations and configuration file editing.  

---

### **Step 1: Update the System**

It’s essential to update your AlmaLinux server to ensure all packages and repositories are up-to-date. Open the terminal and run:

```bash
sudo dnf update -y
```

This ensures that you have the latest version of all installed packages and security patches. If the update includes kernel upgrades, reboot the server:

```bash
sudo reboot
```

---

### **Step 2: Install ProFTPD**

ProFTPD is available in the Extra Packages for Enterprise Linux (EPEL) repository. To enable EPEL and install ProFTPD, follow these steps:  

1. **Enable the EPEL Repository:**  

   ```bash
   sudo dnf install epel-release -y
   ```

2. **Install ProFTPD:**  

   ```bash
   sudo dnf install proftpd -y
   ```

3. **Verify Installation:**  

   Check the ProFTPD version to confirm successful installation:  

   ```bash
   proftpd -v
   ```

---

### **Step 3: Start and Enable ProFTPD**

After installation, start the ProFTPD service and enable it to run automatically at system boot:

```bash
sudo systemctl start proftpd
sudo systemctl enable proftpd
```

Verify the status of the service to ensure it is running correctly:

```bash
sudo systemctl status proftpd
```

---

### **Step 4: Configure ProFTPD**

ProFTPD is highly configurable, allowing you to tailor it to your specific needs. Its main configuration file is located at `/etc/proftpd/proftpd.conf`.  

1. **Open the Configuration File:**  

   ```bash
   sudo nano /etc/proftpd/proftpd.conf
   ```

2. **Key Configuration Settings:**  
   Below are essential configurations for a secure and functional FTP server:

   - **Server Name:**  
     Set your server's name for identification. Modify the line:  

     ```plaintext
     ServerName "ProFTPD Server on AlmaLinux"
     ```

   - **Default Port:**  
     Ensure the default port (21) is enabled:  

     ```plaintext
     Port 21
     ```

   - **Allow Passive Mode:**  
     Passive mode is critical for NAT and firewalls. Add the following lines:  

     ```plaintext
     PassivePorts 30000 31000
     ```

   - **Enable Local User Access:**  
     Allow local system users to log in:  

     ```plaintext
     <Global>
         DefaultRoot ~
         RequireValidShell off
     </Global>
     ```

   - **Disable Anonymous Login:**  
     For secure environments, disable anonymous login:  

     ```plaintext
     <Anonymous /var/ftp>
         User ftp
         Group ftp
         AnonRequirePassword off
         <Limit LOGIN>
             DenyAll
         </Limit>
     </Anonymous>
     ```

3. **Save and Exit:**  
   Save your changes (Ctrl + O, Enter in Nano) and exit (Ctrl + X).  

---

### **Step 5: Adjust Firewall Settings**

To allow FTP traffic, configure the AlmaLinux firewall to permit ProFTPD’s required ports:  

1. **Allow FTP Default Port (21):**  

   ```bash
   sudo firewall-cmd --permanent --add-port=21/tcp
   ```

2. **Allow Passive Mode Ports:**  
   Match the range defined in the configuration file:  

   ```bash
   sudo firewall-cmd --permanent --add-port=30000-31000/tcp
   ```

3. **Reload Firewall Rules:**  
   Apply the new rules by reloading the firewall:  

   ```bash
   sudo firewall-cmd --reload
   ```

---

### **Step 6: Test the ProFTPD Server**

To ensure your ProFTPD server is functioning correctly, test its connectivity:  

1. **Install an FTP Client (Optional):**  

   If testing locally, install an FTP client:  

   ```bash
   sudo dnf install ftp -y
   ```

2. **Connect to the Server:**  

   Use an FTP client to connect. Replace `your_server_ip` with your server’s IP address:  

   ```bash
   ftp your_server_ip
   ```

3. **Log In with a Local User:**  

   Enter the username and password of a valid local user. Verify the ability to upload, download, and navigate files.

---

### **Step 7: Secure the ProFTPD Server with TLS**

To encrypt FTP traffic, configure ProFTPD to use TLS/SSL.  

1. **Generate SSL Certificates:**  

   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/proftpd/ssl/proftpd.key -out /etc/proftpd/ssl/proftpd.crt
   ```

   Provide the necessary details when prompted.  

2. **Enable TLS in Configuration:**  

   Edit the ProFTPD configuration file to include the following settings:  

   ```plaintext
   <IfModule mod_tls.c>
       TLSEngine on
       TLSLog /var/log/proftpd/tls.log
       TLSProtocol TLSv1.2
       TLSRSACertificateFile /etc/proftpd/ssl/proftpd.crt
       TLSRSACertificateKeyFile /etc/proftpd/ssl/proftpd.key
       TLSOptions NoCertRequest
       TLSVerifyClient off
       TLSRequired on
   </IfModule>
   ```

3. **Restart ProFTPD Service:**  

   Restart the ProFTPD service to apply changes:  

   ```bash
   sudo systemctl restart proftpd
   ```

---

### **Step 8: Monitor ProFTPD**

To keep your ProFTPD server secure and functional, regularly monitor logs and update configurations:  

1. **View Logs:**  
   ProFTPD logs are located at `/var/log/proftpd/proftpd.log`.  

   ```bash
   cat /var/log/proftpd/proftpd.log
   ```

2. **Update the Server:**  
   Keep AlmaLinux and ProFTPD up to date:  

   ```bash
   sudo dnf update -y
   ```

3. **Backup Configurations:**  
   Regularly back up the `/etc/proftpd/proftpd.conf` file to avoid losing your settings.

---

### **Conclusion**

Installing and configuring ProFTPD on AlmaLinux is straightforward and enables secure file transfers across networks. By following the steps outlined in this guide, you can set up and optimize ProFTPD to meet your requirements. Don’t forget to implement TLS encryption for enhanced security and monitor your server regularly for optimal performance.  

---

### **FAQs**

1. **Can I enable anonymous FTP with ProFTPD?**  
   Yes, anonymous FTP is supported. However, it’s recommended to disable it in production environments for security.

2. **What are the default ports used by ProFTPD?**  
   ProFTPD uses port 21 for control and a configurable range for passive data transfers.

3. **How do I restrict users to their home directories?**  
   Use the `DefaultRoot ~` directive in the configuration file.

4. **Is it mandatory to use TLS/SSL with ProFTPD?**  
   While not mandatory, TLS/SSL is essential for securing sensitive data during file transfers.

5. **Where are ProFTPD logs stored?**  
   Logs are located at `/var/log/proftpd/proftpd.log`.

6. **How can I restart ProFTPD after changes?**  
   Use the command:  

   ```bash
   sudo systemctl restart proftpd
   ```
