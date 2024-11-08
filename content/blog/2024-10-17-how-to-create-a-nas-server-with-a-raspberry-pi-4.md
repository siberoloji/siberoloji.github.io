---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Raspberry Pi
cmplz_hide_cookiebanner:
- ""
date: "2024-10-17T16:48:44Z"
guid: https://www.siberoloji.com/?p=3537
id: 3537
image: /assets/images/2024/10/raspberrypi.webp
post_views_count:
- "1"
tags:
- raspberry pi
title: How to Create a NAS Server with a Raspberry Pi 4
url: /how-to-create-a-nas-server-with-a-raspberry-pi-4/
---

  In today’s digital world, the need for centralized storage solutions is growing. Whether you want to store media files, backups, or documents, a Network Attached Storage (NAS) server offers a convenient way to access files across devices on a local network or even remotely. While commercial NAS devices are available, they can be expensive. Fortunately, with a Raspberry Pi 4, you can build your own budget-friendly NAS server. 
 

  In this detailed guide, we’ll walk you through the process of setting up a NAS server using a Raspberry Pi 4. By the end, you’ll have a fully functional NAS that can be accessed from various devices in your home or office. 
 

<!-- wp:heading {"level":3} -->
 ### What is a NAS Server?</h3>
<!-- /wp:heading -->

  A Network Attached Storage (NAS) server is a specialized device connected to a network, providing centralized data storage and file sharing across devices. With a NAS, multiple users can access and share data seamlessly over the network. NAS servers are commonly used for: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Media streaming</strong> (movies, music, photos)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Backup storage</strong> for computers and mobile devices</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>File sharing</strong> within a home or office network</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Remote access</strong> to files from anywhere in the world</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Creating a NAS server with a Raspberry Pi 4 is cost-effective, energy-efficient, and customizable, making it ideal for personal use or small-scale business environments. 
 

<!-- wp:heading {"level":3} -->
 ### Why Raspberry Pi 4?</h3>
<!-- /wp:heading -->

  The Raspberry Pi 4 is an excellent candidate for a NAS server due to its improved hardware compared to earlier models. Key features include: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Quad-core 64-bit processor</strong>: Provides better performance for handling network traffic and file management.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Up to 8GB RAM</strong>: Ample memory for managing multiple users and file operations.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gigabit Ethernet port</strong>: Enables fast and stable file transfer across your local network.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>USB 3.0 ports</strong>: Essential for connecting external storage devices such as hard drives or SSDs, providing high-speed data access.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  The Raspberry Pi 4 also runs on low power, which is ideal for a NAS server that might need to stay online 24/7. 
 

<!-- wp:heading {"level":3} -->
 ### What You Will Need</h3>
<!-- /wp:heading -->

  Before starting, make sure you have the following components ready: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Raspberry Pi 4</strong> (4GB or 8GB model recommended for better performance)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>MicroSD card</strong> (16GB or more) for the Raspberry Pi’s operating system</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>External USB hard drive or SSD</strong> (to store your files)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>USB 3.0 powered hub</strong> (optional but recommended if using multiple hard drives)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Raspberry Pi 4 power supply</strong> (official or high-quality third-party)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Ethernet cable</strong> to connect the Pi to your router</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Keyboard, mouse, and monitor</strong> for initial setup (optional if using headless configuration)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Raspberry Pi OS</strong> (Debian-based, previously known as Raspbian)</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Now, let's proceed with the step-by-step process to create your NAS server. 
 

<!-- wp:heading {"level":3} -->
 ### Step 1: Set Up Raspberry Pi 4</h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1.1 Install Raspberry Pi OS</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Download the latest <strong>Raspberry Pi OS</strong> from the official Raspberry Pi website.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use software like <strong>Raspberry Pi Imager</strong> or <strong>Balena Etcher</strong> to write the OS image to your MicroSD card.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Insert the MicroSD card into your Raspberry Pi 4 and power it on. If using a keyboard, mouse, and monitor, proceed with the standard installation. If setting up headless (without peripherals), you can enable <strong>SSH</strong> access before inserting the SD card by creating an empty file named <code>ssh</code> in the boot partition of the SD card.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1.2 Update and Upgrade</h4>
<!-- /wp:heading -->

  Once Raspberry Pi OS is installed and running, it’s important to update your system. Open a terminal window and enter the following commands: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt update
sudo apt upgrade</code></pre>
<!-- /wp:code -->

  This ensures that you have the latest software updates and security patches. 
 

<!-- wp:heading {"level":3} -->
 ### Step 2: Install and Configure Samba for File Sharing</h3>
<!-- /wp:heading -->

  We will use <strong>Samba</strong> to enable file sharing across different devices. Samba is a popular software suite that allows file and print sharing between Linux and Windows devices. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.1 Install Samba</h4>
<!-- /wp:heading -->

  To install Samba, run the following command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt install samba samba-common-bin</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.2 Create a Directory for File Storage</h4>
<!-- /wp:heading -->

  Create a folder where you will store your shared files. For example, let’s create a folder named <code>shared</code> in the <code>/home/pi</code> directory: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">mkdir /home/pi/shared</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.3 Configure Samba</h4>
<!-- /wp:heading -->

  Next, we need to edit Samba’s configuration file to specify the settings for file sharing. Open the configuration file using a text editor: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/samba/smb.conf</code></pre>
<!-- /wp:code -->

  Scroll to the bottom of the file and add the following configuration: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[Shared]
   comment = Shared Folder
   path = /home/pi/shared
   browseable = yes
   writeable = yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   public = no</code></pre>
<!-- /wp:code -->

  This configuration will create a shared folder that’s accessible over the network. The permissions allow read and write access to the folder. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.4 Create Samba User</h4>
<!-- /wp:heading -->

  To secure your NAS server, create a Samba user who can access the shared files. Use the following command to add a user (replace <code>pi</code> with your username if necessary): 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo smbpasswd -a pi</code></pre>
<!-- /wp:code -->

  You’ll be prompted to set a password for the user. Once done, restart the Samba service to apply the changes: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart smbd</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 3: Mount External Hard Drive</h3>
<!-- /wp:heading -->

  A NAS server typically relies on an external hard drive to store files. Let’s mount your external drive to the Raspberry Pi 4. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3.1 Identify the External Drive</h4>
<!-- /wp:heading -->

  First, plug your external hard drive into one of the USB 3.0 ports on the Raspberry Pi 4. To find the drive’s name, run: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo fdisk -l</code></pre>
<!-- /wp:code -->

  Look for your external hard drive in the list (it’s typically named <code>/dev/sda1</code> or similar). 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3.2 Mount the Drive</h4>
<!-- /wp:heading -->

  Create a mount point for the drive: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /mnt/external</code></pre>
<!-- /wp:code -->

  Mount the drive to this directory: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mount /dev/sda1 /mnt/external</code></pre>
<!-- /wp:code -->

  To make the mount permanent (i.e., mounted automatically at boot), you need to add the drive to the <code>/etc/fstab</code> file. Open the file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/fstab</code></pre>
<!-- /wp:code -->

  Add the following line at the bottom: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/dev/sda1 /mnt/external auto defaults 0 0</code></pre>
<!-- /wp:code -->

  Save and exit. Now, your external drive will be mounted automatically on startup. 
 

<!-- wp:heading {"level":3} -->
 ### Step 4: Configure Access to NAS from Other Devices</h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4.1 Access NAS from Windows</h4>
<!-- /wp:heading -->

  On a Windows computer, open <strong>File Explorer</strong> and type the Raspberry Pi’s IP address in the address bar, like so: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">\\192.168.X.XXX</code></pre>
<!-- /wp:code -->

  You will be prompted to enter your Samba username and password. After authentication, you’ll have access to the shared folder. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4.2 Access NAS from macOS</h4>
<!-- /wp:heading -->

  On a macOS device, open <strong>Finder</strong>, press <code>Cmd + K</code>, and enter the Raspberry Pi’s IP address like this: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">smb://192.168.X.XXX</code></pre>
<!-- /wp:code -->

  You’ll be asked for the Samba credentials, and once authenticated, the shared folder will be accessible. 
 

<!-- wp:heading {"level":3} -->
 ### Step 5: Optional - Set Up Remote Access</h3>
<!-- /wp:heading -->

  If you want to access your NAS server remotely, outside your home or office network, you can set up remote access via <strong>OpenVPN</strong> or <strong>WireGuard</strong>. Additionally, <strong>dynamic DNS (DDNS)</strong> can help you manage your NAS server’s IP address if it changes periodically. 
 

<!-- wp:heading {"level":3} -->
 ### Step 6: Optimize Your NAS Setup</h3>
<!-- /wp:heading -->

  While the basic setup is complete, there are several optimizations and improvements you can make: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Add more storage</strong>: Connect additional external drives to expand your storage capacity. You can even set up a RAID configuration for redundancy.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Automatic backups</strong>: Use software like <strong>rsync</strong> to automate backups to your NAS.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Media streaming</strong>: Install media server software like <strong>Plex</strong> or <strong>Emby</strong> on your Raspberry Pi for streaming videos and music to your devices.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

  Building a NAS server with a Raspberry Pi 4 is a cost-effective and powerful way to create a personal cloud for storing and sharing files across your home or office network. With Samba, you can easily access files from Windows, macOS, or Linux devices, making it a flexible solution for your storage needs. 
 

  By following this guide, you’ll have a fully functional NAS server that can be further customized with additional storage, automated backups, or media streaming capabilities. Whether for personal use or a small business, a Raspberry Pi 4 NAS server offers performance, scalability, and convenience at an affordable price. 
 