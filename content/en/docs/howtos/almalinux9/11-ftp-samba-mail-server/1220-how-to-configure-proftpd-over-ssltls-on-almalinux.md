---
title: How to Configure ProFTPD Over SSL/TLS on AlmaLinux
linkTitle: ProFTPD Over SSL/TLS
description: This guide will walk you through the step-by-step process of setting up and configuring ProFTPD over SSL/TLS on AlmaLinux.
date: 2024-12-22
weight: 1220
url: configure-proftpd-ssl-tls-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

keywords:
  - AlmaLinux
  - proftpd


featured_image: /images/almalinux.webp
---
ProFTPD is a powerful and flexible FTP server that can be easily configured to secure file transfers using SSL/TLS. By encrypting data and credentials during transmission, SSL/TLS ensures security and confidentiality. This guide will walk you through the step-by-step process of setting up and configuring ProFTPD over SSL/TLS on AlmaLinux.

---

## **Prerequisites**

Before you begin, ensure the following are in place:

1. **AlmaLinux Server**:  
   - AlmaLinux 8 or a newer version installed.  

2. **Root or Sudo Access**:  
   - Administrative privileges to execute commands.  

3. **OpenSSL Installed**:  
   - Required for generating SSL/TLS certificates.  

4. **Basic FTP Knowledge**:  
   - Familiarity with FTP client operations and file transfers.  

5. **Firewall Configuration Access**:  
   - Necessary for allowing FTP traffic through the firewall.  

---

## **Step 1: Update the System**

Begin by updating your system to ensure all packages are current. Use the following commands:

```bash
sudo dnf update -y
sudo reboot
```

This ensures your AlmaLinux installation has the latest security patches and software versions.

---

## **Step 2: Install ProFTPD**

ProFTPD is available in the Extra Packages for Enterprise Linux (EPEL) repository. To install it:

1. **Enable the EPEL Repository**:

   ```bash
   sudo dnf install epel-release -y
   ```

2. **Install ProFTPD**:

   ```bash
   sudo dnf install proftpd -y
   ```

3. **Start and Enable ProFTPD**:

   ```bash
   sudo systemctl start proftpd
   sudo systemctl enable proftpd
   ```

4. **Verify the Installation**:

   Check the status of ProFTPD:

   ```bash
   sudo systemctl status proftpd
   ```

---

## **Step 3: Generate an SSL/TLS Certificate**

To secure your FTP server, you need an SSL/TLS certificate. For simplicity, we'll create a self-signed certificate.

1. **Create a Directory for SSL Files**:

   ```bash
   sudo mkdir /etc/proftpd/ssl
   ```

2. **Generate the Certificate**:

   Use OpenSSL to create a self-signed certificate and private key:

   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/proftpd/ssl/proftpd.key -out /etc/proftpd/ssl/proftpd.crt
   ```

   When prompted, provide details like Country, State, and Organization. These details will be included in the certificate.

3. **Set File Permissions**:

   Secure the certificate and key files:

   ```bash
   sudo chmod 600 /etc/proftpd/ssl/proftpd.key
   sudo chmod 600 /etc/proftpd/ssl/proftpd.crt
   ```

---

## **Step 4: Configure ProFTPD for SSL/TLS**

Next, configure ProFTPD to use the SSL/TLS certificate for secure connections.

1. **Edit the ProFTPD Configuration File**:

   Open `/etc/proftpd/proftpd.conf` using a text editor:

   ```bash
   sudo nano /etc/proftpd/proftpd.conf
   ```

2. **Enable Mod_TLS Module**:

   Ensure the following line is present to load the `mod_tls` module:

   ```plaintext
   Include /etc/proftpd/conf.d/tls.conf
   ```

3. **Create the TLS Configuration File**:

   Create a new file for TLS-specific configurations:

   ```bash
   sudo nano /etc/proftpd/conf.d/tls.conf
   ```

   Add the following content:

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

   - **TLSEngine on**: Enables SSL/TLS.  
   - **TLSProtocol TLSv1.2**: Specifies the protocol version.  
   - **TLSRequired on**: Enforces the use of TLS.  

4. **Restrict Anonymous Access**:

   In the main ProFTPD configuration file (`/etc/proftpd/proftpd.conf`), disable anonymous logins for better security:

   ```plaintext
   <Anonymous /var/ftp>
       User ftp
       Group ftp
       <Limit LOGIN>
           DenyAll
       </Limit>
   </Anonymous>
   ```

5. **Restrict Users to Home Directories**:

   Add the following directive to ensure users are confined to their home directories:

   ```plaintext
   DefaultRoot ~
   ```

6. **Save and Exit**:

   Save your changes and exit the editor (Ctrl + O, Enter, Ctrl + X in Nano).

---

## **Step 5: Restart ProFTPD**

Restart the ProFTPD service to apply the new configurations:

```bash
sudo systemctl restart proftpd
```

Check for errors in the configuration file using the following command before restarting:

```bash
sudo proftpd -t
```

---

## **Step 6: Configure the Firewall**

Allow FTP and related traffic through the AlmaLinux firewall.

1. **Open FTP Default Port (21)**:

   ```bash
   sudo firewall-cmd --permanent --add-port=21/tcp
   ```

2. **Open Passive Mode Ports**:

   If you have configured passive mode, open the relevant port range (e.g., 30000-31000):

   ```bash
   sudo firewall-cmd --permanent --add-port=30000-31000/tcp
   ```

3. **Reload the Firewall**:

   ```bash
   sudo firewall-cmd --reload
   ```

---

## **Step 7: Test the Configuration**

Use an FTP client such as FileZilla to test the server’s SSL/TLS configuration.

1. **Open FileZilla**:

   Install and launch FileZilla on your client machine.

2. **Enter Connection Details**:

   - **Host**: Your server's IP address or domain.  
   - **Port**: 21 (or the port specified in the configuration).  
   - **Protocol**: FTP - File Transfer Protocol.  
   - **Encryption**: Require explicit FTP over TLS.  
   - **Username and Password**: Use valid credentials for a local user.  

3. **Verify Certificate**:

   Upon connecting, the FTP client will display the server’s SSL certificate. Accept the certificate to establish a secure connection.

4. **Transfer Files**:

   Upload and download a test file to confirm the server is working correctly.

---

## **Step 8: Monitor and Maintain the Server**

1. **Check Logs**:

   Monitor ProFTPD logs for any issues or unauthorized access attempts:

   ```bash
   sudo tail -f /var/log/proftpd/proftpd.log
   sudo tail -f /var/log/proftpd/tls.log
   ```

2. **Renew Certificates**:

   Replace your SSL/TLS certificate before it expires. If using a self-signed certificate, regenerate it using OpenSSL.

3. **Apply System Updates**:

   Regularly update your AlmaLinux system and ProFTPD to maintain security:

   ```bash
   sudo dnf update -y
   ```

4. **Backup Configuration Files**:

   Keep a backup of `/etc/proftpd/proftpd.conf` and `/etc/proftpd/ssl` to restore configurations if needed.

---

## **Conclusion**

Configuring ProFTPD over SSL/TLS on AlmaLinux enhances the security of your FTP server by encrypting data transfers. This guide provides a clear, step-by-step approach to set up SSL/TLS, ensuring secure file transfers for your users. With proper maintenance and periodic updates, your ProFTPD server can remain a reliable and secure solution for file management.

---

## **FAQs**

1. **What is the difference between FTPS and SFTP?**  
   FTPS uses FTP with SSL/TLS for encryption, while SFTP operates over SSH, providing a completely different protocol for secure file transfers.

2. **Can I use a certificate from a trusted Certificate Authority (CA)?**  
   Yes, you can obtain a certificate from a trusted CA and configure it in the same way as a self-signed certificate.

3. **How can I verify that my ProFTPD server is using SSL/TLS?**  
   Use an FTP client like FileZilla and ensure it reports the connection as encrypted.

4. **What is the default ProFTPD log file location?**  
   The default log file is located at `/var/log/proftpd/proftpd.log`.

5. **Why should I restrict anonymous FTP access?**  
   Disabling anonymous access enhances security by ensuring only authenticated users can access the server.

6. **What is the role of Passive Mode in FTP?**  
   Passive mode is essential for clients behind NAT or firewalls, as it allows the client to initiate data connections.
