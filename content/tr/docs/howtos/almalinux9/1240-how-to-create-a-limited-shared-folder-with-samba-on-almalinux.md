---
title: How to Create a Limited Shared Folder with Samba on AlmaLinux
linkTitle: Shared Folder with Samba
description: This guide will walk you through creating a shared folder with restricted access, ensuring only authorized users or groups can view or modify files within it.
date: 2024-12-22
weight: 1240
url: create-limited-shared-folder-samba-almalinux
draft: false
tags:
   - AlmaLinux
   - samba
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
   - samba
excludeSearch: false
sidebar:
   open: true
featured_image: /images/almalinux.webp
---
#### **Introduction**  
Samba is an open-source suite that allows Linux servers to communicate with Windows systems, facilitating file sharing across platforms. A common use case is setting up shared folders with specific restrictions, ensuring secure and controlled access to sensitive data.  

AlmaLinux, a stable and reliable enterprise Linux distribution, is a great choice for hosting Samba servers. This guide will walk you through creating a shared folder with restricted access, ensuring only authorized users or groups can view or modify files within it.  

By the end of this tutorial, you’ll have a fully functional Samba setup with a limited shared folder, ideal for maintaining data security in mixed-OS networks.  

---

#### **Prerequisites**  
To successfully follow this guide, ensure you have the following:  

1. **System Setup**:  
   - A machine running AlmaLinux with sudo/root privileges.  
   - Static IP configuration for consistent network access.  

2. **Software Requirements**:  
   - Samba is not installed by default on AlmaLinux, so you’ll need to install it.  

3. **User Privileges**:  
   - Basic knowledge of managing users and permissions in Linux.  

---

#### **Step 1: Installing Samba on AlmaLinux**  
First, you need to install Samba and start the necessary services.  

1. **Update System Packages**:  
   Update the existing packages to ensure system stability:  
   ```bash
   sudo dnf update -y
   ```  

2. **Install Samba**:  
   Install Samba and its utilities:  
   ```bash
   sudo dnf install samba samba-common samba-client -y
   ```  

3. **Start and Enable Services**:  
   Once installed, start and enable the Samba service:  
   ```bash
   sudo systemctl start smb
   sudo systemctl enable smb
   ```  

4. **Verify Installation**:  
   Confirm Samba is running:  
   ```bash
   sudo systemctl status smb
   ```  

---

#### **Step 2: Configuring Samba for Limited Access**  
The configuration of Samba involves editing its primary configuration file.  

1. **Locate the Configuration File**:  
   The main Samba configuration file is located at `/etc/samba/smb.conf`. Open it using a text editor:  
   ```bash
   sudo nano /etc/samba/smb.conf
   ```  

2. **Define the Shared Folder**:  
   Add the following block at the end of the file:  
   ```plaintext
   [LimitedShare]
   path = /srv/samba/limited
   browseable = yes
   writable = no
   valid users = @limitedgroup
   create mask = 0644
   directory mask = 0755
   ```  

   - `path`: Specifies the directory to be shared.  
   - `browseable`: Makes the share visible to users.  
   - `writable`: Disables write access by default.  
   - `valid users`: Restricts access to members of the specified group (`limitedgroup` in this case).  
   - `create mask` and `directory mask`: Set default permissions for new files and directories.  

3. **Save and Test Configuration**:  
   Save the changes (`CTRL+O`, `Enter`, `CTRL+X`) and test the configuration:  
   ```bash
   sudo testparm
   ```  

---

#### **Step 3: Creating the Shared Folder**  
Now that Samba is configured, let’s create the shared folder and assign proper permissions.  

1. **Create the Directory**:  
   Create the directory specified in the `path` directive:  
   ```bash
   sudo mkdir -p /srv/samba/limited
   ```  

2. **Create a User Group**:  
   Add a group to control access to the shared folder:  
   ```bash
   sudo groupadd limitedgroup
   ```  

3. **Set Ownership and Permissions**:  
   Assign the directory ownership to the group and set permissions:  
   ```bash
   sudo chown -R root:limitedgroup /srv/samba/limited
   sudo chmod -R 0770 /srv/samba/limited
   ```  

   The `0770` permission ensures that only the group members can read, write, and execute files within the folder.  

---

#### **Step 4: Adding Users to the Group**  
To enforce limited access, add specific users to the `limitedgroup` group.  

1. **Create or Modify Users**:  
   If the user doesn’t exist, create one:  
   ```bash
   sudo adduser limiteduser
   ```  

   Add the user to the group:  
   ```bash
   sudo usermod -aG limitedgroup limiteduser
   ```  

2. **Set Samba Password**:  
   Each user accessing Samba needs a Samba-specific password:  
   ```bash
   sudo smbpasswd -a limiteduser
   ```  

3. **Enable the User**:  
   Ensure the user is active in Samba:  
   ```bash
   sudo smbpasswd -e limiteduser
   ```  

Repeat these steps for each user you want to grant access to the shared folder.  

---

#### **Step 5: Testing the Configuration**  
After setting up Samba and the shared folder, test the setup to ensure it works as expected.  

1. **Restart Samba**:  
   Restart the Samba service to apply changes:  
   ```bash
   sudo systemctl restart smb
   ```  

2. **Access the Shared Folder**:  
   On a Windows system:  
   - Open the `Run` dialog (`Win + R`).  
   - Enter the server’s IP address: `\\<Server_IP>\LimitedShare`.  
   - Provide the credentials of a user added to the `limitedgroup`.  

3. **Test Access Control**:  
   - Ensure unauthorized users cannot access the folder.  
   - Verify restricted permissions (e.g., read-only or no access).  

---

#### **Step 6: Securing the Samba Server**  
Security is crucial for maintaining the integrity of your network.  

1. **Disable Guest Access**:  
   Ensure `guest ok` is set to `no` in your shared folder configuration.  

2. **Enable Firewall Rules**:  
   Allow only Samba traffic through the firewall:  
   ```bash
   sudo firewall-cmd --add-service=samba --permanent
   sudo firewall-cmd --reload
   ```  

3. **Monitor Logs**:  
   Regularly review Samba logs in `/var/log/samba/` to detect unauthorized access attempts.  

4. **Limit IP Ranges**:  
   Add an `hosts allow` directive to restrict access by IP:  
   ```plaintext
   hosts allow = 192.168.1.0/24
   ```  

---

#### **Conclusion**  
Creating a limited shared folder with Samba on AlmaLinux is an effective way to control access to sensitive data. By carefully managing permissions and restricting access to specific users or groups, you can ensure that only authorized personnel can interact with the shared resources.  

In this tutorial, we covered the installation of Samba, its configuration for limited access, and best practices for securing your setup. With this setup, you can enjoy the flexibility of cross-platform file sharing while maintaining a secure network environment.  

For further questions or troubleshooting, feel free to leave a comment below!  
