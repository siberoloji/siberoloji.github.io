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
date: "2024-10-04T12:54:43Z"
guid: https://www.siberoloji.com/?p=2275
id: 2275
image: /assets/images/2024/09/almalinux.webp
tags:
- alma linux
- how-to guides
- linux how-to
title: 'AlmaLinux: How to Add, Change Privileges, and Remove User Accounts'
url: /almalinux-how-to-add-change-privileges-and-remove-user-accounts-2/
---

  AlmaLinux, as a robust and enterprise-grade Linux distribution, provides powerful user management capabilities. Whether you're setting up a new server, managing a multi-user workstation, or simply need to modify existing user accounts, understanding how to add, modify, and remove user accounts is crucial. In this comprehensive guide, we'll walk you through the process of managing user accounts on AlmaLinux, covering everything from creating new users to removing old ones, with a focus on changing user privileges.</p>
 

 
 ## Understanding User Accounts in AlmaLinux</h2>
<!-- /wp:heading -->

  Before we dive into the specifics, it's important to understand a few key concepts:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Root User</strong>: The superuser account with full system privileges.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Regular Users</strong>: Standard accounts with limited permissions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Groups</strong>: Collections of users that can be assigned specific permissions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Home Directories</strong>: Each user typically has their own directory in <code>/home/</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Shell</strong>: The command-line interface assigned to a user (e.g., bash, zsh).</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Now, let's explore how to manage these accounts effectively.</p>
 

 
 ## Adding a New User Account</h2>
<!-- /wp:heading -->

  Creating a new user account in AlmaLinux is a straightforward process. You can do this using either the <code>useradd</code> command or the more user-friendly <code>adduser</code> command.</p>
 

<!-- wp:heading {"level":3} -->
 ### Using <code>useradd</code></h3>
<!-- /wp:heading -->

  The basic syntax for <code>useradd</code> is:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo useradd [options] username</code></pre>
<!-- /wp:code -->

  Here's an example of creating a new user named "johndoe":</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo useradd -m -s /bin/bash johndoe</code></pre>
<!-- /wp:code -->

  In this command:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><code>-m</code> creates a home directory for the user</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>-s /bin/bash</code> sets bash as the default shell</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  After creating the user, set a password:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo passwd johndoe</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Using <code>adduser</code></h3>
<!-- /wp:heading -->

  The <code>adduser</code> command is more interactive and user-friendly:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo adduser johndoe</code></pre>
<!-- /wp:code -->

  This command will prompt you for various details like password, full name, and other optional information.</p>
 

 
 ## Changing User Privileges</h2>
<!-- /wp:heading -->

  Modifying user privileges is a common task in system administration. There are several ways to adjust a user's permissions in AlmaLinux.</p>
 

<!-- wp:heading {"level":3} -->
 ### Using <code>usermod</code></h3>
<!-- /wp:heading -->

  The <code>usermod</code> command is versatile for modifying user accounts. Here are some common use cases:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Adding a user to a group</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo usermod -aG groupname username</code></pre>
<!-- /wp:code -->

  For example, to add "johndoe" to the "wheel" group (which typically grants sudo privileges):</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo usermod -aG wheel johndoe</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Changing a user's primary group</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo usermod -g newgroup username</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Changing a user's home directory</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo usermod -d /new/home/directory username</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Changing a user's shell</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo usermod -s /bin/new-shell username</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Using <code>visudo</code> to Grant Sudo Privileges</h3>
<!-- /wp:heading -->

  To give a user sudo privileges, you can add them to the sudoers file:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open the sudoers file:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo visudo</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Add the following line to grant full sudo access:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   johndoe ALL=(ALL) ALL</code></pre>
<!-- /wp:code -->

  Or, for passwordless sudo:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   johndoe ALL=(ALL) NOPASSWD: ALL</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Save and exit the file.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Managing Group Memberships</h3>
<!-- /wp:heading -->

  You can also manage privileges by adding or removing users from specific groups:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>To add a user to a group:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo gpasswd -a username groupname</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>To remove a user from a group:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo gpasswd -d username groupname</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>To create a new group:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  sudo groupadd groupname</code></pre>
<!-- /wp:code -->

 
 ## Removing a User Account</h2>
<!-- /wp:heading -->

  When it's time to remove a user account, AlmaLinux provides a few options.</p>
 

<!-- wp:heading {"level":3} -->
 ### Using <code>userdel</code></h3>
<!-- /wp:heading -->

  The basic command to remove a user is:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo userdel username</code></pre>
<!-- /wp:code -->

  However, this leaves the user's home directory and mail spool intact. To remove these as well, use:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo userdel -r username</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Using <code>deluser</code></h3>
<!-- /wp:heading -->

  The <code>deluser</code> command is more interactive and can handle some cleanup tasks:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo deluser --remove-home username</code></pre>
<!-- /wp:code -->

  This removes the user's home directory and mail spool.</p>
 

 
 ## Best Practices for User Management</h2>
<!-- /wp:heading -->

  When managing user accounts on AlmaLinux, consider these best practices:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Use Strong Passwords</strong>: Enforce strong password policies using tools like <code>pam_pwquality</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Principle of Least Privilege</strong>: Only grant users the minimum privileges necessary for their tasks.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Regular Audits</strong>: Periodically review user accounts and their privileges.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Use Groups</strong>: Organize users into groups for easier permission management.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Secure the Root Account</strong>: Avoid using the root account directly; use sudo for administrative tasks.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Monitor User Activities</strong>: Use tools like <code>auditd</code> to track user actions, especially for privileged accounts.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Implement SSH Key Authentication</strong>: For remote access, consider using SSH keys instead of passwords.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Set Up Password Aging</strong>: Use the <code>chage</code> command to manage password expiration and aging policies.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Advanced User Management Techniques</h2>
<!-- /wp:heading -->

  For more advanced user management, consider these techniques:</p>
 

<!-- wp:heading {"level":3} -->
 ### Using Access Control Lists (ACLs)</h3>
<!-- /wp:heading -->

  ACLs provide more fine-grained control over file and directory permissions:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo setfacl -m u:username:rx /path/to/directory</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Implementing Disk Quotas</h3>
<!-- /wp:heading -->

  To limit the amount of disk space a user can use:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Enable quotas in <code>/etc/fstab</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use <code>quotacheck</code> to initialize the quota database</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Set quotas with <code>edquota</code></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Using PAM (Pluggable Authentication Modules)</h3>
<!-- /wp:heading -->

  PAM allows you to set up sophisticated authentication policies. You can configure PAM modules in <code>/etc/pam.d/</code> to implement features like:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Password strength requirements</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Login attempt limits</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Two-factor authentication</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Troubleshooting Common Issues</h2>
<!-- /wp:heading -->

  Here are some common issues you might encounter when managing user accounts and how to resolve them:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>User can't log in</strong>: Check the user's password, shell, and home directory permissions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sudo access not working</strong>: Verify the user's entry in the sudoers file and group memberships.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Home directory issues</strong>: Ensure proper ownership and permissions on the user's home directory.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Group permission problems</strong>: Double-check group memberships and file/directory group permissions.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

  Effective user management is crucial for maintaining a secure and efficient AlmaLinux system. By mastering the techniques to add users, modify their privileges, and remove accounts when necessary, you'll be well-equipped to manage your AlmaLinux system with confidence.</p>
 

  Remember, with great power comes great responsibility. Always be cautious when modifying user accounts, especially when dealing with system users or granting elevated privileges. Regular audits and following best practices will help ensure your AlmaLinux system remains secure and well-organized.</p>
 

  Whether you're managing a small personal server or a large enterprise environment, these user management skills will serve you well in your journey with AlmaLinux. Happy administrating!</p>
 