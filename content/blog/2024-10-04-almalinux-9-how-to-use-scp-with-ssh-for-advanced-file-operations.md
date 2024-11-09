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
date: "2024-10-04T17:40:49Z"
guid: https://www.siberoloji.com/?p=2331
id: 2331
image: /assets/images/2024/09/almalinux.webp
tags:
- how-to guides
- linux
- linux how-to
title: 'AlmaLinux 9: How to Use SCP with SSH for Advanced File Operations'
url: /almalinux-9-how-to-use-scp-with-ssh-for-advanced-file-operations/
---

  In modern Linux environments, secure file transfers between systems are crucial for efficient system administration and data management. ***SCP (Secure Copy Protocol)***  is a command-line utility that allows you to securely transfer files between a local machine and a remote server using ***SSH (Secure Shell)*** . By leveraging SSH encryption, SCP ensures that your data remains secure during transmission. In this blog post, we will explore how to use SCP for basic and advanced file operations in ***AlmaLinux 9*** , covering multiple scenarios and examples. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to SCP and SSH 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Why Use SCP for File Transfers? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Basic SCP Commands for File Transfer 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Advanced SCP Examples<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Transferring Directories Recursively 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Using SCP with Different SSH Ports 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SCP with Wildcards for Multiple Files 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SCP with Rate Limits for Bandwidth Control 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Preserving File Permissions and Timestamps 
<!-- /wp:list-item --> 
<!-- /wp:list --> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Automating SCP Operations with SSH Key Authentication 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Common SCP Errors and Troubleshooting 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to SCP and SSH
<!-- /wp:heading -->

  ***SCP (Secure Copy Protocol)***  is a method for securely transferring files between local and remote systems. It uses ***SSH (Secure Shell)***  to encrypt both the commands and the data, ensuring that the transmission remains secure and protected from eavesdropping. 
 

  By default, SCP uses the same SSH port (port 22) and authentication methods, making it easy to integrate into any existing SSH setup. SCP is particularly useful when you need to transfer files securely between servers or download/upload data from your local machine to a remote one. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Why Use SCP for File Transfers?
<!-- /wp:heading -->

  SCP offers several advantages for secure file transfers in AlmaLinux 9: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Security*** : As SCP relies on SSH, all data is encrypted during transmission, ensuring that sensitive information is protected. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Simplicity*** : SCP uses a familiar syntax similar to basic file copying commands, making it easy to learn and use. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Cross-Platform Compatibility*** : SCP works on a variety of operating systems that support SSH, including Linux, macOS, and Windows (via tools like PuTTY or OpenSSH). 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  In environments where secure data transfers are a priority, SCP is a highly reliable tool for moving files between systems. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. Basic SCP Commands for File Transfer
<!-- /wp:heading -->

  Let’s start with some basic examples of how to use SCP in AlmaLinux 9. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Copying a File from Local to Remote 
<!-- /wp:heading -->

  To copy a file from your local machine to a remote server, use the following syntax: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This command securely transfers the file <code>report.txt</code> to the <code>/home/admin/backup/</code> directory on the remote server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Copying a File from Remote to Local 
<!-- /wp:heading -->

  To copy a file from a remote server to your local machine: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp user@remote_host:/path/to/remote/file /path/to/local/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp admin@192.168.1.10:/home/admin/backup/report.txt /home/user/Documents/</code></pre>
<!-- /wp:code -->

  This command downloads the <code>report.txt</code> file from the remote server to your local <code>Documents</code> folder. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Advanced SCP Examples
<!-- /wp:heading -->

  Once you are familiar with the basic SCP commands, you can extend its functionality with advanced use cases. Below are some powerful examples that demonstrate SCP’s versatility. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. Transferring Directories Recursively 
<!-- /wp:heading -->

  To copy an entire directory (including subdirectories and files), you can use the <code>-r</code> (recursive) option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -r /path/to/local/directory user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -r /home/user/Documents/project admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This will transfer the <code>project</code> directory and all its contents to the remote server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. Using SCP with Different SSH Ports 
<!-- /wp:heading -->

  By default, SCP connects over SSH port 22, but if your SSH server is configured to use a different port, use the <code>-P</code> option to specify the port: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -P 2022 /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -P 2022 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  Here, SCP will connect to the remote server on port ***2022*** . 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. SCP with Wildcards for Multiple Files 
<!-- /wp:heading -->

  You can use wildcards to copy multiple files matching a pattern. For example, to copy all <code>.txt</code> files from a local directory to a remote server: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /path/to/local/*.txt user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp /home/user/Documents/*.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This command transfers all <code>.txt</code> files in the <code>Documents</code> folder to the remote server. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4. SCP with Rate Limits for Bandwidth Control 
<!-- /wp:heading -->

  If you’re working with limited bandwidth or need to prevent SCP from consuming too much network bandwidth, you can use the <code>-l</code> option to limit the transfer speed in ***Kbits per second*** : 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -l 1000 /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -l 5000 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This command limits the transfer rate to ***5000 Kbps***  (5 Mbps). 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">5. Preserving File Permissions and Timestamps 
<!-- /wp:heading -->

  To ensure that file permissions, timestamps, and ownership are preserved during the transfer, use the <code>-p</code> option: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -p /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -p /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This command copies the file and preserves its original metadata (ownership, permissions, etc.). 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Automating SCP Operations with SSH Key Authentication
<!-- /wp:heading -->

  To streamline SCP operations, especially for repetitive tasks, you can configure ***SSH key authentication***  to allow password-less login. This is particularly useful for automation scripts and cron jobs. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Generate SSH Key Pair 
<!-- /wp:heading -->

  On the local machine, generate an SSH key pair: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh-keygen -t rsa -b 4096</code></pre>
<!-- /wp:code -->

  This creates a public/private key pair. By default, the keys are stored in <code>~/.ssh/id_rsa</code> (private) and <code>~/.ssh/id_rsa.pub</code> (public). 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Copy the Public Key to the Remote Server 
<!-- /wp:heading -->

  Use <code>ssh-copy-id</code> to transfer the public key to the remote server: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh-copy-id user@remote_host</code></pre>
<!-- /wp:code -->

  Once the public key is installed, SCP will no longer require a password for transfers between the two systems. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Common SCP Errors and Troubleshooting
<!-- /wp:heading -->

  Here are a few common SCP issues and how to resolve them: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. ***Permission Denied***  
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Cause*** : Incorrect file permissions or missing SSH key. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Solution*** : Ensure that you have the proper permissions for the destination directory and that the SSH key is correctly installed on the remote server. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. ***Connection Refused***  
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Cause*** : The SSH service might not be running, or the firewall could be blocking the connection. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Solution*** : Verify that SSH is running on the remote server and that the correct port is open in the firewall. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. ***File Not Found***  
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Cause*** : The path to the file is incorrect. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Solution*** : Double-check the file paths on both the local and remote machines to ensure they are correct. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Conclusion
<!-- /wp:heading -->

  SCP is an incredibly useful and secure tool for file transfers between local and remote systems in ***AlmaLinux 9*** . Whether you need to transfer individual files, directories, or automate secure file operations using SSH keys, SCP provides a robust solution. By mastering both basic and advanced SCP options, you can handle a wide variety of use cases efficiently and securely. 
 

  With its integration into the SSH ecosystem, SCP remains an essential tool for system administrators, developers, and anyone working in a distributed or networked environment. 
 