---
draft: false
title: How to Configure Display Resolution and Multiple Monitors on Linux Mint
linkTitle: Resolution and Multiple Monitors
translationKey: how-to-configure-display-resolution-and-multiple-monitors
description: How to configure display resolution and multiple monitors on Linux Mint
url: how-to-configure-display-resolution-and-multiple-monitors-on-linux-mint
weight: 120
date: 2025-02-02
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
featured_image: /images/linuxmint1.webp
---
## How to Configure Display Resolution and Multiple Monitors on Linux Mint

Linux Mint is a popular, user-friendly Linux distribution based on Ubuntu, known for its ease of use and powerful customization options. Configuring display resolution and setting up multiple monitors is straightforward in Linux Mint, whether you're using the Cinnamon, MATE, or Xfce desktop environments. This guide will walk you through the steps to adjust display settings effectively.

### Understanding Display Settings in Linux Mint

Linux Mint provides a built-in Display Settings tool that allows users to manage display resolution, orientation, refresh rate, and multi-monitor configurations. Depending on the desktop environment, the interface might differ slightly, but the core functionality remains consistent.

### Prerequisites

Before you begin, ensure:

1. Your graphics drivers are up-to-date. Linux Mint supports proprietary drivers for NVIDIA and AMD cards, and open-source drivers for Intel.
2. All monitors are properly connected to your computer.
3. You have administrative privileges to make system changes.

### Configuring Display Resolution

#### 1. Using the Display Settings Tool

**For Cinnamon Desktop:**

1. Click on the **Menu** button and go to **Preferences > Display**.
2. The Display Settings window will open, showing connected displays.
3. Select the monitor you want to configure.
4. Under **Resolution**, choose the desired resolution from the drop-down list.
5. Adjust other settings like **Refresh Rate** and **Rotation** if needed.
6. Click **Apply** to preview changes. Confirm if the display looks correct; otherwise, revert to the previous settings.

**For MATE Desktop:**

1. Go to **System > Preferences > Hardware > Displays**.
2. Follow the same steps as outlined for Cinnamon.

**For Xfce Desktop:**

1. Navigate to **Settings > Display**.
2. The interface is minimalistic, but the options for resolution, refresh rate, and orientation are present.

#### 2. Using the Terminal with `xrandr`

For advanced users, `xrandr` is a powerful command-line tool to configure display settings.

- List connected displays:

  ```bash
  xrandr
  ```

- Change the resolution (replace `HDMI-1` with your display identifier):

  ```bash
  xrandr --output HDMI-1 --mode 1920x1080
  ```

- Add a new resolution mode:

  ```bash
  cvt 1920 1080
  xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
  xrandr --addmode HDMI-1 1920x1080_60.00
  xrandr --output HDMI-1 --mode 1920x1080_60.00
  ```

### Setting Up Multiple Monitors

Linux Mint handles multiple monitors seamlessly. You can extend displays, mirror them, or set a primary display.

#### 1. Using the Display Settings Tool

1. Open the **Display** settings as described earlier.
2. Detect connected monitors. They appear as draggable rectangles.
3. Arrange the monitors by dragging them to match their physical setup.
4. Choose the display mode:
   - **Extend:** Different parts of the desktop appear on each screen.
   - **Mirror:** The same display appears on all monitors.
   - **Primary Display:** Select which monitor serves as the main display.
5. Adjust resolutions for each monitor individually.
6. Click **Apply** to save changes.

#### 2. Using `xrandr` for Multiple Monitors

- Extend display to the right:

  ```bash
  xrandr --output HDMI-1 --auto --right-of eDP-1
  ```

- Mirror displays:

  ```bash
  xrandr --output HDMI-1 --same-as eDP-1
  ```

- Set primary monitor:

  ```bash
  xrandr --output HDMI-1 --primary
  ```

### Troubleshooting Display Issues

1. **Incorrect Resolution Not Listed:**
   - Use `xrandr` to add custom resolutions.
   - Check for driver issues.

2. **Display Not Detected:**
   - Reconnect cables.
   - Use the **Detect Displays** button in Display Settings.
   - Restart the system.

3. **Screen Tearing:**
   - For NVIDIA users, enable **Force Full Composition Pipeline** in the NVIDIA X Server Settings.
   - Use Compton or Picom for better compositing in Xfce.

4. **Display Settings Not Saving:**
   - Ensure changes are applied.
   - Edit configuration files directly:

     ```bash
     sudo nano /etc/X11/xorg.conf
     ```

### Advanced Configuration with `xorg.conf`

For persistent changes, especially in complex multi-monitor setups:

1. Generate a default config file:

   ```bash
   sudo X -configure :1
   sudo mv /root/xorg.conf.new /etc/X11/xorg.conf
   ```

2. Edit the file to specify resolutions and monitor arrangements.

### Conclusion

Configuring display resolution and managing multiple monitors on Linux Mint is user-friendly with both GUI tools and command-line utilities like `xrandr`. Whether you're a casual user or a power user, Linux Mint provides the flexibility needed to customize your display setup to your liking. Regular updates and driver management ensure optimal performance for diverse hardware configurations.
