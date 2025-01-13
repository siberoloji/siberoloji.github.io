---
title: How to Install VSFTPD on AlmaLinux
linkTitle: Install VSFTPD
description: If you're looking to install and configure VSFTPD on AlmaLinux, this guide provides a step-by-step approach to set up and optimize it for secure and efficient file sharing.
date: 2024-12-22
weight: 1170
url: install-vsftpd-almalinux-comprehensive-guide
draft: false
tags:
  - AlmaLinux
  - vsftpd
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
  - Install VSFTPD
featured_image: /images/almalinux.webp
---
VSFTPD (Very Secure File Transfer Protocol Daemon) is a popular FTP server software renowned for its speed, stability, and security. AlmaLinux, a robust, community-driven distribution, is an ideal platform for hosting secure file transfer services. If you're looking to install and configure VSFTPD on AlmaLinux, this guide provides a step-by-step approach to set up and optimize it for secure and efficient file sharing.

---

### **Prerequisites**

Before we dive into the installation process, ensure the following prerequisites are in place:  

1. **A Server Running AlmaLinux:**  
   - A fresh installation of AlmaLinux (AlmaLinux 8 or newer is recommended).  
2. **Root or Sudo Privileges:**  
   - Administrator privileges to execute commands and configure services.  
3. **Stable Internet Connection:**  
   - To download packages and dependencies.  
4. **Firewall Configuration Knowledge:**  
   - Familiarity with basic firewall commands to allow FTP access.  

---

### **Step 1: Update Your System**

Start by updating your AlmaLinux server to ensure all installed packages are current. Open your terminal and run the following command:

```bash
sudo dnf update -y
```

This command refreshes the repository metadata and updates the installed packages to their latest versions. Reboot the system if the update includes kernel upgrades:

```bash
sudo reboot
```

---

### **Step 2: Install VSFTPD**

The VSFTPD package is available in the default AlmaLinux repositories. Install it using the `dnf` package manager:

```bash
sudo dnf install vsftpd -y
```

Once the installation completes, verify it by checking the version:

```bash
vsftpd -version
```

---

### **Step 3: Start and Enable VSFTPD Service**

After installation, start the VSFTPD service and enable it to run on boot:

```bash
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```

Check the status to confirm the service is running:

```bash
sudo systemctl status vsftpd
```

---

### **Step 4: Configure the VSFTPD Server**

To customize VSFTPD to your requirements, edit its configuration file located at `/etc/vsftpd/vsftpd.conf`.  

1. **Open the Configuration File:**

   ```bash
   sudo nano /etc/vsftpd/vsftpd.conf
   ```

2. **Modify Key Parameters:**  
   Below are some important configurations for a secure and functional FTP server:

   - **Allow Local User Logins:**
     Uncomment the following line to allow local system users to log in:  
     ```plaintext
     local_enable=YES
     ```

   - **Enable File Uploads:**  
     Ensure file uploads are enabled by uncommenting the line:  
     ```plaintext
     write_enable=YES
     ```

   - **Restrict Users to Their Home Directories:**  
     Prevent users from navigating outside their home directories by uncommenting this:  
     ```plaintext
     chroot_local_user=YES
     ```

   - **Enable Passive Mode:**  
     Add or modify the following lines to enable passive mode (essential for NAT/firewall environments):  
     ```plaintext
     pasv_enable=YES
     pasv_min_port=30000
     pasv_max_port=31000
     ```

   - **Disable Anonymous Login:**  
     For better security, disable anonymous login by ensuring:  
     ```plaintext
     anonymous_enable=NO
     ```

3. **Save and Exit:**  
   After making the changes, save the file (Ctrl + O, then Enter in Nano) and exit (Ctrl + X).

---

### **Step 5: Restart VSFTPD Service**

For the changes to take effect, restart the VSFTPD service:

```bash
sudo systemctl restart vsftpd
```

---

### **Step 6: Configure Firewall to Allow FTP**

To enable FTP access, open the required ports in the AlmaLinux firewall:

1. **Allow Default FTP Port (21):**

   ```bash
   sudo firewall-cmd --permanent --add-port=21/tcp
   ```

2. **Allow Passive Ports:**  
   Match the range defined in your VSFTPD configuration:  
   ```bash
   sudo firewall-cmd --permanent --add-port=30000-31000/tcp
   ```

3. **Reload Firewall Rules:**  
   Apply the changes by reloading the firewall:  
   ```bash
   sudo firewall-cmd --reload
   ```

---

### **Step 7: Test FTP Server**

Use an FTP client to test the server's functionality:  

1. **Install FTP Client:**  
   If you're testing locally, install an FTP client:  
   ```bash
   sudo dnf install ftp -y
   ```

2. **Connect to the FTP Server:**  
   Run the following command, replacing `your_server_ip` with the server's IP address:  
   ```bash
   ftp your_server_ip
   ```

3. **Log In:**  
   Enter the credentials of a local system user to verify connectivity. You should be able to upload, download, and navigate files (based on your configuration).

---

### **Step 8: Secure Your FTP Server with SSL/TLS**

For enhanced security, configure VSFTPD to use SSL/TLS encryption:

1. **Generate an SSL Certificate:**  

   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
   ```

   Follow the prompts to input details for the certificate.

2. **Edit VSFTPD Configuration:**  
   Add the following lines to `/etc/vsftpd/vsftpd.conf` to enable SSL:  
   ```plaintext
   ssl_enable=YES
   rsa_cert_file=/etc/ssl/certs/vsftpd.crt
   rsa_private_key_file=/etc/ssl/private/vsftpd.key
   allow_anon_ssl=NO
   force_local_data_ssl=YES
   force_local_logins_ssl=YES
   ssl_tlsv1=YES
   ssl_sslv2=NO
   ssl_sslv3=NO
   ```

3. **Restart VSFTPD Service:**  
   ```bash
   sudo systemctl restart vsftpd
   ```

---

### **Step 9: Monitor and Manage Your FTP Server**

Keep your VSFTPD server secure and functional by:  

1. **Regularly Checking Logs:**  
   Logs are located at `/var/log/vsftpd.log` and provide insights into FTP activity.

   ```bash
   cat /var/log/vsftpd.log
   ```

2. **Updating AlmaLinux and VSFTPD:**  
   Regularly update the system to patch vulnerabilities:  
   ```bash
   sudo dnf update -y
   ```

3. **Backup Configurations:**  
   Save a copy of the `/etc/vsftpd/vsftpd.conf` file before making changes to revert in case of errors.

---

### **Conclusion**

Installing and configuring VSFTPD on AlmaLinux is a straightforward process that, when done correctly, offers a secure and efficient way to transfer files. By following the steps outlined above, you can set up a robust FTP server tailored to your requirements. Regular maintenance, along with proper firewall and SSL/TLS configurations, will ensure your server remains secure and reliable.  

---

**Frequently Asked Questions (FAQs)**  

1. **Can VSFTPD be used for anonymous FTP access?**  
   Yes, but it's generally not recommended for secure environments. Enable anonymous access by setting `anonymous_enable=YES` in the configuration.

2. **What are the default FTP ports used by VSFTPD?**  
   VSFTPD uses port 21 for control and a range of ports for passive data transfers (as defined in the configuration).

3. **How can I limit user upload speeds?**  
   Add `local_max_rate=UPLOAD_SPEED_IN_BYTES` to the VSFTPD configuration file.

4. **Is it necessary to use SSL/TLS for VSFTPD?**  
   While not mandatory, SSL/TLS significantly enhances the security of file transfers and is strongly recommended.

5. **How do I troubleshoot VSFTPD issues?**  
   Check logs at `/var/log/vsftpd.log` and ensure the configuration file has no syntax errors.

6. **Can VSFTPD be integrated with Active Directory?**  
   Yes, with additional tools like PAM (Pluggable Authentication Modules), VSFTPD can authenticate users via Active Directory.  
