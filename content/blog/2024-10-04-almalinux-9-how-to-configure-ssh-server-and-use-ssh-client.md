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

  <strong>Secure Shell (SSH)</strong> is an essential protocol for administrators and developers to securely manage remote servers. It provides encrypted communication between client and server, ensuring that data sent over the network is protected from eavesdropping. In <strong>AlmaLinux 9</strong>, configuring an SSH server and using SSH clients allows you to connect, control, and manage your servers efficiently from a remote machine. This article will walk you through the process of setting up an SSH server on AlmaLinux 9 and how to use an SSH client for secure connections.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to SSH</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Why Use SSH in AlmaLinux?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Installing and Configuring SSH Server on AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Secure SSH Configuration: Best Practices</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Using the SSH Client to Connect to a Remote Server</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Transferring Files with SSH (SCP and SFTP)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Troubleshooting Common SSH Issues</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to SSH</h3>
<!-- /wp:heading -->

  <strong>SSH (Secure Shell)</strong> is a cryptographic protocol designed for secure communication over a network. It provides several features:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Remote Command Execution</strong>: Execute commands on a remote system as if you're physically present.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Secure File Transfer</strong>: Transfer files between a local and a remote machine securely.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Tunneling</strong>: Forward data securely across an unsecured network.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  SSH is a replacement for older protocols like <strong>Telnet</strong> and <strong>rlogin</strong>, which do not encrypt traffic and are vulnerable to attacks.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Why Use SSH in AlmaLinux?</h3>
<!-- /wp:heading -->

  SSH is widely used because of its security and functionality. It offers:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Encrypted Connections</strong>: Prevents unauthorized access and protects sensitive data.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Remote Management</strong>: Allows administrators to manage servers without being physically present.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Flexibility</strong>: Supports tunneling, port forwarding, and file transfer protocols like SCP and SFTP.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  In AlmaLinux 9, <strong>OpenSSH</strong> is the default SSH implementation. It includes both the SSH server (<code>sshd</code>) and the client (<code>ssh</code>).</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. Installing and Configuring SSH Server on AlmaLinux 9</h3>
<!-- /wp:heading -->

  The first step in setting up remote access on AlmaLinux 9 is installing and configuring the <strong>OpenSSH Server</strong>.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install OpenSSH</h4>
<!-- /wp:heading -->

  By default, AlmaLinux 9 may have OpenSSH installed. To confirm or install it:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install openssh-server</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Enable and Start SSH Service</h4>
<!-- /wp:heading -->

  After installation, enable the SSH service to ensure it starts on boot and is immediately active:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable sshd
sudo systemctl start sshd</code></pre>
<!-- /wp:code -->

  You can verify the status of the SSH service with:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status sshd</code></pre>
<!-- /wp:code -->

  If it's running, you’re ready to accept SSH connections.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Configure the Firewall</h4>
<!-- /wp:heading -->

  To allow SSH traffic through the firewall, open port <strong>22</strong> (the default SSH port):</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  If you intend to change the default port for added security (as explained below), you will need to open that port in the firewall.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Secure SSH Configuration: Best Practices</h3>
<!-- /wp:heading -->

  Security is a priority when configuring SSH. Several tweaks can improve the security of your SSH server, making it harder for attackers to compromise your system.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Disable Root Login</h4>
<!-- /wp:heading -->

  By default, SSH allows root login, but this can be risky. Disabling root access ensures that users log in with non-privileged accounts before escalating privileges.</p>
 

  Open the SSH configuration file:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/ssh/sshd_config</code></pre>
<!-- /wp:code -->

  Locate the line:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PermitRootLogin yes</code></pre>
<!-- /wp:code -->

  Change it to:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PermitRootLogin no</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Use SSH Key-Based Authentication</h4>
<!-- /wp:heading -->

  Password authentication can be vulnerable to brute-force attacks. For stronger security, use <strong>SSH keys</strong>:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Generate a key pair on your client machine:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  ssh-keygen -t rsa -b 4096</code></pre>
<!-- /wp:code -->

  This will create a private key (<code>id_rsa</code>) and a public key (<code>id_rsa.pub</code>) in the <code>~/.ssh/</code> directory.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Copy the public key to the server:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  ssh-copy-id user@server_ip_address</code></pre>
<!-- /wp:code -->

  Alternatively, you can manually copy the contents of <code>id_rsa.pub</code> to the <code>~/.ssh/authorized_keys</code> file on the server.</p>
 

  Once key-based authentication is set up, disable password authentication in the <code>/etc/ssh/sshd_config</code> file:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">PasswordAuthentication no</code></pre>
<!-- /wp:code -->

  Restart the SSH service to apply changes:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart sshd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Change the Default SSH Port</h4>
<!-- /wp:heading -->

  Another security measure is to change the default SSH port (22) to something less predictable. Edit <code>/etc/ssh/sshd_config</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Port 2022</code></pre>
<!-- /wp:code -->

  Replace <strong>2022</strong> with any available port number. Don’t forget to update your firewall:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --permanent --add-port=2022/tcp
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  Restart the SSH service after making the changes:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart sshd</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Using the SSH Client to Connect to a Remote Server</h3>
<!-- /wp:heading -->

  Once the SSH server is configured, you can connect to it using the SSH client from any Linux, macOS, or Windows machine (using tools like <strong>PuTTY</strong> on Windows).</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Basic SSH Connection</h4>
<!-- /wp:heading -->

  To connect to a remote server, use the following syntax:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh user@server_ip_address</code></pre>
<!-- /wp:code -->

  For example, if the user is <strong>admin</strong> and the server's IP is <strong>192.168.1.10</strong>, run:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh admin@192.168.1.10</code></pre>
<!-- /wp:code -->

  If you changed the SSH port, specify the port using the <code>-p</code> option:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh admin@192.168.1.10 -p 2022</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Using SSH Keys</h4>
<!-- /wp:heading -->

  If you’ve configured SSH key-based authentication, the SSH client will automatically use your private key (<code>~/.ssh/id_rsa</code>). If you have multiple keys, you can specify which key to use with the <code>-i</code> option:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh -i /path/to/private_key user@server_ip_address</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Transferring Files with SSH (SCP and SFTP)</h3>
<!-- /wp:heading -->

  SSH also supports secure file transfers using <strong>SCP</strong> (Secure Copy Protocol) and <strong>SFTP</strong> (Secure File Transfer Protocol).</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Using SCP for File Transfers</h4>
<!-- /wp:heading -->

  To copy files from a local machine to a remote server:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /path/to/local/file user@server_ip_address:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  To copy files from a remote server to your local machine:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp user@server_ip_address:/path/to/remote/file /path/to/local/directory</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Using SFTP for File Transfers</h4>
<!-- /wp:heading -->

  <strong>SFTP</strong> is an interactive file transfer tool that works over SSH. To start an SFTP session, use:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sftp user@server_ip_address</code></pre>
<!-- /wp:code -->

  Once connected, you can use standard file transfer commands like <code>put</code>, <code>get</code>, <code>ls</code>, <code>cd</code>, and <code>exit</code>.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Troubleshooting Common SSH Issues</h3>
<!-- /wp:heading -->

  If you encounter problems when using SSH, here are some common troubleshooting steps:</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. <strong>SSH Connection Refused</strong>:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Ensure the SSH service is running: <code>sudo systemctl status sshd</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Check if the firewall allows SSH traffic: <code>sudo firewall-cmd --list-all</code>.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. <strong>Permission Denied</strong>:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Verify that the correct user and key are being used.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Ensure the public key is properly configured in the server's <code>~/.ssh/authorized_keys</code> file.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. <strong>Slow Connection</strong>:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>This could be due to DNS resolution. Add the following line to <code>/etc/ssh/sshd_config</code> to skip DNS checks:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">UseDNS no</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Conclusion</h3>
<!-- /wp:heading -->

  SSH is a critical tool for managing remote servers securely. Configuring an SSH server in <strong>AlmaLinux 9</strong> is straightforward, and once set up, it offers robust features like encrypted connections, remote command execution, and secure file transfers. By following best security practices—such as disabling root login, using key-based authentication, and changing the default SSH port—you can enhance the security of your remote connections.</p>
 

  Whether you're managing a single server or an entire infrastructure, SSH is a fundamental tool that every administrator should master.</p>
 