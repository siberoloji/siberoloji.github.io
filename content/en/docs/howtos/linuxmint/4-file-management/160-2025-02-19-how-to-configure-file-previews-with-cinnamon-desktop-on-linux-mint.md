---
draft: false
title: How to Configure File Previews with Cinnamon Desktop on Linux Mint
linkTitle: Configure File Previews with Cinnamon Desktop on Linux Mint
translationKey: how-to-configure-file-previews-with-cinnamon-desktop-on-linux-mint
description: Learn how to enable, disable, and customize file previews in the Cinnamon desktop environment on Linux Mint using the Nemo file manager.
url: how-to-configure-file-previews-with-cinnamon-desktop-on-linux-mint
weight: 160
date: 2025-02-19T00:00:00Z
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - how-to guides
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
featured_image: /images/linuxmint1.webp
---
Linux Mint, one of the most user-friendly Linux distributions, comes with the Cinnamon desktop environment by default. One of the useful features of Cinnamon’s **Nemo file manager** is its ability to display **file previews** for images, videos, text files, and documents. If you want to enable, disable, or customize file previews in Cinnamon, this guide will walk you through the process step by step.  

---

## **Why Configure File Previews in Cinnamon?**  

File previews in Nemo enhance usability by allowing users to get a **quick glance at file contents** without opening them. However, depending on your system's performance or personal preferences, you might want to:  

- Enable or disable specific preview types (images, videos, PDFs, etc.).  
- Adjust the file size limit for previews.  
- Optimize performance on low-end hardware.  
- Troubleshoot preview issues if they are not working correctly.  

---

## **Step-by-Step Guide to Configuring File Previews in Cinnamon**  

### **Step 1: Open Nemo File Manager Preferences**  

To begin customizing file previews in Linux Mint Cinnamon:  

1. **Launch Nemo File Manager**: Click on the **Files** icon in the taskbar or open Nemo from the application menu.  
2. **Access Preferences**: Click on **Edit** in the menu bar and select **Preferences**.  
3. Navigate to the **Preview** tab to find settings related to file previews.  

---

### **Step 2: Configure Preview Settings**  

The **Preview** tab contains several customization options:  

#### **1. Show Thumbnails for Files**  

This setting controls when thumbnails (previews) are generated for files. You will see the following options:  

- **Always**: Enables previews for all supported files.  
- **Local Files Only**: Shows previews for files stored on your computer but not on remote drives.  
- **Never**: Disables previews entirely.  

If you want to speed up Nemo or conserve system resources, setting it to **Local Files Only** or **Never** is recommended.  

#### **2. Preview Text Files**  

This option allows you to see the content of **text-based files** (like `.txt`, `.md`, `.log`) within Nemo. The choices are:  

- **Always**  
- **Local Files Only**  
- **Never**  

If you work with a lot of text files, enabling previews can be useful. However, if you have large files, previews might slow down navigation.  

#### **3. Preview Sound Files**  

Nemo can generate waveforms (visual representations of audio) for supported sound files. You can enable or disable this feature using the same three options:  

- **Always**  
- **Local Files Only**  
- **Never**  

If you have a large music collection, disabling this option might speed up file browsing.  

#### **4. Preview Image Files**  

By default, image previews are enabled. However, you can modify how Nemo generates these thumbnails:  

- **Choose thumbnail size**: Small, Medium, Large, or Extra Large.  
- **Limit previews to a maximum file size** (e.g., do not generate thumbnails for images larger than 10MB).  

For optimal performance, it is advisable to **set a reasonable size limit** (e.g., 5MB) to prevent slowdowns.  

#### **5. Preview Video Files**  

Nemo supports video file previews by displaying a **thumbnail from the video**. You can customize this setting just like image files. If you experience lag, disable video previews.  

#### **6. Preview PDF and Other Documents**  

For PDFs and office documents, thumbnails can be useful, but they may take additional processing power. If you have many large documents, consider limiting previews.  

#### **7. Configure Cache for Thumbnails**  

Nemo stores thumbnails in a **cache folder** to speed up file browsing. You can:  

- **Keep thumbnails forever**  
- **Automatically clean up old thumbnails**  
- **Disable thumbnail caching entirely**  

If disk space is a concern, setting it to **auto-clean** is recommended.  

---

## **Step 3: Apply Changes and Restart Nemo**  

Once you’ve configured the preview settings:  

1. **Click Close** to exit the preferences window.  
2. Restart Nemo to apply the changes by running the following command in the terminal:  

   ```bash
   nemo --quit && nemo &
   ```  

3. Browse your files again to see if the changes took effect.  

---

## **Advanced Tweaks for File Previews in Cinnamon**  

### **Manually Clear Thumbnail Cache**  

If thumbnails are not updating correctly or take up too much space, clear the cache manually:  

```bash
rm -rf ~/.cache/thumbnails/*
```

This will remove all stored thumbnails, forcing Nemo to regenerate them.  

### **Enable or Disable Previews for Specific File Types**  

If you want more granular control over which file types get previews, you may need to edit the **MIME type associations** in `~/.local/share/mime/`.  

### **Increase or Decrease Thumbnail Quality**  

For better-looking thumbnails, you can modify the thumbnailer settings:  

1. Open the `~/.config/thumbnailrc` file (create it if it doesn’t exist).  
2. Add the following lines to adjust quality settings:  

   ```ini
   [Thumbnailer Settings]
   ThumbnailSize=256
   MaxFileSize=10485760
   ```

   This increases thumbnail size to **256px** and limits previews to **10MB** files.  

---

## **Troubleshooting Nemo Previews Not Working**  

If file previews are not appearing as expected, try these fixes:  

### **1. Ensure Thumbnail Generation is Enabled**  

Go to **Nemo Preferences > Preview** and make sure preview settings are **not set to "Never"**.  

### **2. Check for Missing Thumbnailers**  

Some file types require additional packages for previews. If PDFs or videos don’t generate thumbnails, install missing dependencies:  

```bash
sudo apt install ffmpegthumbnailer gnome-sushi tumbler
```

### **3. Reset Nemo Settings**  

If previews still don’t work, reset Nemo settings with:  

```bash
rm -rf ~/.config/nemo
```

Then restart Nemo.  

---

## **Conclusion**  

Configuring file previews in Cinnamon's Nemo file manager is a straightforward process that can significantly enhance your Linux Mint experience. Whether you want to enable thumbnails for all files, optimize performance by restricting previews, or troubleshoot missing thumbnails, this guide provides everything you need.  

By adjusting the **Preview settings**, managing **thumbnail cache**, and installing necessary **dependencies**, you can ensure that file previews work exactly how you want them to. Happy file browsing on Linux Mint! 🚀  

---

### **Frequently Asked Questions (FAQs)**  

#### **1. Why are my file previews not showing in Nemo?**  

Ensure that previews are enabled in **Edit > Preferences > Preview** and install missing thumbnailers using:  

```bash
sudo apt install ffmpegthumbnailer tumbler
```

#### **2. How do I disable file previews to improve performance?**  

Set all preview options to **Never** in Nemo Preferences under the **Preview** tab.  

#### **3. Can I enable thumbnails for remote files?**  

Yes, but set "Show Thumbnails" to **Always** instead of "Local Files Only." Keep in mind that this may slow down browsing.  

#### **4. How do I clear old thumbnails in Linux Mint?**  

Run the following command in the terminal:  

```bash
rm -rf ~/.cache/thumbnails/*
```

#### **5. Can I set different preview sizes for different file types?**  

No, Nemo applies the same thumbnail size settings globally, but you can adjust **Thumbnail Size** under Preferences.  

#### **6. What should I do if PDF previews are not working?**  

Install `tumbler` to enable document previews:  

```bash
sudo apt install tumbler
```
