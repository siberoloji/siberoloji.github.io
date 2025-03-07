---
draft: false
title: How to Dual-Boot FreeBSD with Windows Using GRUB on FreeBSD Operating System
linkTitle: How to Dual-Boot FreeBSD
translationKey: how-to-dual-boot-freebsd-with-windows-using-grub-on-freebsd-operating-system
description: This guide walks you through the step-by-step process of setting up a dual-boot system with FreeBSD and Windows using GRUB as the bootloader.
url: how-to-dual-boot-freebsd-with-windows-using-grub-on-freebsd-operating-system
date: 2025-02-26
weight: 30
keywords:
  - FreeBSD
  - dual-boot
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---
Dual-booting FreeBSD and Windows is an excellent way to leverage the strengths of both operating systems. Windows provides a familiar environment for general computing, gaming, and commercial software, while FreeBSD offers a powerful, Unix-like system with a reputation for security, performance, and stability. By using **GRUB (Grand Unified Bootloader)**, you can effectively manage multiple operating systems on a single machine.  

In this guide, we will walk you through the **step-by-step process** of setting up a dual-boot system with **FreeBSD and Windows** using **GRUB** as the bootloader.  

## **Prerequisites**  

Before proceeding, ensure that you have:  

- A computer with **Windows** already installed or planned for installation.  
- A **FreeBSD installation ISO** (downloadable from [FreeBSD.org](https://www.freebsd.org/)).  
- A bootable USB drive or DVD for FreeBSD installation.  
- Basic knowledge of partitioning and disk management.  
- **GRUB bootloader** (to be installed on FreeBSD).  

---

## **Step 1: Install Windows (If Not Already Installed)**  

Windows should be installed **before FreeBSD** because it tends to overwrite the bootloader during installation.  

1. **Create a Bootable Windows USB/DVD:**  
   - Use **Rufus** (Windows) or **dd command** (Linux) to create a bootable USB.  
   - Boot from the USB and install Windows as usual.  
   - Ensure that Windows is installed in either **MBR (BIOS Mode)** or **GPT (UEFI Mode)**.  

2. **Check Windows Partitioning Scheme:**  
   - Open **Disk Management** (`diskmgmt.msc` in Windows).  
   - Identify the partitions. Ensure you leave **unallocated space** for FreeBSD installation.  

---

## **Step 2: Install FreeBSD**  

1. **Create a Bootable FreeBSD USB/DVD:**  
   - Use **dd** or **Rufus** to write the FreeBSD ISO onto a USB stick.  

2. **Boot from the FreeBSD Installer:**  
   - Restart your computer and boot from the USB/DVD.  
   - Select the **Install FreeBSD** option.  

3. **Partition the Disk for FreeBSD:**  
   - Use the **Guided Disk Setup** and choose **Manual Partitioning**.  
   - Create at least two partitions:  
     - `/` (root) – Recommended **20GB or more**.  
     - Swap – Recommended **2-4GB** (or equal to your RAM).  
   - Choose **UFS** or **ZFS** as your filesystem.  
   - Do **NOT** install the FreeBSD bootloader, as GRUB will be used instead.  

4. **Complete the Installation:**  
   - Set the root password and create a user account.  
   - Install additional software if needed.  
   - Reboot into FreeBSD.  

---

## **Step 3: Install and Configure GRUB on FreeBSD**  

Since we did not install the FreeBSD bootloader, we will now install **GRUB** and configure it to recognize both Windows and FreeBSD.  

### **1. Install GRUB**  

Log into FreeBSD and install **GRUB** using the package manager:  

```sh
pkg install grub2
```

Or if you are using **ports**:  

```sh
cd /usr/ports/sysutils/grub2
make install clean
```

### **2. Install GRUB to the Disk**  

If you are using **MBR (Legacy BIOS mode)**:  

```sh
grub-install --target=i386-pc /dev/ada0
```

If you are using **UEFI mode**:  

```sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

Replace `/dev/ada0` with the correct disk identifier.  

### **3. Generate GRUB Configuration**  

After installing GRUB, generate the GRUB configuration file:  

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

---

## **Step 4: Configure GRUB to Dual Boot FreeBSD and Windows**  

Edit the **GRUB configuration file**:  

```sh
nano /boot/grub/grub.cfg
```

### **Add FreeBSD Entry**  

Find the `menuentry` section and add the following lines:  

```sh
menuentry "FreeBSD" {
    insmod ufs2
    set root='(hd0,2)'
    chainloader +1
}
```

Change `(hd0,2)` to match your **FreeBSD partition**.  

### **Add Windows Entry**  

For Windows, add:  

```sh
menuentry "Windows 10" {
    insmod ntfs
    set root='(hd0,1)'
    chainloader +1
}
```

Again, ensure `(hd0,1)` corresponds to the **Windows partition**.  

Save and exit the file (`CTRL + X`, then `Y`, then `Enter`).  

---

## **Step 5: Set GRUB as the Default Bootloader**  

To ensure GRUB loads on boot, update the FreeBSD bootloader settings:  

```sh
echo 'GRUB_ENABLE_BLSCFG=true' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
```

Finally, reboot the system:  

```sh
reboot
```

---

## **Step 6: Verify Dual Boot Functionality**  

1. Upon restarting, you should see the **GRUB menu**.  
2. Select **Windows 10** to boot into Windows.  
3. Select **FreeBSD** to boot into FreeBSD.  
4. If Windows fails to boot, check if **Fast Boot** is enabled in BIOS and disable it.  

---

## **Troubleshooting Tips**  

### **1. GRUB Doesn’t Show Up?**  

- Boot into FreeBSD using a live USB and reinstall GRUB:  

```sh
grub-install --target=i386-pc /dev/ada0
grub-mkconfig -o /boot/grub/grub.cfg
```

### **2. Windows Boot Manager Overwrites GRUB?**  

- Boot into FreeBSD and **reinstall GRUB** using the same steps above.  
- Disable **Secure Boot** and **Fast Startup** in Windows.  

### **3. Incorrect Partition Numbers?**  

- Use `ls (hd0,msdosX)/` in the GRUB command line (`c` key) to find the correct partition.  

---

## **Conclusion**  

By following these steps, you have successfully **set up a dual-boot system with FreeBSD and Windows using GRUB**. This configuration allows you to leverage the benefits of both operating systems while maintaining a flexible and efficient boot management system.  

If you run into issues, FreeBSD’s official handbook and community forums are great resources for troubleshooting.  

---

### **FAQs**  

#### **1. Can I use FreeBSD’s bootloader instead of GRUB?**  

Yes, FreeBSD has its own bootloader (`boot0cfg`), but GRUB provides more flexibility when managing multiple OS installations.  

#### **2. How do I update GRUB if I install another OS?**  

Run the following command in FreeBSD:  

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

#### **3. What if I don’t see Windows in GRUB?**  

Ensure the Windows partition is correctly detected using:  

```sh
lsblk
```

Manually add the Windows entry in `/boot/grub/grub.cfg`.  

#### **4. Can I install FreeBSD and Windows on separate drives?**  

Yes, but you may need to configure GRUB to detect both disks by specifying their paths correctly.  

#### **5. What happens if Windows updates break GRUB?**  

Simply boot into a FreeBSD live USB and **reinstall GRUB**.  

#### **6. Is dual-booting FreeBSD and Windows safe?**  

Yes, as long as you partition your disk correctly and avoid formatting the wrong partitions.  

---

By following this guide, you now have a robust dual-boot system with **FreeBSD and Windows managed via GRUB**. Enjoy your new setup! 🚀
