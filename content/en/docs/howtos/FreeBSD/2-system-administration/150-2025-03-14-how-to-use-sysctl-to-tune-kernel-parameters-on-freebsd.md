---
draft: false
title: How to Use `sysctl` to Tune Kernel Parameters on FreeBSD
linkTitle: How to Use `sysctl` to Tune Kernel Parameters
translationKey: how-to-use-sysctl-to-tune-kernel-parameters-on-freebsd
description: This article provides a step-by-step guide on how to use `sysctl` to tune kernel parameters on FreeBSD.
url: how-to-use-sysctl-to-tune-kernel-parameters-on-freebsd
date: 2025-03-14
weight: 150
keywords:
  - FreeBSD
  - sysctl
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

FreeBSD is a powerful and flexible UNIX-like operating system known for its performance, security, and scalability. One of its essential system management tools is `sysctl`, which allows administrators to examine and modify kernel parameters at runtime. Tuning these parameters is crucial for optimizing system performance, security, and resource allocation.

This guide will explain how to use `sysctl` on FreeBSD, covering fundamental concepts, practical usage, and best practices for managing kernel parameters.

## Understanding `sysctl` in FreeBSD

The FreeBSD kernel exposes various system parameters that administrators can query and modify using the `sysctl` utility. These parameters are part of the FreeBSD `sysctl` MIB (Management Information Base), a hierarchical namespace representing different kernel subsystems.

### Structure of `sysctl` MIB

The `sysctl` parameters are organized hierarchically. Some common categories include:

- `kern`: Kernel-related settings (e.g., process limits, security policies).
- `vm`: Virtual memory management.
- `net`: Networking parameters.
- `debug`: Debugging-related configurations.
- `hw`: Hardware settings.
- `security`: Security configurations.

Each parameter follows a dot-separated notation, such as:

```shell
sysctl kern.ostype
```

This command retrieves the operating system type.

## Viewing System Parameters

To display all available `sysctl` parameters, run:

```shell
sysctl -a
```

To search for a specific parameter, use `grep`:

```shell
sysctl -a | grep net.inet
```

To check the value of a specific parameter:

```shell
sysctl kern.maxproc
```

## Modifying Kernel Parameters

### Temporary Changes

To temporarily modify a kernel parameter, use:

```shell
sysctl -w net.inet.ip.forwarding=1
```

or:

```shell
sysctl net.inet.ip.forwarding=1
```

This enables IP forwarding, allowing the system to act as a router.

However, these changes will be lost after a reboot.

### Persistent Changes

To make changes permanent, add them to `/etc/sysctl.conf`:

```shell
echo "net.inet.ip.forwarding=1" >> /etc/sysctl.conf
```

Then, apply changes using:

```shell
sysctl -f /etc/sysctl.conf
```

## Tuning Performance with `sysctl`

### 1. Optimizing Network Performance

#### Enable TCP Fast Open

```shell
sysctl net.inet.tcp.fastopen.server_enable=1
```

Add to `/etc/sysctl.conf` for persistence:

```shell
net.inet.tcp.fastopen.server_enable=1
```

#### Increase Maximum Socket Buffer Size

```shell
sysctl kern.ipc.maxsockbuf=8388608
```

To make it permanent:

```shell
echo "kern.ipc.maxsockbuf=8388608" >> /etc/sysctl.conf
```

### 2. Improving Memory Management

#### Adjust Swappiness

FreeBSD uses `vm.swap_enabled` instead of the Linux `swappiness` parameter. Enable or disable swap:

```shell
sysctl vm.swap_enabled=1  # Enable swap
sysctl vm.swap_enabled=0  # Disable swap
```

To persist this change:

```shell
echo "vm.swap_enabled=1" >> /etc/sysctl.conf
```

#### Modify Page Caching

```shell
sysctl vm.v_free_min=4096
```

Make it permanent:

```shell
echo "vm.v_free_min=4096" >> /etc/sysctl.conf
```

### 3. Enhancing System Limits

#### Increase Maximum Number of Processes

```shell
sysctl kern.maxproc=50000
```

For persistence:

```shell
echo "kern.maxproc=50000" >> /etc/sysctl.conf
```

#### Raise Open File Limits

```shell
sysctl kern.maxfiles=200000
sysctl kern.maxfilesperproc=100000
```

Persist these settings:

```shell
echo "kern.maxfiles=200000" >> /etc/sysctl.conf
echo "kern.maxfilesperproc=100000" >> /etc/sysctl.conf
```

## Security Hardening with `sysctl`

### 1. Enable ASLR (Address Space Layout Randomization)

```shell
sysctl kern.elf32.aslr.enable=1
sysctl kern.elf64.aslr.enable=1
```

Persist changes:

```shell
echo "kern.elf32.aslr.enable=1" >> /etc/sysctl.conf
echo "kern.elf64.aslr.enable=1" >> /etc/sysctl.conf
```

### 2. Restrict Core Dumps

```shell
sysctl kern.coredump=0
```

Persist the change:

```shell
echo "kern.coredump=0" >> /etc/sysctl.conf
```

### 3. Enable Secure Sysctl Mode

Restrict non-root users from modifying `sysctl` parameters:

```shell
sysctl security.bsd.unprivileged_read_msgbuf=0
sysctl security.bsd.see_other_uids=0
```

Persist the settings:

```shell
echo "security.bsd.unprivileged_read_msgbuf=0" >> /etc/sysctl.conf
echo "security.bsd.see_other_uids=0" >> /etc/sysctl.conf
```

## Best Practices for `sysctl` Tuning

1. **Backup Before Making Changes**: Always backup `/etc/sysctl.conf` before modifying it.
2. **Test Changes Temporarily**: Apply modifications interactively first to avoid system instability.
3. **Document Changes**: Maintain a log of changes to ensure traceability.
4. **Use Incremental Adjustments**: Modify values gradually and monitor system performance.
5. **Monitor with `sysctl`**: Regularly check system parameters to identify potential optimizations.

## Conclusion

Using `sysctl` to tune kernel parameters in FreeBSD is a powerful way to enhance system performance, security, and resource allocation. By understanding how to query, modify, and persist these settings, administrators can fine-tune FreeBSD to meet their specific needs. However, careful testing and documentation are essential to avoid unintended consequences.

By applying the techniques outlined in this guide, you can optimize FreeBSD for better efficiency, responsiveness, and security.
