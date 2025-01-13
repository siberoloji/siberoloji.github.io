---
title: How to Create a Fully Accessed Shared Folder with Samba on AlmaLinux
linkTitle: Fully Accessed Shared Folder with Samba
description: "In this guide, we’ll walk you through setting up a fully accessed shared folder using Samba on AlmaLinux, ensuring users across your network can easily share and manage files.  "
date: 2024-12-22
weight: 1230
url: create-fully-accessed-shared-folder-samba-almalinux
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

Samba is a powerful open-source software suite that enables file sharing and printer services across different operating systems, including Linux and Windows. It allows seamless integration of Linux systems into Windows-based networks, making it an essential tool for mixed-OS environments.  

AlmaLinux, a popular community-driven enterprise OS, provides a stable foundation for hosting Samba servers. In this guide, we’ll walk you through setting up a fully accessed shared folder using Samba on AlmaLinux, ensuring users across your network can easily share and manage files.

---

#### **Prerequisites**  

Before we dive in, ensure the following requirements are met:  

1. **System Setup**: A machine running AlmaLinux with sudo/root access.  
2. **Network Configuration**: Ensure the machine has a static IP for reliable access.  
3. **Required Packages**: Samba is not pre-installed, so be ready to install it.  
4. **User Privileges**: Have administrative privileges to manage users and file permissions.  

---

#### **Installing Samba on AlmaLinux**  

To start, you need to install Samba on your AlmaLinux system.  

1. **Update Your System**:  
   Open the terminal and update the system packages to their latest versions:  

   ```bash
   sudo dnf update -y
   ```  

2. **Install Samba**:  
   Install Samba and its dependencies using the following command:  

   ```bash
   sudo dnf install samba samba-common samba-client -y
   ```  

3. **Start and Enable Samba**:  
   After installation, start the Samba service and enable it to run at boot:  

   ```bash
   sudo systemctl start smb
   sudo systemctl enable smb
   ```  

4. **Verify Installation**:  
   Ensure Samba is running properly:  

   ```bash
   sudo systemctl status smb
   ```  

---

#### **Configuring Samba**  

The next step is to configure Samba by editing its configuration file.  

1. **Open the Configuration File**:  
   The Samba configuration file is located at `/etc/samba/smb.conf`. Open it using a text editor:  

   ```bash
   sudo nano /etc/samba/smb.conf
   ```  

2. **Basic Configuration**:  
   Add the following block at the end of the file to define the shared folder:  

   ```plaintext
   [SharedFolder]
   path = /srv/samba/shared
   browseable = yes
   writable = yes
   guest ok = yes
   create mask = 0755
   directory mask = 0755
   ```  

   - `path`: Specifies the folder location on your system.  
   - `browseable`: Allows the folder to be seen in the network.  
   - `writable`: Enables write access.  
   - `guest ok`: Allows guest access without authentication.  

3. **Save and Exit**:  
   Save the file and exit the editor (`CTRL+O`, `Enter`, `CTRL+X`).  

4. **Test the Configuration**:  
   Validate the Samba configuration for errors:  

   ```bash
   sudo testparm
   ```  

---

#### **Setting Up the Shared Folder**  

Now, let’s create the shared folder and adjust its permissions.  

1. **Create the Directory**:  
   Create the directory specified in the configuration file:  

   ```bash
   sudo mkdir -p /srv/samba/shared
   ```  

2. **Set Permissions**:  
   Ensure everyone can access the folder:  

   ```bash
   sudo chmod -R 0777 /srv/samba/shared
   ```  

   The `0777` permission allows full read, write, and execute access to all users.  

---

#### **Creating Samba Users**  

Although the above configuration allows guest access, creating Samba users is more secure.  

1. **Add a System User**:  
   Create a system user who will be granted access:  

   ```bash
   sudo adduser sambauser
   ```  

2. **Set a Samba Password**:  
   Assign a password for the Samba user:  

   ```bash
   sudo smbpasswd -a sambauser
   ```  

3. **Enable the User**:  
   Ensure the user is active in Samba:  

   ```bash
   sudo smbpasswd -e sambauser
   ```  

---

#### **Testing and Verifying the Shared Folder**  

After configuring Samba, verify that the shared folder is accessible.  

1. **Restart Samba**:  
   Apply changes by restarting the Samba service:  

   ```bash
   sudo systemctl restart smb
   ```  

2. **Access from Windows**:  
   - On a Windows machine, press `Win + R` to open the Run dialog.  
   - Enter the server’s IP address in the format `\\<Server_IP>\SharedFolder`.  
   - For example: `\\192.168.1.100\SharedFolder`.  

3. **Test Read and Write Access**:  
   Try creating, modifying, and deleting files within the shared folder to ensure full access.  

---

#### **Securing Your Samba Server**  

While setting up a fully accessed shared folder is convenient, it’s important to secure your Samba server:  

1. **Restrict IP Access**:  
   Limit access to specific IP addresses using the `hosts allow` directive in the Samba configuration file.  

2. **Monitor Logs**:  
   Regularly check Samba logs located in `/var/log/samba/` for unauthorized access attempts.  

3. **Implement User Authentication**:  
   Avoid enabling guest access in sensitive environments. Instead, require user authentication.  

---

#### **Conclusion**  

Setting up a fully accessed shared folder with Samba on AlmaLinux is straightforward and provides an efficient way to share files across your network. With Samba, you can seamlessly integrate Linux into a Windows-dominated environment, making file sharing easy and accessible for everyone.  

To further secure and optimize your server, consider implementing advanced configurations like encrypted communication or access controls tailored to your organization’s needs.  

By following this guide, you’re now equipped to deploy a shared folder that enhances collaboration and productivity in your network.  

---

If you need additional assistance or have tips to share, feel free to leave a comment below!  
