---
draft: false
title: How to Manage Kernel Modules with `kldload` and `kldstat` on FreeBSD
linkTitle: Manage Kernel Modules with `kldload` and `kldstat`
translationKey: how-to-manage-kernel-modules-with-kldload-and-kldstat-on-freebsd
description: How to Manage Kernel Modules with `kldload` and `kldstat` on FreeBSD
url: how-to-manage-kernel-modules-with-kldload-and-kldstat-on-freebsd
date: 2025-03-14
weight: 130
keywords:
  - FreeBSD
  - kernel modules
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
FreeBSD is a powerful Unix-like operating system known for its robustness, advanced networking features, and extensive customization capabilities. One of its strengths is the modularity of the kernel, which allows users to load and unload kernel modules dynamically without requiring a system reboot. Managing kernel modules efficiently is crucial for system performance, hardware support, and security.

In this guide, we’ll explore how to manage kernel modules in FreeBSD using the `kldload` and `kldstat` utilities. We will cover the basics of kernel modules, how to load them dynamically, verify their status, and troubleshoot potential issues.

---

## Understanding Kernel Modules in FreeBSD

Kernel modules are pieces of code that extend the functionality of the FreeBSD kernel without the need for recompilation. They are typically used to add support for hardware drivers, file systems, network protocols, and security features.

FreeBSD's modular kernel architecture allows users to:

- Load new functionality on demand.
- Avoid bloating the base kernel with unnecessary features.
- Improve system stability and performance by only loading required modules.

Kernel modules in FreeBSD are stored in the `/boot/kernel/` directory and typically have a `.ko` extension (e.g., `if_wg.ko` for WireGuard support).

---

## Loading Kernel Modules with `kldload`

The `kldload` command is used to load kernel modules into the running kernel. It allows users to add new features without rebooting the system.

### Syntax

The basic syntax of `kldload` is:

```sh
kldload <module_name>
```

For example, to load the `pf` (Packet Filter) firewall module:

```sh
sudo kldload pf
```

This command will load the module `pf.ko` from `/boot/kernel/` into the kernel.

### Loading Modules with Absolute Path

In some cases, if a module is not located in `/boot/kernel/`, you may need to specify the absolute path:

```sh
sudo kldload /path/to/module.ko
```

### Checking Module Dependencies

Some modules depend on other kernel modules. If a required dependency is missing, `kldload` will attempt to load it automatically. However, if there are issues, you may need to load dependencies manually before loading the main module.

---

## Verifying Loaded Modules with `kldstat`

Once a module is loaded, you may want to verify its status. The `kldstat` command provides information about currently loaded kernel modules.

### Syntax

To list all loaded kernel modules, run:

```sh
kldstat
```

This outputs details such as the module ID, size, and name. Example output:

```
Id Refs Address            Size     Name
 1    6 0xffffffff80200000  2535600  kernel
 2    1 0xffffffff824d0000  37010   pf.ko
 3    1 0xffffffff824e0000  12000   if_wg.ko
```

- **Id**: Module identifier.
- **Refs**: Number of references to the module.
- **Address**: Memory address where the module is loaded.
- **Size**: Memory size of the module.
- **Name**: Module filename.

### Checking Specific Module Information

To check if a particular module (e.g., `pf.ko`) is loaded, use:

```sh
kldstat | grep pf
```

This will return a line containing information about the `pf.ko` module if it is loaded.

---

## Unloading Kernel Modules

If a module is no longer needed, it can be removed using `kldunload`:

```sh
sudo kldunload <module_name>
```

For example, to unload the `pf` module:

```sh
sudo kldunload pf
```

This frees up system resources and reduces the attack surface by removing unused functionality.

**Note:** Some modules cannot be unloaded if they are actively in use. To identify dependencies preventing unloading, use:

```sh
kldstat -v
```

If unloading fails, ensure that no processes or services are using the module.

---

## Automatically Loading Modules at Boot

To ensure that a module loads at boot, add it to `/boot/loader.conf`:

```sh
echo 'pf_load="YES"' | sudo tee -a /boot/loader.conf
```

This ensures the module is loaded early in the boot process.

Alternatively, for services that require a module but should start later, add the module to `/etc/rc.conf`:

```sh
sudo sysrc kld_list+="pf"
```

This approach ensures that the module is loaded before related services start but after the kernel has initialized.

---

## Troubleshooting Kernel Module Issues

### 1. Module Not Found

If `kldload` fails with an error like:

```
kldload: can't load pf: No such file or directory
```

Ensure that:

- The module exists in `/boot/kernel/` or another specified path.
- The correct module name is used.
- The kernel version matches the module version (check with `uname -a`).

### 2. Module Cannot Be Unloaded

If unloading fails, check:

- `kldstat -v` for dependencies.
- Running processes that might be using the module (`ps aux | grep <module>`).
- System logs for relevant messages (`dmesg | tail`).

### 3. Boot Fails After Loading a Module

If a system becomes unbootable due to a misconfigured module, boot into single-user mode:

1. Reboot the system and select **Single User Mode** from the boot menu.
2. Mount the filesystem:

   ```sh
   mount -u /
   mount -a
   ```

3. Edit `/boot/loader.conf` to remove the faulty module entry.
4. Reboot the system normally.

---

## Conclusion

Managing kernel modules in FreeBSD using `kldload` and `kldstat` provides a flexible way to extend or modify the system without requiring a reboot. Understanding how to load, check, and unload modules helps maintain system efficiency, security, and stability. By automating module loading where necessary and troubleshooting issues proactively, FreeBSD users can take full advantage of the operating system’s modular design.
