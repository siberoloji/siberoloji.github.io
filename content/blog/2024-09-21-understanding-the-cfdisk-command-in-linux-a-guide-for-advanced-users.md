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

 <p>Disk partitioning is an essential task in Linux, especially for system administrators or users managing multiple drives. One of the tools available for partition management is the <code>cfdisk</code> command, a simple yet powerful text-based partition editor. While graphical partition editors like GParted provide a user-friendly interface, <code>cfdisk</code> offers greater control through the command line, making it ideal for advanced users who prefer working without a graphical environment.
 

 <p>In this blog post, we’ll explore the <code>cfdisk</code> command in detail, discussing its use cases, advantages, and practical examples to help you master disk partitioning tasks on Linux.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## What is <code>cfdisk</code>?
<!-- /wp:heading -->

 <p><code>cfdisk</code> stands for ***curses-based fdisk*** . It is a simplified version of the more traditional <code>fdisk</code> command but with a menu-driven interface based on the curses library. This allows users to interactively manage disk partitions in a text-based environment.
 

 <p><code>cfdisk</code> is particularly useful for those who find <code>fdisk</code>'s command-line interface too complex or want a faster way to create, delete, and modify partitions. While it lacks some of the advanced features of <code>parted</code>, it is perfect for common partitioning tasks such as:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Creating partitions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Deleting partitions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Changing partition types (e.g., setting a partition as Linux, swap, or NTFS) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Setting partitions as bootable 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p><code>cfdisk</code> operates on block devices such as <code>/dev/sda</code>, <code>/dev/nvme0n1</code>, or <code>/dev/mmcblk0</code>, and changes are only committed when you write them to the disk. Until that point, no data is altered, making it a relatively safe tool to experiment with.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Installing <code>cfdisk</code>
<!-- /wp:heading -->

 <p>Before you begin, ensure that <code>cfdisk</code> is installed on your system. Most Linux distributions include <code>cfdisk</code> by default, but if it is missing, you can install it using your package manager.
 

 <p>For ***Debian/Ubuntu***  systems:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get install util-linux</code></pre>
<!-- /wp:code -->

 <p>For ***Fedora*** :
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf install util-linux</code></pre>
<!-- /wp:code -->

 <p>For ***Arch Linux*** :
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo pacman -S util-linux</code></pre>
<!-- /wp:code -->

 <p>The <code>cfdisk</code> tool is part of the <code>util-linux</code> package, which is widely available on almost all Linux distributions.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Basic Usage and Interface
<!-- /wp:heading -->

 <p>To begin working with <code>cfdisk</code>, you need to specify the disk you want to manage. For example, to work on the first disk (<code>/dev/sda</code>), run the following command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sda</code></pre>
<!-- /wp:code -->

 <p>This command will open an interactive text-based interface where you can perform various partitioning tasks.
 


 ### Key Sections of the Interface:
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Disk Information*** : At the top of the screen, you’ll see information about the disk you’re working on, including the size of the disk and the partition table type (e.g., DOS or GPT). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Partition Table*** : Below the disk information is a list of current partitions on the disk. Each partition is displayed with its start and end points, size, file system type, and label. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Menu Options*** : At the bottom, you’ll find a menu that provides options such as ***Create*** , ***Delete*** , ***Type*** , ***Write*** , and ***Quit*** . You can navigate through these options using the arrow keys and select them by pressing ***Enter*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Working with Partition Tables
<!-- /wp:heading -->

 <p>Before creating or modifying partitions, you must ensure that the partition table is correctly set up. <code>cfdisk</code> supports both ***DOS***  and ***GPT***  partition tables.
 


 ### Creating a New Partition Table
<!-- /wp:heading -->

 <p>To create a new partition table:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open <code>cfdisk</code> on the disk you want to partition: <code>sudo cfdisk /dev/sda</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Use the arrow keys to select the ***[Label]***  option, which allows you to create a new partition table. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select either ***gpt***  or ***dos***  depending on your requirements: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***GPT***  (GUID Partition Table) is suitable for disks larger than 2 TB or when using UEFI boot. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DOS***  is more common for legacy BIOS systems and smaller disks. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Choosing the correct partition table is crucial for compatibility with your system’s boot method.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Creating Partitions with <code>cfdisk</code>
<!-- /wp:heading -->

 <p>Once the partition table is set, you can begin creating partitions. Here’s an example where we create three partitions:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- A root partition (<code>/</code>) of 50 GB 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- A swap partition of 8 GB 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- A home partition (<code>/home</code>) with the remaining space 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Create Root Partition*** :<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- In the <code>cfdisk</code> interface, select ***[New]***  to create a new partition. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Choose the size of the partition. For this example, enter ***50G***  for the root partition. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- After setting the size, you'll be prompted to choose whether the partition should be ***Primary***  or ***Logical*** . For the first partition on a DOS table, select ***Primary*** . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Now, mark the partition as bootable by selecting ***[Bootable]*** . This is required for the partition from which you will boot your system. 
<!-- /wp:list-item --> 
<!-- /wp:list --> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Create Swap Partition*** :<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- After creating the root partition, select ***[New]***  again to create another partition. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enter ***8G***  as the size of this partition for the swap area. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Use the ***[Type]***  option to change the partition type to ***82 (Linux swap)*** . 
<!-- /wp:list-item --> 
<!-- /wp:list --> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Create Home Partition*** :<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Finally, use the remaining space to create the home partition. Select ***[New]***  and assign the remaining size. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- No special settings are required for the home partition unless you want to change the file system type. 
<!-- /wp:list-item --> 
<!-- /wp:list --> 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Example:
<!-- /wp:heading -->

 <p>After completing these steps, the partition table might look something like this:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/dev/sda1   50G   Linux filesystem
/dev/sda2   8G    Linux swap
/dev/sda3   Remaining size  Linux filesystem</code></pre>
<!-- /wp:code -->

 <p>Once the partitions are set, navigate to ***[Write]***  to commit your changes to disk. <code>cfdisk</code> will ask you to type "yes" to confirm that you want to write the changes. Afterward, you can quit the program by selecting ***[Quit]*** .
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Deleting and Modifying Partitions
<!-- /wp:heading -->


 ### Deleting a Partition
<!-- /wp:heading -->

 <p>If you need to delete a partition, use the ***[Delete]***  option in the <code>cfdisk</code> interface:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Select the partition you want to delete using the arrow keys. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select ***[Delete]*** , and the partition will be removed from the partition table. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Deleted partitions remain uncommitted until you choose to write the changes. This gives you the flexibility to undo changes before they are final.
 


 ### Changing Partition Types
<!-- /wp:heading -->

 <p>Sometimes you might want to change the type of an existing partition (e.g., setting a partition as ***swap***  or ***EFI system*** ). Use the ***[Type]***  option to assign a different type to the selected partition.
 

 <p>For example:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Type -&gt; 82 (Linux swap)</code></pre>
<!-- /wp:code -->

 <p>or
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Type -&gt; EF00 (EFI system)</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Practical <code>cfdisk</code> Use Cases
<!-- /wp:heading -->


 ### 1. Preparing a Disk for Linux Installation
<!-- /wp:heading -->

 <p>When installing a new Linux distribution, partitioning is often required. Using <code>cfdisk</code>, you can easily create partitions for ***root*** , ***home*** , ***swap*** , and ***boot***  partitions before installation.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sda</code></pre>
<!-- /wp:code -->

 <p>Then create the necessary partitions (e.g., <code>/</code>, <code>/boot</code>, <code>/home</code>, swap) and set the appropriate types and bootable flags.
 


 ### 2. Partitioning a New External Drive
<!-- /wp:heading -->

 <p>Suppose you have a new external drive (<code>/dev/sdb</code>) that you want to partition for use as a backup drive. Using <code>cfdisk</code>, you can create a large partition and set the partition type to ***Linux filesystem***  for ext4 formatting later.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo cfdisk /dev/sdb</code></pre>
<!-- /wp:code -->

 <p>Create a partition with the desired size and write the changes. Once done, format the partition using the <code>mkfs</code> command:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkfs.ext4 /dev/sdb1</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Advantages and Limitations of <code>cfdisk</code>
<!-- /wp:heading -->


 ### Advantages:
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Intuitive Interface*** : The text-based interface is easy to navigate compared to <code>fdisk</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Safe to Use*** : Until changes are written to disk, <code>cfdisk</code> does not modify your data. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Wide Compatibility*** : Supports both DOS and GPT partition tables. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Limitations:
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Limited Features*** : Compared to <code>parted</code>, <code>cfdisk</code> lacks advanced features such as resizing partitions or aligning them to sector boundaries. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Non-Graphical*** : While more user-friendly than <code>fdisk</code>, it still requires working in a text-based interface, which might not be ideal for all users. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Conclusion
<!-- /wp:heading -->

 <p>The <code>cfdisk</code> command is a straightforward yet powerful tool for managing partitions in Linux. For advanced users, it offers an efficient way to perform common partitioning tasks without the complexity of <code>fdisk</code> or the need for a full graphical interface. Whether you’re setting up a new disk, preparing for an installation, or managing storage on a server, <code>cfdisk</code> provides a reliable method to create, delete, and modify partitions with ease.
 

 <p>By mastering <code>cfdisk</code>, you gain the ability to handle disk management tasks in almost any environment, from desktop setups to headless servers.
 