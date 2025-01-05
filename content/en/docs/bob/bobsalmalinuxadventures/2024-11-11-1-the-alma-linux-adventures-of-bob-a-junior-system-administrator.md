---
title: The AlmaLinux Adventures of Bob, a Junior System Administrator
linkTitle: Installation
description: Installing AlmaLinux. Should be simple, right? Bob rolls up his sleeves and gets ready for his first adventure.
date: 2024-11-07
draft: false
prev: docs/bob/bobsalmalinuxadventures/
next: ""
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 10
toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: /alma-linux-adventures-of-bob-junior-system-administrator/
---

## 1. Introduction: Meet Bob

Bob is a freshly minted Junior System Administrator, and like many new sysadmins, he’s both excited and a little overwhelmed by his new responsibilities. As he digs into his role, he quickly learns that mastering Linux is at the core of becoming a true pro. There’s just one small hitch—Linux is massive, and choosing where to start feels like staring into an endless sea of terminal commands and system quirks.

But Bob is determined! After some research, he’s decided to dive into [AlmaLinux](/exploring-alma-linux-enterprise-computing/), a robust, community-driven distribution compatible with [Red Hat](/red-hat-open-source-powerhouse-transforming-enterprise-computing/) but completely free and open-source. He’s read that AlmaLinux is popular in enterprise environments for its stability and security, which are crucial in his line of work. However, Bob knows he has a steep learning curve ahead as a beginner.

**Bob’s First Challenge**: Installing AlmaLinux. It should be simple, right? He rolls up his sleeves and gets ready for his first adventure.

---

## 2. Bob’s Mission: Understanding AlmaLinux

To begin, Bob does a little research on AlmaLinux. He finds out that AlmaLinux was designed as a direct replacement for CentOS after CentOS shifted its focus to a different model. This new operating system is loved by system administrators who want an enterprise-grade, open-source Linux option without Red Hat’s licensing fees. AlmaLinux provides stability, community support, and, best of all, compatibility with Red Hat-based software—features that make it a great choice for learning in a professional environment.

> *“Alright, AlmaLinux,”* Bob thinks. *“You seem like a solid place to start my sysadmin journey.”*

---

## 3. The Setup Begins: Downloading and Preparing AlmaLinux

Bob heads over to the [AlmaLinux website](https://almalinux.org) and downloads the latest ISO. He realizes he’ll need a bootable USB drive, so he digs out an old flash drive, follows the website’s instructions, and prepares the installer.

**Things get a bit tricky here:**

- **Selecting the Right ISO**: Bob finds multiple options and wonders which one he needs. For new users, the standard x86_64 ISO is typically best. Bob downloads it, resisting the temptation to experiment with other ISOs (he’s curious but trying to stay on task).

- [**Creating a Bootable USB**](/creating-bootable-usb-windows-linux-macos/): Bob uses a tool called **Balena Etcher** to create his bootable USB. While [Etcher](/balena-etcher-tool-creating-bootable-usb/) is straightforward, he runs into his first hiccup—a boot error. After a quick Google search, Bob finds that formatting the USB as [FAT32](/fat32-microsoft-windows-file-systems/) before using Etcher can help. The problem is solved, and his USB is ready.

---

## 4. Installation Process: Bob Takes It Step-by-Step

Finally, it’s installation time! Bob boots his system from the USB and follows along with the AlmaLinux installer.

- **Partitioning**: When the installer asks about partitioning, Bob is a little thrown. He sees terms like “/root,” “swap,” and “/home,” and he’s not quite sure what to make of them. After consulting a [Linux guide](/concepts-root-home-swap-spaces-linux/), he learns that these partitions help organize data and system files, keeping things separate and manageable. He opts for the default automatic partitioning, hoping that AlmaLinux’s installer knows best.

- **Choosing Packages**: As he navigates the options, Bob discovers that he can select additional software packages during the installation. Unsure what he’ll need yet, he sticks with the default packages but makes a mental note to revisit this once he’s more comfortable.

- **Setting Up the Root Password**: Bob’s also prompted to set a password for the “root” user, which has [superuser privileges](/understanding-root-user-linux-important-role-security/). He carefully chooses a secure password, knowing how critical it is to protect this account.

- **The GRUB Loader**: Just as he’s feeling confident, Bob hits a roadblock—the system throws a vague error about “GRUB installation.” After a bit of searching, he finds that this error can sometimes occur if the BIOS settings aren’t configured correctly. Following advice from a troubleshooting guide, he switches his boot mode from [UEFI to Legacy](/understanding-uefi-legacy-boot-mode-comprehensive-guide/). Success! AlmaLinux continues to install without a hitch.

---

## 5. Configurations and First Commands: Bob’s First Tasks

With AlmaLinux installed, Bob is ready to explore his new system. As he logs in for the first time, he feels like a true sysadmin—until he’s met by the command line. Undeterred, he decides to start small, running basic commands to make sure everything’s working.

- **Checking for Updates**: Bob’s first command is to check for system updates, something he’s read is important for security and stability. He types:

    ```bash
    sudo dnf update
    ```

    AlmaLinux quickly responds with a list of available updates. *“So far, so good!”* Bob mutters, hitting “Y” to confirm.

- **Creating a Non-Root User**: Knowing it’s risky to use the root account for day-to-day tasks, he creates a [non-root user account](/creating-non-root-user-linux/) for himself with:

    ```bash
    sudo useradd -m bob
    sudo passwd bob
    ```

    Now, he can perform everyday tasks without risking system integrity by working as root.

- **Enabling SSH Access**: Bob realizes he’ll need SSH access for remote connections in the future, so he enables the [SSH service](/understanding-ssh-service-linux/):

    ```bash
    sudo systemctl enable --now sshd
    ```

---

## 6. Conclusion: Bob Reflects on His First Day

With his AlmaLinux system set up and basic configurations in place, Bob takes a step back to reflect on his first adventure. He’s gained confidence, learned a few commands, and most importantly, realized that Linux isn’t quite as scary as it seemed. There’s still a lot he doesn’t know, but he’s off to a solid start.

As he closes his laptop, he wonders what tomorrow will bring. His next adventure? Diving into the mysterious world of Linux directories and permissions—an essential skill for every sysadmin.

> Stay tuned for the next chapter: "[Bob vs. The Mysterious World of Directories and Permissions!](/bob-explores-mysterious-world-of-directories-permissions/)"
