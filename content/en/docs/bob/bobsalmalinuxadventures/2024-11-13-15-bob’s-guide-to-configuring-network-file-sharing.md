---
title: Bob’s Guide to Configuring Network File Sharing on AlmaLinux
linkTitle: File Sharing
description: Bob will learn how to set up network file sharing on AlmaLinux. He’ll configure both NFS and Samba.
date: 2024-11-12
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 150
toc: true
keywords:
  - file sharing
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-configuring-network-file-sharing-alma-linux
---
Alright, let’s continue with Chapter 15, *"Bob’s Guide to Configuring Network File Sharing"*, where Bob will learn how to set up network file sharing on AlmaLinux. He’ll configure both NFS (for Linux-to-Linux sharing) and Samba (for cross-platform sharing with Windows).

---

##  **1. Introduction: Bob’s File Sharing Challenge**

Bob’s team wants an easy way to share files across the network, so he’s been asked to set up network file sharing on his AlmaLinux server. This will allow team members to access shared folders from their own devices, whether they’re using Linux or Windows. Bob decides to explore two popular solutions: **NFS** (Network File System) for Linux clients and **Samba** for cross-platform sharing with Windows.

> *“Let’s get these files accessible for everyone on the team!”* Bob says, ready to set up network sharing.

---

## **2. Setting Up NFS for Linux-to-Linux File Sharing**

Bob starts with **NFS**, a protocol optimized for Linux systems, which allows file sharing across Linux-based devices with minimal configuration.

- **Installing NFS**: Bob installs the `nfs-utils` package, which includes the necessary tools to set up NFS:

  ```bash
  sudo dnf install nfs-utils
  ```

- **Creating a Shared Directory**: Bob creates a directory on the server to share with other Linux devices:

  ```bash
  sudo mkdir /srv/nfs/shared
  ```

- **Configuring Permissions**: He sets permissions so that other users can read and write to the directory:

  ```bash
  sudo chown -R nobody:nogroup /srv/nfs/shared
  sudo chmod 777 /srv/nfs/shared
  ```

- **Editing the Exports File**: To define the NFS share, Bob adds an entry in `/etc/exports`:

  ```bash
  sudo nano /etc/exports
  ```

  He adds the following line to allow all devices in the local network (e.g., `192.168.1.0/24`) to access the share:

  ```bash
  /srv/nfs/shared 192.168.1.0/24(rw,sync,no_subtree_check)
  ```

- **Starting and Enabling NFS**: Bob starts and enables NFS services so that they’re available after reboot:

  ```bash
  sudo systemctl start nfs-server
  sudo systemctl enable nfs-server
  ```

- **Exporting the NFS Shares**: Finally, he exports the NFS configuration to apply the settings:

  ```bash
  sudo exportfs -rav
  ```

> *“The shared directory is live on the network for other Linux users!”* Bob says, happy with the simple setup.

---

## **3. Mounting the NFS Share on a Linux Client**

Bob tests the NFS setup by mounting it on another Linux machine.

- **Installing NFS Client**: On the client system, he ensures `nfs-utils` is installed:

  ```bash
  sudo dnf install nfs-utils
  ```

- **Mounting the NFS Share**: He creates a mount point and mounts the NFS share:

  ```bash
  sudo mkdir -p /mnt/nfs_shared
  sudo mount 192.168.1.100:/srv/nfs/shared /mnt/nfs_shared
  ```

  - Replace `192.168.1.100` with the IP address of the NFS server.

- **Testing the Connection**: Bob checks that he can read and write to the shared folder from the client machine.

> *“NFS is now set up, and my Linux teammates can access shared files easily!”* Bob says, feeling accomplished.

---

## **4. Setting Up Samba for Cross-Platform Sharing with Windows**

Next, Bob configures **Samba** so that Windows devices can also access the shared files. Samba allows AlmaLinux to act as a file server that’s compatible with both Linux and Windows systems.

- **Installing Samba**: Bob installs the `samba` package:

  ```bash
  sudo dnf install samba
  ```

- **Creating a Samba Share Directory**: Bob creates a directory specifically for Samba sharing:

  ```bash
  sudo mkdir /srv/samba/shared
  ```

- **Configuring Permissions**: He sets permissions so that Samba clients can access the directory:

  ```bash
  sudo chown -R nobody:nogroup /srv/samba/shared
  sudo chmod 777 /srv/samba/shared
  ```

- **Editing the Samba Configuration File**: Bob opens the Samba configuration file to define the shared folder:

  ```bash
  sudo nano /etc/samba/smb.conf
  ```

  At the end of the file, he adds a configuration section for the shared directory:

  ```bash
  [Shared]
  path = /srv/samba/shared
  browsable = yes
  writable = yes
  guest ok = yes
  read only = no
  ```

  - **`browsable = yes`**: Allows the folder to appear in network discovery.
  - **`guest ok = yes`**: Enables guest access for users without a Samba account.

- **Setting a Samba Password**: To add a user with Samba access, Bob creates a new Samba password:

  ```bash
  sudo smbpasswd -a bob
  ```

- **Starting and Enabling Samba**: Bob starts and enables the Samba service:

  ```bash
  sudo systemctl start smb
  sudo systemctl enable smb
  ```

> *“Now Windows users should be able to see the shared folder on the network,”* Bob says, excited to test the setup.

---

## **5. Accessing the Samba Share from a Windows Client**

Bob heads over to a Windows machine to test the Samba share.

- **Accessing the Share**: On the Windows device, he opens File Explorer and types the server IP into the address bar:

  ```bash
  \\192.168.1.100\Shared
  ```

  (Replace `192.168.1.100` with the actual IP address of the Samba server.)

- **Testing Read and Write Access**: Bob can see the shared folder and successfully reads and writes files, confirming the Samba share is fully operational.

> *“Cross-platform file sharing achieved!”* Bob says, pleased to have a setup that works for everyone.

---

## **6. Configuring Samba and NFS for Security**

With file sharing enabled, Bob wants to make sure his configuration is secure.

- **Limiting Access in NFS**: Bob restricts access in the NFS configuration to specific trusted IPs:

  ```bash
  /srv/nfs/shared 192.168.1.101(rw,sync,no_subtree_check)
  ```

  This limits access to a specific client with IP `192.168.1.101`.

- **Setting User Permissions in Samba**: He sets up specific user permissions in Samba by adding individual users to `smb.conf`:

  ```bash
  [Shared]
  path = /srv/samba/shared
  valid users = bob, alice
  browsable = yes
  writable = yes
  ```

  This ensures that only `bob` and `alice` can access the share.

- **Restarting Services**: Bob restarts both NFS and Samba services to apply the new security settings:

  ```bash
  sudo systemctl restart nfs-server
  sudo systemctl restart smb
  ```

> *“Keeping access secure is just as important as making it convenient,”* Bob notes, feeling good about the added security.

---

## **7. Conclusion: Bob’s Cross-Platform File Sharing Success**

With both NFS and Samba set up, Bob has created a robust file-sharing environment on AlmaLinux. Now, his Linux and Windows teammates can access shared resources seamlessly, and his server is set up securely to prevent unauthorized access.

> Next up, Bob is eager to dive into **automated deployment and containerization** to make app management even easier.

*Stay tuned for the next chapter: "Bob Explores Automated Deployment and Containerization with Docker!"*
