---
draft: false
title: How to Manage File Extensions with Cinnamon Desktop on Linux Mint
linkTitle: Manage File Extensions
translationKey: how-to-manage-file-extensions-with-cinnamon-desktop-on-linux-mint
description: A guide on how to manage file extensions in Linux Mint using the Cinnamon desktop environment. Learn how to view, change, and rename file extensions, handle unknown file types, and more.
url: how-to-manage-file-extensions-with-cinnamon-desktop-on-linux-mint
weight: 240
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - file extensions
featured_image: /images/linuxmint1.webp
---
Linux Mint is one of the most popular Linux distributions, known for its user-friendly interface and reliability. The Cinnamon desktop environment, which is the default for Linux Mint, provides an intuitive way to manage files, including their extensions. File extensions help the operating system and applications recognize file types and determine how to open or execute them. In this guide, we’ll explore how to manage file extensions in Linux Mint using the Cinnamon desktop environment.

---

### **What Are File Extensions and Why Do They Matter?**

A file extension is a set of characters at the end of a filename, typically after a period (`.`). It identifies the file format and determines which application should be used to open it. Some common file extensions include:

- `.txt` – Text file
- `.jpg` – JPEG image
- `.png` – PNG image
- `.mp3` – Audio file
- `.mp4` – Video file
- `.pdf` – Portable Document Format

In Linux Mint, file extensions are important, but the system also relies on **MIME types** and file headers to determine file types, rather than just the extension.

---

### **1. Viewing File Extensions in Cinnamon Desktop**

By default, Cinnamon does not always show file extensions in the **File Manager (Nemo)**. To ensure you can see file extensions:

1. **Open Nemo (File Manager)**: Click on the **Files** icon from the taskbar or press `Super + E` (Windows key + E).
2. **Enable Extensions**:
   - Click on **View** in the menu bar.
   - Check **Show Hidden Files** (or press `Ctrl + H`).
   - Make sure **Show Text in Icons** is enabled so filenames (including extensions) are fully visible.

If file extensions are still hidden, ensure that **Preferences > Display** has **"Show file extensions"** enabled.

---

### **2. Changing File Associations (Default Applications)**

Sometimes, you may want a particular file type to open with a different application. Here’s how to change the default application for a specific file type:

1. **Right-click the file** and select **Properties**.
2. Go to the **Open With** tab.
3. Select the application you want to use.
4. Click **Set as Default** to make it the new default for all files with that extension.

Alternatively, if you want more control over MIME types, you can use the **xdg-mime** command:

```bash
xdg-mime default vlc.desktop video/mp4
```

This command sets VLC Media Player as the default application for MP4 video files.

---

### **3. Renaming File Extensions**

Sometimes, you may need to change a file's extension manually. You can do this in several ways:

#### **Using the File Manager (Nemo)**

1. Locate the file whose extension you want to change.
2. Right-click and choose **Rename**.
3. Modify the extension, e.g., change `file.txt` to `file.md`.
4. Press **Enter**, and confirm if prompted.

#### **Using the Terminal**

For renaming files via the command line, use the `mv` command:

```bash
mv oldfile.txt newfile.md
```

If you want to change the extensions of multiple files in a directory, use:

```bash
rename 's/\.txt$/\.md/' *.txt
```

This changes all `.txt` files in the current directory to `.md`.

---

### **4. Handling Unknown or Misidentified File Extensions**

Sometimes, a file may not have an extension or may be misidentified. To determine its actual type:

1. **Use the `file` command**:

   ```bash
   file unknownfile
   ```

   Example output:

   ```
   unknownfile: PNG image data, 800 x 600, 8-bit/color RGBA, non-interlaced
   ```

2. **Check MIME type**:

   ```bash
   xdg-mime query filetype unknownfile
   ```

If the file is wrongly identified, you can manually rename it with the appropriate extension.

---

### **5. Forcing Files to Open with a Specific Application**

If a file is not opening in the desired application, you can explicitly run it with the preferred software:

```bash
xdg-open file.pdf
```

or

```bash
libreoffice file.docx
```

For graphical use, right-click the file, select **Open With**, and choose the desired application.

---

### **6. Creating Custom File Associations**

If you have a file type not associated with any application, you can manually set its default program:

1. **Open the MIME database file**:

   ```bash
   nano ~/.config/mimeapps.list
   ```

2. Locate the MIME type you want to modify, e.g.,

   ```
   text/plain=gedit.desktop
   ```

   Change `gedit.desktop` to your preferred text editor, such as `xed.desktop` for Linux Mint’s default text editor.
3. Save and close the file (`Ctrl + X`, then `Y` and `Enter`).

---

### **7. Managing File Extensions Using GUI Tools**

Besides using the terminal, Linux Mint provides GUI tools to manage file types:

- **Nemo’s Properties Menu**: Right-click a file and check its properties.
- **MIME Type Editor** (`mimetype-editor`): Allows managing file associations.
- **Menulibre** (`sudo apt install menulibre`): Useful for editing desktop entries.

---

### **8. Dealing with Executable Extensions (.sh, .desktop, .AppImage)**

Executable files like `.sh` (shell scripts) and `.desktop` files require execution permissions:

1. **Grant Execution Permission**:

   ```bash
   chmod +x script.sh
   ```

2. **Run the Script**:

   ```bash
   ./script.sh
   ```

3. **For .desktop Files**:
   - Right-click the `.desktop` file > **Properties** > **Permissions**.
   - Enable **Allow executing file as program**.

For AppImage files:

```bash
chmod +x appimage.AppImage
./appimage.AppImage
```

---

### **9. Removing or Adding File Extensions in Bulk**

To remove file extensions:

```bash
rename 's/\.bak$//' *.bak
```

To add `.txt` extensions to all files:

```bash
rename 's/$/\.txt/' *
```

---

### **10. Using File Managers Other than Nemo**

If you use another file manager like **Thunar** or **Dolphin**, the process of managing file extensions is similar, but the settings may be in different locations.

---

## **Conclusion**

Managing file extensions in Linux Mint with Cinnamon is straightforward, thanks to its user-friendly interface and powerful terminal commands. Whether you're renaming files, changing default applications, or dealing with missing extensions, Cinnamon provides multiple ways to handle file extensions efficiently. By following this guide, you can take full control over file types and their associated applications on your Linux Mint system.

---

### **Frequently Asked Questions (FAQs)**

#### **1. Can I hide file extensions in Linux Mint?**

Yes, you can hide file extensions by disabling "Show file extensions" in Nemo's preferences, but it's generally not recommended.

#### **2. Why can't I rename a file extension?**

Some files may have restricted permissions. Try using `sudo mv filename.old filename.new` in the terminal.

#### **3. How do I reset file associations in Cinnamon?**

Delete the MIME settings:

```bash
rm ~/.config/mimeapps.list
```

Then log out and log back in.

#### **4. Are file extensions case-sensitive in Linux?**

Yes, `file.TXT` and `file.txt` are treated as different files.

#### **5. Can I change multiple file extensions at once?**

Yes, using the `rename` command:

```bash
rename 's/\.oldext$/\.newext/' *.oldext
```

#### **6. What if a file has no extension?**

You can determine its type using `file unknownfile` and manually rename it if necessary.

By mastering these file management techniques, you can improve your workflow and make better use of Linux Mint’s powerful file-handling capabilities! 🚀
