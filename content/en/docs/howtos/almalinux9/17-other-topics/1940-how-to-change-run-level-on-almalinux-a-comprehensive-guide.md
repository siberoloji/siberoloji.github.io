---
title: "How to Change Run Level on AlmaLinux: A Comprehensive Guide"
linkTitle: Change Run Level
description: This blog post will guide you through everything you need to know about run levels in AlmaLinux, why you might want to change them, and step-by-step instructions to achieve this efficiently.
date: 2025-01-08
weight: 1940
url: change-run-level-almalinux-comprehensive-guide
draft: false
tags:
   - AlmaLinux
   - Run level
categories:
   - Linux
   - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
   - AlmaLinux
   - run level
featured_image: /images/almalinux.webp
---
AlmaLinux has become a go-to Linux distribution for businesses and individuals seeking a community-driven, open-source operating system that closely follows the Red Hat Enterprise Linux (RHEL) model. For administrators, one of the key tasks when managing a Linux system involves understanding and manipulating run levels, also known as **targets** in systems using `systemd`.

This blog post will guide you through everything you need to know about run levels in AlmaLinux, why you might want to change them, and step-by-step instructions to achieve this efficiently.

---

### Understanding Run Levels and Targets in AlmaLinux

In traditional Linux distributions using the **SysVinit** system, "run levels" were used to define the state of the machine. These states determined which services and processes were active. With the advent of `systemd`, run levels have been replaced by **targets**, which serve the same purpose but with more flexibility and modern features.

#### Common Run Levels (Targets) in AlmaLinux

Here’s a quick comparison between traditional run levels and `systemd` targets in AlmaLinux:

| **Run Level** | **Systemd Target**         | **Description**                           |
|---------------|----------------------------|-------------------------------------------|
| 0             | poweroff.target           | Halts the system.                         |
| 1             | rescue.target             | Single-user mode for maintenance.         |
| 3             | multi-user.target         | Multi-user mode without a graphical UI.   |
| 5             | graphical.target          | Multi-user mode with a graphical UI.      |
| 6             | reboot.target             | Reboots the system.                       |

Other specialized targets also exist, such as `emergency.target` for minimal recovery and troubleshooting.

---

### Why Change Run Levels?

Changing run levels might be necessary in various scenarios, including:

- **System Maintenance:** Access a minimal environment for repairs or recovery by switching to `rescue.target` or `emergency.target`.
- **Performance Optimization:** Disable the graphical interface on a server to save resources by switching to `multi-user.target`.
- **Custom Configurations:** Run specific applications or services only in certain targets for testing or production purposes.
- **Debugging:** Boot into a specific target to troubleshoot startup issues or problematic services.

---

### How to Check the Current Run Level (Target)

Before changing the run level, it’s helpful to check the current target of your system. This can be done with the following commands:

1. **Check Current Target:**

   ```bash
   systemctl get-default
   ```

   This command returns the default target that the system boots into (e.g., `graphical.target` or `multi-user.target`).

2. **Check Active Target:**

   ```bash
   systemctl list-units --type=target
   ```

   This lists all active targets and gives you an overview of the system's current state.

---

### Changing the Run Level (Target) Temporarily

To change the current run level temporarily, you can switch to another target without affecting the system's default configuration. This method is useful for tasks like one-time maintenance or debugging.

#### Steps to Change Run Level Temporarily

1. Use the `systemctl` command to switch to the desired target. For example:
   - To switch to **multi-user.target**:

     ```bash
     sudo systemctl isolate multi-user.target
     ```

   - To switch to **graphical.target**:

     ```bash
     sudo systemctl isolate graphical.target
     ```

2. Verify the active target:

   ```bash
   systemctl list-units --type=target
   ```

#### Key Points

- Temporary changes do not persist across reboots.
- If you encounter issues in the new target, you can switch back by running `systemctl isolate` with the previous target.

---

### Changing the Run Level (Target) Permanently

To set a different default target that persists across reboots, follow these steps:

#### Steps to Change the Default Target

1. **Set the New Default Target:**
   Use the `systemctl set-default` command to change the default target. For example:
   - To set **multi-user.target** as the default:

     ```bash
     sudo systemctl set-default multi-user.target
     ```

   - To set **graphical.target** as the default:

     ```bash
     sudo systemctl set-default graphical.target
     ```

2. **Verify the New Default Target:**
   Confirm the change with:

   ```bash
   systemctl get-default
   ```

3. **Reboot the System:**
   Restart the system to ensure it boots into the new default target:

   ```bash
   sudo reboot
   ```

---

### Booting into a Specific Run Level (Target) Once

If you want to boot into a specific target just for a single session, you can modify the boot parameters directly.

#### Using the GRUB Menu

1. **Access the GRUB Menu:**
   During system boot, press **Esc** or another key (depending on your system) to access the GRUB boot menu.

2. **Edit the Boot Parameters:**
   - Select the desired boot entry and press **e** to edit it.
   - Locate the line starting with `linux` or `linux16`.
   - Append the desired target to the end of the line. For example:

     ```bash
     systemd.unit=rescue.target
     ```

3. **Boot Into the Target:**
   Press **Ctrl+X** or **F10** to boot with the modified parameters.

#### Key Points

- This change is only effective for the current boot session.
- The system reverts to its default target after rebooting.

---

### Troubleshooting Run Level Changes

While changing run levels is straightforward, you might encounter issues. Here’s how to troubleshoot common problems:

#### 1. **System Fails to Boot into the Desired Target**

- Ensure the target is correctly configured and not missing essential services.
- Boot into `rescue.target` or `emergency.target` to diagnose issues.

#### 2. **Graphical Interface Fails to Start**

- Check the status of the `gdm` (GNOME Display Manager) or equivalent service:

     ```bash
     sudo systemctl status gdm
     ```

- Restart the service if needed:

     ```bash
     sudo systemctl restart gdm
     ```

#### 3. **Services Not Starting in the Target**

- Use `systemctl` to inspect and enable the required services:

     ```bash
     sudo systemctl enable <service-name>
     sudo systemctl start <service-name>
     ```

---

### Advanced: Creating Custom Targets

For specialized use cases, you can create custom targets tailored to your requirements.

#### Steps to Create a Custom Target

1. **Create a New Target File:**

   ```bash
   sudo cp /usr/lib/systemd/system/multi-user.target /etc/systemd/system/my-custom.target
   ```

2. **Modify the Target Configuration:**
   Edit the new target file to include or exclude specific services:

   ```bash
   sudo nano /etc/systemd/system/my-custom.target
   ```

3. **Add Dependencies:**
   Add or remove dependencies by creating `.wants` directories under `/etc/systemd/system/my-custom.target`.

4. **Test the Custom Target:**
   Switch to the new target temporarily using:

   ```bash
   sudo systemctl isolate my-custom.target
   ```

5. **Set the Custom Target as Default:**

   ```bash
   sudo systemctl set-default my-custom.target
   ```

---

### Conclusion

Changing run levels (targets) in AlmaLinux is an essential skill for administrators, enabling fine-tuned control over system behavior. Whether you’re performing maintenance, optimizing performance, or debugging issues, the ability to switch between targets efficiently is invaluable.

By understanding the concepts and following the steps outlined in this guide, you can confidently manage run levels on AlmaLinux and customize the system to meet your specific needs. For advanced users, creating custom targets offers even greater flexibility, allowing AlmaLinux to adapt to a wide range of use cases.

Feel free to share your experiences or ask questions in the comments below. Happy administering!
