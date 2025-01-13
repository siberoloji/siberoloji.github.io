---
draft: false

title:  'AlmaLinux 9: How to Configure SSH Server and Use SSH Client'
date: '2024-10-04T17:36:36+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-configure-ssh-server-and-use-ssh-client/
 
featured_image: /images/almalinux.webp
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux how-to'
---
**Secure Shell (SSH)** is an essential protocol for administrators and developers to securely manage remote servers. It provides encrypted communication between client and server, ensuring that data sent over the network is protected from eavesdropping. In **AlmaLinux 9**, configuring an SSH server and using SSH clients allows you to connect, control, and manage your servers efficiently from a remote machine. This article will walk you through the process of setting up an SSH server on AlmaLinux 9 and how to use an SSH client for secure connections.
Table of Contents
* Introduction to SSH

* Why Use SSH in AlmaLinux?

* Installing and Configuring SSH Server on AlmaLinux 9

* Secure SSH Configuration: Best Practices

* Using the SSH Client to Connect to a Remote Server

* Transferring Files with SSH (SCP and SFTP)

* Troubleshooting Common SSH Issues

* Conclusion

1. Introduction to SSH

**SSH (Secure Shell)** is a cryptographic protocol designed for secure communication over a network. It provides several features:
* **Remote Command Execution**: Execute commands on a remote system as if you're physically present.

* **Secure File Transfer**: Transfer files between a local and a remote machine securely.

* **Tunneling**: Forward data securely across an unsecured network.
SSH is a replacement for older protocols like **Telnet** and **rlogin**, which do not encrypt traffic and are vulnerable to attacks.
2. Why Use SSH in AlmaLinux?

SSH is widely used because of its security and functionality. It offers:
* **Encrypted Connections**: Prevents unauthorized access and protects sensitive data.

* **Remote Management**: Allows administrators to manage servers without being physically present.

* **Flexibility**: Supports tunneling, port forwarding, and file transfer protocols like SCP and SFTP.
In AlmaLinux 9, **OpenSSH** is the default SSH implementation. It includes both the SSH server (`sshd`) and the client (`ssh`).
3. Installing and Configuring SSH Server on AlmaLinux 9

The first step in setting up remote access on AlmaLinux 9 is installing and configuring the **OpenSSH Server**.
#### Step 1: Install OpenSSH

By default, AlmaLinux 9 may have OpenSSH installed. To confirm or install it:
```bash
sudo dnf install openssh-server```
#### Step 2: Enable and Start SSH Service

After installation, enable the SSH service to ensure it starts on boot and is immediately active:
```bash
sudo systemctl enable sshd
sudo systemctl start sshd
```

You can verify the status of the SSH service with:
```bash
sudo systemctl status sshd
```

If it's running, you’re ready to accept SSH connections.
#### Step 3: Configure the Firewall

To allow SSH traffic through the firewall, open port **22** (the default SSH port):
```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

If you intend to change the default port for added security (as explained below), you will need to open that port in the firewall.
4. Secure SSH Configuration: Best Practices

Security is a priority when configuring SSH. Several tweaks can improve the security of your SSH server, making it harder for attackers to compromise your system.
#### Step 1: Disable Root Login

By default, SSH allows root login, but this can be risky. Disabling root access ensures that users log in with non-privileged accounts before escalating privileges.

Open the SSH configuration file:
```bash
sudo nano /etc/ssh/sshd_config```

Locate the line:
```bash
PermitRootLogin yes
```

Change it to:
```bash
PermitRootLogin no```
#### Step 2: Use SSH Key-Based Authentication

Password authentication can be vulnerable to brute-force attacks. For stronger security, use **SSH keys**:
* Generate a key pair on your client machine:

```bash
  ssh-keygen -t rsa -b 4096```

This will create a private key (`id_rsa`) and a public key (`id_rsa.pub`) in the `~/.ssh/` directory.
* Copy the public key to the server:

```bash
  ssh-copy-id user@server_ip_address
```

Alternatively, you can manually copy the contents of `id_rsa.pub` to the `~/.ssh/authorized_keys` file on the server.

Once key-based authentication is set up, disable password authentication in the `/etc/ssh/sshd_config` file:
```bash
PasswordAuthentication no```

Restart the SSH service to apply changes:
```bash
sudo systemctl restart sshd
```
#### Step 3: Change the Default SSH Port

Another security measure is to change the default SSH port (22) to something less predictable. Edit `/etc/ssh/sshd_config`:
```bash
Port 2022```

Replace **2022** with any available port number. Don’t forget to update your firewall:
```bash
sudo firewall-cmd --permanent --add-port=2022/tcp
sudo firewall-cmd --reload
```

Restart the SSH service after making the changes:
```bash
sudo systemctl restart sshd
```
5. Using the SSH Client to Connect to a Remote Server

Once the SSH server is configured, you can connect to it using the SSH client from any Linux, macOS, or Windows machine (using tools like **PuTTY** on Windows).
#### Step 1: Basic SSH Connection

To connect to a remote server, use the following syntax:
```bash
ssh user@server_ip_address
```

For example, if the user is **admin** and the server's IP is **192.168.1.10**, run:
```bash
ssh admin@192.168.1.10```

If you changed the SSH port, specify the port using the `-p` option:
```bash
ssh admin@192.168.1.10 -p 2022```
#### Step 2: Using SSH Keys

If you’ve configured SSH key-based authentication, the SSH client will automatically use your private key (`~/.ssh/id_rsa`). If you have multiple keys, you can specify which key to use with the `-i` option:
```bash
ssh -i /path/to/private_key user@server_ip_address
```
6. Transferring Files with SSH (SCP and SFTP)

SSH also supports secure file transfers using **SCP** (Secure Copy Protocol) and **SFTP** (Secure File Transfer Protocol).
#### Step 1: Using SCP for File Transfers

To copy files from a local machine to a remote server:
```bash
scp /path/to/local/file user@server_ip_address:/path/to/remote/directory
```

To copy files from a remote server to your local machine:
```bash
scp user@server_ip_address:/path/to/remote/file /path/to/local/directory
```
#### Step 2: Using SFTP for File Transfers

**SFTP** is an interactive file transfer tool that works over SSH. To start an SFTP session, use:
```bash
sftp user@server_ip_address
```

Once connected, you can use standard file transfer commands like `put`, `get`, `ls`, `cd`, and `exit`.
7. Troubleshooting Common SSH Issues

If you encounter problems when using SSH, here are some common troubleshooting steps:
#### 1. **SSH Connection Refused**:
* Ensure the SSH service is running: `sudo systemctl status sshd`.

* Check if the firewall allows SSH traffic: `sudo firewall-cmd --list-all`.

#### 2. **Permission Denied**:
* Verify that the correct user and key are being used.

* Ensure the public key is properly configured in the server's `~/.ssh/authorized_keys` file.

#### 3. **Slow Connection**:
* This could be due to DNS resolution. Add the following line to `/etc/ssh/sshd_config` to skip DNS checks:

```bash
UseDNS no```
8. Conclusion

SSH is a critical tool for managing remote servers securely. Configuring an SSH server in **AlmaLinux 9** is straightforward, and once set up, it offers robust features like encrypted connections, remote command execution, and secure file transfers. By following best security practices—such as disabling root login, using key-based authentication, and changing the default SSH port—you can enhance the security of your remote connections.

Whether you're managing a single server or an entire infrastructure, SSH is a fundamental tool that every administrator should master.
