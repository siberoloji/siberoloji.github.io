---
draft: true
title: How to Create Custom Desktop Shortcuts with Cinnamon Desktop on Linux Mint
linkTitle: How to Create Custom Desktop Shortcuts
translationKey: how-to-create-custom-desktop-shortcuts-with-cinnamon
description: A comprehensive guide on how to create custom desktop shortcuts in Linux Mint using the Cinnamon desktop environment.
url: how-to-create-custom-desktop-shortcuts-with-cinnamon
weight: 40
date: 2025-02-10
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
Linux Mint, known for its user-friendly experience, offers the Cinnamon desktop environment as one of its most popular choices. Cinnamon is designed to be intuitive and easy to use, making it ideal for both beginners and advanced users. One useful feature of Cinnamon is the ability to create custom desktop shortcuts, also known as launchers. These shortcuts provide quick access to applications, scripts, and files, improving efficiency and workflow.

In this guide, we will explore different methods to create and customize desktop shortcuts on Linux Mint using the Cinnamon desktop environment.

## Understanding Cinnamon Desktop Shortcuts

A desktop shortcut in Cinnamon is essentially a `.desktop` file, a small configuration file that contains metadata about an application, script, or command. These files are typically stored in `~/.local/share/applications/` for user-specific shortcuts or `/usr/share/applications/` for system-wide shortcuts.

Each `.desktop` file follows a standard format defined by the [Desktop Entry Specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/), which includes:

- **Name**: The display name of the shortcut
- **Exec**: The command to execute when clicked
- **Icon**: The icon displayed for the shortcut
- **Terminal**: Whether to run the application in a terminal
- **Type**: Defines the shortcut type (e.g., Application, Link, or Directory)
- **Categories**: Specifies the menu category in which the application appears

Now, let’s dive into the step-by-step process of creating custom desktop shortcuts.

---

## Method 1: Creating a Desktop Shortcut via GUI

If you prefer a graphical approach, Cinnamon provides a built-in way to create and manage desktop shortcuts.

### Steps

1. **Right-click on the Desktop**

   - Select **Create a new launcher here** from the context menu.

2. **Fill in the Launcher Details**

   - **Name**: Enter the name for your shortcut (e.g., "My App").
   - **Command**: Click on **Browse** or manually enter the command for the application or script.
   - **Comment**: Add an optional description.
   - **Icon**: Click on the icon button to select a custom icon.
   - **Run in Terminal**: Check this if the application requires a terminal.

3. **Click OK** to create the launcher.

   - Cinnamon will create a `.desktop` file in `~/Desktop/`.
   - If you see a warning about an untrusted application, right-click the new shortcut, go to **Properties > Permissions**, and check **Allow executing file as a program**.

---

## Method 2: Manually Creating a `.desktop` File

For more control, you can manually create a `.desktop` file using a text editor.

### Steps

1. **Open a Terminal and Navigate to the Desktop**

   ```bash
   cd ~/Desktop
   ```

2. **Create a New ****`.desktop`**** File**

   ```bash
   touch myapp.desktop
   ```

3. **Edit the File Using a Text Editor**

   ```bash
   nano myapp.desktop
   ```

   Add the following content:

   ```ini
   [Desktop Entry]
   Version=1.0
   Type=Application
   Name=My App
   Exec=/path/to/executable
   Icon=/path/to/icon.png
   Terminal=false
   Categories=Utility;
   ```

   - Replace `/path/to/executable` with the actual command or script.
   - Replace `/path/to/icon.png` with the path to an icon file.

4. **Save the File and Exit**

   - In `nano`, press `CTRL + X`, then `Y`, and `Enter` to save.

5. **Make the Shortcut Executable**

   ```bash
   chmod +x myapp.desktop
   ```

6. **Test the Shortcut**

   - Double-click the shortcut on the desktop.
   - If prompted, select "Trust and Launch."

---

## Method 3: Creating a System-Wide Shortcut

If you want your shortcut to be available system-wide, store it in `/usr/share/applications/`.

### Steps

1. **Create a ****`.desktop`**** File in****`/usr/share/applications/`**

   ```bash
   sudo nano /usr/share/applications/myapp.desktop
   ```

2. **Add the Shortcut Configuration**

   ```ini
   [Desktop Entry]
   Version=1.0
   Type=Application
   Name=My App
   Exec=/path/to/executable
   Icon=/path/to/icon.png
   Terminal=false
   Categories=Utility;
   ```

3. **Save and Exit**

4. **Update System Menus**

   ```bash
   sudo update-desktop-database
   ```

5. **Find Your App in the Start Menu**

   - Open the Cinnamon menu and search for "My App."
   - If needed, drag it to the desktop or panel for quick access.

---

## Customizing Desktop Shortcuts

### Changing Icons

- Right-click the `.desktop` file.
- Select **Properties** > **Icon** and choose a new icon.

### Running Scripts with Shortcuts

If launching a script, use:

```ini
Exec=bash -c "gnome-terminal -- /path/to/script.sh"
```

Ensure the script is executable:

```bash
chmod +x /path/to/script.sh
```

### Adding Environment Variables

For applications requiring environment variables:

```ini
Exec=env VAR_NAME=value /path/to/executable
```

---

## Troubleshooting Common Issues

### Shortcut Won’t Launch

- Ensure the file has execution permissions (`chmod +x filename.desktop`).
- Check the `Exec` path for typos.
- Verify the `.desktop` file syntax using:

  ```bash
  desktop-file-validate myapp.desktop
  ```

### Missing Icons

- Ensure the icon file exists at the specified path.
- Use an absolute path instead of a relative one.

### Application Opens in a Terminal Unnecessarily

- Set `Terminal=false` in the `.desktop` file.

---

## Conclusion

Creating custom desktop shortcuts in Linux Mint with the Cinnamon desktop environment is a simple yet powerful way to enhance usability. Whether using the GUI, manually crafting `.desktop` files, or creating system-wide launchers, these methods allow for a highly personalized experience. With a little customization, you can streamline your workflow and access your favorite applications and scripts with ease.

If you found this guide helpful, feel free to share it with fellow Linux Mint users and explore more customization options available in Cinnamon!
