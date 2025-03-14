---
draft: false
title: How to Reset a Forgotten Root Password on FreeBSD
linkTitle: How to Reset a Forgotten Root Password
translationKey: how-to-reset-a-forgotten-root-password
description: How to reset a forgotten root password on FreeBSD
url: how-to-reset-a-forgotten-root-password
date: 2025-03-14
weight: 110
keywords:
  - FreeBSD
  - password recovery
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

Forgetting the root password on a FreeBSD system can be a frustrating experience, especially if you are responsible for system administration. However, FreeBSD provides a straightforward method to reset the root password using single-user mode. This guide will take you through the entire process, ensuring you regain access to your system safely.

## Prerequisites

Before beginning, you need:

- Physical or remote access to the FreeBSD system.
- Knowledge of how to interact with the bootloader and shell.

If your system is hosted remotely, check whether your provider offers a recovery console or rescue mode to access single-user mode.

## Step-by-Step Guide to Resetting the Root Password

### Step 1: Reboot the System

If you are logged in but lack root access, restart the system using:

```sh
reboot
```

If you are completely locked out, you may need to perform a hard reboot using your hosting provider’s control panel or physically restarting the machine.

### Step 2: Access the Bootloader Menu

Once the system starts rebooting, you need to interrupt the normal boot process to access the FreeBSD bootloader menu. When you see the FreeBSD boot menu, press the **number 2 key** or select **Boot Single User Mode** manually.

If the boot menu is not visible, try pressing **ESC** or **Space** during boot to bring it up.

### Step 3: Enter Single-User Mode

Once in single-user mode, you will be presented with a shell prompt. By default, the system will boot into `/bin/sh`, the default shell.

If prompted to select a shell, simply press **Enter** to proceed with the default option.

### Step 4: Mount the Filesystem

In single-user mode, the root filesystem is typically mounted in read-only mode. To make changes, including resetting the password, you must remount it as read-write.

Run the following command:

```sh
mount -u /
```

Next, ensure that all necessary filesystems are available by running:

```sh
mount -a
```

This step is crucial to allow modifications to system files, including the password database.

### Step 5: Reset the Root Password

Now, change the root password using the `passwd` command:

```sh
passwd root
```

You will be prompted to enter a new password. Make sure to choose a strong password and confirm it when asked.

If the password change is successful, you will see a message confirming the update.

### Step 6: Reboot the System

Now that you have reset the root password, reboot your system to return to normal operation.

Run:

```sh
reboot
```

Alternatively, you can use:

```sh
exec reboot
```

Once the system boots up normally, log in as `root` using the new password.

## Additional Considerations

### Handling Encrypted Filesystems

If your system uses an encrypted root filesystem, you may need to manually decrypt and mount it before proceeding with password recovery. Follow your specific encryption setup’s documentation for details.

### Disabling Automatic Boot Scripts

In some cases, the system may run scripts automatically upon boot, which might interfere with the single-user mode process. To prevent this, boot into single-user mode and avoid running `mount -a` if you suspect script execution issues.

### Secure the System After Recovery

After resetting the password, consider:

- **Updating authentication methods**: If this is a recurring issue, consider using SSH keys or other secure authentication methods.
- **Checking for unauthorized access**: If you suspect the root password was changed by someone else, review system logs (`/var/log/auth.log`) to check for suspicious activity.
- **Setting up a password manager**: To avoid losing access again, store your credentials securely using a password manager.

## Conclusion

Resetting a forgotten root password on FreeBSD is a straightforward process if you have physical or console access. By following these steps—booting into single-user mode, mounting the filesystem, resetting the password, and rebooting—you can regain access to your system quickly. Always ensure your system is secure and that you have recovery measures in place to avoid similar situations in the future.
