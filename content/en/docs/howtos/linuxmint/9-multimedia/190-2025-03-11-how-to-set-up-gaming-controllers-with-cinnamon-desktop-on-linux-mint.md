---
draft: false
title: How to Set Up Gaming Controllers with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Gaming Controllers
translationKey: how-to-set-up-gaming-controllers-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up gaming controllers on Linux Mint with the Cinnamon desktop environment.
url: how-to-set-up-gaming-controllers-with-cinnamon-desktop-on-linux-mint
weight: 190
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
  - gaming controllers
featured_image: /images/linuxmint1.webp
---
# How to Set Up Gaming Controllers with Cinnamon Desktop on Linux Mint

Linux Mint, with its Cinnamon desktop environment, is a popular choice for users seeking a stable, user-friendly, and visually appealing operating system. While Linux has traditionally been associated with productivity and development, it has also made significant strides in the gaming world. Thanks to advancements in compatibility layers like Proton and tools like Steam Play, gaming on Linux has never been better. However, to fully enjoy gaming on Linux Mint, you need to ensure your gaming controllers are properly set up.

In this guide, we’ll walk you through the process of setting up gaming controllers on Linux Mint with the Cinnamon desktop environment. Whether you’re using an Xbox, PlayStation, or a generic controller, this guide will help you get your device up and running smoothly.

---

## Why Use Gaming Controllers on Linux Mint?

Gaming controllers offer a more immersive and comfortable experience for many types of games, especially platformers, racing games, and action-adventure titles. While keyboard and mouse setups are great for precision, controllers provide analog input and ergonomic design that can enhance your gaming experience.

Linux Mint, being a Ubuntu-based distribution, has excellent support for a wide range of gaming controllers. The Cinnamon desktop environment, known for its simplicity and elegance, provides a seamless interface for managing peripherals. With the right tools and configurations, you can easily connect and use your gaming controller on Linux Mint.

---

## Step 1: Identify Your Controller

Before diving into the setup process, it’s important to identify the type of controller you’re using. The most common controllers include:

- **Xbox Controllers**: Xbox One, Xbox Series X/S, and Xbox 360 controllers are widely supported on Linux.
- **PlayStation Controllers**: DualShock 4 (PS4) and DualSense (PS5) controllers are also compatible, though they may require additional software for full functionality.
- **Generic Controllers**: Many third-party controllers emulate Xbox or PlayStation controllers and should work out of the box.
- **Nintendo Switch Pro Controller**: This controller is supported but may need extra configuration.

Most modern controllers use USB or Bluetooth for connectivity. Ensure your controller is charged or connected via USB before proceeding.

---

## Step 2: Connect Your Controller

### Wired Connection

If your controller uses a USB connection, simply plug it into an available USB port on your computer. Linux Mint should automatically detect the controller and install the necessary drivers.

### Wireless Connection (Bluetooth)

For wireless controllers, follow these steps to pair your device via Bluetooth:

1. Open the **Menu** and go to **System Settings**.
2. Select **Bluetooth** and ensure it’s turned on.
3. Put your controller into pairing mode. For example:
   - **Xbox Controller**: Press and hold the pairing button on the top of the controller.
   - **PS4 Controller**: Hold the **PS button** and **Share button** simultaneously until the light bar flashes.
   - **PS5 Controller**: Hold the **PS button** and **Create button** until the light bar flashes.
4. In the Bluetooth settings, click **Search** and select your controller from the list.
5. Click **Pair** and wait for the connection to complete.

---

## Step 3: Verify Controller Detection

Once your controller is connected, you’ll want to verify that Linux Mint recognizes it. Here’s how:

1. Open a terminal (`Ctrl + Alt + T`).
2. Install `jstest-gtk`, a tool for testing joysticks and controllers:

   ```bash
   sudo apt install jstest-gtk
   ```

3. Launch `jstest-gtk` from the terminal or by searching for it in the menu.
4. Select your controller from the list and click **Properties**.
5. Test the buttons, joysticks, and triggers to ensure they’re working correctly.

If your controller isn’t listed, it may not be supported out of the box, or you may need to install additional drivers.

---

## Step 4: Install Additional Drivers (If Needed)

While most controllers work seamlessly on Linux Mint, some may require extra drivers or software for full functionality.

### Xbox Controllers

Xbox controllers are natively supported by the `xpad` kernel module. However, for advanced features like rumble and wireless support, you may want to install the `xboxdrv` driver:

1. Open a terminal and install `xboxdrv`:

   ```bash
   sudo apt install xboxdrv
   ```

2. Start the driver:

   ```bash
   sudo xboxdrv
   ```

3. Test your controller again using `jstest-gtk`.

### PlayStation Controllers

For PS4 and PS5 controllers, you may need to install `ds4drv` or `steam-devices` for better compatibility:

1. Install `ds4drv`:

   ```bash
   sudo apt install ds4drv
   ```

2. Run the driver:

   ```bash
   sudo ds4drv
   ```

3. Alternatively, Steam provides excellent support for PlayStation controllers. Simply enable PlayStation controller support in Steam’s settings.

### Nintendo Switch Pro Controller

To use a Nintendo Switch Pro Controller, install the `hid-nintendo` driver:

1. Open a terminal and install the driver:

   ```bash
   sudo apt install xboxdrv
   ```

2. Reboot your system and test the controller.

---

## Step 5: Configure Controller in Steam

If you’re using Steam for gaming, it offers built-in support for a wide range of controllers. Here’s how to configure your controller in Steam:

1. Open Steam and go to **Settings**.
2. Select **Controller** and click **General Controller Settings**.
3. Enable the appropriate configuration for your controller (e.g., Xbox, PlayStation, or Switch Pro Controller).
4. Customize button mappings and sensitivity as needed.
5. Launch a game and test your controller.

Steam’s controller configuration tool is highly versatile and allows you to create custom profiles for different games.

---

## Step 6: Troubleshooting Common Issues

Despite Linux Mint’s excellent hardware support, you may encounter issues when setting up your controller. Here are some common problems and their solutions:

### Controller Not Detected

- Ensure the controller is properly connected via USB or Bluetooth.
- Check if the controller is supported by Linux Mint.
- Install additional drivers if necessary.

### Input Lag or Unresponsive Controls

- Disconnect other USB devices that may be causing interference.
- Use a wired connection if possible.
- Update your system and controller drivers.

### Incorrect Button Mapping

- Use `jstest-gtk` or Steam’s controller configuration tool to remap buttons.
- Check for community-created profiles in Steam.

### Rumble Not Working

- Ensure the `xboxdrv` or `ds4drv` driver is installed and running.
- Enable rumble in Steam’s controller settings.

---

## Step 7: Enhance Your Gaming Experience

Once your controller is set up, you can further enhance your gaming experience on Linux Mint:

- **Install Gaming Tools**: Tools like Lutris and PlayOnLinux make it easy to manage and play games from various platforms.
- **Optimize Performance**: Use tools like Gamemode to optimize system performance for gaming.
- **Explore Native Linux Games**: Many games, such as those available on Steam, have native Linux versions that run flawlessly on Linux Mint.

---

## Conclusion

Setting up gaming controllers on Linux Mint with the Cinnamon desktop environment is a straightforward process that can significantly enhance your gaming experience. Whether you’re using an Xbox, PlayStation, or generic controller, Linux Mint’s robust hardware support and user-friendly interface make it easy to get started.

By following this guide, you’ll be able to connect, configure, and troubleshoot your gaming controller with ease. With your controller ready, you can dive into your favorite games and enjoy a seamless gaming experience on Linux Mint.
