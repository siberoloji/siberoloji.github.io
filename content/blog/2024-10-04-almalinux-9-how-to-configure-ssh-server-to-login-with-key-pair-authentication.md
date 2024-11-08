---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-04T18:18:22Z"
guid: https://www.siberoloji.com/?p=2339
id: 2339
image: /assets/images/2024/09/almalinux.webp
tags:
- how-to guides
- linux
- linux how-to
- ssh key-pair
title: 'AlmaLinux 9: How to Configure SSH Server to Login with Key-Pair Authentication'
url: /almalinux-9-how-to-configure-ssh-server-to-login-with-key-pair-authentication/
---

  Securing access to your server is a top priority for system administrators, and SSH key-pair authentication is one of the most secure methods for logging into remote servers. This article will walk you through the steps to configure SSH key-pair authentication on AlmaLinux 9, providing a secure way to access your server while eliminating the need for password-based logins.</p>
 

  SSH (Secure Shell) is a protocol used to securely access remote systems over an encrypted connection. While using a password to log in is convenient, it poses security risks such as brute-force attacks. Key-pair authentication eliminates these risks, providing a two-part authentication method where a private key is stored on your local machine, and a corresponding public key is stored on the server.</p>
 

  In this guide, we will cover:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>The basics of SSH key-pair authentication</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>How to generate an SSH key pair</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>How to configure the AlmaLinux 9 server to accept key-based authentication</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Disabling password-based authentication for enhanced security</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### What is SSH Key-Pair Authentication?</h3>
<!-- /wp:heading -->

  SSH key-pair authentication works by using two cryptographic keys:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Public Key:</strong> This key is stored on the server in a designated file. It can be shared openly without compromising security.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Private Key:</strong> This is stored on your local machine and must remain confidential. Only someone with access to this key can log into the server.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  When you attempt to log in, the server checks whether the private key matches the public key stored on the server. If they match, access is granted.</p>
 

<!-- wp:heading {"level":3} -->
 ### Prerequisites</h3>
<!-- /wp:heading -->

  Before starting, make sure you have the following:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>An AlmaLinux 9 server with SSH access</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A user account with sudo privileges on the server</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A local machine (Linux, macOS, or Windows) where you will generate the SSH keys</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 1: Generate an SSH Key Pair</h3>
<!-- /wp:heading -->

  The first step is to generate the SSH key pair on your local machine. If you're using Linux or macOS, the <code>ssh-keygen</code> tool is typically installed by default. For Windows, you can use tools like PuTTYgen or the OpenSSH client available through PowerShell.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Linux and macOS:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open a terminal window.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Run the following command to generate a new SSH key pair: <code>ssh-keygen -t rsa -b 4096</code><!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><code>-t rsa</code> specifies that you're creating an RSA key pair, which is widely used and recommended.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>-b 4096</code> sets the key length to 4096 bits for stronger encryption.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You will be prompted to choose a location to save the key. The default location is usually <code>~/.ssh/id_rsa</code>. You can press <code>Enter</code> to accept the default or specify a different file path.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>If you wish to protect your key with a passphrase, enter it when prompted. This passphrase adds an extra layer of security to your private key.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Windows:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open PowerShell and run the following command to generate the key: <code>ssh-keygen -t rsa -b 4096</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Follow the prompts as described above.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  After generating the key, you will have two files:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>A <strong>private key</strong> (e.g., <code>id_rsa</code>) stored on your local machine.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A <strong>public key</strong> (e.g., <code>id_rsa.pub</code>) that you will copy to your AlmaLinux 9 server.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 2: Copy the Public Key to Your AlmaLinux Server</h3>
<!-- /wp:heading -->

  Now that you have the key pair, the next step is to transfer the public key to your AlmaLinux server.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Using <code>ssh-copy-id</code> (Recommended Method)</h4>
<!-- /wp:heading -->

  The easiest way to transfer the public key is by using the <code>ssh-copy-id</code> command. This command appends your public key to the <code>~/.ssh/authorized_keys</code> file on the server, which is where the server checks for allowed keys.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>In your terminal, run the following command: <code>ssh-copy-id username@your_server_ip</code> Replace <code>username</code> with your AlmaLinux user and <code>your_server_ip</code> with your server's IP address. For example: <code>ssh-copy-id john@192.168.1.100</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You will be prompted to enter your password for the last time. Once logged in, <code>ssh-copy-id</code> will automatically transfer the key and set the correct permissions.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Manually Copying the Key</h4>
<!-- /wp:heading -->

  If <code>ssh-copy-id</code> is not available, you can manually copy the public key using <code>scp</code> (secure copy) or by pasting it directly.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Copy the public key to your server using <code>scp</code>: <code>scp ~/.ssh/id_rsa.pub username@your_server_ip:/home/username/.ssh/authorized_keys</code> Ensure the <code>.ssh</code> directory exists in your home directory on the server, and set the correct permissions: <code>ssh username@your_server_ip mkdir -p ~/.ssh chmod 700 ~/.ssh cat ~/id_rsa.pub &gt;&gt; ~/.ssh/authorized_keys chmod 600 ~/.ssh/authorized_keys</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 3: Configure SSH Server to Use Key-Based Authentication</h3>
<!-- /wp:heading -->

  With the key copied, you now need to ensure your SSH server on AlmaLinux 9 is configured to allow key-based authentication.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Log in to your AlmaLinux server: <code>ssh username@your_server_ip</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open the SSH server configuration file in a text editor with root privileges: <code>sudo nano /etc/ssh/sshd_config</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Look for the following lines and ensure they are configured as follows: <code>PubkeyAuthentication yes AuthorizedKeysFile .ssh/authorized_keys</code> These lines should already exist in most SSH configurations, but ensure they are not commented out.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>To improve security, you can disable password-based logins. Find the following line: <code>PasswordAuthentication yes</code> Change it to: <code>PasswordAuthentication no</code> This will force the SSH server to only accept key-pair authentication.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>After making these changes, save the file and exit the text editor.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Restart the SSH service to apply the new configuration: <code>sudo systemctl restart sshd</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 4: Test the Configuration</h3>
<!-- /wp:heading -->

  Once the server is configured, test your SSH login using key-based authentication.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open a terminal on your local machine and try to log in using the following command: <code>ssh username@your_server_ip</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>If everything is set up correctly, you should be logged in without being prompted for a password. If you added a passphrase to your private key during generation, you'll be asked to enter it at this point.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 5: Disable Root Login (Optional, but Recommended)</h3>
<!-- /wp:heading -->

  For an additional layer of security, it's highly recommended to disable root logins over SSH. This prevents attackers from attempting to brute-force the root account.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open the SSH configuration file again: <code>sudo nano /etc/ssh/sshd_config</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Find the line that reads: <code>PermitRootLogin yes</code> Change it to: <code>PermitRootLogin no</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Save the file and restart the SSH service again: <code>sudo systemctl restart sshd</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Now, only non-root users with key-pair authentication will be able to log in.</p>
 

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

  Configuring SSH key-pair authentication on AlmaLinux 9 is a critical step in securing your server. By following this guide, you've learned how to generate an SSH key pair, copy the public key to your server, configure the server to accept key-based authentication, and disable password-based logins for enhanced security. With these measures in place, your AlmaLinux server is far less vulnerable to unauthorized access attempts.</p>
 

  Additionally, disabling root login over SSH provides an extra layer of protection by ensuring that even if a root password is compromised, attackers will not be able to log in directly as root.</p>
 

  By using SSH key-pair authentication, you've significantly improved the security of your AlmaLinux 9 server.</p>
 