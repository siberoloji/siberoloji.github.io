---
draft: true
title: How to Configure System Scaling with Cinnamon Desktop on Linux Mint
linkTitle: How to Configure System Scaling
translationKey: how-to-configure-system-scaling-with-cinnamon-desktop-on-linux-mint
description: Learn how to configure system scaling in Cinnamon on Linux Mint.
url: how-to-configure-system-scaling-with-cinnamon-desktop-on-linux-mint
weight: 320
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
  - system scaling
featured_image: /images/linuxmint1.webp
---
Linux Mint, particularly with the Cinnamon desktop environment, is a popular choice for users who want a sleek, modern, and customizable Linux experience. One key aspect of this customization is adjusting the system scaling to ensure that text, icons, and interface elements appear at the right size for your display. Whether you're using a high-resolution monitor (HiDPI) or simply want to tweak how elements are displayed, Cinnamon provides several options to adjust scaling effectively.

In this guide, we will cover how to configure system scaling in Cinnamon on Linux Mint, including fractional scaling, display resolution settings, and manual adjustments for better usability.

## Understanding System Scaling

System scaling adjusts how UI elements, text, and icons are rendered on your screen. By default, most Linux distributions, including Linux Mint, assume a standard 100% scaling setting, which works well for standard HD (1080p) displays. However, on high-resolution (4K or higher) displays, this can make everything appear too small.

Cinnamon offers different scaling methods:

- **Standard (Integer) Scaling**: 100% (default), 200% (for HiDPI displays)
- **Fractional Scaling**: Allows finer adjustments like 125%, 150%, or 175%
- **Custom Manual Scaling**: Adjusts font sizes and UI elements separately

## Enabling and Configuring Scaling in Cinnamon

### 1. Using Cinnamon's Display Settings

The easiest way to configure system scaling is through the built-in Display Settings.

1. **Open Display Settings**:
   - Click on the **Menu** button in the bottom-left corner.
   - Navigate to **System Settings** > **Displays**.

2. **Adjust Scaling**:
   - Under the **Resolution and Layout** section, look for the **UI scaling** option.
   - By default, this is set to 100%. If you have a HiDPI display, switch it to **Double (200%)**.
   - If you need finer control, enable **Fractional Scaling** (described below).

3. **Apply and Test**:
   - Click **Apply** and check if the interface looks appropriate.
   - If necessary, adjust further or revert changes if things appear too large or small.

### 2. Enabling Fractional Scaling

Fractional scaling is useful for displays where 100% is too small and 200% is too large.

1. **Enable Fractional Scaling**:
   - Open a terminal and run:

     ```bash
     gsettings set org.cinnamon.muffin experimental-features "['x11-randr-fractional-scaling']"
     ```

   - Restart Cinnamon by pressing **Alt + F2**, typing `r`, and pressing Enter.

2. **Configure Fractional Scaling**:
   - Return to **System Settings** > **Displays**.
   - You should now see fractional scaling options like **125%, 150%, and 175%**.
   - Select the one that best fits your display and apply.

### 3. Adjusting Font and UI Scaling Manually

If enabling system-wide scaling doesn't fully suit your needs, you can manually adjust specific UI elements.

1. **Adjust Font Scaling**:
   - Go to **System Settings** > **Fonts**.
   - Increase the **Text Scaling Factor** slider to make fonts larger.

2. **Change Icon and Panel Sizes**:
   - Right-click on the **Panel** and choose **Panel Settings**.
   - Adjust the **Panel Height** to make it larger if necessary.
   - For icons, go to **System Settings** > **Themes** > **Icons** and choose a larger set if available.

3. **Modify Window Borders and Title Bar Sizes**:
   - Some themes allow scaling of window elements. Go to **System Settings** > **Themes** and choose a different **Window Border** theme if needed.

### 4. Custom Scaling via xrandr (Advanced Users)

For those who need more granular control, `xrandr` can be used to manually adjust scaling per display.

1. **Check Available Displays**:
   Open a terminal and run:

   ```bash
   xrandr
   ```

   This will list your connected displays, such as `eDP-1` or `HDMI-1`.

2. **Apply Custom Scaling**:
   If you want to apply a 1.5x scale factor, run:

   ```bash
   xrandr --output eDP-1 --scale 0.75x0.75
   ```

   - Replace `eDP-1` with your display identifier.
   - The value `0.75x0.75` effectively scales elements up by 1.5x.

3. **Make it Permanent**:
   - To apply changes at startup, add the command to your `~/.profile` or `~/.xprofile` file.

### 5. Tuning Applications for Proper Scaling

Some applications may not respond well to system-wide scaling. Here are some fixes:

- **GTK Applications**: Most apps respect system scaling, but you can manually force scaling using:

  ```bash
  export GDK_SCALE=2
  ```

- **Electron Apps (VS Code, Slack, Discord, etc.)**: Run apps with:

  ```bash
  --force-device-scale-factor=1.5
  ```

- **Firefox and Chrome**: Enable scaling via environment variables:

  ```bash
  export MOZ_ENABLE_WAYLAND=1  # For Firefox
  google-chrome --force-device-scale-factor=1.5  # For Chrome
  ```

## Troubleshooting Common Issues

### 1. Blurry Fonts and Icons

- Ensure you are using the recommended resolution in **System Settings** > **Displays**.
- Try adjusting **Hinting** and **Anti-Aliasing** under **System Settings** > **Fonts**.

### 2. Cinnamon UI Becomes Unresponsive After Scaling Changes

- Restart Cinnamon with **Alt + F2**, type `r`, and hit Enter.
- If the issue persists, log out and log back in.

### 3. Some Apps Appear Too Small or Too Large

- Some applications do not support fractional scaling properly. Try forcing scaling per application using the methods mentioned above.

## Conclusion

Configuring system scaling in Linux Mint with Cinnamon allows you to fine-tune your display settings for the best experience, whether you're on a high-resolution screen or just need larger UI elements for readability. By using built-in settings, enabling fractional scaling, or manually adjusting elements through `xrandr`, you can achieve an optimal display setup tailored to your needs. Experiment with different settings and find what works best for you!
