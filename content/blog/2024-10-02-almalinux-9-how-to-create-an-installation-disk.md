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
date: "2024-10-02T21:27:42Z"
guid: https://www.siberoloji.com/?p=2209
id: 2209
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- create installation disk
- how-to guides
- linux
- linux how-to
title: 'AlmaLinux 9: How to Create an Installation Disk'
url: /almalinux-9-how-to-create-an-installation-disk/
---

<!-- wp:paragraph -->
<p>AlmaLinux is a popular, community-driven open-source Linux distribution that offers a stable, secure, and reliable alternative to CentOS. After CentOS shifted to its new rolling release model (CentOS Stream), AlmaLinux has become a go-to choice for users who need a Red Hat Enterprise Linux (RHEL) compatible operating system. AlmaLinux 9 brings several improvements in performance, security, and usability, making it an excellent choice for both server and desktop environments.</p>
  

<!-- wp:paragraph -->
<p>One of the first steps in setting up AlmaLinux is creating an installation disk. In this blog post, we’ll guide you through the process of creating an AlmaLinux 9 installation disk. Whether you're a Linux beginner or an experienced user, this guide will cover everything you need, from downloading the ISO file to writing it onto a USB drive, ensuring you’re ready to install AlmaLinux 9 on your system.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Prerequisites</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before we dive into the steps for creating an installation disk for AlmaLinux 9, let’s cover the prerequisites you'll need:</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>A USB drive</strong>: At least 4 GB of storage space (preferably 8 GB or more).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>AlmaLinux 9 ISO file</strong>: You will need to download the official AlmaLinux 9 ISO.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Disk writing software</strong>: Tools like <strong>Etcher</strong>, <strong>Rufus</strong>, or the Linux <code>dd</code> command can be used to write the ISO file onto your USB drive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>A computer for creating the disk</strong>: Running Windows, macOS, or another Linux distribution.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Downloading the AlmaLinux 9 ISO</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The first step is to download the AlmaLinux 9 ISO file from the official website.</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Go to the AlmaLinux website</strong>: Visit <a href="https://almalinux.org">https://almalinux.org</a> and navigate to the <strong>Downloads</strong> section.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select the appropriate ISO</strong>: AlmaLinux 9 is available for different architectures. If you’re using a standard PC, select the x86_64 architecture. For servers, you might want to choose the minimal ISO, while for desktops, the full installation ISO is recommended.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Download the ISO</strong>: Choose a mirror close to your location to download the ISO faster.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Step-by-Step Guide to Creating an AlmaLinux 9 Installation Disk</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Step 1: Prepare Your USB Drive</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before we write the AlmaLinux 9 ISO file to the USB drive, make sure your USB drive is properly prepared.</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Back up your data</strong>: Writing the ISO file to the USB drive will erase all the data currently on the drive. If you have important files on it, be sure to back them up elsewhere before proceeding.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Format the USB drive</strong>: Although many disk-writing tools will format the drive for you, it’s a good idea to format it manually before starting. You can use your operating system’s built-in disk utility for this.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Windows:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Insert the USB drive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open <strong>File Explorer</strong> and right-click on the USB drive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select <strong>Format</strong>, choose the <strong>FAT32</strong> or <strong>NTFS</strong> file system, and click <strong>Start</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On macOS:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Insert the USB drive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open <strong>Disk Utility</strong> (you can find this in <strong>Applications</strong> &gt; <strong>Utilities</strong>).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the USB drive from the sidebar and click <strong>Erase</strong>. Set the format to <strong>MS-DOS (FAT)</strong> or <strong>exFAT</strong>, then click <strong>Erase</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Linux:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Insert the USB drive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use the <code>gparted</code> utility to format the drive. If you don't have it installed, you can install it via your package manager (<code>sudo apt install gparted</code> on Ubuntu, for example).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the drive and format it to <strong>FAT32</strong> or <strong>NTFS</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 2: Use Disk Writing Software to Write the ISO</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>There are several tools you can use to create an installation disk for AlmaLinux 9. The tool you choose will depend on the operating system you’re using. Here, we’ll cover instructions for three common tools: <strong>Etcher</strong>, <strong>Rufus</strong>, and the <strong>dd</strong> command.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 1: Using Etcher (Cross-platform: Windows, macOS, and Linux)</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Etcher is a user-friendly tool that works on Windows, macOS, and Linux. It's highly recommended for beginners due to its simple interface.</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Download Etcher</strong>: Visit <a href="https://www.balena.io/etcher/">https://www.balena.io/etcher/</a> and download the installer for your operating system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Install Etcher</strong>: Run the installer and follow the prompts to install it on your system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Open Etcher</strong>: Once installed, open the application.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select the AlmaLinux ISO</strong>: Click on <strong>Flash from file</strong> and browse to the location where you downloaded the AlmaLinux 9 ISO.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Choose your USB drive</strong>: Insert your USB drive and select it in Etcher.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Start flashing</strong>: Click <strong>Flash!</strong> to begin the process. Etcher will write the ISO file to the USB drive and automatically verify the contents once the process is complete.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Eject the USB</strong>: Once the flashing process is finished, you’ll be notified. You can now safely eject the USB drive.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 2: Using Rufus (Windows)</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rufus is a lightweight tool for creating bootable USB drives on Windows. It's fast and reliable, making it a popular choice among Windows users.</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Download Rufus</strong>: Visit <a href="https://rufus.ie">https://rufus.ie</a> and download the latest version.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Open Rufus</strong>: Run the executable file (no installation required).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select the USB drive</strong>: Rufus will automatically detect your USB drive. Make sure the correct drive is selected.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select the AlmaLinux ISO</strong>: Click <strong>Select</strong> and browse to where you downloaded the AlmaLinux 9 ISO.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Partition scheme</strong>: Rufus will set the partition scheme to <strong>GPT</strong> by default, which is suitable for UEFI systems. If you’re installing on an older BIOS system, you may need to switch it to <strong>MBR</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>File system</strong>: Choose <strong>FAT32</strong> or <strong>NTFS</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Start the process</strong>: Click <strong>Start</strong>. Rufus will write the ISO to the USB drive and notify you when it’s finished.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Eject the USB drive</strong>: Once Rufus has completed the process, safely eject your USB drive.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 3: Using the <code>dd</code> Command (Linux)</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For experienced Linux users, the <code>dd</code> command is a powerful way to write ISO files to USB drives.</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Insert your USB drive</strong>: Identify the device path for your USB drive using the <code>lsblk</code> command. The device will typically be something like <code>/dev/sdb</code> or <code>/dev/sdc</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Write the ISO</strong>: Open a terminal and use the following command to write the ISO file to the USB drive. Be very careful with this command, as using the wrong device path can overwrite important data.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo dd if=/path/to/almalinux9.iso of=/dev/sdX bs=4M status=progress &amp;&amp; sync</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>/path/to/almalinux9.iso</code> with the path to the downloaded ISO file, and <code>/dev/sdX</code> with the device path for your USB drive.</p>
  

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Wait for the process to complete</strong>: The <code>dd</code> command will take some time to complete, and there won't be much visual feedback. Once it finishes, you’ll see a message indicating the number of bytes written.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Eject the USB drive</strong>: Use the following command to safely eject the USB drive:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo eject /dev/sdX</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Step 3: Boot from the USB Drive</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once you’ve created your AlmaLinux 9 installation disk, it’s time to boot from it and begin the installation process.</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Insert the USB drive</strong>: Plug the USB drive into the computer where you want to install AlmaLinux 9.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Restart your computer</strong>: Reboot the system and enter the <strong>BIOS</strong> or <strong>UEFI</strong> settings by pressing a key like <code>F2</code>, <code>F10</code>, or <code>Delete</code> during startup (the specific key depends on your computer's manufacturer).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select the USB drive as the boot device</strong>: In the BIOS/UEFI menu, find the <strong>Boot Order</strong> or <strong>Boot Device</strong> settings and select the USB drive as the first boot option.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Save and exit</strong>: Save your settings and exit the BIOS. Your computer will now boot from the USB drive and begin the AlmaLinux 9 installation process.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Creating an installation disk for AlmaLinux 9 is a straightforward process, whether you’re using Windows, macOS, or Linux. With the right tools and a few steps, you’ll have a bootable USB drive ready to install AlmaLinux 9 on your system. This powerful, enterprise-ready Linux distribution offers a robust solution for users and organizations seeking a stable, RHEL-compatible environment.</p>
  

<!-- wp:paragraph -->
<p>Once you’ve successfully booted from the USB drive, you can proceed with the installation and enjoy the many features and benefits AlmaLinux 9 has to offer. Whether you're setting up a server, desktop, or virtual machine, AlmaLinux 9 provides a secure and reliable operating system that’s well-suited for a wide range of use cases.</p>
  