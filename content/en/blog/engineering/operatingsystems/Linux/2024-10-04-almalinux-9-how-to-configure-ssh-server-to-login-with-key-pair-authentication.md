---
draft: false

title:  'AlmaLinux 9: How to Configure SSH Server to Login with Key-Pair Authentication'
date: '2024-10-04T18:18:22+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /almalinux-9-how-to-configure-ssh-server-to-login-with-key-pair-authentication/
 
featured_image: /images/almalinux.webp
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux how-to'
    - 'ssh key-pair'
---
Securing access to your server is a top priority for system administrators, and SSH key-pair authentication is one of the most secure methods for logging into remote servers. This article will walk you through the steps to configure SSH key-pair authentication on AlmaLinux 9, providing a secure way to access your server while eliminating the need for password-based logins.

SSH (Secure Shell) is a protocol used to securely access remote systems over an encrypted connection. While using a password to log in is convenient, it poses security risks such as brute-force attacks. Key-pair authentication eliminates these risks, providing a two-part authentication method where a private key is stored on your local machine, and a corresponding public key is stored on the server.

In this guide, we will cover:
* The basics of SSH key-pair authentication

* How to generate an SSH key pair

* How to configure the AlmaLinux 9 server to accept key-based authentication

* Disabling password-based authentication for enhanced security
What is SSH Key-Pair Authentication?

SSH key-pair authentication works by using two cryptographic keys:
* **Public Key:** This key is stored on the server in a designated file. It can be shared openly without compromising security.

* **Private Key:** This is stored on your local machine and must remain confidential. Only someone with access to this key can log into the server.
When you attempt to log in, the server checks whether the private key matches the public key stored on the server. If they match, access is granted.

Prerequisites

Before starting, make sure you have the following:
* An AlmaLinux 9 server with SSH access

* A user account with sudo privileges on the server

* A local machine (Linux, macOS, or Windows) where you will generate the SSH keys
Step 1: Generate an SSH Key Pair

The first step is to generate the SSH key pair on your local machine. If you're using Linux or macOS, the `ssh-keygen` tool is typically installed by default. For Windows, you can use tools like PuTTYgen or the OpenSSH client available through PowerShell.
#### On Linux and macOS:
* Open a terminal window.

* Run the following command to generate a new SSH key pair: `ssh-keygen -t rsa -b 4096`* `-t rsa` specifies that you're creating an RSA key pair, which is widely used and recommended.

* `-b 4096` sets the key length to 4096 bits for stronger encryption.

* You will be prompted to choose a location to save the key. The default location is usually `~/.ssh/id_rsa`. You can press `Enter` to accept the default or specify a different file path.

* If you wish to protect your key with a passphrase, enter it when prompted. This passphrase adds an extra layer of security to your private key.

#### On Windows:
* Open PowerShell and run the following command to generate the key: `ssh-keygen -t rsa -b 4096`

* Follow the prompts as described above.
After generating the key, you will have two files:
* A **private key** (e.g., `id_rsa`) stored on your local machine.

* A **public key** (e.g., `id_rsa.pub`) that you will copy to your AlmaLinux 9 server.
Step 2: Copy the Public Key to Your AlmaLinux Server

Now that you have the key pair, the next step is to transfer the public key to your AlmaLinux server.
#### Using `ssh-copy-id` (Recommended Method)

The easiest way to transfer the public key is by using the `ssh-copy-id` command. This command appends your public key to the `~/.ssh/authorized_keys` file on the server, which is where the server checks for allowed keys.
* In your terminal, run the following command: `ssh-copy-id username@your_server_ip` Replace `username` with your AlmaLinux user and `your_server_ip` with your server's IP address. For example: `ssh-copy-id john@192.168.1.100`

* You will be prompted to enter your password for the last time. Once logged in, `ssh-copy-id` will automatically transfer the key and set the correct permissions.

#### Manually Copying the Key

If `ssh-copy-id` is not available, you can manually copy the public key using `scp` (secure copy) or by pasting it directly.
* Copy the public key to your server using `scp`: `scp ~/.ssh/id_rsa.pub username@your_server_ip:/home/username/.ssh/authorized_keys` Ensure the `.ssh` directory exists in your home directory on the server, and set the correct permissions: `ssh username@your_server_ip mkdir -p ~/.ssh chmod 700 ~/.ssh cat ~/id_rsa.pub >> ~/.ssh/authorized_keys chmod 600 ~/.ssh/authorized_keys`
Step 3: Configure SSH Server to Use Key-Based Authentication

With the key copied, you now need to ensure your SSH server on AlmaLinux 9 is configured to allow key-based authentication.
* Log in to your AlmaLinux server: `ssh username@your_server_ip`

* Open the SSH server configuration file in a text editor with root privileges: `sudo nano /etc/ssh/sshd_config`

* Look for the following lines and ensure they are configured as follows: `PubkeyAuthentication yes AuthorizedKeysFile .ssh/authorized_keys` These lines should already exist in most SSH configurations, but ensure they are not commented out.

* To improve security, you can disable password-based logins. Find the following line: `PasswordAuthentication yes` Change it to: `PasswordAuthentication no` This will force the SSH server to only accept key-pair authentication.

* After making these changes, save the file and exit the text editor.

* Restart the SSH service to apply the new configuration: `sudo systemctl restart sshd`
Step 4: Test the Configuration

Once the server is configured, test your SSH login using key-based authentication.
* Open a terminal on your local machine and try to log in using the following command: `ssh username@your_server_ip`

* If everything is set up correctly, you should be logged in without being prompted for a password. If you added a passphrase to your private key during generation, you'll be asked to enter it at this point.
Step 5: Disable Root Login (Optional, but Recommended)

For an additional layer of security, it's highly recommended to disable root logins over SSH. This prevents attackers from attempting to brute-force the root account.
* Open the SSH configuration file again: `sudo nano /etc/ssh/sshd_config`

* Find the line that reads: `PermitRootLogin yes` Change it to: `PermitRootLogin no`

* Save the file and restart the SSH service again: `sudo systemctl restart sshd`
Now, only non-root users with key-pair authentication will be able to log in.

Conclusion

Configuring SSH key-pair authentication on AlmaLinux 9 is a critical step in securing your server. By following this guide, you've learned how to generate an SSH key pair, copy the public key to your server, configure the server to accept key-based authentication, and disable password-based logins for enhanced security. With these measures in place, your AlmaLinux server is far less vulnerable to unauthorized access attempts.

Additionally, disabling root login over SSH provides an extra layer of protection by ensuring that even if a root password is compromised, attackers will not be able to log in directly as root.

By using SSH key-pair authentication, you've significantly improved the security of your AlmaLinux 9 server.
