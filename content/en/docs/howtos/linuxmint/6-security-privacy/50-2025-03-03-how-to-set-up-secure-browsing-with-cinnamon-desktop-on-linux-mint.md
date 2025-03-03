---
draft: false
title: How to Set Up Secure Browsing with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Secure Browsing
translationKey: how-to-set-up-secure-browsing-with-cinnamon-desktop-on-linux-mint
description: Learn how to set up secure browsing on Linux Mint with the Cinnamon Desktop.
url: how-to-set-up-secure-browsing-with-cinnamon-desktop-on-linux-mint
weight: 50
date: 2025-03-03
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - secure browsing
featured_image: /images/linuxmint1.webp
---
Linux Mint is one of the most popular Linux distributions, known for its user-friendly interface and robust security features. The Cinnamon Desktop environment enhances this experience with a sleek design and smooth performance. However, securing your online browsing experience is essential to protect your personal information and maintain privacy. In this guide, we'll walk you through how to set up secure browsing on Linux Mint with the Cinnamon Desktop.

## 1. **Keep Your System Updated**

Before diving into browser-specific security settings, ensure your Linux Mint system is up to date. Security patches and updates help protect against vulnerabilities and malware.

### **Steps to Update Your System:**

1. Open the Terminal (Press `Ctrl + Alt + T`)
2. Run the following commands:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

3. Reboot your system if required:

   ```bash
   sudo reboot
   ```

Keeping your system updated ensures that your web browser and security settings remain in sync with the latest security patches.

## 2. **Choose a Secure Web Browser**

Linux Mint comes with Mozilla Firefox as the default browser, which is a solid choice for security and privacy. However, there are other alternatives, each with its own strengths:

- **Mozilla Firefox** (Recommended): Strong privacy features, supports numerous security extensions.
- **Brave Browser**: Built-in ad-blocker and tracker blocker.
- **Tor Browser**: Best for anonymity but slower performance.
- **Chromium**: Open-source version of Chrome with improved privacy settings.

### **Installing a Secure Browser**

If you want to install an additional browser like Brave or Tor, use the following commands:

- **Brave Browser**

  ```bash
  sudo apt install brave-browser
  ```

- **Tor Browser**

  ```bash
  sudo apt install torbrowser-launcher
  ```

## 3. **Harden Browser Security Settings**

Once you have chosen your browser, configure its security settings for optimal protection.

### **Mozilla Firefox Security Settings**

1. **Enable Enhanced Tracking Protection**

   - Open Firefox and go to `Settings > Privacy & Security`.
   - Set `Enhanced Tracking Protection` to `Strict`.

2. **Disable Telemetry**

   - In `Settings > Privacy & Security`, scroll down to `Firefox Data Collection and Use` and uncheck all options.

3. **Use Secure DNS Over HTTPS**

   - Go to `Settings > General > Network Settings`.
   - Click `Settings` and enable `Enable DNS over HTTPS`.
   - Choose a trusted provider such as Cloudflare or NextDNS.

### **Brave Browser Security Settings**

1. **Enable Shields**

   - Open `Settings > Shields` and turn on features like ad-blocking, script blocking, and fingerprinting protection.

2. **Use Secure DNS**

   - Go to `Settings > Privacy and Security > Security` and enable `Use secure DNS`.

## 4. **Install Privacy-Focused Extensions**

Adding security extensions enhances protection against trackers, malware, and unwanted ads.

### **Recommended Browser Extensions:**

- **uBlock Origin**: Blocks ads and trackers efficiently.
- **HTTPS Everywhere**: Forces websites to use encrypted HTTPS connections.
- **Privacy Badger**: Automatically learns and blocks trackers.
- **NoScript** (Firefox only): Blocks JavaScript execution on unknown sites.
- **Cookie AutoDelete**: Deletes cookies when you close a tab.

To install these extensions in Firefox:

1. Open Firefox and go to `Add-ons` (`about:addons`).
2. Search for the desired extension and install it.

For Brave and Chromium-based browsers:

1. Open the Chrome Web Store.
2. Search for the extension and install it.

## 5. **Use a Secure and Private Search Engine**

Most mainstream search engines, like Google, track and profile users. Consider switching to a privacy-focused search engine:

- **DuckDuckGo**: No tracking and good search results.
- **Startpage**: Google results without tracking.
- **Qwant**: EU-based with strong privacy laws.

To set a private search engine in Firefox:

1. Go to `Settings > Search`.
2. Under `Default Search Engine`, choose `DuckDuckGo` or another secure alternative.

For Brave and Chromium:

1. Go to `Settings > Search Engine`.
2. Select a private search engine from the list.

## 6. **Enable a Firewall and Configure Network Security**

A firewall adds an extra layer of protection by controlling incoming and outgoing connections.

### **Enable UFW (Uncomplicated Firewall)**

1. Open the Terminal (`Ctrl + Alt + T`).
2. Enable the firewall:

   ```bash
   sudo ufw enable
   ```

3. Check the firewall status:

   ```bash
   sudo ufw status
   ```

4. To allow only necessary connections, you can configure rules, such as:

   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   ```

## 7. **Use a VPN for Secure Browsing**

A Virtual Private Network (VPN) encrypts your internet traffic, preventing ISPs and attackers from snooping on your activities.

### **Recommended VPN Services:**

- ProtonVPN (Free and Paid)
- Mullvad (Strong privacy focus)
- ExpressVPN (Premium option)

### **Installing ProtonVPN on Linux Mint**

1. Install ProtonVPN CLI:

   ```bash
   sudo apt install protonvpn-cli
   ```

2. Log in and connect:

   ```bash
   protonvpn connect
   ```

## 8. **Enable AppArmor for Extra Protection**

AppArmor helps limit the capabilities of applications, including browsers, reducing the impact of potential security breaches.

### **Enable and Configure AppArmor**

1. Check AppArmor status:

   ```bash
   sudo aa-status
   ```

2. If not active, enable it:

   ```bash
   sudo systemctl enable apparmor
   sudo systemctl start apparmor
   ```

## 9. **Regularly Clear Cache and Cookies**

Cookies and cached data can track your online behavior. Configure your browser to clear them regularly:

- In **Firefox**, go to `Settings > Privacy & Security`, under `Cookies and Site Data`, enable `Delete cookies and site data when Firefox is closed`.
- In **Brave**, go to `Settings > Privacy and Security > Clear Browsing Data` and set automatic deletion preferences.

## Conclusion

By following these steps, you can significantly improve your online security while using Linux Mint with the Cinnamon Desktop. Keeping your system updated, using a secure browser, installing privacy-focused extensions, enabling a firewall, and using a VPN are essential measures. By implementing these security best practices, you can enjoy a safer and more private browsing experience on Linux Mint.

Would you like additional recommendations on advanced security setups? Let us know in the comments!
