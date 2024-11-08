---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "8"
categories:
- Linux Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-23T13:05:41Z"
excerpt: You can think of the "apropos" command as the search engine for man pages.
  This command searches command names and short descriptions.
guid: https://www.siberoloji.com/?p=734
id: 734
image: /assets/images/2024/01/bash-1.png
tags:
- linux
- linux fundamentals
- os
title: apropos command in Linux
url: /apropos-command-in-linux/
---

  You may sometimes have problems remembering ready-made commands on the Linux command line. You may not remember which command is related to what. In such a case, you can search the definitions on the command manual pages with the "apropos" command and find what you are looking for more easily. In this article, we will give examples of the use of the "apropos" command. 
 

 
 ## apropos command</h2>
<!-- /wp:heading -->

  You can think of the "apropos" command as the search engine for man pages. This command searches command names and short descriptions. It does not search all help pages. Below is a simple example. This command will list all commands that contain "unzip" anywhere in their help page descriptions or command names. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos unzip
bunzip2 (1)          - a block-sorting file compressor, v1.0.8
funzip (1)           - filter for extracting from a ZIP archive in a pipe
gunzip (1)           - compress or expand files
unzip (1)            - list, test and extract compressed files in a ZIP archive
unzipsfx (1)         - self-extracting stub for prepending to ZIP archives</code></pre>
<!-- /wp:code -->

  Beyond the simple usage seen in this example, it is possible to use the command at an advanced level by using some options. You can see the options available to you in the list below. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos -h
Usage: apropos [OPTION...] KEYWORD...

  -d, --debug                emit debugging messages
  -v, --verbose              print verbose warning messages
  -e, --exact                search each keyword for exact match
  -r, --regex                interpret each keyword as a regex
  -w, --wildcard             the keyword(s) contain wildcards
  -a, --and                  require all keywords to match
  -l, --long                 do not trim output to terminal width
  -C, --config-file=FILE     use this user configuration file
  -L, --locale=LOCALE        define the locale for this search
  -m, --systems=SYSTEM       use manual pages from other systems
  -M, --manpath=PATH         set search path for manual pages to PATH
  -s, --sections=LIST, --section=LIST
                             search only these sections (colon-separated)
  -?, --help                 give this help list
      --usage                give a short usage message
  -V, --version              print program version</code></pre>
<!-- /wp:code -->

 
 ## -e, --exact</h2>
<!-- /wp:heading -->

  The phrase you are looking for must match exactly. Below you can see the use of the expression "partiti" with and without the -e option. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos -e partiti
partiti: nothing appropriate.

linux@rpi4:~ $ apropos  partiti
addpart (8)          - tell the kernel about the existence of a partition
cfdisk (8)           - display or manipulate a disk partition table
cgdisk (8)           - Curses-based GUID partition table (GPT) manipulator
delpart (8)          - tell the kernel to forget about a partition
fdisk (8)            - manipulate disk partition table
fixparts (8)         - MBR partition table repair utility
gdisk (8)            - Interactive GUID partition table (GPT) manipulator
gparted (8)          - GNOME Partition Editor for manipulating disk partitions.
parted (8)           - a partition manipulation program
partprobe (8)        - inform the OS of partition table changes
partx (8)            - tell the kernel about the presence and numbering of on-disk partitions
repart.d (5)         - Partition Definition Files for Automatic Boot-Time Repartitioning
resizepart (8)       - tell the kernel about the new size of a partition
sfdisk (8)           - display or manipulate a disk partition table
sgdisk (8)           - Command-line GUID partition table (GPT) manipulator for Linux and Unix
systemd-gpt-auto-generator (8) - Generator for automatically discovering and mounting root, /home/, /srv/, ...
systemd-repart (8)   - Automatically grow and add partitions
systemd-repart.service (8) - Automatically grow and add partitions</code></pre>
<!-- /wp:code -->

 
 ## -r, --regex</h2>
<!-- /wp:heading -->

  If you want to include regular expressions in your search expression, you can use them. For example, ^ means "head side" in regular expressions. Let's try to find the commands that start with "tar". As you can see, the apropos command found 2 commands whose command name starts with "tar" and also found another command whose description begins with Tar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos -r '^tar'
systemd.target (5)   - Target unit configuration
tar (1)              - an archiving utility
tarcat (1)           - concatenates the pieces of a GNU tar multi-volume archive</code></pre>
<!-- /wp:code -->

 
 ## -a, --and</h2>
<!-- /wp:heading -->

  You can use it when all the expressions you are searching for must be found. Let's search for help pages that contain "tar" and "file" in the command name or description. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos -a tar file
gpgtar (1)           - Encrypt or sign files into an archive
ptargrep (1)         - Apply pattern matching to the contents of files in a tar archive
qt-faststart (1)     - utility for Quicktime files
swapoff (2)          - start/stop swapping to file/device
swapon (2)           - start/stop swapping to file/device
systemd-xdg-autostart-generator (8) - User unit generator for XDG autostart files</code></pre>
<!-- /wp:code -->

 
 ## -w, --wildcard</h2>
<!-- /wp:heading -->

  It indicates that you are using wildcard characters in the expression you want to search. For example, it is used when you want to find all expressions that start with "color" and whatever follows. In our example, all comments containing "color", "colorization", "color-name", "colormap" were found. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">linux@rpi4:~ $ apropos -w color*
cd-create-profile (1) - Color Manager Profile Creation Tool
cd-fix-profile (1)   - Color Manager Testing Tool
cd-it8 (1)           - Color Manager Testing Tool
colormgr (1)         - Color Manager Testing Tool
dircolors (1)        - color setup for ls
hp-colorcal (1)      - Printer Cartridge Color Calibration Utility
setvtrgb (1)         - customize the console color map
showrgb (1)          - display an rgb color-name database
terminal-colors.d (5) - configure output colorization for various utilities
xcmsdb (1)           - Device Color Characterization utility for X Color Management System
XcupGetReservedColormapEntries (3) - list colormap entries reserved by the system
XcupStoreColors (3)  - initialize shareable colormap entries at specific locations
xstdcmap (1)         - X standard colormap utility</code></pre>
<!-- /wp:code -->

  In this article, we explained the "apropos" command and frequently used options. For more detailed information, you can look at the help pages with the "man apropos" command. 
 