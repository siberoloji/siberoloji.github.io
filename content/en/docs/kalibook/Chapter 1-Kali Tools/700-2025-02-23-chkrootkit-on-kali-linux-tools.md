---
draft: false
title: chkrootkit on Kali Linux Tools
linkTitle: chkrootkit
translationKey: chkrootkit-on-kali-linux-tools
weight: 700
description: Learn how to use chkrootkit on Kali Linux to detect rootkits, backdoors, and other malicious software. Explore its features, installation, usage, and best practices.
date: 2025-02-23
url: chkrootkit-on-kali-linux-tools
tags:
  - kali tools
categories:
  - Kali linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords: 
  - chkrootkit
  - kali tools
featured_image: /images/kalilinux2.webp
---
## Introduction

Kali Linux is widely regarded as the go-to operating system for penetration testers and cybersecurity professionals. It comes preloaded with a variety of security tools, one of which is **chkrootkit**—a tool designed to detect rootkits on a Unix-based system. Rootkits are malicious software designed to gain unauthorized access to a system while remaining hidden from detection tools.

In this post, we will explore **chkrootkit** in detail, covering its features, installation, usage, and best practices for scanning and removing rootkits in Kali Linux.

## What is chkrootkit?

**chkrootkit** (Check Rootkit) is a security scanner designed to detect known rootkits, backdoors, and other malicious software on a system. It scans various system binaries and configurations to look for signs of rootkit infections. The tool was originally developed by Nelson Murilo and Klaus Steding-Jessen and remains one of the most commonly used rootkit detection tools in Unix-based environments.

### Key Features of chkrootkit

- Scans for a wide variety of rootkits and malicious files.
- Detects hidden processes and suspicious network connections.
- Checks system binaries for modifications.
- Lightweight and easy to use.
- Open-source and actively maintained.

## Installing chkrootkit on Kali Linux

Although **chkrootkit** is included in Kali Linux by default, you may need to install or update it to ensure you have the latest version.

To install chkrootkit, use the following command:

```bash
sudo apt update && sudo apt install chkrootkit -y
```

To verify that chkrootkit has been installed, run:

```bash
chkrootkit -V
```

This should return the installed version of chkrootkit.

## How to Use chkrootkit

Once chkrootkit is installed, you can use it to scan your system for rootkits. Below are the main commands and options for using chkrootkit effectively.

### Running a Basic Scan

To perform a basic rootkit scan, use:

```bash
sudo chkrootkit
```

This command will check for known rootkits and display the results in the terminal.

### Checking for Specific Rootkits

You can specify a particular rootkit test by using:

```bash
sudo chkrootkit <test-name>
```

For example, to check for the **Suckit** rootkit:

```bash
sudo chkrootkit suckit
```

### Running chkrootkit in Quiet Mode

If you want to filter the results and only show suspicious entries, use:

```bash
sudo chkrootkit -q
```

### Scanning Specific Directories

By default, chkrootkit scans the entire system. However, you can specify a particular directory to scan:

```bash
sudo chkrootkit -r /path/to/directory
```

## Understanding chkrootkit Output

After a scan, chkrootkit provides an output indicating whether potential rootkits have been detected. Here’s how to interpret the results:

- **"Nothing found" or "not infected"** – No threats were detected.
- **"INFECTED"** – A potential rootkit or suspicious file was found.
- **"not tested"** – This indicates that chkrootkit did not perform a check for a particular rootkit.

### False Positives

It is important to note that chkrootkit sometimes reports **false positives**. If chkrootkit flags a file as infected, manually verify it before taking any action. You can:

- Compare the file hash with a known safe version.
- Use other security tools like **rkhunter** to cross-check the results.
- Analyze system logs for any unusual activity.

## What to Do If a Rootkit is Found

If chkrootkit detects a rootkit, follow these steps:

### 1. Confirm the Infection

Use another tool such as **rkhunter** (Rootkit Hunter) to cross-check the findings:

```bash
sudo apt install rkhunter -y
sudo rkhunter --check
```

### 2. Investigate Suspicious Activity

Check logs for unusual activity:

```bash
sudo cat /var/log/auth.log | grep "root"
```

Look for unauthorized login attempts or unexpected changes in system files.

### 3. Remove the Rootkit

Removing a rootkit is challenging because they often hide deep within the system. Some general removal methods include:

- **Manually deleting infected files** (if safe to do so).
- **Restoring from a clean backup** (recommended if possible).
- **Reinstalling the OS** (in case of severe infection).

### 4. Prevent Future Infections

- Keep your system updated: `sudo apt update && sudo apt upgrade -y`
- Use a firewall to limit network access.
- Regularly scan your system using chkrootkit and other security tools.
- Avoid running untrusted scripts or software.

## chkrootkit vs. Other Rootkit Detection Tools

chkrootkit is just one of several rootkit detection tools available for Kali Linux. Here’s how it compares to other similar tools:

| Tool | Features | Pros | Cons |
|------|---------|------|------|
| **chkrootkit** | Scans system binaries, network connections, and hidden processes | Lightweight, easy to use, open-source | Can produce false positives |
| **rkhunter** | Compares file hashes, scans for malware signatures | More detailed checks, logs reports | Slower than chkrootkit |
| **Lynis** | Performs security auditing, including rootkit checks | Comprehensive security auditing | Not just a rootkit scanner |

For the best security, use **multiple tools** together to verify results.

## Conclusion

chkrootkit is a powerful tool for detecting rootkits on Kali Linux. While it provides valuable insights into potential infections, it is not foolproof. Regular scanning, combined with other security measures like **rkhunter, Lynis, and manual log inspection**, ensures a more robust defense against rootkits.

By understanding how to use chkrootkit effectively, analyzing its results, and taking proactive steps to secure your system, you can significantly reduce the risk of rootkit infections. Always stay vigilant, keep your software up to date, and maintain secure practices to protect your system from threats.

Do you use chkrootkit regularly? Share your experiences and tips in the comments below!
