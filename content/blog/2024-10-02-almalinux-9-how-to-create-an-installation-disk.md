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
<p>AlmaLinux is a popular, community-driven open-source Linux distribution that offers a stable, secure, and reliable alternative to CentOS. After CentOS shifted to its new rolling release model (CentOS Stream), AlmaLinux has become a go-to choice for users who need a Red Hat Enterprise Linux (RHEL) compatible operating system. AlmaLinux 9 brings several improvements in performance, security, and usability, making it an excellent choice for both server and desktop environments.
  

<!-- wp:paragraph -->
<p>One of the first steps in setting up AlmaLinux is creating an installation disk. In this blog post, we’ll guide you through the process of creating an AlmaLinux 9 installation disk. Whether you're a Linux beginner or an experienced user, this guide will cover everything you need, from downloading the ISO file to writing it onto a USB drive, ensuring you’re ready to install AlmaLinux 9 on your system.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Prerequisites
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before we dive into the steps for creating an installation disk for AlmaLinux 9, let’s cover the prerequisites you'll need:
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***A USB drive*** : At least 4 GB of storage space (preferably 8 GB or more). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***AlmaLinux 9 ISO file*** : You will need to download the official AlmaLinux 9 ISO. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Disk writing software*** : Tools like ***Etcher*** , ***Rufus*** , or the Linux <code>dd</code> command can be used to write the ISO file onto your USB drive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***A computer for creating the disk*** : Running Windows, macOS, or another Linux distribution. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Downloading the AlmaLinux 9 ISO
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The first step is to download the AlmaLinux 9 ISO file from the official website.
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Go to the AlmaLinux website*** : Visit <a href="https://almalinux.org">https://almalinux.org</a> and navigate to the ***Downloads***  section. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select the appropriate ISO*** : AlmaLinux 9 is available for different architectures. If you’re using a standard PC, select the x86_64 architecture. For servers, you might want to choose the minimal ISO, while for desktops, the full installation ISO is recommended. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Download the ISO*** : Choose a mirror close to your location to download the ISO faster. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Step-by-Step Guide to Creating an AlmaLinux 9 Installation Disk
<!-- /wp:heading -->


 ### Step 1: Prepare Your USB Drive
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before we write the AlmaLinux 9 ISO file to the USB drive, make sure your USB drive is properly prepared.
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Back up your data*** : Writing the ISO file to the USB drive will erase all the data currently on the drive. If you have important files on it, be sure to back them up elsewhere before proceeding. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Format the USB drive*** : Although many disk-writing tools will format the drive for you, it’s a good idea to format it manually before starting. You can use your operating system’s built-in disk utility for this. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Windows: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Insert the USB drive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Open ***File Explorer***  and right-click on the USB drive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select ***Format*** , choose the ***FAT32***  or ***NTFS***  file system, and click ***Start*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On macOS: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Insert the USB drive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Open ***Disk Utility***  (you can find this in ***Applications***  &gt; ***Utilities*** ). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select the USB drive from the sidebar and click ***Erase*** . Set the format to ***MS-DOS (FAT)***  or ***exFAT*** , then click ***Erase*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Linux: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Insert the USB drive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Use the <code>gparted</code> utility to format the drive. If you don't have it installed, you can install it via your package manager (<code>sudo apt install gparted</code> on Ubuntu, for example). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select the drive and format it to ***FAT32***  or ***NTFS*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Step 2: Use Disk Writing Software to Write the ISO
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>There are several tools you can use to create an installation disk for AlmaLinux 9. The tool you choose will depend on the operating system you’re using. Here, we’ll cover instructions for three common tools: ***Etcher*** , ***Rufus*** , and the ***dd***  command.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 1: Using Etcher (Cross-platform: Windows, macOS, and Linux) 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Etcher is a user-friendly tool that works on Windows, macOS, and Linux. It's highly recommended for beginners due to its simple interface.
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Download Etcher*** : Visit <a href="https://www.balena.io/etcher/">https://www.balena.io/etcher/</a> and download the installer for your operating system. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Install Etcher*** : Run the installer and follow the prompts to install it on your system. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Open Etcher*** : Once installed, open the application. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select the AlmaLinux ISO*** : Click on ***Flash from file***  and browse to the location where you downloaded the AlmaLinux 9 ISO. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Choose your USB drive*** : Insert your USB drive and select it in Etcher. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Start flashing*** : Click ***Flash!***  to begin the process. Etcher will write the ISO file to the USB drive and automatically verify the contents once the process is complete. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Eject the USB*** : Once the flashing process is finished, you’ll be notified. You can now safely eject the USB drive. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 2: Using Rufus (Windows) 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rufus is a lightweight tool for creating bootable USB drives on Windows. It's fast and reliable, making it a popular choice among Windows users.
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Download Rufus*** : Visit <a href="https://rufus.ie">https://rufus.ie</a> and download the latest version. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Open Rufus*** : Run the executable file (no installation required). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select the USB drive*** : Rufus will automatically detect your USB drive. Make sure the correct drive is selected. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select the AlmaLinux ISO*** : Click ***Select***  and browse to where you downloaded the AlmaLinux 9 ISO. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Partition scheme*** : Rufus will set the partition scheme to ***GPT***  by default, which is suitable for UEFI systems. If you’re installing on an older BIOS system, you may need to switch it to ***MBR*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***File system*** : Choose ***FAT32***  or ***NTFS*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Start the process*** : Click ***Start*** . Rufus will write the ISO to the USB drive and notify you when it’s finished. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Eject the USB drive*** : Once Rufus has completed the process, safely eject your USB drive. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Option 3: Using the <code>dd</code> Command (Linux) 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For experienced Linux users, the <code>dd</code> command is a powerful way to write ISO files to USB drives.
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Insert your USB drive*** : Identify the device path for your USB drive using the <code>lsblk</code> command. The device will typically be something like <code>/dev/sdb</code> or <code>/dev/sdc</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Write the ISO*** : Open a terminal and use the following command to write the ISO file to the USB drive. Be very careful with this command, as using the wrong device path can overwrite important data. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo dd if=/path/to/almalinux9.iso of=/dev/sdX bs=4M status=progress &amp;&amp; sync</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>/path/to/almalinux9.iso</code> with the path to the downloaded ISO file, and <code>/dev/sdX</code> with the device path for your USB drive.
  

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- ***Wait for the process to complete*** : The <code>dd</code> command will take some time to complete, and there won't be much visual feedback. Once it finishes, you’ll see a message indicating the number of bytes written. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Eject the USB drive*** : Use the following command to safely eject the USB drive: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo eject /dev/sdX</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Step 3: Boot from the USB Drive
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once you’ve created your AlmaLinux 9 installation disk, it’s time to boot from it and begin the installation process.
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Insert the USB drive*** : Plug the USB drive into the computer where you want to install AlmaLinux 9. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Restart your computer*** : Reboot the system and enter the ***BIOS***  or ***UEFI***  settings by pressing a key like <code>F2</code>, <code>F10</code>, or <code>Delete</code> during startup (the specific key depends on your computer's manufacturer). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select the USB drive as the boot device*** : In the BIOS/UEFI menu, find the ***Boot Order***  or ***Boot Device***  settings and select the USB drive as the first boot option. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Save and exit*** : Save your settings and exit the BIOS. Your computer will now boot from the USB drive and begin the AlmaLinux 9 installation process. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Conclusion
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Creating an installation disk for AlmaLinux 9 is a straightforward process, whether you’re using Windows, macOS, or Linux. With the right tools and a few steps, you’ll have a bootable USB drive ready to install AlmaLinux 9 on your system. This powerful, enterprise-ready Linux distribution offers a robust solution for users and organizations seeking a stable, RHEL-compatible environment.
  

<!-- wp:paragraph -->
<p>Once you’ve successfully booted from the USB drive, you can proceed with the installation and enjoy the many features and benefits AlmaLinux 9 has to offer. Whether you're setting up a server, desktop, or virtual machine, AlmaLinux 9 provides a secure and reliable operating system that’s well-suited for a wide range of use cases.
  