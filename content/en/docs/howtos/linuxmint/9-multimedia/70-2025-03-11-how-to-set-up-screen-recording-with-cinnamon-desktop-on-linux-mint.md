---
draft: false
title: How to Set Up Screen Recording with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Screen Recording
translationKey: how-to-set-up-screen-recording-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up screen recording with the Cinnamon desktop on Linux Mint.
url: how-to-set-up-screen-recording-with-cinnamon-desktop-on-linux-mint
weight: 70
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
  - screen recording
featured_image: /images/linuxmint1.webp
---
Screen recording is an essential tool for many users, whether you're a content creator, developer, or IT professional. If you're using Linux Mint with the Cinnamon desktop, you have several options for capturing your screen. This guide will walk you through different methods, including built-in tools and third-party applications, to help you set up screen recording effectively.

## 1. Understanding Your Screen Recording Needs

Before diving into the setup, consider the following:

- **Do you need to record the entire screen, a specific window, or a selected area?**
- **Will you be recording audio from your microphone or system sounds?**
- **Are you looking for simple recording or advanced features like annotations and live streaming?**

Answering these questions will help you choose the right tool and configure it properly.

## 2. Using Cinnamon’s Built-in Screen Recorder

Cinnamon includes a lightweight built-in screen recording tool, though it is quite limited. It can record the entire screen but does not support audio recording.

### Enabling and Using Cinnamon’s Built-in Recorder

1. **Start Recording**: Press `Ctrl + Alt + Shift + R` to begin recording.
2. **Stop Recording**: Press the same key combination again to stop.
3. **Find Your Recording**: The recorded file is automatically saved in `~/Videos` in WebM format.

### Limitations

- No audio support.
- No options for selecting specific areas or windows.
- No configuration options.

If you need more features, you’ll need a third-party tool.

## 3. Using SimpleScreenRecorder

SimpleScreenRecorder (SSR) is a popular choice for screen recording on Linux due to its ease of use and performance optimization.

### Installing SimpleScreenRecorder

1. Open a terminal (`Ctrl + Alt + T`).
2. Run the following command:

   ```bash
   sudo apt update && sudo apt install simplescreenrecorder
   ```

### Setting Up SimpleScreenRecorder

1. Open SimpleScreenRecorder from the menu (`Start Menu > Sound & Video > SimpleScreenRecorder`).
2. Click **Continue** to enter the configuration screen.
3. Choose the recording area:
   - **Full screen**: Records everything.
   - **Rectangular section**: Allows you to select a specific area.
   - **Follow the cursor**: The recording moves with the cursor.
4. Enable **Record audio** if needed and select an appropriate audio source (such as PulseAudio for system sound or an external microphone).
5. Choose an output format (MKV, MP4, or WebM are good choices).
6. Select a save location for your recordings.
7. Click **Start recording** to begin capturing your screen.

## 4. Using OBS Studio for Advanced Recording

OBS Studio is a powerful open-source tool widely used for screen recording and live streaming.

### Installing OBS Studio

1. Open a terminal (`Ctrl + Alt + T`).
2. Add the OBS repository and install it:

   ```bash
   sudo add-apt-repository ppa:obsproject/obs-studio
   sudo apt update
   sudo apt install obs-studio
   ```

### Configuring OBS Studio

1. Open OBS Studio from the menu (`Start Menu > Sound & Video > OBS Studio`).
2. In the **Auto-Configuration Wizard**, choose "Optimize for recording."
3. Click **Settings > Output**, then select the output format (MP4 or MKV recommended).
4. Go to **Sources** and click **+** to add a new source:
   - Select **Screen Capture (XSHM)** for full-screen recording.
   - Select **Window Capture** to record a specific application.
5. Configure your audio settings in **Settings > Audio**, selecting your microphone and system audio.
6. Click **Start Recording** to begin capturing.

OBS Studio allows you to customize frame rates, resolutions, and overlays, making it ideal for professional-quality recordings.

## 5. Using Kazam for a Simple GUI Option

Kazam is another straightforward screen recording tool that balances ease of use and functionality.

### Installing Kazam

1. Open a terminal (`Ctrl + Alt + T`).
2. Install Kazam with:

   ```bash
   sudo apt update && sudo apt install kazam
   ```

### Using Kazam

1. Open Kazam from the menu (`Start Menu > Sound & Video > Kazam`).
2. Select the recording mode:
   - **Full screen**
   - **Window**
   - **Area selection**
3. Enable **Audio recording** if needed.
4. Click **Capture** to start recording.
5. Press `Super + Ctrl + R` to stop recording.
6. The recorded video is saved in `~/Videos`.

## 6. Additional Tips for a Smooth Recording Experience

### Adjusting Performance Settings

- Lower the resolution or frame rate if you experience lag.
- Close unnecessary applications to free up system resources.
- Use hardware acceleration if available (especially in OBS Studio).

### Editing Your Recordings

If you need to edit your recorded videos, consider using:

- **Kdenlive**: A full-featured video editor.
- **Shotcut**: A simple, open-source video editor.
- **FFmpeg**: A command-line tool for trimming and converting videos.

### Recording Keyboard Shortcuts

Some tools allow you to configure keyboard shortcuts for easier control. Check each program’s settings to enable hotkeys for starting, stopping, and pausing recordings.

## Conclusion

Setting up screen recording on Linux Mint with Cinnamon is straightforward, whether you use the built-in recorder, SimpleScreenRecorder, OBS Studio, or Kazam. Each tool has its own strengths:

- **Cinnamon’s built-in recorder** is quick but limited.
- **SimpleScreenRecorder** balances performance and ease of use.
- **OBS Studio** offers professional-grade features.
- **Kazam** provides a simple graphical interface.

Choose the one that best fits your needs and start recording effortlessly!
