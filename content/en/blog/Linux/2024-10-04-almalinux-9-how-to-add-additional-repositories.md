---
draft: false
title: "AlmaLinux 9: How to Add Additional Repositories"
date: 2024-10-04T14:57:07+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-add-additional-repositories/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - Additional repositories
  - AlmaLinux
  - how-to guides
  - linux how-to
---


**AlmaLinux 9** is a powerful, enterprise-level Linux distribution that offers stability, security, and reliability. One of the key aspects of managing a Linux system like AlmaLinux is installing and updating software. While AlmaLinux comes with a default set of repositories that provide essential packages, there may be times when you need to install software that isn't available in the default repositories.



Adding **additional repositories** can provide access to a wider range of software, giving system administrators and users more flexibility and options. In this blog post, we'll walk through the process of adding third-party or custom repositories to AlmaLinux 9, covering topics such as enabling extra repositories, verifying GPG keys, and managing repository configurations.





Table of Contents


* Introduction to Repositories in AlmaLinux 9

* Why Add Additional Repositories?

* Checking Enabled Repositories in AlmaLinux 9

* How to Add an Official AlmaLinux Repository

* Adding EPEL (Extra Packages for Enterprise Linux)

* Adding a Custom Third-Party Repository

* Managing Repositories with DNF

* Verifying Repository GPG Keys

* Best Practices for Managing Repositories

* Conclusion






1. Introduction to Repositories in AlmaLinux 9



A **repository** (or repo) is a storage location where packages (software) are stored. In Linux distributions like AlmaLinux, package managers like **DNF** pull software from these repositories and install them on your system.



Repositories contain software that is packaged in a format such as **RPM** (Red Hat Package Manager), which is common for AlmaLinux. AlmaLinux 9 comes with several pre-configured repositories like:


* **BaseOS**: Essential system components.

* **AppStream**: Additional applications and developer tools.

* **Extras**: Additional packages that complement the core system.




However, if you need specific tools or software that aren't included in these repositories, you'll need to add third-party or custom repositories.





2. Why Add Additional Repositories?



There are several reasons you may need to add additional repositories:


* **Access to More Software**: Sometimes, the default AlmaLinux repositories may not include all the software packages you need, especially niche or cutting-edge software.

* **Community or Third-Party Packages**: Some software is maintained by the community or third-party developers and isn’t available in the official repositories.

* **Custom Internal Repositories**: Organizations may maintain internal repositories with custom-built packages for specific use cases.

* **Access to the Latest Updates**: Some repositories offer faster updates for software packages than the default AlmaLinux repositories, which prioritize stability over cutting-edge features.






3. Checking Enabled Repositories in AlmaLinux 9



Before adding new repositories, it's important to check which repositories are already enabled on your system. To view the currently enabled repositories, you can use the **DNF** package manager.


```bash
sudo dnf repolist```



This command will list all enabled repositories on your system. You’ll likely see the BaseOS, AppStream, and Extras repositories by default.



For a more detailed view that includes both enabled and disabled repositories, you can use:


```bash
sudo dnf repolist all
```



This command will show you the state of every available repository, whether it's enabled, disabled, or set to be used only in certain conditions.





4. How to Add an Official AlmaLinux Repository



While AlmaLinux comes with most repositories pre-configured, there might be situations where you want to manually add or enable an official AlmaLinux repository. For example, AlmaLinux might release additional repositories for specific software sets or testing.


#### Step 1: Verify Repository Information



Make sure to verify the URL and repository information on the official AlmaLinux site. AlmaLinux repositories are usually located at `http://repo.almalinux.org`.


#### Step 2: Create a Repo File



To manually add an AlmaLinux repository, create a new repo file in the `/etc/yum.repos.d/` directory. For example, if AlmaLinux introduces a new repository, you can add it by creating a new file:


```bash
sudo nano /etc/yum.repos.d/almalinux-new.repo```



In the file, add the following lines, adjusting them to the repository you're adding:


```bash
[almalinux-new-repo]
name=AlmaLinux New Repository
baseurl=http://repo.almalinux.org/almalinux/9/new-repo/
enabled=1
gpgcheck=1
gpgkey=http://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux```


#### Step 3: Update the Repository Metadata



After creating the repository file, run the following command to refresh the repository metadata:


```bash
sudo dnf makecache```



This will download the latest repository metadata, making new packages available.





5. Adding EPEL (Extra Packages for Enterprise Linux)



One of the most popular additional repositories for AlmaLinux and other RHEL-based distributions is **EPEL (Extra Packages for Enterprise Linux)**. This repository is maintained by the Fedora project and offers a wide range of extra packages that are not included in the default repositories.


#### Step 1: Install EPEL Release Package



To add EPEL to AlmaLinux 9, simply install the EPEL release package:


```bash
sudo dnf install epel-release```



This will automatically configure the EPEL repository and enable it on your system.


#### Step 2: Update Repositories



After installing EPEL, update the repository metadata:


```bash
sudo dnf makecache```



Now you can start installing packages from the EPEL repository just like any other AlmaLinux repository.


#### Step 3: Verify EPEL Installation



To ensure EPEL is enabled, you can run:


```bash
sudo dnf repolist```



You should see **epel** listed in the repository list.





6. Adding a Custom Third-Party Repository



Sometimes, you might need to add a third-party repository for specific software or tools that aren’t available in the official AlmaLinux or EPEL repositories.


#### Step 1: Obtain the Repository Information



To add a third-party repository, you'll need to obtain the repository URL from the software vendor or project website. They typically provide instructions or a `.repo` file for the specific software.


#### Step 2: Create the Repository File



Just like we did earlier, create a new `.repo` file in the `/etc/yum.repos.d/` directory. For example, if you're adding a repository for a software package called `example-repo`:


```bash
sudo nano /etc/yum.repos.d/example-repo.repo```



Add the following lines to define the repository:


```bash
[example-repo]
name=Example Repository
baseurl=http://example-repo-url/path/to/repo/
enabled=1
gpgcheck=1
gpgkey=http://example-repo-url/path/to/gpgkey
```


#### Step 3: Refresh Metadata and Install Packages



After adding the repository, refresh the metadata:


```bash
sudo dnf makecache```



You can now search and install packages from this third-party repository:


```bash
sudo dnf install package_name```





7. Managing Repositories with DNF



Once you've added repositories, managing them with **DNF** is straightforward. You can enable, disable, or remove repositories as needed.


#### Enabling or Disabling a Repository



If you want to temporarily enable or disable a repository, you can do so with the following commands:


* **Disable a repository**:



```bash
  sudo dnf config-manager --set-disabled repo_name```


* **Enable a repository**:



```bash
  sudo dnf config-manager --set-enabled repo_name```


#### Removing a Repository



To completely remove a repository, simply delete the `.repo` file from `/etc/yum.repos.d/`. For example:


```bash
sudo rm /etc/yum.repos.d/example-repo.repo```



This removes the repository from your system and prevents it from being used for package installations or updates.





8. Verifying Repository GPG Keys



GPG (GNU Privacy Guard) keys ensure that the software packages you install from a repository are legitimate and haven't been tampered with. It is crucial to verify the GPG key of a repository before enabling it.



When adding a repository, ensure that the `gpgcheck=1` option is enabled in the `.repo` file. This tells the package manager to verify the GPG signature of all packages installed from the repository.



You can manually import the GPG key using the following command:


```bash
sudo rpm --import http://repository-url/path/to/gpgkey
```





9. Best Practices for Managing Repositories


* **Use Trusted Sources**: Always ensure that repositories come from trusted and verified sources. Adding repositories from untrusted sources can introduce security risks to your system.

* **Minimize Repository Usage**: Use only the repositories you need. Having too many repositories can lead to package conflicts or unexpected software behavior.

* **Regularly Clean Repositories**: Use the `dnf clean all` command to clean up old metadata and package information, especially after adding or removing repositories.

* **Monitor Repository Changes**: Some repositories may release updates or changes to their structure, which can affect your system. Regularly monitor repository-related announcements to stay up to date.






10. Conclusion



Adding additional repositories to your AlmaLinux 9 system is a great way to expand the available software and customize your server environment. Whether you're looking to install community packages from EPEL or integrate third-party repositories for specialized software, the process is simple and can significantly enhance your system



’s capabilities.



By understanding how to properly manage repositories, verify GPG keys, and use best practices, you can keep your AlmaLinux 9 system secure, flexible, and up to date with the latest software offerings. Proper repository management ensures you have access to the software you need while maintaining system integrity.



Regularly review and manage your repositories to keep your AlmaLinux system running smoothly and efficiently.
