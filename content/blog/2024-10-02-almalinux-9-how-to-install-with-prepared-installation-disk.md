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
cmplz_hide_cookiebanner:
- ""
date: "2024-10-02T21:31:19Z"
guid: https://www.siberoloji.com/?p=2211
id: 2211
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- Installation
- linux how-to
title: 'AlmaLinux 9: How to Install with Prepared Installation Disk'
url: /almalinux-9-how-to-install-with-prepared-installation-disk/
---

 <p>AlmaLinux has quickly become a popular choice for those seeking a stable, enterprise-grade Linux distribution. As a 1:1 binary compatible fork of Red Hat Enterprise Linux (RHEL), it offers a robust and reliable platform for various applications. In this comprehensive guide, we'll walk you through the process of installing AlmaLinux 9 using a prepared installation disk.
 

 
 ## Prerequisites
<!-- /wp:heading -->

 <p>Before we begin, ensure you have the following:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- A computer with at least 2GB of RAM (4GB recommended for GUI installations) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- 20GB of free disk space (more is recommended for production use) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- A prepared AlmaLinux 9 installation disk (USB drive or DVD) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Internet connection (optional, but recommended for updates during installation) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 1: Obtaining the Installation Media
<!-- /wp:heading -->

 <p>If you haven't already prepared your installation media, you'll need to:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Visit the official AlmaLinux website (https://almalinux.org/) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Navigate to the Downloads section 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Choose AlmaLinux 9 and select the appropriate ISO file (usually the DVD ISO) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Download the ISO file 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Create a bootable USB drive or burn the ISO to a DVD 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>There are various tools available for creating bootable USB drives, such as Rufus for Windows or dd for Linux systems.
 

 
 ## Step 2: Booting from the Installation Media
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Insert your prepared installation disk (USB or DVD) into your computer 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Restart your computer 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Access your computer's boot menu (usually by pressing F12, F2, or Del during startup) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select the installation media as the boot device 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- When the AlmaLinux boot menu appears, select "Install AlmaLinux 9" 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 3: Language Selection
<!-- /wp:heading -->

 <p>The first screen you'll encounter is the language selection. Choose your preferred language for the installation process and click "Continue."
 

 
 ## Step 4: Installation Summary
<!-- /wp:heading -->

 <p>You'll now see the Installation Summary screen, which provides an overview of various installation options. We'll go through each section:
 


 ### Localization
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Keyboard*** : Set your keyboard layout 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Language Support*** : Add additional language support if needed 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Time &amp; Date*** : Set your time zone and configure NTP (Network Time Protocol) if desired 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Software
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Installation Source*** : This should be set to "Local media" by default 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Software Selection*** : Choose your base environment (e.g., Server with GUI, Minimal Install, Workstation) 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### System
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Installation Destination*** : Select the drive where you want to install AlmaLinux 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***KDUMP*** : Enable or disable the kernel crash dumping mechanism 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Network &amp; Host Name*** : Configure network settings and set your system's hostname 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### User Settings
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Root Password*** : Set a strong password for the root account 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***User Creation*** : Create a non-root user account (recommended) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 5: Installation Destination
<!-- /wp:heading -->

 <p>Click on "Installation Destination" to configure your disk partitioning:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Select the disk(s) you want to use for installation 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Choose between "Automatic" or "Custom" partitioning 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- For most users, "Automatic" is sufficient 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- If you need specific partitioning schemes, select "Custom" 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- If using "Custom," create the following partitions at minimum: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- /boot (1GB) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- / (root, allocate remaining space) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- swap (typically 1.5x your RAM size, up to 8GB) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Click "Done" when finished 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 6: Software Selection
<!-- /wp:heading -->

 <p>Click on "Software Selection" to choose your desired installation type:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Select a base environment (e.g., "Server with GUI" or "Minimal Install") 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Choose additional software packages if needed 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Done" to confirm your selection 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 7: Network &amp; Host Name
<!-- /wp:heading -->

 <p>Configure your network settings:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Click on "Network &amp; Host Name" 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Set your desired hostname 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Toggle the network adapter to "ON" if you want to configure it during installation 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configure IPv4/IPv6 settings as needed 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Done" to save your settings 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 8: Begin Installation
<!-- /wp:heading -->

 <p>Once you've configured all necessary options:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Review the Installation Summary screen 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Begin Installation" to start the process 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 9: User Settings
<!-- /wp:heading -->

 <p>While the installation is running:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Set the root password when prompted 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Create a non-root user account (recommended for daily use) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Step 10: Complete Installation
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Wait for the installation to complete (this may take several minutes) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Reboot" when prompted 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Remove the installation media before the system restarts 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Post-Installation Steps
<!-- /wp:heading -->

 <p>After your system reboots:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Log in using your created user account 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Open a terminal and run <code>sudo dnf update</code> to ensure your system is up-to-date 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Install any additional software you need using <code>sudo dnf install &lt;package-name&gt;</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configure your firewall settings using <code>firewall-cmd</code> if necessary 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Set up any additional users or groups as needed 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Troubleshooting Common Issues
<!-- /wp:heading -->

 <p>Here are some common issues you might encounter during installation and how to resolve them:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Boot media not recognized*** : Ensure your BIOS/UEFI settings allow booting from USB/DVD and that the installation media is properly created. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Network not detected*** : Check your network cable connection or Wi-Fi adapter. You may need to load additional drivers during installation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Partitioning errors*** : If using custom partitioning, ensure you've allocated enough space for each partition and that you've included all necessary mount points. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Package installation failures*** : This could be due to corrupt installation media. Try re-downloading the ISO and creating a new installation disk. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Conclusion
<!-- /wp:heading -->

 <p>Congratulations! You've successfully installed AlmaLinux 9 on your system. AlmaLinux offers a stable, secure, and free enterprise-grade operating system that's perfect for servers, workstations, and development environments.
 

 <p>Remember to keep your system updated regularly using <code>sudo dnf update</code> and explore the wealth of software available in the AlmaLinux repositories. If you encounter any issues or need community support, don't hesitate to visit the official AlmaLinux forums or documentation.
 

 <p>AlmaLinux 9 provides a solid foundation for your computing needs, whether you're running a web server, developing software, or using it as a daily driver. Enjoy your new AlmaLinux 9 installation!
 