---
title: How to Add Additional Repositories on AlmaLinux
description: This article walks you through the steps to add, configure, and manage repositories on AlmaLinux.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Additional Repositories
type: docs
prev: null
next: null
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 70
toc: true
keywords:
  - AlmaLinux
  - Repositories on AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
url: add-additional-repositories-almalinux
---
AlmaLinux is a popular open-source Linux distribution designed to fill the gap left by CentOS after its shift to CentOS Stream. Its robust, enterprise-grade stability makes it a favorite for servers and production environments. However, the base repositories may not include every software package or the latest versions of specific applications you need.  

To address this, AlmaLinux allows you to add additional repositories, which can provide access to a broader range of software. This article walks you through the steps to add, configure, and manage repositories on AlmaLinux.

---

### **What Are Repositories in Linux?**

Repositories are storage locations where software packages are stored and managed. AlmaLinux uses the YUM and DNF package managers to interact with these repositories, enabling users to search, install, update, and manage software effortlessly.  

There are three main types of repositories:  

1. **Base Repositories**: Officially provided by AlmaLinux, containing the core packages.  
2. **Third-Party Repositories**: Maintained by external communities or organizations, offering specialized software.  
3. **Custom Repositories**: Created by users or organizations to host proprietary or internally developed packages.  

Adding additional repositories can be helpful for:  

- Accessing newer versions of software.  
- Installing applications not available in the base repositories.  
- Accessing third-party or proprietary tools.  

---

### **Preparation Before Adding Repositories**  

Before diving into repository management, take these preparatory steps:  

#### 1. **Ensure System Updates**  

Update your system to minimize compatibility issues:  

```bash  
sudo dnf update -y  
```  

#### 2. **Verify AlmaLinux Version**  

Check your AlmaLinux version to ensure compatibility with repository configurations:  

```bash  
cat /etc/os-release  
```  

#### 3. **Install Essential Tools**  

Ensure you have tools like `dnf-plugins-core` installed:  

```bash  
sudo dnf install dnf-plugins-core -y  
```  

---

### **Adding Additional Repositories on AlmaLinux**

#### **1. Enabling Official Repositories**  

AlmaLinux comes with built-in repositories that may be disabled by default. You can enable them using the following command:  

```bash  
sudo dnf config-manager --set-enabled <repository-name>  
```  

For example, to enable the `PowerTools` repository:  

```bash  
sudo dnf config-manager --set-enabled powertools  
```  

To verify if the repository is enabled:  

```bash  
sudo dnf repolist enabled  
```  

---

#### **2. Adding EPEL Repository**  

The Extra Packages for Enterprise Linux (EPEL) repository provides additional software packages for AlmaLinux. To add EPEL:  

```bash  
sudo dnf install epel-release -y  
```  

Verify the addition:  

```bash  
sudo dnf repolist  
```  

You can now install software from the EPEL repository.  

---

#### **3. Adding RPM Fusion Repository**  

For multimedia and non-free packages, RPM Fusion is a popular choice.  

##### Add the free repository  

```bash  
sudo dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm  
```  

##### Add the non-free repository  

```bash  
sudo dnf install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm  
```  

After installation, confirm that RPM Fusion is added:  

```bash  
sudo dnf repolist  
```  

---

#### **4. Adding a Custom Repository**  

You can create a custom `.repo` file to add a repository manually.  

1. **Create a `.repo` file in `/etc/yum.repos.d/`:**  

```bash  
sudo nano /etc/yum.repos.d/custom.repo  
```  

2. **Add the repository details:**  
For example:  

```ini  
[custom-repo]  
name=Custom Repository  
baseurl=http://example.com/repo/  
enabled=1  
gpgcheck=1  
gpgkey=http://example.com/repo/RPM-GPG-KEY  
```  

3. **Save the file and update the repository list:**  

```bash  
sudo dnf makecache  
```  

4. **Test the repository:**  
Install a package from the custom repository:  

```bash  
sudo dnf install <package-name>  
```  

---

#### **5. Adding Third-Party Repositories**  

Third-party repositories, like Remi or MySQL repositories, often provide newer versions of popular software.  

##### Add the Remi repository  

1. Install the repository:  

```bash  
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm  
```  

2. Enable a specific repository branch (e.g., PHP 8.2):  

```bash  
sudo dnf module enable php:remi-8.2  
```  

3. Install the package:  

```bash  
sudo dnf install php  
```  

---

### **Managing Repositories**  

#### **1. Listing Repositories**  

View all enabled repositories:  

```bash  
sudo dnf repolist enabled  
```  

View all repositories (enabled and disabled):  

```bash  
sudo dnf repolist all  
```  

#### **2. Enabling/Disabling Repositories**  

Enable a repository:  

```bash  
sudo dnf config-manager --set-enabled <repository-name>  
```  

Disable a repository:  

```bash  
sudo dnf config-manager --set-disabled <repository-name>  
```  

#### **3. Removing a Repository**  

To remove a repository, delete its `.repo` file:  

```bash  
sudo rm /etc/yum.repos.d/<repository-name>.repo  
```  

Clear the cache afterward:  

```bash  
sudo dnf clean all  
```  

---

### **Best Practices for Repository Management**  

1. **Use Trusted Sources**: Only add repositories from reliable sources to avoid security risks.  
2. **Verify GPG Keys**: Always validate GPG keys to ensure the integrity of packages.  
3. **Avoid Repository Conflicts**: Multiple repositories providing the same packages can cause conflicts. Use priority settings if necessary.  
4. **Regular Updates**: Keep your repositories updated to avoid compatibility issues.  
5. **Backup Configurations**: Backup `.repo` files before making changes.  

---

### **Conclusion**  

Adding additional repositories in AlmaLinux unlocks a wealth of software and ensures you can tailor your system to meet specific needs. By following the steps outlined in this guide, you can easily add, manage, and maintain repositories while adhering to best practices for system stability and security.  

Whether you're installing packages from trusted third-party sources like EPEL and RPM Fusion or setting up custom repositories for internal use, AlmaLinux provides the flexibility you need to enhance your system.  

Explore the potential of AlmaLinux by integrating the right repositories into your setup today!  

---

*Do you have a favorite repository or experience with adding repositories on AlmaLinux? Share your thoughts in the comments below!*  
