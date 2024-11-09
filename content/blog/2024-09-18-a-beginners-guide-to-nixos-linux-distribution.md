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
date: "2024-09-18T23:51:38Z"
excerpt: 'While it’s not as widely known as some other distros, NixOS Linux offers
  an innovative way to manage your system with a focus on reproducibility and isolation. '
guid: https://www.siberoloji.com/?p=1631
id: 1631
image: /assets/images/2024/09/nixoslinuxillustration1.webp
tags:
- linux
- linux distributions
- linux distros
- nixos
title: A Beginner’s Guide to NixOS Linux Distribution
url: /a-beginners-guide-to-nixos-linux-distribution/
---

  When it comes to Linux distributions, the options are numerous. Whether you’re looking for something user-friendly like Ubuntu or highly customizable like Arch, there’s a flavor for every type of user. However, there’s a Linux distribution that stands out due to its unique approach to package management and system configuration—***NixOS*** . While it’s not as widely known as some other distros, NixOS Linux offers an innovative way to manage your system with a focus on reproducibility and isolation. In this blog post, we’ll explore NixOS and explain why beginners might find it interesting, despite its initially steep learning curve. 
 

 
 ## What is NixOS?
<!-- /wp:heading -->

  NixOS is a ***Linux distribution***  that is built around the ***Nix package manager*** , which uses a purely functional approach to package management. Unlike most other Linux distributions that rely on traditional package managers like <code>apt</code> (Debian/Ubuntu) or <code>pacman</code> (Arch), NixOS takes a fundamentally different approach. 
 

  The core philosophy behind NixOS is that the entire system configuration is ***declarative*** . This means that you describe the state of your system in a single configuration file, and NixOS will ensure that your system matches that description. This brings several advantages, including the ability to easily ***roll back changes*** , maintain reproducibility across machines, and isolate dependencies. 
 


 ### Key Features of NixOS
<!-- /wp:heading -->

  Before diving into how to get started with NixOS, let’s look at some of its standout features: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Declarative System Configuration*** : Instead of manually installing packages and tweaking configurations, you describe your system in a file (usually <code>/etc/nixos/configuration.nix</code>). This file contains everything from installed packages to system services and user settings. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Reproducibility*** : Because your entire system is described in a single configuration file, you can easily recreate the same environment on different machines. This is particularly useful for developers who want consistent environments across multiple systems. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Atomic Upgrades and Rollbacks*** : NixOS allows for atomic system upgrades, meaning that changes are applied all at once. If something goes wrong, you can roll back to the previous system state with ease, ensuring a stable system at all times. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Isolation of Packages*** : Each package in NixOS is installed in isolation, reducing the risk of conflicts between different versions of libraries or software. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Functional Package Management*** : The Nix package manager builds packages in a purely functional way, ensuring that they don’t interfere with each other. This prevents issues like "dependency hell" that are common in other distributions. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Sandboxed Builds*** : NixOS builds all packages in an isolated environment, ensuring that the build process is independent of the state of the system, leading to more reliable builds. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Why Should Beginners Consider NixOS?
<!-- /wp:heading -->

  At first glance, NixOS might not seem like the most beginner-friendly distribution. Its unconventional approach can be intimidating, especially for those who are new to Linux. However, NixOS offers several benefits that make it worth considering, even for beginners: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Learning Through Experimentation*** : NixOS’s declarative nature forces you to think about how your system is configured, helping you learn the inner workings of Linux and package management in the process. While there’s a learning curve, the structured nature of NixOS helps you avoid the chaos of misconfigured systems. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Easily Reversible Changes*** : One of the biggest challenges for beginners is dealing with a system that becomes unstable due to package conflicts or bad configurations. With NixOS, every change is reversible, which provides a safety net for experimentation. If something goes wrong, you can roll back to a previous configuration. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Consistent Environments*** : For users who want to learn Linux while also exploring development environments, NixOS offers a reliable way to maintain consistent systems. You can easily replicate the same setup across different machines, which is great for development, testing, and learning. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Comprehensive Documentation*** : NixOS comes with a well-documented <a href="https://nixos.org/manual/">manual</a>, which guides you through everything from installation to advanced configurations. The strong community support and active development make it easier for newcomers to find help when needed. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Flexible for Different Use Cases*** : Whether you’re using NixOS as a desktop system, server, or even for development environments, its flexible nature allows you to tailor it to your needs. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Getting Started with NixOS
<!-- /wp:heading -->

  Here’s a step-by-step guide on how to get started with NixOS, from downloading the ISO to configuring your system. 
 


 ### Step 1: Downloading the NixOS ISO
<!-- /wp:heading -->

  The first step is to download the NixOS ISO image. NixOS provides two main editions: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***NixOS Graphical ISO*** : This comes with a desktop environment like GNOME or KDE, making it easier for beginners who want to jump straight into a graphical user interface. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***NixOS Minimal ISO*** : This is a command-line-only installation that’s best suited for advanced users or those who want to build their system from scratch. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  You can download the appropriate version from the <a href="https://nixos.org/download.html">official NixOS website</a>. For beginners, it’s recommended to start with the ***Graphical ISO***  for a smoother experience. 
 


 ### Step 2: Creating a Bootable USB
<!-- /wp:heading -->

  Once you’ve downloaded the ISO, you’ll need to create a bootable USB drive. There are several tools available for this task: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Rufus***  (Windows) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Etcher***  (Windows, macOS, Linux) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***dd***  (Linux command-line tool) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Choose your tool and create the bootable USB by selecting the NixOS ISO file and the target USB drive. 
 


 ### Step 3: Booting and Installing NixOS
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Boot from USB*** : Insert the bootable USB into your machine and restart it. Enter your BIOS/UEFI settings (usually by pressing F2, F12, or Delete during startup) and set the USB drive as the primary boot device. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Choose Installation Mode*** : If you’re using the graphical ISO, you’ll be greeted by a desktop environment where you can open a terminal and start the installation. For the minimal ISO, you’ll be dropped into a command-line interface. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Partitioning the Disk*** : Before you can install NixOS, you’ll need to partition your disk. You can use tools like <code>fdisk</code>, <code>cfdisk</code>, or <code>parted</code> to create the necessary partitions (typically, a boot partition, root partition, and swap). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Mount the Partitions*** : Once the partitions are created, mount them to the appropriate locations: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   mount /dev/sda2 /mnt
   mkdir /mnt/boot
   mount /dev/sda1 /mnt/boot</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":5} -->
<ol start="5" class="wp-block-list"><!-- wp:list-item -->
- ***Generate the Configuration File*** : NixOS uses a configuration file to define your system. Generate this file by running: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   nixos-generate-config --root /mnt</code></pre>
<!-- /wp:code -->

  This will create two files: <code>/mnt/etc/nixos/configuration.nix</code> (where you define your system) and <code>/mnt/etc/nixos/hardware-configuration.nix</code> (which is auto-generated based on your hardware). 
 

<!-- wp:list {"ordered":true,"start":6} -->
<ol start="6" class="wp-block-list"><!-- wp:list-item -->
- ***Edit the Configuration*** : Open <code>/mnt/etc/nixos/configuration.nix</code> in your favorite text editor and make any necessary changes. For example, you can define which desktop environment you want to install or which services to enable. The file is well-commented, so it’s easy to understand what each section does. For example, to install GNOME, add this line: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   services.xserver.desktopManager.gnome.enable = true;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":7} -->
<ol start="7" class="wp-block-list"><!-- wp:list-item -->
- ***Install NixOS*** : Once the configuration is ready, run the installation command: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   nixos-install</code></pre>
<!-- /wp:code -->

  This will install NixOS based on the configuration file you edited. 
 

<!-- wp:list {"ordered":true,"start":8} -->
<ol start="8" class="wp-block-list"><!-- wp:list-item -->
- ***Set a Root Password*** : During installation, you’ll be prompted to set a root password for your system. Make sure to set a strong password. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Reboot*** : After the installation is complete, reboot your system by running: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   reboot</code></pre>
<!-- /wp:code -->

  Don’t forget to remove the USB drive during the reboot to avoid booting back into the installer. 
 


 ### Step 4: Post-Installation Setup
<!-- /wp:heading -->

  After installation, your system should boot into the desktop environment or command-line interface, depending on your configuration. From here, you can start using your new NixOS system, but there are a few things you might want to do to finalize your setup: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Update Your System*** : NixOS uses channels to provide updates. To update your system, first switch to the stable channel: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  sudo nix-channel --add https://nixos.org/channels/nixos-21.11 nixpkgs
  sudo nix-channel --update</code></pre>
<!-- /wp:code -->

  Then, run the following command to apply updates: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  sudo nixos-rebuild switch</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Install Additional Software*** : You can install software using the <code>nix-env</code> command. For example, to install Firefox: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">  nix-env -iA nixpkgs.firefox</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Experiment with the Configuration File*** : One of the joys of NixOS is that you can continue modifying your system configuration through the <code>configuration.nix</code> file. As you get more comfortable, you can add new services, software, and customizations. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Conclusion
<!-- /wp:heading -->

  NixOS offers a unique approach to Linux that can seem daunting at first, but its declarative configuration and rollback capabilities make it an excellent choice for beginners who want to 
 

  learn more about system management and package isolation. The ability to reproduce your environment on different machines, combined with the ease of undoing changes, provides a safe environment for learning. By following this guide, you can get started with NixOS and begin exploring its powerful features. 
 

  <a href="https://www.siberoloji.com/a-list-of-popular-linux-distributions/" target="_blank" rel="noopener" title="">Linux Distributions List</a> 
 