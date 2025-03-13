---
title: How to Configure VSFTPD Over SSL/TLS on AlmaLinux
linkTitle: VSFTPD Over SSL/TLS
description: This guide will walk you through the process of setting up VSFTPD with SSL/TLS on AlmaLinux.
date: 2024-12-22
weight: 1210
url: configure-vsftpd-ssl-tls-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-configure-vsftpd-over-ssltls-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
VSFTPD (Very Secure File Transfer Protocol Daemon) is a reliable, lightweight, and highly secure FTP server for Unix-like operating systems. By default, FTP transmits data in plain text, making it vulnerable to interception. Configuring VSFTPD with SSL/TLS ensures encrypted data transfers, providing enhanced security for your FTP server. This guide will walk you through the process of setting up VSFTPD with SSL/TLS on AlmaLinux.

---

## **Prerequisites**

Before starting, ensure the following are in place:

1. **A Running AlmaLinux Server**:  
   - AlmaLinux 8 or later installed on your system.

2. **Root or Sudo Privileges**:  
   - Required to install software and modify configurations.

3. **Basic Knowledge of FTP**:  
   - Familiarity with FTP basics will be helpful.

4. **OpenSSL Installed**:  
   - Necessary for generating SSL/TLS certificates.

5. **Firewall Configuration Access**:  
   - Required to open FTP and related ports.

---

## **Step 1: Update Your AlmaLinux System**

Before configuring VSFTPD, ensure your system is up-to-date. Run the following commands:

```bash
sudo dnf update -y
sudo reboot
```

Updating ensures you have the latest security patches and stable software versions.

---

## **Step 2: Install VSFTPD**

VSFTPD is available in the AlmaLinux default repositories, making installation straightforward. Install it using the following command:

```bash
sudo dnf install vsftpd -y
```

Once the installation is complete, start and enable the VSFTPD service:

```bash
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```

Check the service status to ensure it's running:

```bash
sudo systemctl status vsftpd
```

---

## **Step 3: Generate an SSL/TLS Certificate**

To encrypt FTP traffic, you’ll need an SSL/TLS certificate. For simplicity, we’ll create a self-signed certificate using OpenSSL.

1. **Create a Directory for Certificates**:  
   Create a dedicated directory to store your SSL/TLS certificate and private key:

   ```bash
   sudo mkdir /etc/vsftpd/ssl
   ```

2. **Generate the Certificate**:  
   Run the following command to generate a self-signed certificate:

   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/vsftpd/ssl/vsftpd.key -out /etc/vsftpd/ssl/vsftpd.crt
   ```

   When prompted, provide details like Country, State, and Organization. This information will be included in the certificate.

3. **Set Permissions**:  
   Secure the certificate and key files:

   ```bash
   sudo chmod 600 /etc/vsftpd/ssl/vsftpd.key
   sudo chmod 600 /etc/vsftpd/ssl/vsftpd.crt
   ```

---

## **Step 4: Configure VSFTPD for SSL/TLS**

Edit the VSFTPD configuration file to enable SSL/TLS and customize the server settings.

1. **Open the Configuration File**:  
   Use a text editor to open `/etc/vsftpd/vsftpd.conf`:

   ```bash
   sudo nano /etc/vsftpd/vsftpd.conf
   ```

2. **Enable SSL/TLS**:  
   Add or modify the following lines:

   ```plaintext
   ssl_enable=YES
   rsa_cert_file=/etc/vsftpd/ssl/vsftpd.crt
   rsa_private_key_file=/etc/vsftpd/ssl/vsftpd.key
   force_local_data_ssl=YES
   force_local_logins_ssl=YES
   ssl_tlsv1=YES
   ssl_sslv2=NO
   ssl_sslv3=NO
   ```

   - **ssl_enable=YES**: Enables SSL/TLS.
   - force_local_data_ssl=YES**: Forces encryption for data transfer.
   - force_local_logins_ssl=YES**: Forces encryption for user authentication.
   - **ssl_tlsv1=YES**: Enables the TLSv1 protocol.
   - **ssl_sslv2=NO** and **ssl_sslv3=NO**: Disables outdated SSL protocols.

3. **Restrict Anonymous Access**:  
   Disable anonymous logins for added security:

   ```plaintext
   anonymous_enable=NO
   ```

4. **Restrict Users to Home Directories**:  
   Prevent users from accessing directories outside their home:

   ```plaintext
   chroot_local_user=YES
   ```

5. **Save and Exit**:  
   Save the changes (Ctrl + O, Enter in Nano) and exit (Ctrl + X).

---

## **Step 5: Restart VSFTPD**

After making configuration changes, restart the VSFTPD service to apply them:

```bash
sudo systemctl restart vsftpd
```

---

## **Step 6: Configure the Firewall**

To allow FTP traffic, update your firewall rules:

1. **Open the Default FTP Port (21)**:  

   ```bash
   sudo firewall-cmd --permanent --add-port=21/tcp
   ```

2. **Open Passive Mode Ports**:  
   Passive mode requires a range of ports. Open them as defined in your configuration file (e.g., 30000-31000):

   ```bash
   sudo firewall-cmd --permanent --add-port=30000-31000/tcp
   ```

3. **Reload the Firewall**:  

   ```bash
   sudo firewall-cmd --reload
   ```

---

## **Step 7: Test the Configuration**

Verify that VSFTPD is working correctly and SSL/TLS is enabled:

1. **Connect Using an FTP Client**:  
   Use an FTP client like FileZilla. Enter the server’s IP address, port, username, and password.

2. **Enable Encryption**:  
   In the FTP client, choose “Require explicit FTP over TLS” or a similar option to enforce encryption.

3. **Verify Certificate**:  
   Upon connecting, the client should display the self-signed certificate details. Accept it to proceed.

4. **Test File Transfers**:  
   Upload and download a test file to ensure the server functions as expected.

---

## **Step 8: Monitor and Maintain VSFTPD**

1. **Check Logs**:  
   Monitor logs for any errors or unauthorized access attempts. Logs are located at:

   ```bash
   /var/log/vsftpd.log
   ```

2. **Update Certificates**:  
   Renew your SSL/TLS certificate before it expires. For a self-signed certificate, regenerate it using OpenSSL.

3. **Apply System Updates**:  
   Regularly update AlmaLinux and VSFTPD to ensure you have the latest security patches:

   ```bash
   sudo dnf update -y
   ```

4. **Backup Configuration Files**:  
   Keep a backup of `/etc/vsftpd/vsftpd.conf` and SSL/TLS certificates.

---

## **Conclusion**

Setting up VSFTPD over SSL/TLS on AlmaLinux provides a secure and efficient way to manage file transfers. By encrypting data and user credentials, you minimize the risk of unauthorized access and data breaches. With proper configuration, firewall rules, and maintenance, your VSFTPD server will operate reliably and securely.

---

## **FAQs**

1. **What is the difference between FTPS and SFTP?**  
   - FTPS uses FTP with SSL/TLS for encryption, while SFTP is a completely different protocol that uses SSH for secure file transfers.

2. **Can I use a certificate from a trusted authority instead of a self-signed certificate?**  
   - Yes, you can purchase a certificate from a trusted CA (Certificate Authority) and configure it in the same way as a self-signed certificate.

3. **What port should I use for FTPS?**  
   - FTPS typically uses port 21 for control and a range of passive ports for data transfer.

4. **How do I troubleshoot connection errors?**  
   - Check the firewall rules, VSFTPD logs (`/var/log/vsftpd.log`), and ensure the FTP client is configured to use explicit TLS encryption.

5. **Is passive mode necessary?**  
   - Passive mode is recommended when clients are behind a NAT or firewall, as it allows the server to initiate data connections.

6. **How do I add new users to the FTP server?**  
   - Create a new user with `sudo adduser username` and assign a password with `sudo passwd username`. Ensure the user has appropriate permissions for their home directory.
