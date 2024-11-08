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

  In modern Linux environments, secure file transfers between systems are crucial for efficient system administration and data management. <strong>SCP (Secure Copy Protocol)</strong> is a command-line utility that allows you to securely transfer files between a local machine and a remote server using <strong>SSH (Secure Shell)</strong>. By leveraging SSH encryption, SCP ensures that your data remains secure during transmission. In this blog post, we will explore how to use SCP for basic and advanced file operations in <strong>AlmaLinux 9</strong>, covering multiple scenarios and examples. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to SCP and SSH</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Why Use SCP for File Transfers?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Basic SCP Commands for File Transfer</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Advanced SCP Examples<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Transferring Directories Recursively</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Using SCP with Different SSH Ports</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>SCP with Wildcards for Multiple Files</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>SCP with Rate Limits for Bandwidth Control</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Preserving File Permissions and Timestamps</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Automating SCP Operations with SSH Key Authentication</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Common SCP Errors and Troubleshooting</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to SCP and SSH</h3>
<!-- /wp:heading -->

  <strong>SCP (Secure Copy Protocol)</strong> is a method for securely transferring files between local and remote systems. It uses <strong>SSH (Secure Shell)</strong> to encrypt both the commands and the data, ensuring that the transmission remains secure and protected from eavesdropping. 
 

  By default, SCP uses the same SSH port (port 22) and authentication methods, making it easy to integrate into any existing SSH setup. SCP is particularly useful when you need to transfer files securely between servers or download/upload data from your local machine to a remote one. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Why Use SCP for File Transfers?</h3>
<!-- /wp:heading -->

  SCP offers several advantages for secure file transfers in AlmaLinux 9: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Security</strong>: As SCP relies on SSH, all data is encrypted during transmission, ensuring that sensitive information is protected.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Simplicity</strong>: SCP uses a familiar syntax similar to basic file copying commands, making it easy to learn and use.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Cross-Platform Compatibility</strong>: SCP works on a variety of operating systems that support SSH, including Linux, macOS, and Windows (via tools like PuTTY or OpenSSH).</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  In environments where secure data transfers are a priority, SCP is a highly reliable tool for moving files between systems. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. Basic SCP Commands for File Transfer</h3>
<!-- /wp:heading -->

  Let’s start with some basic examples of how to use SCP in AlmaLinux 9. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Copying a File from Local to Remote</h4>
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
<h4 class="wp-block-heading">Copying a File from Remote to Local</h4>
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

<!-- wp:heading {"level":3} -->
 ### 4. Advanced SCP Examples</h3>
<!-- /wp:heading -->

  Once you are familiar with the basic SCP commands, you can extend its functionality with advanced use cases. Below are some powerful examples that demonstrate SCP’s versatility. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. Transferring Directories Recursively</h4>
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
<h4 class="wp-block-heading">2. Using SCP with Different SSH Ports</h4>
<!-- /wp:heading -->

  By default, SCP connects over SSH port 22, but if your SSH server is configured to use a different port, use the <code>-P</code> option to specify the port: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -P 2022 /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -P 2022 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  Here, SCP will connect to the remote server on port <strong>2022</strong>. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. SCP with Wildcards for Multiple Files</h4>
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
<h4 class="wp-block-heading">4. SCP with Rate Limits for Bandwidth Control</h4>
<!-- /wp:heading -->

  If you’re working with limited bandwidth or need to prevent SCP from consuming too much network bandwidth, you can use the <code>-l</code> option to limit the transfer speed in <strong>Kbits per second</strong>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -l 1000 /path/to/local/file user@remote_host:/path/to/remote/directory</code></pre>
<!-- /wp:code -->

  Example: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">scp -l 5000 /home/user/Documents/report.txt admin@192.168.1.10:/home/admin/backup/</code></pre>
<!-- /wp:code -->

  This command limits the transfer rate to <strong>5000 Kbps</strong> (5 Mbps). 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">5. Preserving File Permissions and Timestamps</h4>
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

<!-- wp:heading {"level":3} -->
 ### 5. Automating SCP Operations with SSH Key Authentication</h3>
<!-- /wp:heading -->

  To streamline SCP operations, especially for repetitive tasks, you can configure <strong>SSH key authentication</strong> to allow password-less login. This is particularly useful for automation scripts and cron jobs. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Generate SSH Key Pair</h4>
<!-- /wp:heading -->

  On the local machine, generate an SSH key pair: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh-keygen -t rsa -b 4096</code></pre>
<!-- /wp:code -->

  This creates a public/private key pair. By default, the keys are stored in <code>~/.ssh/id_rsa</code> (private) and <code>~/.ssh/id_rsa.pub</code> (public). 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Copy the Public Key to the Remote Server</h4>
<!-- /wp:heading -->

  Use <code>ssh-copy-id</code> to transfer the public key to the remote server: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ssh-copy-id user@remote_host</code></pre>
<!-- /wp:code -->

  Once the public key is installed, SCP will no longer require a password for transfers between the two systems. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Common SCP Errors and Troubleshooting</h3>
<!-- /wp:heading -->

  Here are a few common SCP issues and how to resolve them: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. <strong>Permission Denied</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Cause</strong>: Incorrect file permissions or missing SSH key.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Solution</strong>: Ensure that you have the proper permissions for the destination directory and that the SSH key is correctly installed on the remote server.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. <strong>Connection Refused</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Cause</strong>: The SSH service might not be running, or the firewall could be blocking the connection.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Solution</strong>: Verify that SSH is running on the remote server and that the correct port is open in the firewall.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. <strong>File Not Found</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Cause</strong>: The path to the file is incorrect.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Solution</strong>: Double-check the file paths on both the local and remote machines to ensure they are correct.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Conclusion</h3>
<!-- /wp:heading -->

  SCP is an incredibly useful and secure tool for file transfers between local and remote systems in <strong>AlmaLinux 9</strong>. Whether you need to transfer individual files, directories, or automate secure file operations using SSH keys, SCP provides a robust solution. By mastering both basic and advanced SCP options, you can handle a wide variety of use cases efficiently and securely. 
 

  With its integration into the SSH ecosystem, SCP remains an essential tool for system administrators, developers, and anyone working in a distributed or networked environment. 
 