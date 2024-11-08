---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Distributions
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
cmplz_hide_cookiebanner:
- ""
date: "2024-09-18T23:44:06Z"
excerpt: While Void Linux might seem intimidating for beginners, it offers several
  advantages, such as being lightweight, fast, and designed to give you a lean, customized
  system.
guid: https://www.siberoloji.com/?p=1627
id: 1627
image: /assets/images/2024/09/voidlinuxillustration1.webp
tags:
- linux
- linux distributions
- linux distros
- void linux
title: 'Void Linux: Take Control Your Distribution'
url: /a-beginners-guide-to-void-linux-distribution/
---

<!-- wp:paragraph -->
<p>Linux distributions have come a long way in offering a range of options to suit different user needs. Among these, Void Linux stands out as a unique, independent, and flexible distribution, often favored by users who want more control over their system. While Void Linux might seem intimidating for beginners, it offers several advantages, such as being lightweight, fast, and designed to give you a lean, customized system. In this article, we will cover what Void Linux is, its features, and how beginners can get started with it.</p>
  

 
 ## What is Void Linux?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Void Linux is an independent, general-purpose Linux distribution that is entirely developed from scratch, meaning it doesn’t derive from other distributions like Ubuntu, Debian, or Arch. It was created by Juan Romero Pardines in 2008, originally as a personal project, and has since gained traction within the Linux community.</p>
  

<!-- wp:paragraph -->
<p>Void is known for its minimalist design and for providing users with a lightweight, customizable system. The philosophy behind Void Linux is to give users as much control over their operating system as possible, which makes it popular among advanced users, but also a great learning platform for beginners who want to deepen their knowledge of Linux.</p>
  

<!-- wp:heading {"level":3} -->
 ### Key Features of Void Linux</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before diving into how you can get started with Void Linux, let’s look at some key features that make it unique:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Independent Development</strong>: Unlike many popular distributions, Void Linux is not based on any other Linux distribution. It was built from the ground up, making it unique in its architecture, package management system, and approach to stability.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Runit as Init System</strong>: One of the standout features of Void Linux is its use of the <strong>runit</strong> init system, rather than the more common systemd used by many other distributions. Runit is a lightweight, fast, and easy-to-understand init system, which is responsible for initializing your system’s processes.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>XBPS (X Binary Package System)</strong>: Void Linux uses its own package manager, XBPS, which is fast and flexible. It allows users to install, update, and manage packages in an efficient way. This is different from more common package managers like <code>apt</code> (Debian/Ubuntu) or <code>pacman</code> (Arch).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Rolling Release</strong>: Void Linux follows a rolling release model, meaning that once you install it, you will continue to receive updates for your system indefinitely, without needing to reinstall or upgrade major versions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Multilib Support</strong>: Void Linux supports both 32-bit and 64-bit systems, as well as ARM architecture. This means it can run on a wide range of devices, from older hardware to modern desktop systems and even embedded devices.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Customizable and Lightweight</strong>: Void comes with minimal bloat, giving you the freedom to install only the software you need. This makes it lightweight and customizable, perfect for users who want full control over their system configuration.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Why Should Beginners Consider Void Linux?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>At first glance, Void Linux might not seem like the best choice for beginners due to its minimalism and focus on user control. However, there are several reasons why it can be a great learning experience for those who are new to Linux:</p>
  

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Learn by Doing</strong>: Void Linux encourages you to learn how Linux works by giving you the tools to configure and customize your system. The learning curve might be steeper compared to beginner-friendly distributions like Ubuntu, but you’ll gain a deeper understanding of the inner workings of Linux.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>No Bloatware</strong>: Many beginner-friendly distributions come with pre-installed software that you may never use. Void Linux, on the other hand, comes with a bare minimum installation, allowing you to install only what you need. This gives you a streamlined and fast system right from the start.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Stable and Fast</strong>: Void’s use of the runit init system and XBPS package manager makes it incredibly fast and responsive. The lack of unnecessary background processes and services means that your system is lightweight and efficient.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Rolling Release Model</strong>: For beginners, the rolling release model can be appealing because you won’t need to worry about upgrading to a new version of the operating system every six months or a year. As long as you keep your system updated, you’ll always be running the latest version of Void Linux.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Good Documentation and Community Support</strong>: Void Linux has a well-maintained <a href="https://docs.voidlinux.org/">official documentation</a>, which covers installation, package management, configuration, and troubleshooting. Additionally, Void has an active community that is willing to help newcomers, making it a more approachable distribution for beginners.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Getting Started with Void Linux</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Here’s a step-by-step guide to help you get started with Void Linux, from downloading the ISO to performing a basic setup.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 1: Downloading Void Linux</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The first step is to download the Void Linux ISO image. Void offers different flavors, including options for both <strong>glibc</strong> (the GNU C library) and <strong>musl</strong> (an alternative lightweight C library). For beginners, it’s recommended to start with the glibc version as it is more widely compatible with existing Linux software.</p>
  

<!-- wp:paragraph -->
<p>You can download Void Linux from the <a href="https://voidlinux.org/download/">official website</a>, where you’ll find options for different architectures (x86, x86_64, ARM) and desktop environments such as Xfce, LXQt, and Cinnamon. If you prefer a more minimal installation, you can opt for the <strong>base</strong> image, which installs the bare minimum system and lets you build it up from there.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 2: Creating a Bootable USB</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once you’ve downloaded the ISO, the next step is to create a bootable USB drive. Tools like <strong>Rufus</strong> (for Windows) or <strong>Etcher</strong> (for Linux and macOS) can be used to create the bootable media. Select the Void Linux ISO, choose the USB drive, and let the software handle the rest.</p>
  

<!-- wp:heading {"level":3} -->
 ### Step 3: Installing Void Linux</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Booting from USB</strong>: Insert the USB into your system and reboot. Enter your BIOS or UEFI settings (usually by pressing F2, F12, or Delete during startup) and select the USB drive as the boot device.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Partitioning the Disk</strong>: The Void Linux installer is a text-based interface, which might seem intimidating at first, but it’s quite simple to follow. You’ll need to partition your hard drive if you want to dual boot or do a clean installation. Tools like <code>fdisk</code> and <code>cfdisk</code> are available to help with this process.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select Bootloader</strong>: Void offers options for bootloaders like GRUB, which is the most common, or you can opt to install your own.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Install Base System</strong>: The installer will allow you to install the base system. If you’re using a flavor with a desktop environment, it will install that as well.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Setting up Users</strong>: After the installation, you’ll be prompted to set up your user account and password. Make sure to set a strong root password and create a user account for daily use.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 4: Post-Installation Setup</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once Void Linux is installed, you’ll need to set up a few things before getting started:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Network Configuration</strong>: If you have Ethernet, Void should detect it automatically. For Wi-Fi, you may need to install and configure packages like <strong>wpa_supplicant</strong> and <strong>NetworkManager</strong> to get connected.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Installing Software</strong>: Void Linux doesn’t come pre-installed with a lot of software, so you’ll need to install your preferred applications using XBPS. For example, to install Firefox, you would run:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  sudo xbps-install -S firefox</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Desktop Environment</strong>: If you installed the base version, you’ll need to set up a desktop environment or window manager. Popular options include Xfce, LXQt, and i3. To install Xfce, for example:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  sudo xbps-install -S xfce4 xfce4-goodies</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Updating Your System</strong>: To keep your system up-to-date, run the following command periodically:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  sudo xbps-install -Su</code></pre>
<!-- /wp:code -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Void Linux might seem daunting for beginners at first glance, but it offers a rewarding learning experience for those who want to dive deeper into Linux. With its lightweight design, fast performance, and rolling release model, Void Linux gives you a flexible system that can be tailored to your needs. By following this guide, you can get started with Void Linux and begin exploring its many features.</p>
  