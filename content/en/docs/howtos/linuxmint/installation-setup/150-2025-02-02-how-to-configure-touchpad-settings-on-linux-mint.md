---
draft: false
title: How to Configure Touchpad Settings on Linux Mint
linkTitle: Touchpad Settings
translationKey: how-to-configure-touchpad-settings-on-linux-mint
description: Learn how to configure touchpad settings on Linux Mint using GUI options, command-line tools, and Xorg configuration files to optimize sensitivity, gestures, and palm detection.
url: how-to-configure-touchpad-settings-on-linux-mint
weight: 150
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
Linux Mint is a popular Linux distribution known for its user-friendly interface and robust performance. However, when it comes to configuring hardware settings like the touchpad, new users might find themselves navigating unfamiliar territory. Whether you're dealing with sensitivity issues, multi-touch gestures, or accidental palm touches while typing, Linux Mint offers several ways to customize your touchpad to suit your preferences.

In this guide, we'll walk you through different methods to configure touchpad settings on Linux Mint, covering both graphical user interface (GUI) options and command-line techniques.

## **1. Accessing Touchpad Settings via the System Settings**

The simplest way to adjust touchpad settings is through the System Settings interface:

### **Step-by-Step Instructions:**

1. **Open System Settings:** Click on the Menu button (usually located at the bottom-left corner) and select **"System Settings."**
2. **Navigate to Touchpad Settings:** Under the **"Hardware"** section, click on **"Mouse and Touchpad."**
3. **Adjust Touchpad Preferences:**
   - **Enable/Disable Touchpad:** You can toggle the touchpad on or off.
   - **Sensitivity Settings:** Adjust the pointer speed to your liking.
   - **Tap to Click:** Enable this option if you prefer tapping instead of pressing the touchpad buttons.
   - **Scrolling Options:** Choose between two-finger scrolling or edge scrolling.
   - **Disable While Typing:** Reduce accidental touches by enabling this feature.

4. **Apply Changes:** Your settings are usually applied automatically, but ensure everything works as expected.

This method is straightforward, especially for beginners who prefer not to deal with terminal commands.

## **2. Advanced Configuration Using `xinput`**

For more granular control, Linux Mint users can utilize the `xinput` command-line tool. This utility allows you to modify touchpad properties on the fly.

### **How to Use `xinput`:**

1. **Open Terminal:** Press `Ctrl + Alt + T` to launch the terminal.
2. **List Input Devices:**

   ```bash
   xinput list
   ```

   Look for your touchpad in the output. It will be listed as something like **"SynPS/2 Synaptics TouchPad"** or **"ELAN Touchpad."**

3. **Check Touchpad Properties:**

   ```bash
   xinput list-props [device ID]
   ```

   Replace `[device ID]` with the corresponding ID number from the previous step.

4. **Modify Settings:** For example, to adjust the sensitivity (acceleration speed):

   ```bash
   xinput --set-prop [device ID] "Device Accel Constant Deceleration" 2.5
   ```

   - Lower values increase sensitivity; higher values decrease it.

5. **Disable Tap-to-Click:**

   ```bash
   xinput --set-prop [device ID] "libinput Tapping Enabled" 0
   ```

   - Replace `0` with `1` to re-enable tap-to-click.

6. **Persistence:** These changes reset after a reboot. To make them permanent, consider adding the commands to your startup applications or create an `.xprofile` script in your home directory.

## **3. Configuring Touchpad Settings via `libinput` and Xorg Config Files**

Linux Mint uses `libinput` for input device management. For advanced, persistent settings, you can modify the Xorg configuration files.

### **Creating a Custom Configuration File:**

1. **Create a New Config File:**

   ```bash
   sudo nano /etc/X11/xorg.conf.d/40-libinput.conf
   ```

2. **Add Touchpad Configuration:**

   ```bash
   Section "InputClass"
       Identifier "touchpad"
       MatchIsTouchpad "on"
       Driver "libinput"
       Option "Tapping" "on"
       Option "NaturalScrolling" "true"
       Option "DisableWhileTyping" "true"
       Option "AccelSpeed" "0.5"
   EndSection
   ```

3. **Save and Exit:** Press `Ctrl + O` to save, then `Ctrl + X` to exit.
4. **Reboot the System:**

   ```bash
   sudo reboot
   ```

This method ensures your custom settings are preserved across reboots.

## **4. Using `dconf-editor` for GNOME-Based Adjustments**

If you’re using the Cinnamon desktop environment, which is based on GNOME technologies, `dconf-editor` provides another way to tweak touchpad settings.

### **Steps to Configure with `dconf-editor`:**

1. **Install `dconf-editor`:**

   ```bash
   sudo apt install dconf-editor
   ```

2. **Launch `dconf-editor`:** Type `dconf-editor` in the terminal or search for it in the application menu.
3. **Navigate to Touchpad Settings:**
   - Go to `org` > `gnome` > `desktop` > `peripherals` > `touchpad`.
4. **Modify Options:** Adjust settings like **tap-to-click**, **natural scrolling**, and **disable while typing**.
5. **Apply Changes:** Changes take effect immediately.

## **5. Troubleshooting Common Touchpad Issues**

### **Touchpad Not Detected:**

- **Check for Hardware Recognition:**

  ```bash
  xinput list
  ```

- **Review Kernel Modules:**

  ```bash
  lsmod | grep -i i2c
  ```

- **Reinstall Drivers:**

  ```bash
  sudo apt install xserver-xorg-input-synaptics
  ```

### **Gestures Not Working:**

- Ensure `libinput-gestures` is installed:

  ```bash
  sudo apt install libinput-tools
  ```

- Configure gestures using tools like **Gesture Manager** or **fusuma**.

### **Settings Not Persistent After Reboot:**

- Use `.xprofile` or `/etc/X11/xorg.conf.d/` for permanent settings.
- Verify startup scripts are executable:

  ```bash
  chmod +x ~/.xprofile
  ```

## **Conclusion**

Configuring touchpad settings on Linux Mint can greatly enhance your user experience, whether you're a casual user or a power user seeking precision control. From basic GUI tweaks to advanced command-line configurations, Linux Mint provides multiple avenues to optimize touchpad performance. Experiment with the methods outlined above to find the perfect setup for your workflow.
