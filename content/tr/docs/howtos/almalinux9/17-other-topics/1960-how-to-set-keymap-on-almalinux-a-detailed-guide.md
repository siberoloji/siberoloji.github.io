---
title: "How to Set Keymap on AlmaLinux: A Detailed Guide"
linkTitle: Set Keymap
description: This guide explains everything you need to know about keymaps on AlmaLinux, including why they matter, how to configure them, and troubleshooting common issues.
date: 2025-01-08
weight: 1960
url: set-keymap-almalinux-detailed-guide
translationKey: set-keymap-almalinux-detailed-guide
draft: true
tags:
  - AlmaLinux
  - keymaps
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
Keyboard layouts, or keymaps, are essential for system usability, especially in multilingual environments or when working with non-standard keyboards. AlmaLinux, a RHEL-based Linux distribution, provides several tools and methods to configure and manage keymaps effectively. Whether you’re working on a server without a graphical interface or a desktop environment, setting the correct keymap ensures your keyboard behaves as expected.

This guide explains everything you need to know about keymaps on AlmaLinux, including why they matter, how to configure them, and troubleshooting common issues.

---

## What Is a Keymap?

A keymap is a mapping between physical keys on a keyboard and their corresponding characters, symbols, or functions. Keymaps are essential for adapting keyboards to different languages, regions, and usage preferences. For example:

- A U.S. English keymap (`us`) maps keys to standard QWERTY layout.
- A German keymap (`de`) includes characters like `ä`, `ö`, and `ü`.
- A French AZERTY keymap (`fr`) rearranges the layout entirely.

---

## Why Set a Keymap on AlmaLinux?

Setting the correct keymap is important for several reasons:

- **Accuracy:** Ensures the keys you press match the output on the screen.
- **Productivity:** Reduces frustration and improves efficiency for non-standard layouts.
- **Localization:** Supports users who need language-specific characters or symbols.
- **Remote Management:** Prevents mismatched layouts when accessing a system via SSH or a terminal emulator.

---

## Keymap Management on AlmaLinux

AlmaLinux uses `systemd` tools to manage keymaps, including both temporary and permanent configurations. Keymaps can be configured for:

1. the Console** (TTY sessions).
2. **Graphical Environments** (desktop sessions).
3. **Remote Sessions** (SSH or terminal emulators).

The primary tool for managing keymaps in AlmaLinux is **`localectl`**, a command provided by `systemd`.

---

### Checking the Current Keymap

Before making changes, you may want to check the current keymap configuration.

1. **Using `localectl`:**
   Run the following command to display the current keymap and localization settings:

   ```bash
   localectl
   ```

   The output will include lines like:

   ```bash
   System Locale: LANG=en_US.UTF-8
   VC Keymap: us
   X11 Layout: us
   ```

2. for Console Keymap:**
   The line `VC Keymap` shows the keymap used in virtual consoles (TTY sessions).

3. for Graphical Keymap:**
   The line `X11 Layout` shows the layout used in graphical environments like GNOME or KDE.

---

### Setting the Keymap Temporarily

A temporary keymap change is useful for testing or for one-off sessions. These changes will not persist after a reboot.

#### Changing the Console Keymap

To set the keymap for the current TTY session:

```bash
sudo loadkeys <keymap>
```

For example, to switch to a German keymap:

```bash
sudo loadkeys de
```

#### Changing the Graphical Keymap

To test a keymap temporarily in a graphical session:

```bash
setxkbmap <keymap>
```

For instance, to switch to a French AZERTY layout:

```bash
setxkbmap fr
```

#### Key Points

- Temporary changes are lost after reboot.
- Use temporary settings to confirm the keymap works as expected before making permanent changes.

---

### Setting the Keymap Permanently

To ensure the keymap persists across reboots, you need to configure it using `localectl`.

#### Setting the Console Keymap

To set the keymap for virtual consoles permanently:

```bash
sudo localectl set-keymap <keymap>
```

Example:

```bash
sudo localectl set-keymap de
```

#### Setting the Graphical Keymap

To set the keymap for graphical sessions:

```bash
sudo localectl set-x11-keymap <layout>
```

Example:

```bash
sudo localectl set-x11-keymap fr
```

#### Setting Both Console and Graphical Keymaps

You can set both keymaps simultaneously:

```bash
sudo localectl set-keymap <keymap>
sudo localectl set-x11-keymap <layout>
```

#### Verifying the Configuration

Check the updated configuration using:

```bash
localectl
```

Ensure the `VC Keymap` and `X11 Layout` fields reflect your changes.

---

### Advanced Keymap Configuration

In some cases, you might need advanced keymap settings, such as variants or options for specific needs.

#### Setting a Keymap Variant

Variants provide additional configurations for a keymap. For example, the `us` layout has an `intl` variant for international characters.

To set a keymap with a variant:

```bash
sudo localectl set-x11-keymap <layout> <variant>
```

Example:

```bash
sudo localectl set-x11-keymap us intl
```

#### Adding Keymap Options

You can customize behaviors like switching between layouts or enabling specific keys (e.g., Caps Lock as a control key).

Example:

```bash
sudo localectl set-x11-keymap us "" caps:ctrl_modifier
```

---

### Keymap Files and Directories

Understanding the keymap-related files and directories helps when troubleshooting or performing manual configurations.

1. **Keymap Files for Console:**
   - Stored in `/usr/lib/kbd/keymaps/`.
   - Organized by regions, such as `qwerty`, `azerty`, or `dvorak`.

2. **Keymap Files for X11:**
   - Managed by the `xkeyboard-config` package.
   - Located in `/usr/share/X11/xkb/`.

3. **System Configuration File:**
   - `/etc/vconsole.conf` for console settings.
   - Example content:

     ```bash
     KEYMAP=us
     ```

4. **X11 Configuration File:**
   - `/etc/X11/xorg.conf.d/00-keyboard.conf` for graphical settings.
   - Example content:

     ```bash
     Section "InputClass"
         Identifier "system-keyboard"
         MatchIsKeyboard "on"
         Option "XkbLayout" "us"
         Option "XkbVariant" "intl"
     EndSection
     ```

---

### Troubleshooting Keymap Issues

#### 1. Keymap Not Applying After Reboot

- Ensure `localectl` was used for permanent changes.
- Check `/etc/vconsole.conf` for console settings.
- Verify `/etc/X11/xorg.conf.d/00-keyboard.conf` for graphical settings.

#### 2. Keymap Not Recognized

- Confirm the keymap exists in `/usr/lib/kbd/keymaps/`.
- Reinstall the `kbd` package:

  ```bash
  sudo dnf reinstall kbd
  ```

#### 3. Incorrect Characters Displayed

- Check if the correct locale is set:

  ```bash
  sudo localectl set-locale LANG=<locale>
  ```

  For example:

  ```bash
  sudo localectl set-locale LANG=en_US.UTF-8
  ```

#### 4. Remote Session Keymap Issues

- Ensure the terminal emulator or SSH client uses the same keymap as the server.
- Set the keymap explicitly during the session:

  ```bash
  loadkeys <keymap>
  ```

---

### Automating Keymap Configuration

For managing multiple systems, you can automate keymap configuration using tools like Ansible.

#### Example Ansible Playbook

```yaml
---
- name: Configure keymap on AlmaLinux
  hosts: all
  become: yes
  tasks:
    - name: Set console keymap
      command: localectl set-keymap us

    - name: Set graphical keymap
      command: localectl set-x11-keymap us
```

---

### Conclusion

Setting the correct keymap on AlmaLinux is an essential task for ensuring smooth operation, especially in multilingual or non-standard keyboard environments. By using tools like `localectl`, you can easily manage both temporary and permanent keymap configurations. Advanced options and troubleshooting techniques further allow for customization and problem resolution.

With the information provided in this guide, you should be able to configure and maintain keymaps on your AlmaLinux systems confidently. Feel free to share your thoughts or ask questions in the comments below! Happy configuring!
