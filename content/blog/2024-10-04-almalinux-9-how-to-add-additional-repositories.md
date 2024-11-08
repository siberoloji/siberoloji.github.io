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
<p><strong>AlmaLinux 9</strong> is a powerful, enterprise-level Linux distribution that offers stability, security, and reliability. One of the key aspects of managing a Linux system like AlmaLinux is installing and updating software. While AlmaLinux comes with a default set of repositories that provide essential packages, there may be times when you need to install software that isn't available in the default repositories.</p>
  

<!-- wp:paragraph -->
<p>Adding <strong>additional repositories</strong> can provide access to a wider range of software, giving system administrators and users more flexibility and options. In this blog post, we'll walk through the process of adding third-party or custom repositories to AlmaLinux 9, covering topics such as enabling extra repositories, verifying GPG keys, and managing repository configurations.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Table of Contents</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Introduction to Repositories in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Why Add Additional Repositories?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Checking Enabled Repositories in AlmaLinux 9</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>How to Add an Official AlmaLinux Repository</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Adding EPEL (Extra Packages for Enterprise Linux)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Adding a Custom Third-Party Repository</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Managing Repositories with DNF</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Verifying Repository GPG Keys</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Best Practices for Managing Repositories</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conclusion</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 1. Introduction to Repositories in AlmaLinux 9</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>repository</strong> (or repo) is a storage location where packages (software) are stored. In Linux distributions like AlmaLinux, package managers like <strong>DNF</strong> pull software from these repositories and install them on your system.</p>
  

<!-- wp:paragraph -->
<p>Repositories contain software that is packaged in a format such as <strong>RPM</strong> (Red Hat Package Manager), which is common for AlmaLinux. AlmaLinux 9 comes with several pre-configured repositories like:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>BaseOS</strong>: Essential system components.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>AppStream</strong>: Additional applications and developer tools.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Extras</strong>: Additional packages that complement the core system.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>However, if you need specific tools or software that aren't included in these repositories, you'll need to add third-party or custom repositories.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. Why Add Additional Repositories?</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>There are several reasons you may need to add additional repositories:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Access to More Software</strong>: Sometimes, the default AlmaLinux repositories may not include all the software packages you need, especially niche or cutting-edge software.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Community or Third-Party Packages</strong>: Some software is maintained by the community or third-party developers and isn’t available in the official repositories.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Custom Internal Repositories</strong>: Organizations may maintain internal repositories with custom-built packages for specific use cases.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Access to the Latest Updates</strong>: Some repositories offer faster updates for software packages than the default AlmaLinux repositories, which prioritize stability over cutting-edge features.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. Checking Enabled Repositories in AlmaLinux 9</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before adding new repositories, it's important to check which repositories are already enabled on your system. To view the currently enabled repositories, you can use the <strong>DNF</strong> package manager.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will list all enabled repositories on your system. You’ll likely see the BaseOS, AppStream, and Extras repositories by default.</p>
  

<!-- wp:paragraph -->
<p>For a more detailed view that includes both enabled and disabled repositories, you can use:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist all</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This command will show you the state of every available repository, whether it's enabled, disabled, or set to be used only in certain conditions.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. How to Add an Official AlmaLinux Repository</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>While AlmaLinux comes with most repositories pre-configured, there might be situations where you want to manually add or enable an official AlmaLinux repository. For example, AlmaLinux might release additional repositories for specific software sets or testing.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Verify Repository Information</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Make sure to verify the URL and repository information on the official AlmaLinux site. AlmaLinux repositories are usually located at <code>http://repo.almalinux.org</code>.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Create a Repo File</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To manually add an AlmaLinux repository, create a new repo file in the <code>/etc/yum.repos.d/</code> directory. For example, if AlmaLinux introduces a new repository, you can add it by creating a new file:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/yum.repos.d/almalinux-new.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In the file, add the following lines, adjusting them to the repository you're adding:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[almalinux-new-repo]
name=AlmaLinux New Repository
baseurl=http://repo.almalinux.org/almalinux/9/new-repo/
enabled=1
gpgcheck=1
gpgkey=http://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Update the Repository Metadata</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After creating the repository file, run the following command to refresh the repository metadata:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will download the latest repository metadata, making new packages available.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. Adding EPEL (Extra Packages for Enterprise Linux)</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One of the most popular additional repositories for AlmaLinux and other RHEL-based distributions is <strong>EPEL (Extra Packages for Enterprise Linux)</strong>. This repository is maintained by the Fedora project and offers a wide range of extra packages that are not included in the default repositories.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Install EPEL Release Package</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To add EPEL to AlmaLinux 9, simply install the EPEL release package:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install epel-release</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This will automatically configure the EPEL repository and enable it on your system.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Update Repositories</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After installing EPEL, update the repository metadata:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now you can start installing packages from the EPEL repository just like any other AlmaLinux repository.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Verify EPEL Installation</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To ensure EPEL is enabled, you can run:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf repolist</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You should see <strong>epel</strong> listed in the repository list.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. Adding a Custom Third-Party Repository</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sometimes, you might need to add a third-party repository for specific software or tools that aren’t available in the official AlmaLinux or EPEL repositories.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Obtain the Repository Information</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To add a third-party repository, you'll need to obtain the repository URL from the software vendor or project website. They typically provide instructions or a <code>.repo</code> file for the specific software.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Create the Repository File</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Just like we did earlier, create a new <code>.repo</code> file in the <code>/etc/yum.repos.d/</code> directory. For example, if you're adding a repository for a software package called <code>example-repo</code>:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /etc/yum.repos.d/example-repo.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Add the following lines to define the repository:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[example-repo]
name=Example Repository
baseurl=http://example-repo-url/path/to/repo/
enabled=1
gpgcheck=1
gpgkey=http://example-repo-url/path/to/gpgkey</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Refresh Metadata and Install Packages</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After adding the repository, refresh the metadata:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf makecache</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can now search and install packages from this third-party repository:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install package_name</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Managing Repositories with DNF</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once you've added repositories, managing them with <strong>DNF</strong> is straightforward. You can enable, disable, or remove repositories as needed.</p>
  

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Enabling or Disabling a Repository</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If you want to temporarily enable or disable a repository, you can do so with the following commands:</p>
  

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Disable a repository</strong>:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo dnf config-manager --set-disabled repo_name</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Enable a repository</strong>:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo dnf config-manager --set-enabled repo_name</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Removing a Repository</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To completely remove a repository, simply delete the <code>.repo</code> file from <code>/etc/yum.repos.d/</code>. For example:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo rm /etc/yum.repos.d/example-repo.repo</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This removes the repository from your system and prevents it from being used for package installations or updates.</p>
  

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 8. Verifying Repository GPG Keys</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>GPG (GNU Privacy Guard) keys ensure that the software packages you install from a repository are legitimate and haven't been tampered with. It is crucial to verify the GPG key of a repository before enabling it.</p>
  

<!-- wp:paragraph -->
<p>When adding a repository, ensure that the <code>gpgcheck=1</code> option is enabled in the <code>.repo</code> file. This tells the package manager to verify the GPG signature of all packages installed from the repository.</p>
  

<!-- wp:paragraph -->
<p>You can manually import the GPG key using the following command:</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo rpm --import http://repository-url/path/to/gpgkey</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 9. Best Practices for Managing Repositories</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Use Trusted Sources</strong>: Always ensure that repositories come from trusted and verified sources. Adding repositories from untrusted sources can introduce security risks to your system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Minimize Repository Usage</strong>: Use only the repositories you need. Having too many repositories can lead to package conflicts or unexpected software behavior.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Regularly Clean Repositories</strong>: Use the <code>dnf clean all</code> command to clean up old metadata and package information, especially after adding or removing repositories.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Monitor Repository Changes</strong>: Some repositories may release updates or changes to their structure, which can affect your system. Regularly monitor repository-related announcements to stay up to date.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 10. Conclusion</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Adding additional repositories to your AlmaLinux 9 system is a great way to expand the available software and customize your server environment. Whether you're looking to install community packages from EPEL or integrate third-party repositories for specialized software, the process is simple and can significantly enhance your system</p>
  

<!-- wp:paragraph -->
<p>’s capabilities.</p>
  

<!-- wp:paragraph -->
<p>By understanding how to properly manage repositories, verify GPG keys, and use best practices, you can keep your AlmaLinux 9 system secure, flexible, and up to date with the latest software offerings. Proper repository management ensures you have access to the software you need while maintaining system integrity.</p>
  

<!-- wp:paragraph -->
<p>Regularly review and manage your repositories to keep your AlmaLinux system running smoothly and efficiently.</p>
  