---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-09-21T17:58:07Z"
guid: https://www.siberoloji.com/?p=1697
id: 1697
image: /assets/images/2024/09/linuxcommandsillustration1.webp
tags:
- cfdisk
- linux
- linux fundamentals
- os
title: 'Understanding the cfdisk Command in Linux: A Guide for Advanced Users'
url: /understanding-the-cfdisk-command-in-linux-a-guide-for-advanced-users/
---

 <p>Disk partitioning is an essential task in Linux, especially for system administrators or users managing multiple drives. One of the tools available for partition management is the <code>cfdisk</code> command, a simple yet powerful text-based partition editor. While graphical partition editors like GParted provide a user-friendly interface, <code>cfdisk</code> offers greater control through the command line, making it ideal for advanced users who prefer working without a graphical environment.</p>
 

 <p>In this blog post, we’ll explore the <code>cfdisk</code> command in detail, discussing its use cases, advantages, and practical examples to help you master disk partitioning tasks on Linux.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## What is <code>cfdisk</code>?</h2>
<!-- /wp:heading -->

 <p><code>cfdisk</code> stands for <strong>curses-based fdisk</strong>. It is a simplified version of the more traditional <code>fdisk</code> command but with a menu-driven interface based on the curses library. This allows users to interactively manage disk partitions in a text-based environment.</p>
 

 <p><code>cfdisk</code> is particularly useful for those who find <code>fdisk</code>'s command-line interface too complex or want a faster way to create, delete, and modify partitions. While it lacks some of the advanced features of <code>parted</code>, it is perfect for common partitioning tasks such as:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Creating partitions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Deleting partitions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Changing partition types (e.g., setting a partition as Linux, swap, or NTFS)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Setting partitions as bootable</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 <p><code>cfdisk</code> operates on block devices such as <code>/dev/sda</code>, <code>/dev/nvme0n1</code>, or <code>/dev/mmcblk0</code>, and changes are only committed when you write them to the disk. Until that point, no data is altered, making it a relatively safe tool to experiment with.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Installing <code>cfdisk</code></h2>
<!-- /wp:heading -->

 <p>Before you begin, ensure that <code>cfdisk</code> is installed on your system. Most Linux distributions include <code>cfdisk</code> by default, but if it is missing, you can install it using your package manager.</p>
 

 <p>For <strong>Debian/Ubuntu</strong> systems:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get install util-linux</code></pre>
<!-- /wp:code -->

 <p>For <strong>Fedora</strong>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install util-linux</code></pre>
<!-- /wp:code -->

 <p>For <strong>Arch Linux</strong>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo pacman -S util-linux</code></pre>
<!-- /wp:code -->

 <p>The <code>cfdisk</code> tool is part of the <code>util-linux</code> package, which is widely available on almost all Linux distributions.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Basic Usage and Interface</h2>
<!-- /wp:heading -->

 <p>To begin working with <code>cfdisk</code>, you need to specify the disk you want to manage. For example, to work on the first disk (<code>/dev/sda</code>), run the following command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sda</code></pre>
<!-- /wp:code -->

 <p>This command will open an interactive text-based interface where you can perform various partitioning tasks.</p>
 

<!-- wp:heading {"level":3} -->
 ### Key Sections of the Interface:</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Disk Information</strong>: At the top of the screen, you’ll see information about the disk you’re working on, including the size of the disk and the partition table type (e.g., DOS or GPT).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Partition Table</strong>: Below the disk information is a list of current partitions on the disk. Each partition is displayed with its start and end points, size, file system type, and label.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Menu Options</strong>: At the bottom, you’ll find a menu that provides options such as <strong>Create</strong>, <strong>Delete</strong>, <strong>Type</strong>, <strong>Write</strong>, and <strong>Quit</strong>. You can navigate through these options using the arrow keys and select them by pressing <strong>Enter</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Working with Partition Tables</h2>
<!-- /wp:heading -->

 <p>Before creating or modifying partitions, you must ensure that the partition table is correctly set up. <code>cfdisk</code> supports both <strong>DOS</strong> and <strong>GPT</strong> partition tables.</p>
 

<!-- wp:heading {"level":3} -->
 ### Creating a New Partition Table</h3>
<!-- /wp:heading -->

 <p>To create a new partition table:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open <code>cfdisk</code> on the disk you want to partition: <code>sudo cfdisk /dev/sda</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use the arrow keys to select the <strong>[Label]</strong> option, which allows you to create a new partition table.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select either <strong>gpt</strong> or <strong>dos</strong> depending on your requirements:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>GPT</strong> (GUID Partition Table) is suitable for disks larger than 2 TB or when using UEFI boot.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DOS</strong> is more common for legacy BIOS systems and smaller disks.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 <p>Choosing the correct partition table is crucial for compatibility with your system’s boot method.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Creating Partitions with <code>cfdisk</code></h2>
<!-- /wp:heading -->

 <p>Once the partition table is set, you can begin creating partitions. Here’s an example where we create three partitions:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>A root partition (<code>/</code>) of 50 GB</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A swap partition of 8 GB</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>A home partition (<code>/home</code>) with the remaining space</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Create Root Partition</strong>:<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>In the <code>cfdisk</code> interface, select <strong>[New]</strong> to create a new partition.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Choose the size of the partition. For this example, enter <strong>50G</strong> for the root partition.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>After setting the size, you'll be prompted to choose whether the partition should be <strong>Primary</strong> or <strong>Logical</strong>. For the first partition on a DOS table, select <strong>Primary</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Now, mark the partition as bootable by selecting <strong>[Bootable]</strong>. This is required for the partition from which you will boot your system.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Create Swap Partition</strong>:<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>After creating the root partition, select <strong>[New]</strong> again to create another partition.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enter <strong>8G</strong> as the size of this partition for the swap area.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use the <strong>[Type]</strong> option to change the partition type to <strong>82 (Linux swap)</strong>.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Create Home Partition</strong>:<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Finally, use the remaining space to create the home partition. Select <strong>[New]</strong> and assign the remaining size.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>No special settings are required for the home partition unless you want to change the file system type.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list --></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Example:</h3>
<!-- /wp:heading -->

 <p>After completing these steps, the partition table might look something like this:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/dev/sda1   50G   Linux filesystem
/dev/sda2   8G    Linux swap
/dev/sda3   Remaining size  Linux filesystem</code></pre>
<!-- /wp:code -->

 <p>Once the partitions are set, navigate to <strong>[Write]</strong> to commit your changes to disk. <code>cfdisk</code> will ask you to type "yes" to confirm that you want to write the changes. Afterward, you can quit the program by selecting <strong>[Quit]</strong>.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Deleting and Modifying Partitions</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Deleting a Partition</h3>
<!-- /wp:heading -->

 <p>If you need to delete a partition, use the <strong>[Delete]</strong> option in the <code>cfdisk</code> interface:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Select the partition you want to delete using the arrow keys.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select <strong>[Delete]</strong>, and the partition will be removed from the partition table.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>Deleted partitions remain uncommitted until you choose to write the changes. This gives you the flexibility to undo changes before they are final.</p>
 

<!-- wp:heading {"level":3} -->
 ### Changing Partition Types</h3>
<!-- /wp:heading -->

 <p>Sometimes you might want to change the type of an existing partition (e.g., setting a partition as <strong>swap</strong> or <strong>EFI system</strong>). Use the <strong>[Type]</strong> option to assign a different type to the selected partition.</p>
 

 <p>For example:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Type -&gt; 82 (Linux swap)</code></pre>
<!-- /wp:code -->

 <p>or</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Type -&gt; EF00 (EFI system)</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Practical <code>cfdisk</code> Use Cases</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Preparing a Disk for Linux Installation</h3>
<!-- /wp:heading -->

 <p>When installing a new Linux distribution, partitioning is often required. Using <code>cfdisk</code>, you can easily create partitions for <strong>root</strong>, <strong>home</strong>, <strong>swap</strong>, and <strong>boot</strong> partitions before installation.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sda</code></pre>
<!-- /wp:code -->

 <p>Then create the necessary partitions (e.g., <code>/</code>, <code>/boot</code>, <code>/home</code>, swap) and set the appropriate types and bootable flags.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2. Partitioning a New External Drive</h3>
<!-- /wp:heading -->

 <p>Suppose you have a new external drive (<code>/dev/sdb</code>) that you want to partition for use as a backup drive. Using <code>cfdisk</code>, you can create a large partition and set the partition type to <strong>Linux filesystem</strong> for ext4 formatting later.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sdb</code></pre>
<!-- /wp:code -->

 <p>Create a partition with the desired size and write the changes. Once done, format the partition using the <code>mkfs</code> command:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkfs.ext4 /dev/sdb1</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Advantages and Limitations of <code>cfdisk</code></h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Advantages:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Intuitive Interface</strong>: The text-based interface is easy to navigate compared to <code>fdisk</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Safe to Use</strong>: Until changes are written to disk, <code>cfdisk</code> does not modify your data.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Wide Compatibility</strong>: Supports both DOS and GPT partition tables.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Limitations:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Limited Features</strong>: Compared to <code>parted</code>, <code>cfdisk</code> lacks advanced features such as resizing partitions or aligning them to sector boundaries.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Non-Graphical</strong>: While more user-friendly than <code>fdisk</code>, it still requires working in a text-based interface, which might not be ideal for all users.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

 <p>The <code>cfdisk</code> command is a straightforward yet powerful tool for managing partitions in Linux. For advanced users, it offers an efficient way to perform common partitioning tasks without the complexity of <code>fdisk</code> or the need for a full graphical interface. Whether you’re setting up a new disk, preparing for an installation, or managing storage on a server, <code>cfdisk</code> provides a reliable method to create, delete, and modify partitions with ease.</p>
 

 <p>By mastering <code>cfdisk</code>, you gain the ability to handle disk management tasks in almost any environment, from desktop setups to headless servers.</p>
 