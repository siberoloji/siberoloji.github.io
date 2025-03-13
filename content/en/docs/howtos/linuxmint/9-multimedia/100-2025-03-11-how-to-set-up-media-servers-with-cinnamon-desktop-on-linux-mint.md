---
draft: false
title: How to Set Up Media Servers with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Media Servers
translationKey: how-to-set-up-media-servers-with-cinnamon-desktop-on-linux-mint
description: A guide to setting up a media server on Linux Mint with Cinnamon.
url: how-to-set-up-media-servers-with-cinnamon-desktop-on-linux-mint
weight: 100
date: 2025-03-11
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - media servers
featured_image: /images/linuxmint1.webp
---
Linux Mint is a popular Linux distribution known for its stability, ease of use, and compatibility with a variety of applications. If you use the Cinnamon desktop environment and want to set up a media server, you have several options. Whether you want to stream movies, share music, or serve photos, a media server can help you centralize your media library and access it from multiple devices.

In this guide, we’ll walk you through setting up a media server on Linux Mint with Cinnamon. We’ll cover installation, configuration, and access to your media from different devices.

---

## Choosing the Right Media Server Software

Before setting up your media server, you need to choose the right software. Here are some of the best options available:

- **Plex**: A popular media server that offers a sleek interface and support for a wide range of devices.
- **Jellyfin**: A free, open-source alternative to Plex that does not require a subscription.
- **Kodi**: A powerful media center that can act as a server.
- **Emby**: Similar to Plex but allows more control over local media.
- **MiniDLNA (ReadyMedia)**: A lightweight DLNA-compliant media server for simple streaming.

For most users, **Plex** or **Jellyfin** are the best choices due to their user-friendly interfaces and broad compatibility.

---

## Installing Plex Media Server on Linux Mint

### Step 1: Download and Install Plex

1. Open a terminal by pressing `Ctrl + Alt + T`.
2. Update your system:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

3. Download the Plex package:

   ```bash
   wget https://downloads.plex.tv/plex-media-server-new/1.32.5.7349-8f4248874/debian/plexmediaserver_1.32.5.7349-8f4248874_amd64.deb
   ```

   *(Make sure to check the [official Plex website](https://www.plex.tv/) for the latest version.)*
4. Install Plex:

   ```bash
   sudo dpkg -i plexmediaserver_*.deb
   ```

5. Start and enable the Plex service:

   ```bash
   sudo systemctl enable --now plexmediaserver
   ```

6. Verify Plex is running:

   ```bash
   systemctl status plexmediaserver
   ```

### Step 2: Access the Plex Web Interface

Plex runs as a web application. To access it:

1. Open a web browser and go to:

   ```
   http://localhost:32400/web
   ```

2. Sign in with your Plex account (or create one if you don’t have it yet).
3. Follow the on-screen setup wizard to add your media libraries (Movies, TV Shows, Music, etc.).
4. Configure remote access if needed.

---

## Installing Jellyfin on Linux Mint

### Step 1: Add the Jellyfin Repository and Install

1. Update your system:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Add the Jellyfin repository:

   ```bash
   echo "deb [signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
   ```

3. Download the Jellyfin GPG key:

   ```bash
   wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo tee /usr/share/keyrings/jellyfin.gpg
   ```

4. Install Jellyfin:

   ```bash
   sudo apt update
   sudo apt install jellyfin -y
   ```

5. Start and enable the Jellyfin service:

   ```bash
   sudo systemctl enable --now jellyfin
   ```

6. Check the service status:

   ```bash
   systemctl status jellyfin
   ```

### Step 2: Access the Jellyfin Web Interface

1. Open a web browser and navigate to:

   ```
   http://localhost:8096
   ```

2. Follow the setup wizard to create an admin account and configure media libraries.
3. Set up user profiles and remote access as needed.

---

## Configuring Firewall for Media Servers

If you plan to access your media server from other devices on your network, you need to allow traffic through the firewall.

For Plex:

```bash
sudo ufw allow 32400/tcp
```

For Jellyfin:

```bash
sudo ufw allow 8096/tcp
```

Enable the firewall if it's not active:

```bash
sudo ufw enable
```

---

## Accessing Your Media from Other Devices

Once your media server is set up, you can stream content on various devices:

### **On Smart TVs and Streaming Devices**

- Install the **Plex** or **Jellyfin** app on Roku, Fire TV, Apple TV, or Android TV.
- Log in with your account and browse your media library.

### **On Smartphones and Tablets**

- Download the **Plex** or **Jellyfin** app from the App Store or Google Play.
- Connect to your home media server and start streaming.

### **On Other Computers**

- Open a web browser and visit `http://<server-ip>:32400/web` for Plex.
- Use `http://<server-ip>:8096` for Jellyfin.
- If needed, set up a VPN or port forwarding to access your media outside your home network.

---

## Additional Features and Enhancements

- **Transcoding Support**: Enable hardware acceleration in settings for smoother streaming.
- **Plugins and Add-ons**: Plex and Jellyfin offer plugins to enhance functionality (e.g., subtitles, metadata fetchers).
- **Remote Access**: Configure your router to allow access outside your home.
- **Automated Media Downloads**: Use software like **Sonarr**, **Radarr**, and **Lidarr** to automate media management.

---

## Conclusion

Setting up a media server on Linux Mint with Cinnamon is straightforward and provides a great way to organize and access your media files from multiple devices. Whether you choose **Plex** for its polished interface, **Jellyfin** for its open-source flexibility, or a lightweight DLNA server for simple streaming, Linux Mint is a solid foundation for your home media system.

With the right configuration, you can enjoy seamless media playback, automated library management, and remote access to your content—all powered by the stability of Linux Mint and the Cinnamon desktop environment.
