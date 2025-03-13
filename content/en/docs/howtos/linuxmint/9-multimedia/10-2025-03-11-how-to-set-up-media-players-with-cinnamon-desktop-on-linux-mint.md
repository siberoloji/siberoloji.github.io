---
draft: false
title: How to Set Up Media Players with Cinnamon Desktop on Linux Mint
linkTitle: Media Players
translationKey: how-to-set-up-media-players-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up various media players with the Cinnamon desktop environment on Linux Mint.
url: how-to-set-up-media-players-with-cinnamon-desktop-on-linux-mint
weight: 10
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
  - media players
featured_image: /images/linuxmint1.webp
---
Linux Mint, with its Cinnamon desktop environment, offers a great balance between usability and customization. One of the key aspects of a good user experience is setting up media players to handle your audio and video files efficiently. Whether you're watching movies, listening to music, or streaming content, Linux Mint provides multiple options for setting up and configuring media players.

This guide will walk you through installing, configuring, and optimizing media players on the Cinnamon desktop.

## Choosing the Right Media Player

Linux Mint comes with a default media player, **Celluloid** (formerly GNOME MPV), which is lightweight and efficient. However, you might prefer alternatives based on your specific needs. Here are some popular choices:

- **VLC Media Player** – Highly versatile, supports almost all formats.
- **SMPlayer** – A front-end for MPlayer, great for advanced users.
- **MPV** – Lightweight and powerful, with scripting capabilities.
- **Rhythmbox** – Best for managing and playing music.
- **Audacious** – Lightweight audio player with Winamp-style UI.

### Installing Media Players

Most media players are available in Linux Mint’s repositories and can be installed via the terminal or Software Manager.

#### Using Terminal

Open a terminal (`Ctrl + Alt + T`) and use the following commands to install media players:

- **VLC**

  ```bash
  sudo apt install vlc
  ```

- **SMPlayer**

  ```bash
  sudo apt install smplayer
  ```

- **MPV**

  ```bash
  sudo apt install mpv
  ```

- **Rhythmbox**

  ```bash
  sudo apt install rhythmbox
  ```

- **Audacious**

  ```bash
  sudo apt install audacious
  ```

Alternatively, you can install these from **Software Manager** by searching for the media player and clicking **Install**.

## Configuring Default Media Player

Once installed, you may want to set your preferred player as the default for opening media files.

1. Open **System Settings** from the menu.
2. Navigate to **Preferred Applications**.
3. Under the **Multimedia** tab, select your desired media player.
4. Close the settings window.

Now, any media file you open will default to your chosen application.

## Integrating Media Players with Cinnamon Desktop

### Adding Media Player to Panel

For quick access, you can add your media player to the Cinnamon panel.

1. Open the **Menu**.
2. Search for your media player (e.g., VLC).
3. Right-click on it and select **Add to Panel**.

### Adding Media Controls to the Sound Applet

Cinnamon’s sound applet can integrate with certain media players, allowing playback control from the system tray.

1. Open **Rhythmbox** or **VLC**.
2. Start playing any audio or video file.
3. Click on the sound icon in the system tray.
4. You should see playback controls (Play/Pause, Next, Previous).

If controls are not appearing, ensure the **MPRIS2** plugin is enabled in your media player’s settings.

## Optimizing Media Player Performance

### Enabling Hardware Acceleration (VLC & MPV)

If you experience lag or stuttering, enabling hardware acceleration can help.

#### VLC

1. Open **VLC** and go to **Tools > Preferences**.
2. Select **Input / Codecs**.
3. Under **Hardware-accelerated decoding**, choose **Automatic** or **VA-API** (for Intel/AMD GPUs).
4. Save and restart VLC.

#### MPV

1. Open the MPV configuration file (create it if it doesn’t exist):

   ```bash
   mkdir -p ~/.config/mpv
   nano ~/.config/mpv/mpv.conf
   ```

2. Add the following lines:

   ```
   hwdec=auto
   ```

3. Save and exit (`Ctrl + X`, then `Y`, then `Enter`).
4. Restart MPV.

### Enabling Additional Codecs

While most modern media players support a wide range of formats, you might encounter unsupported codecs.
To install additional codecs, run:

```bash
sudo apt install ubuntu-restricted-extras
```

This package includes proprietary codecs like MP3, H.264, and some Microsoft fonts.

## Customizing Media Player Appearance

Most media players allow theme customization to match the Cinnamon desktop.

### VLC Skins

1. Download VLC skins from [VLC’s official website](https://www.videolan.org/vlc/skins.php).
2. Open VLC, go to **Tools > Preferences > Interface**.
3. Select **Use custom skin**, then browse to the downloaded file.
4. Restart VLC.

### SMPlayer Themes

1. Open **SMPlayer** and go to **Options > Preferences**.
2. Under **Interface**, change the icon theme and GUI style.
3. Click **Apply**.

## Troubleshooting Common Issues

### Media Player Won’t Open

- Run the player from the terminal to check for errors. Example:

  ```bash
  vlc
  ```

- If an error appears, try reinstalling:

  ```bash
  sudo apt remove --purge vlc
  sudo apt install vlc
  ```

### No Sound or Audio Problems

- Ensure your media player is not muted.
- Open **PulseAudio Volume Control** (`pavucontrol`) and check output settings.

  ```bash
  sudo apt install pavucontrol
  pavucontrol
  ```

- Restart the audio service:

  ```bash
  pulseaudio --kill && pulseaudio --start
  ```

### Video Stuttering or Lagging

- Enable hardware acceleration as described earlier.
- Lower the resolution or use a different player.
- Check if another process is using too many system resources with:

  ```bash
  top
  ```

## Conclusion

Setting up media players on Linux Mint with the Cinnamon desktop is simple and highly customizable. Whether you prefer VLC, MPV, SMPlayer, or another option, configuring them properly enhances your multimedia experience. With these optimizations, you can enjoy smooth playback, better performance, and seamless desktop integration.
