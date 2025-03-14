---
draft: false
title: How to Check Hardware Details with `pciconf` and `usbconfig` on FreeBSD Operating System
linkTitle: How to Check Hardware Details
translationKey: how-to-check-hardware-details-with-pciconf-and-usbconfig-on-freebsd-operating-system
description: This guide provides an overview of how to use the `pciconf` and `usbconfig` utilities to check hardware details on FreeBSD systems.
url: how-to-check-hardware-details-with-pciconf-and-usbconfig-on-freebsd
date: 2023-03-14
weight: 200
keywords:
  - FreeBSD
  - hardware inspection
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Understanding your system's hardware is a fundamental aspect of system administration. Whether you're diagnosing issues, planning upgrades, or simply trying to understand what components are inside your machine, FreeBSD provides powerful tools to inspect hardware configurations. Two particularly useful utilities are `pciconf` for examining PCI devices and `usbconfig` for inspecting USB devices. This comprehensive guide explores how to use these tools effectively to gather detailed hardware information on FreeBSD systems.

## Understanding Hardware Detection in FreeBSD

FreeBSD follows the Unix philosophy of having specialized tools for specific tasks. Rather than having a single "hardware manager" application, FreeBSD provides various command-line utilities to inspect different aspects of system hardware. For PCI and USB devices, `pciconf` and `usbconfig` are the go-to tools, offering administrators detailed insight into these hardware components.

Before diving into these tools, let's briefly understand how FreeBSD interacts with hardware:

1. During boot, the kernel detects hardware devices and loads appropriate drivers
2. Each device is assigned a driver and device node in the `/dev` directory
3. Information about detected hardware is logged in system messages
4. Tools like `pciconf` and `usbconfig` query the system to provide this information to users

## The `pciconf` Utility

`pciconf` is the primary tool for examining PCI (Peripheral Component Interconnect) devices in FreeBSD. These include components like network cards, sound cards, graphics adapters, and other expansion cards connected to the motherboard's PCI or PCIe slots.

### Basic Usage of `pciconf`

The simplest way to use `pciconf` is to invoke it with the `-lv` options to list all PCI devices with verbose information:

```sh
pciconf -lv
```

This command produces output similar to:

```
hostb0@pci0:0:0:0:      class=0x060000 rev=0x0c hdr=0x00 vendor=0x8086 device=0x5917 subvendor=0x1028 subdevice=0x0810
    vendor     = 'Intel Corporation'
    device     = 'Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers'
    class      = bridge
    subclass   = HOST-PCI
vgapci0@pci0:0:2:0:     class=0x030000 rev=0x06 hdr=0x00 vendor=0x8086 device=0x591b subvendor=0x1028 subdevice=0x0810
    vendor     = 'Intel Corporation'
    device     = 'HD Graphics 630'
    class      = display
    subclass   = VGA
```

This output shows each PCI device with:

- Device identifier (e.g., `hostb0@pci0:0:0:0`)
- Vendor and device IDs in hexadecimal
- Human-readable vendor and device names
- Device class and subclass information

### Understanding `pciconf` Output

Let's break down the elements of a typical `pciconf` entry:

1. **Device identifier**: Shows the device name and its address in the format `device@pci0:bus:device:function`
   - `bus`: Identifies the PCI bus number
   - `device`: The device number on that bus
   - `function`: For multifunction devices, indicates the specific function

2. **Class information**: Indicates the device's general category (e.g., bridge, network, display)

3. **Vendor and device IDs**: Hexadecimal identifiers that uniquely identify the hardware

4. **Revision and header information**: Hardware-specific details about the PCI configuration

### Advanced `pciconf` Options

`pciconf` offers several options for more specific information:

#### List devices with minimal information

```sh
pciconf -l
```

This provides a concise list without the verbose details.

#### Dump raw configuration space

```sh
pciconf -d pci0:0:2:0
```

This displays the raw hexadecimal data from the PCI configuration space for the specified device.

#### Examine a specific device

```sh
pciconf -lv pci0:0:2:0
```

This focuses the verbose output on just the specified device.

#### Access specific configuration registers

```sh
pciconf -r pci0:0:2:0 0x10
```

This reads the value of a specific configuration register (in this case, register 0x10 which typically contains the base address).

### Practical Examples with `pciconf`

#### Identifying Graphics Cards

```sh
pciconf -lv | grep -A 4 "class=0x030000"
```

This command finds devices with class 0x030000 (display controllers) and shows the 4 lines following each match, helping you identify your graphics hardware.

#### Finding Network Interfaces

```sh
pciconf -lv | grep -A 4 "class=0x020000"
```

This locates network interfaces (class 0x020000) and displays their details.

#### Checking for USB Controllers

```sh
pciconf -lv | grep -A 4 "class=0x0c03"
```

This identifies USB controllers in the system.

## The `usbconfig` Utility

While `pciconf` handles PCI devices, `usbconfig` is the specialized tool for inspecting and controlling USB devices. Unlike `pciconf`, which is part of the base system, `usbconfig` might need to be installed if it's not already present:

```sh
pkg install usbconfig
```

Or from ports:

```sh
cd /usr/ports/sysutils/usbconfig
make install clean
```

### Basic Usage of `usbconfig`

To list all USB devices connected to your system:

```sh
usbconfig
```

This produces output similar to:

```
ugen0.1: <Intel EHCI root HUB> at usbus0, cfg=0 md=HOST spd=HIGH(480Mbps) pwr=SAVE (0mA)
ugen0.2: <vendor 0x8087 product 0x0024> at usbus0, cfg=0 md=HOST spd=HIGH(480Mbps) pwr=SAVE (0mA)
ugen1.1: <Intel EHCI root HUB> at usbus1, cfg=0 md=HOST spd=HIGH(480Mbps) pwr=SAVE (0mA)
ugen1.2: <Kingston DataTraveler 3.0> at usbus1, cfg=0 md=HOST spd=HIGH(480Mbps) pwr=ON (500mA)
```

Each line represents a USB device with:

- Device identifier (e.g., `ugen0.1`)
- Vendor and product information
- USB bus information
- Configuration settings
- Speed and power information

### Understanding `usbconfig` Output

The elements of a typical `usbconfig` entry include:

1. **Device identifier**: Shows the USB device name in the format `ugenX.Y`
   - `X`: USB bus number
   - `Y`: Device address on that bus

2. **Device description**: Vendor and product information in angle brackets

3. **Bus information**: Shows which USB bus the device is connected to

4. **Configuration status**: Indicates the current configuration settings

5. **Mode, speed, and power**: Shows the operational mode, connection speed, and power usage

### Advanced `usbconfig` Options

`usbconfig` offers numerous options for detailed inspection and control:

#### Showing detailed device information

```sh
usbconfig -d ugen1.2 dump_device_desc
```

This shows detailed descriptors for the specified device.

#### Displaying configuration details

```sh
usbconfig -d ugen1.2 dump_curr_config_desc
```

This shows the current configuration descriptor.

#### Showing all USB string descriptors

```sh
usbconfig -d ugen1.2 dump_all_desc
```

This dumps all descriptors for the device.

#### Listing USB devices with detailed output

```sh
usbconfig list
```

### Practical Examples with `usbconfig`

#### Identifying USB Storage Devices

```sh
usbconfig | grep -i "mass storage"
```

This helps identify USB flash drives and external hard drives.

#### Checking USB Device Power Usage

```sh
usbconfig | grep -E 'pwr=(ON|SAVE)'
```

This shows power information for connected devices.

#### Resetting a Problematic USB Device

```sh
usbconfig -d ugen1.2 reset
```

This can help troubleshoot USB devices that aren't functioning correctly.

## Combining `pciconf` and `usbconfig` for Comprehensive Hardware Analysis

For a thorough analysis of your system's hardware, you can combine these tools with other FreeBSD utilities.

### Creating a Complete Hardware Inventory Script

Here's a simple shell script that collects comprehensive hardware information:

```sh
#!/bin/sh
# hardware_inventory.sh - Collect FreeBSD hardware information

echo "===== SYSTEM INFORMATION ====="
sysctl hw.model hw.ncpu hw.physmem

echo "\n===== CPU DETAILS ====="
sysctl -a | grep -E 'hw.model|hw.ncpu|hw.machine'

echo "\n===== PCI DEVICES ====="
pciconf -lv

echo "\n===== USB DEVICES ====="
usbconfig

echo "\n===== DISK INFORMATION ====="
camcontrol devlist

echo "\n===== NETWORK INTERFACES ====="
ifconfig -a
```

Save this as `hardware_inventory.sh`, make it executable with `chmod +x hardware_inventory.sh`, and run it to get a complete hardware overview.

## Advanced Hardware Inspection Techniques

### Combining with `devinfo`

The `devinfo` utility provides a hierarchical view of devices in the system:

```sh
devinfo -rv
```

Used alongside `pciconf` and `usbconfig`, it helps understand device relationships.

### Monitoring Hardware Changes with `usbdump`

For USB troubleshooting, `usbdump` can capture USB traffic:

```sh
usbdump -i usbus0
```

This captures USB packets on the specified bus, useful for diagnosing device recognition issues.

### Using `sysctl` for Additional Hardware Information

The `sysctl` command can provide complementary hardware information:

```sh
# CPU information
sysctl hw.model hw.ncpu hw.machine

# Memory information
sysctl hw.physmem hw.usermem hw.realmem

# Device information
sysctl hw.devices
```

## Troubleshooting Hardware Issues

### Identifying Unrecognized Devices

Sometimes you'll see devices in `pciconf` without proper drivers:

```
none0@pci0:1:0:0:      class=0x0c0330 rev=0x00 hdr=0x00 vendor=0x1106 device=0x3483 subvendor=0x1849 subdevice=0x3483
    vendor     = 'VIA Technologies, Inc.'
    device     = 'VL805/806 xHCI USB 3.0 Controller'
    class      = serial bus
    subclass   = USB
```

When a device shows up as `none`, it means FreeBSD doesn't have a driver loaded for it. Solutions include:

1. Check if a driver is available in the FreeBSD ports collection
2. Look for kernel modules that might support the device
3. Check if the device is supported in a newer FreeBSD version

### Dealing with USB Device Recognition Problems

If USB devices aren't recognized properly:

1. Try a different USB port (especially if mixing USB 2.0 and 3.0 devices)
2. Reset the USB controller:

   ```sh
   usbconfig reset
   ```

3. Check system messages for USB errors:

   ```sh
   dmesg | grep -i usb
   ```

### Checking Driver Attachments

To see which driver is attached to a PCI device:

```sh
pciconf -lv | grep -B 3 driver
```

This can help identify devices with problematic drivers.

## Best Practices for Hardware Management

### Keeping Records

Maintain a hardware inventory for each FreeBSD system:

```sh
pciconf -lv > hardware_inventory_$(hostname)_$(date +%Y%m%d).txt
usbconfig >> hardware_inventory_$(hostname)_$(date +%Y%m%d).txt
```

This creates a timestamped record of your hardware configuration.

### Checking Compatibility Before Upgrades

Before adding new hardware:

1. Check hardware compatibility lists
2. Search the FreeBSD forums for others' experiences with the hardware
3. Test the hardware with a live FreeBSD system if possible

### Monitoring Hardware Health

While `pciconf` and `usbconfig` show device presence, use additional tools for health monitoring:

- `smartctl` for disk health
- `sysctl` for temperature readings
- `powerd` for power management

## Conclusion

FreeBSD's `pciconf` and `usbconfig` utilities provide powerful ways to inspect, understand, and troubleshoot your system's hardware. By mastering these tools, system administrators can maintain better awareness of their systems' configurations, diagnose hardware issues more effectively, and make informed decisions about system upgrades and maintenance.

Whether you're setting up a new system, troubleshooting hardware problems, or simply documenting your infrastructure, these utilities offer the detailed insights needed to manage FreeBSD systems effectively. Combined with other FreeBSD diagnostic tools, they form the foundation of comprehensive hardware management on this robust operating system.

Remember that hardware inspection is not just about solving problems—it's also about building knowledge of your systems that helps prevent issues before they occur. Regular hardware inventory checks using these tools should be part of every FreeBSD administrator's maintenance routine.
