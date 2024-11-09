---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classic-editor-remember:
- block-editor
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-04T17:36:36Z"
guid: https://www.siberoloji.com/?p=2328
id: 2328
image: /assets/images/2024/09/almalinux.webp
tags:
- how-to guides
- linux
- linux how-to
title: 'AlmaLinux 9: How to Configure SSH Server and Use SSH Client'
url: /almalinux-9-how-to-configure-ssh-server-and-use-ssh-client/
---

  ***Secure Shell (SSH)***  is an essential protocol for administrators and developers to securely manage remote servers. It provides encrypted communication between client and server, ensuring that data sent over the network is protected from eavesdropping. In ***AlmaLinux 9*** , configuring an SSH server and using SSH clients allows you to connect, control, and manage your servers efficiently from a remote machine. This article will walk you through the process of setting up an SSH server on AlmaLinux 9 and how to use an SSH client for secure connections.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to SSH 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Why Use SSH in AlmaLinux? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Installing and Configuring SSH Server on AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Secure SSH Configuration: Best Practices 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Using the SSH Client to Connect to a Remote Server 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Transferring Files with SSH (SCP and SFTP) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Troubleshooting Common SSH Issues 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to SSH
<!-- /wp:heading -->

  ***SSH (Secure Shell)***  is a cryptographic protocol designed for secure communication over a network. It provides several features:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Remote Command Execution*** : Execute commands on a remote system as if you're physically present. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Secure File Transfer*** : Transfer files between a local and a remote machine securely. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Tunneling*** : Forward data securely across an unsecured network. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  SSH is a replacement for older protocols like ***Telnet***  and ***rlogin*** , which do not encrypt traffic and are vulnerable to attacks.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Why Use SSH in AlmaLinux?
<!-- /wp:heading -->

  SSH is widely used because of its security and functionality. It offers:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Encrypted Connections*** : Prevents unauthorized access and protects sensitive data. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Remote Management*** : Allows administrators to manage servers without being physically present. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Flexibility*** : Supports tunneling, port forwarding, and file transfer protocols like SCP and SFTP. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  In AlmaLinux 9, ***OpenSSH***  is the default SSH implementation. It includes both the SSH server (<code>sshd</code>) and the client (<code>ssh</code>).
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. Installing and Configuring SSH Server on AlmaLinux 9
<!-- /wp:heading -->

  The first step in setting up remote access on AlmaLinux 9 is installing and configuring the ***OpenSSH Server*** .
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install OpenSSH 
<!-- /wp:heading -->

  By default, AlmaLinux 9 may have OpenSSH installed. To confirm or install it:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install openssh-server</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Enable and Start SSH Service 
<!-- /wp:heading -->

  After installation, enable the SSH service to ensure it starts on boot and is immediately active:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable sshd
sudo systemctl start sshd</code></pre>
<!-- /wp:code -->

  You can verify the status of the SSH service with:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status sshd</code></pre>
<!-- /wp:code -->

  If it's running, you’re ready to accept SSH connections.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Configure the Firewall 
<!-- /wp:heading -->

  To allow SSH traffic through the firewall, open port ***22***  (the default SSH port):
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  If you intend to change the default port for added security (as explained below), you will need to open that port in the firewall.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Secure SSH Configuration: Best Practices
<!-- /wp:heading -->

  Security is a priority when configuring SSH. Several tweaks can improve the security of your SSH server, making it harder for attackers to compromise your system.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Disable Root Login 
<!-- /wp:heading -->

  By default, SSH allows root login, but this can be risky. Disabling root access ensures that users log in with non-privileged accounts before escalating privileges.
 

  Open the SSH configuration file:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/ssh/sshd_config</code></pre>
<!-- /wp:code -->

  Locate the line:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PermitRootLogin yes</code></pre>
<!-- /wp:code -->

  Change it to:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PermitRootLogin no</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Use SSH Key-Based Authentication 
<!-- /wp:heading -->

  Password authentication can be vulnerable to brute-force attacks. For stronger security, use ***SSH keys*** :
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Generate a key pair on your client machine: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  ssh-keygen -t rsa -b 4096</code></pre>
<!-- /wp:code -->

  This will create a private key (<code>id_rsa</code>) and a public key (<code>id_rsa.pub</code>) in the <code>~/.ssh/</code> directory.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Copy the public key to the server: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  ssh-copy-id user@server_ip_address</code></pre>
<!-- /wp:code -->

  Alternatively, you can manually copy the contents of <code>id_rsa.pub</code> to the <code>~/.ssh/authorized_keys</code> file on the server.
 

  Once key-based authentication is set up, disable password authentication in the <code>/etc/ssh/sshd_config</code> file:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PasswordAuthentication no</code></pre>
<!-- /wp:code -->

  Restart the SSH service to apply changes:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart sshd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Change the Default SSH Port 
<!-- /wp:heading -->

  Another security measure is to change the default SSH port (22) to something less predictable. Edit <code>/etc/ssh/sshd_config</code>:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Port 2022</code></pre>
<!-- /wp:code -->

  Replace ***2022***  with any available port number. Don’t forget to update your firewall:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-port=2022/tcp
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  Restart the SSH service after making the changes:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart sshd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Using the SSH Client to Connect to a Remote Server
<!-- /wp:heading -->

  Once the SSH server is configured, you can connect to it using the SSH client from any Linux, macOS, or Windows machine (using tools like ***PuTTY***  on Windows).
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Basic SSH Connection 
<!-- /wp:heading -->

  To connect to a remote server, use the following syntax:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh user@server_ip_address</code></pre>
<!-- /wp:code -->

  For example, if the user is ***admin***  and the server's IP is ***192.168.1.10*** , run:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh admin@192.168.1.10</code></pre>
<!-- /wp:code -->

  If you changed the SSH port, specify the port using the <code>-p</code> option:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh admin@192.168.1.10 -p 2022</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Using SSH Keys 
<!-- /wp:heading -->

  If you’ve configured SSH key-based authentication, the SSH client will automatically use your private key (<code>~/.ssh/id_rsa</code>). If you have multiple keys, you can specify which key to use with the <code>-i</code> option:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh -i /path/to/private_key user@server_ip_address</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Transferring Files with SSH (SCP and SFTP)
<!-- /wp:heading -->

  SSH also supports secure file transfers using ***SCP***  (Secure Copy Protocol) and ***SFTP***  (Secure File Transfer Protocol).
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Using SCP for File Transfers 
<!-- /wp:heading -->

  To copy files from a local machine to a remote server:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /path/to/local/file user@server_ip_address:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  To copy files from a remote server to your local machine:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp user@server_ip_address:/path/to/remote/file /path/to/local/directory</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Using SFTP for File Transfers 
<!-- /wp:heading -->

  ***SFTP***  is an interactive file transfer tool that works over SSH. To start an SFTP session, use:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sftp user@server_ip_address</code></pre>
<!-- /wp:code -->

  Once connected, you can use standard file transfer commands like <code>put</code>, <code>get</code>, <code>ls</code>, <code>cd</code>, and <code>exit</code>.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Troubleshooting Common SSH Issues
<!-- /wp:heading -->

  If you encounter problems when using SSH, here are some common troubleshooting steps:
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. ***SSH Connection Refused*** : 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Ensure the SSH service is running: <code>sudo systemctl status sshd</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Check if the firewall allows SSH traffic: <code>sudo firewall-cmd --list-all</code>. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. ***Permission Denied*** : 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Verify that the correct user and key are being used. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Ensure the public key is properly configured in the server's <code>~/.ssh/authorized_keys</code> file. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. ***Slow Connection*** : 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- This could be due to DNS resolution. Add the following line to <code>/etc/ssh/sshd_config</code> to skip DNS checks: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">UseDNS no</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Conclusion
<!-- /wp:heading -->

  SSH is a critical tool for managing remote servers securely. Configuring an SSH server in ***AlmaLinux 9***  is straightforward, and once set up, it offers robust features like encrypted connections, remote command execution, and secure file transfers. By following best security practices—such as disabling root login, using key-based authentication, and changing the default SSH port—you can enhance the security of your remote connections.
 

  Whether you're managing a single server or an entire infrastructure, SSH is a fundamental tool that every administrator should master.
 