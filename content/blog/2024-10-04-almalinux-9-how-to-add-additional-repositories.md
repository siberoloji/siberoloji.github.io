---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux How-to
classic-editor-remember:
- block-editor
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-04T14:57:07Z"
guid: https://www.siberoloji.com/?p=2318
id: 2318
image: /assets/images/2024/09/almalinux.webp
tags:
- Additional repositories
- alma linux
- how-to guides
- linux how-to
title: 'AlmaLinux 9: How to Add Additional Repositories'
url: /almalinux-9-how-to-add-additional-repositories/
---

<!-- wp:paragraph -->
<p>***AlmaLinux 9***  is a powerful, enterprise-level Linux distribution that offers stability, security, and reliability. One of the key aspects of managing a Linux system like AlmaLinux is installing and updating software. While AlmaLinux comes with a default set of repositories that provide essential packages, there may be times when you need to install software that isn't available in the default repositories.
  

<!-- wp:paragraph -->
<p>Adding ***additional repositories***  can provide access to a wider range of software, giving system administrators and users more flexibility and options. In this blog post, we'll walk through the process of adding third-party or custom repositories to AlmaLinux 9, covering topics such as enabling extra repositories, verifying GPG keys, and managing repository configurations.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Table of Contents
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Introduction to Repositories in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Why Add Additional Repositories? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Checking Enabled Repositories in AlmaLinux 9 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- How to Add an Official AlmaLinux Repository 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Adding EPEL (Extra Packages for Enterprise Linux) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Adding a Custom Third-Party Repository 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Managing Repositories with DNF 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Verifying Repository GPG Keys 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Best Practices for Managing Repositories 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conclusion 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 1. Introduction to Repositories in AlmaLinux 9
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A ***repository***  (or repo) is a storage location where packages (software) are stored. In Linux distributions like AlmaLinux, package managers like ***DNF***  pull software from these repositories and install them on your system.
  

<!-- wp:paragraph -->
<p>Repositories contain software that is packaged in a format such as ***RPM***  (Red Hat Package Manager), which is common for AlmaLinux. AlmaLinux 9 comes with several pre-configured repositories like:
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***BaseOS*** : Essential system components. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***AppStream*** : Additional applications and developer tools. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Extras*** : Additional packages that complement the core system. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>However, if you need specific tools or software that aren't included in these repositories, you'll need to add third-party or custom repositories.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. Why Add Additional Repositories?
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>There are several reasons you may need to add additional repositories:
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Access to More Software*** : Sometimes, the default AlmaLinux repositories may not include all the software packages you need, especially niche or cutting-edge software. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Community or Third-Party Packages*** : Some software is maintained by the community or third-party developers and isn’t available in the official repositories. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Custom Internal Repositories*** : Organizations may maintain internal repositories with custom-built packages for specific use cases. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Access to the Latest Updates*** : Some repositories offer faster updates for software packages than the default AlmaLinux repositories, which prioritize stability over cutting-edge features. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. Checking Enabled Repositories in AlmaLinux 9
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before adding new repositories, it's important to check which repositories are already enabled on your system. To view the currently enabled repositories, you can use the ***DNF***  package manager.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will list all enabled repositories on your system. You’ll likely see the BaseOS, AppStream, and Extras repositories by default.
  

<!-- wp:paragraph -->
<p>For a more detailed view that includes both enabled and disabled repositories, you can use:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist all</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will show you the state of every available repository, whether it's enabled, disabled, or set to be used only in certain conditions.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. How to Add an Official AlmaLinux Repository
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>While AlmaLinux comes with most repositories pre-configured, there might be situations where you want to manually add or enable an official AlmaLinux repository. For example, AlmaLinux might release additional repositories for specific software sets or testing.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Verify Repository Information 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Make sure to verify the URL and repository information on the official AlmaLinux site. AlmaLinux repositories are usually located at <code>http://repo.almalinux.org</code>.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Create a Repo File 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To manually add an AlmaLinux repository, create a new repo file in the <code>/etc/yum.repos.d/</code> directory. For example, if AlmaLinux introduces a new repository, you can add it by creating a new file:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/yum.repos.d/almalinux-new.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In the file, add the following lines, adjusting them to the repository you're adding:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[almalinux-new-repo]
name=AlmaLinux New Repository
baseurl=http://repo.almalinux.org/almalinux/9/new-repo/
enabled=1
gpgcheck=1
gpgkey=http://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Update the Repository Metadata 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After creating the repository file, run the following command to refresh the repository metadata:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will download the latest repository metadata, making new packages available.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. Adding EPEL (Extra Packages for Enterprise Linux)
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One of the most popular additional repositories for AlmaLinux and other RHEL-based distributions is ***EPEL (Extra Packages for Enterprise Linux)*** . This repository is maintained by the Fedora project and offers a wide range of extra packages that are not included in the default repositories.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install EPEL Release Package 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To add EPEL to AlmaLinux 9, simply install the EPEL release package:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install epel-release</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will automatically configure the EPEL repository and enable it on your system.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Update Repositories 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After installing EPEL, update the repository metadata:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now you can start installing packages from the EPEL repository just like any other AlmaLinux repository.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Verify EPEL Installation 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To ensure EPEL is enabled, you can run:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You should see ***epel***  listed in the repository list.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. Adding a Custom Third-Party Repository
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sometimes, you might need to add a third-party repository for specific software or tools that aren’t available in the official AlmaLinux or EPEL repositories.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Obtain the Repository Information 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To add a third-party repository, you'll need to obtain the repository URL from the software vendor or project website. They typically provide instructions or a <code>.repo</code> file for the specific software.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Create the Repository File 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Just like we did earlier, create a new <code>.repo</code> file in the <code>/etc/yum.repos.d/</code> directory. For example, if you're adding a repository for a software package called <code>example-repo</code>:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/yum.repos.d/example-repo.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Add the following lines to define the repository:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[example-repo]
name=Example Repository
baseurl=http://example-repo-url/path/to/repo/
enabled=1
gpgcheck=1
gpgkey=http://example-repo-url/path/to/gpgkey</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Refresh Metadata and Install Packages 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After adding the repository, refresh the metadata:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can now search and install packages from this third-party repository:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install package_name</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Managing Repositories with DNF
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once you've added repositories, managing them with ***DNF***  is straightforward. You can enable, disable, or remove repositories as needed.
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Enabling or Disabling a Repository 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If you want to temporarily enable or disable a repository, you can do so with the following commands:
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Disable a repository*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo dnf config-manager --set-disabled repo_name</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Enable a repository*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo dnf config-manager --set-enabled repo_name</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Removing a Repository 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To completely remove a repository, simply delete the <code>.repo</code> file from <code>/etc/yum.repos.d/</code>. For example:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo rm /etc/yum.repos.d/example-repo.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This removes the repository from your system and prevents it from being used for package installations or updates.
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 8. Verifying Repository GPG Keys
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>GPG (GNU Privacy Guard) keys ensure that the software packages you install from a repository are legitimate and haven't been tampered with. It is crucial to verify the GPG key of a repository before enabling it.
  

<!-- wp:paragraph -->
<p>When adding a repository, ensure that the <code>gpgcheck=1</code> option is enabled in the <code>.repo</code> file. This tells the package manager to verify the GPG signature of all packages installed from the repository.
  

<!-- wp:paragraph -->
<p>You can manually import the GPG key using the following command:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo rpm --import http://repository-url/path/to/gpgkey</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 9. Best Practices for Managing Repositories
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Use Trusted Sources*** : Always ensure that repositories come from trusted and verified sources. Adding repositories from untrusted sources can introduce security risks to your system. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Minimize Repository Usage*** : Use only the repositories you need. Having too many repositories can lead to package conflicts or unexpected software behavior. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Regularly Clean Repositories*** : Use the <code>dnf clean all</code> command to clean up old metadata and package information, especially after adding or removing repositories. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Monitor Repository Changes*** : Some repositories may release updates or changes to their structure, which can affect your system. Regularly monitor repository-related announcements to stay up to date. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 10. Conclusion
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Adding additional repositories to your AlmaLinux 9 system is a great way to expand the available software and customize your server environment. Whether you're looking to install community packages from EPEL or integrate third-party repositories for specialized software, the process is simple and can significantly enhance your system
  

<!-- wp:paragraph -->
<p>’s capabilities.
  

<!-- wp:paragraph -->
<p>By understanding how to properly manage repositories, verify GPG keys, and use best practices, you can keep your AlmaLinux 9 system secure, flexible, and up to date with the latest software offerings. Proper repository management ensures you have access to the software you need while maintaining system integrity.
  

<!-- wp:paragraph -->
<p>Regularly review and manage your repositories to keep your AlmaLinux system running smoothly and efficiently.
  