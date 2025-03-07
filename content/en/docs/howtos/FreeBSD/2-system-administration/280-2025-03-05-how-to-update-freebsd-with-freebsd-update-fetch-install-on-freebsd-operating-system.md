---
draft: false
title: How to Update FreeBSD with `freebsd-update fetch install` on FreeBSD Operating System
linkTitle: How to Update FreeBSD with `freebsd-update fetch install`
translationKey: how-to-update-freebsd-with-freebsd-update-fetch-install-on-freebsd-operating-system
description: This article provides a step-by-step guide on how to update FreeBSD using the `freebsd-update fetch install` command.
url: how-to-update-freebsd-with-freebsd-update-fetch-install-on-freebsd-operating-system
date: 2025-03-05
weight: 280
keywords:
  - FreeBSD
  - update
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

FreeBSD is a powerful, open-source Unix-like operating system known for its performance, stability, and advanced networking capabilities. It is widely used in servers, desktops, and embedded systems. Like any other operating system, FreeBSD requires regular updates to ensure security, stability, and access to the latest features. One of the most straightforward ways to update FreeBSD is by using the `freebsd-update` tool, which simplifies the process of fetching and installing updates.

In this blog post, we will walk you through the process of updating FreeBSD using the `freebsd-update fetch install` command. We will cover the following topics:

1. **Understanding `freebsd-update`**
2. **Preparing for the Update**
3. **Fetching and Installing Updates**
4. **Rebooting the System**
5. **Handling Major Version Upgrades**
6. **Best Practices for Updating FreeBSD**
7. **Troubleshooting Common Issues**

By the end of this guide, you will have a clear understanding of how to keep your FreeBSD system up-to-date using the `freebsd-update` tool.

---

## 1. Understanding `freebsd-update`

The `freebsd-update` tool is a built-in utility in FreeBSD designed to simplify the process of applying security patches, bug fixes, and system updates. It is particularly useful for users who want to keep their systems current without manually compiling and installing updates from source code.

`freebsd-update` supports two types of updates:

- **Minor Updates**: These include security patches, bug fixes, and minor feature enhancements. They are typically applied to the current version of FreeBSD (e.g., updating from 13.1-RELEASE to 13.1-RELEASE-p1).
- **Major Version Upgrades**: These involve upgrading to a new major or minor version of FreeBSD (e.g., upgrading from 13.1-RELEASE to 13.2-RELEASE).

For most users, `freebsd-update` is the recommended method for applying minor updates. For major version upgrades, additional steps may be required, which we will discuss later in this post.

---

## 2. Preparing for the Update

Before proceeding with the update, it is essential to prepare your system to ensure a smooth and error-free process. Follow these steps:

### a. Backup Your Data

While `freebsd-update` is generally reliable, it is always a good idea to back up your important data before performing any system updates. This ensures that you can recover your data in case something goes wrong during the update process.

### b. Check System Requirements

Ensure that your system meets the requirements for the update. For example, verify that you have sufficient disk space and that your hardware is compatible with the new version of FreeBSD.

### c. Review Release Notes

Before updating, review the release notes for the new version of FreeBSD. The release notes provide information about new features, bug fixes, and any potential issues that may arise during the update.

### d. Ensure Network Connectivity

Since `freebsd-update` fetches updates from the internet, ensure that your system has a stable network connection.

---

## 3. Fetching and Installing Updates

Once you have prepared your system, you can proceed with fetching and installing updates. The process involves two main commands: `freebsd-update fetch` and `freebsd-update install`.

### a. Fetching Updates

To fetch the latest updates, run the following command as the root user:

```sh
freebsd-update fetch
```

This command connects to the FreeBSD update servers and downloads the latest patches and updates for your system. Depending on the size of the updates and your internet connection speed, this process may take a few minutes.

### b. Installing Updates

After fetching the updates, you can install them using the following command:

```sh
freebsd-update install
```

This command applies the downloaded updates to your system. During the installation process, `freebsd-update` may prompt you to review and approve certain changes, such as merging configuration files.

### c. Reboot the System (if necessary)

Some updates, particularly kernel updates, require a system reboot to take effect. If `freebsd-update` indicates that a reboot is necessary, you can reboot your system using the following command:

```sh
reboot
```

---

## 4. Reboot the System

After installing updates, it is often necessary to reboot the system to ensure that all changes take effect. This is especially true for kernel updates, which require a reboot to load the new kernel.

To reboot your system, simply run:

```sh
reboot
```

Once the system has rebooted, you can verify that the updates have been applied by checking the system version:

```sh
uname -a
```

This command displays the current version of the FreeBSD kernel and operating system.

---

## 5. Handling Major Version Upgrades

While `freebsd-update` is primarily designed for minor updates, it can also be used to perform major version upgrades. However, major upgrades require additional steps and precautions.

### a. Fetch the Upgrade

To fetch the files for a major version upgrade, use the following command:

```sh
freebsd-update -r <new-version> upgrade
```

Replace `<new-version>` with the target version of FreeBSD (e.g., `13.2-RELEASE`).

### b. Install the Upgrade

After fetching the upgrade files, install them using:

```sh
freebsd-update install
```

### c. Reboot the System

Reboot the system to load the new version of FreeBSD:

```sh
reboot
```

### d. Complete the Upgrade

After rebooting, run `freebsd-update` again to complete the upgrade process:

```sh
freebsd-update install
```

### e. Rebuild Installed Packages

After a major version upgrade, you may need to rebuild and reinstall your installed packages to ensure compatibility with the new version of FreeBSD. This can be done using the `pkg` tool:

```sh
pkg upgrade -f
```

---

## 6. Best Practices for Updating FreeBSD

To ensure a smooth and secure update process, follow these best practices:

- **Regularly Check for Updates**: Make it a habit to check for updates regularly. This ensures that your system remains secure and up-to-date.
- **Read Release Notes**: Always review the release notes before performing an update. This helps you understand the changes and potential issues.
- **Backup Your Data**: Always back up your data before performing an update. This protects your data in case something goes wrong.
- **Test Updates in a Staging Environment**: If possible, test updates in a staging environment before applying them to production systems.
- **Monitor System Performance**: After applying updates, monitor your system's performance to ensure that everything is functioning correctly.

---

## 7. Troubleshooting Common Issues

While `freebsd-update` is generally reliable, you may encounter issues during the update process. Here are some common issues and their solutions:

### a. Network Connectivity Issues

If `freebsd-update` fails to fetch updates, ensure that your system has a stable network connection. You can also try changing the update server by editing the `/etc/freebsd-update.conf` file.

### b. Insufficient Disk Space

If you encounter errors related to insufficient disk space, free up space by removing unnecessary files or expanding your disk partition.

### c. Configuration File Conflicts

During the update process, `freebsd-update` may prompt you to resolve conflicts in configuration files. Carefully review the changes and merge them as needed.

### d. Failed Updates

If an update fails, you can try running `freebsd-update` again. If the issue persists, consult the FreeBSD documentation or seek help from the FreeBSD community.

---

## Conclusion

Updating FreeBSD using the `freebsd-update fetch install` command is a straightforward and efficient way to keep your system secure and up-to-date. By following the steps outlined in this guide, you can ensure that your FreeBSD system remains stable and performs optimally.

Remember to back up your data, review release notes, and follow best practices to minimize the risk of issues during the update process. Whether you are applying minor updates or performing a major version upgrade, `freebsd-update` is a powerful tool that simplifies the process and helps you maintain a healthy FreeBSD system.

If you encounter any issues, don't hesitate to consult the FreeBSD documentation or seek assistance from the vibrant FreeBSD community. Happy updating!
