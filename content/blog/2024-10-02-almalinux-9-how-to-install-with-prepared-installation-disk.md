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

 <p>AlmaLinux has quickly become a popular choice for those seeking a stable, enterprise-grade Linux distribution. As a 1:1 binary compatible fork of Red Hat Enterprise Linux (RHEL), it offers a robust and reliable platform for various applications. In this comprehensive guide, we'll walk you through the process of installing AlmaLinux 9 using a prepared installation disk.</p>
 

 
 ## Prerequisites</h2>
<!-- /wp:heading -->

 <p>Before we begin, ensure you have the following:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>A computer with at least 2GB of RAM (4GB recommended for GUI installations)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>20GB of free disk space (more is recommended for production use)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A prepared AlmaLinux 9 installation disk (USB drive or DVD)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Internet connection (optional, but recommended for updates during installation)</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 1: Obtaining the Installation Media</h2>
<!-- /wp:heading -->

 <p>If you haven't already prepared your installation media, you'll need to:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Visit the official AlmaLinux website (https://almalinux.org/)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Navigate to the Downloads section</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Choose AlmaLinux 9 and select the appropriate ISO file (usually the DVD ISO)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Download the ISO file</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create a bootable USB drive or burn the ISO to a DVD</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>There are various tools available for creating bootable USB drives, such as Rufus for Windows or dd for Linux systems.</p>
 

 
 ## Step 2: Booting from the Installation Media</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Insert your prepared installation disk (USB or DVD) into your computer</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Restart your computer</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Access your computer's boot menu (usually by pressing F12, F2, or Del during startup)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the installation media as the boot device</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>When the AlmaLinux boot menu appears, select "Install AlmaLinux 9"</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 3: Language Selection</h2>
<!-- /wp:heading -->

 <p>The first screen you'll encounter is the language selection. Choose your preferred language for the installation process and click "Continue."</p>
 

 
 ## Step 4: Installation Summary</h2>
<!-- /wp:heading -->

 <p>You'll now see the Installation Summary screen, which provides an overview of various installation options. We'll go through each section:</p>
 

<!-- wp:heading {"level":3} -->
 ### Localization</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Keyboard</strong>: Set your keyboard layout</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Language Support</strong>: Add additional language support if needed</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Time &amp; Date</strong>: Set your time zone and configure NTP (Network Time Protocol) if desired</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Software</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Installation Source</strong>: This should be set to "Local media" by default</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Software Selection</strong>: Choose your base environment (e.g., Server with GUI, Minimal Install, Workstation)</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### System</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Installation Destination</strong>: Select the drive where you want to install AlmaLinux</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>KDUMP</strong>: Enable or disable the kernel crash dumping mechanism</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Network &amp; Host Name</strong>: Configure network settings and set your system's hostname</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### User Settings</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Root Password</strong>: Set a strong password for the root account</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>User Creation</strong>: Create a non-root user account (recommended)</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Step 5: Installation Destination</h2>
<!-- /wp:heading -->

 <p>Click on "Installation Destination" to configure your disk partitioning:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Select the disk(s) you want to use for installation</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Choose between "Automatic" or "Custom" partitioning</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>For most users, "Automatic" is sufficient</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>If you need specific partitioning schemes, select "Custom"</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>If using "Custom," create the following partitions at minimum:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>/boot (1GB)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>/ (root, allocate remaining space)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>swap (typically 1.5x your RAM size, up to 8GB)</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Click "Done" when finished</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 6: Software Selection</h2>
<!-- /wp:heading -->

 <p>Click on "Software Selection" to choose your desired installation type:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Select a base environment (e.g., "Server with GUI" or "Minimal Install")</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Choose additional software packages if needed</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Done" to confirm your selection</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 7: Network &amp; Host Name</h2>
<!-- /wp:heading -->

 <p>Configure your network settings:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Click on "Network &amp; Host Name"</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Set your desired hostname</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Toggle the network adapter to "ON" if you want to configure it during installation</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configure IPv4/IPv6 settings as needed</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Done" to save your settings</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 8: Begin Installation</h2>
<!-- /wp:heading -->

 <p>Once you've configured all necessary options:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Review the Installation Summary screen</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Begin Installation" to start the process</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 9: User Settings</h2>
<!-- /wp:heading -->

 <p>While the installation is running:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Set the root password when prompted</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Create a non-root user account (recommended for daily use)</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Step 10: Complete Installation</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Wait for the installation to complete (this may take several minutes)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Reboot" when prompted</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Remove the installation media before the system restarts</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Post-Installation Steps</h2>
<!-- /wp:heading -->

 <p>After your system reboots:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Log in using your created user account</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Open a terminal and run <code>sudo dnf update</code> to ensure your system is up-to-date</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Install any additional software you need using <code>sudo dnf install &lt;package-name&gt;</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configure your firewall settings using <code>firewall-cmd</code> if necessary</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Set up any additional users or groups as needed</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Troubleshooting Common Issues</h2>
<!-- /wp:heading -->

 <p>Here are some common issues you might encounter during installation and how to resolve them:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Boot media not recognized</strong>: Ensure your BIOS/UEFI settings allow booting from USB/DVD and that the installation media is properly created.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Network not detected</strong>: Check your network cable connection or Wi-Fi adapter. You may need to load additional drivers during installation.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Partitioning errors</strong>: If using custom partitioning, ensure you've allocated enough space for each partition and that you've included all necessary mount points.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Package installation failures</strong>: This could be due to corrupt installation media. Try re-downloading the ISO and creating a new installation disk.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

 <p>Congratulations! You've successfully installed AlmaLinux 9 on your system. AlmaLinux offers a stable, secure, and free enterprise-grade operating system that's perfect for servers, workstations, and development environments.</p>
 

 <p>Remember to keep your system updated regularly using <code>sudo dnf update</code> and explore the wealth of software available in the AlmaLinux repositories. If you encounter any issues or need community support, don't hesitate to visit the official AlmaLinux forums or documentation.</p>
 

 <p>AlmaLinux 9 provides a solid foundation for your computing needs, whether you're running a web server, developing software, or using it as a daily driver. Enjoy your new AlmaLinux 9 installation!</p>
 