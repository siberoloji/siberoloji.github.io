---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T13:19:07Z"
excerpt: Follow our detailed guide on installing FreeSWITCH on Ubuntu. Learn each
  step, from prerequisites to configuration, to build a high-performance VoIP server
  on your Ubuntu system.
guid: https://www.siberoloji.com/?p=5546
id: 5546
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: 'Installing FreeSWITCH on Ubuntu Server: A Step-by-Step Guide'
url: /installing-freeswitch-on-ubuntu-server-a-step-by-step-guide/
---

 
 ## Introduction
<!-- /wp:heading -->

  ***FreeSWITCH***  is a powerful open-source communications platform widely used for VoIP, video, and chat applications. It’s designed to facilitate large-scale telecommunication systems, supporting a broad range of protocols and codecs, making it highly versatile and efficient. Setting up <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> on an Ubuntu server offers a reliable and cost-effective way to manage and scale communications. This step-by-step guide will walk you through the process of installing FreeSWITCH on Ubuntu. Whether you’re a beginner or a seasoned system administrator, this guide will help you get FreeSWITCH up and running in no time. 
 

 
 ## System Requirements
<!-- /wp:heading -->

  Before starting the installation, make sure you have the following: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Ubuntu Server*** : This guide is compatible with Ubuntu 18.04, 20.04, and later versions. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***2 GB RAM or higher*** : A minimum of 2 GB of RAM is recommended. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Processor*** : A modern multi-core processor is preferred. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Root or Sudo Access*** : Ensure you have administrative privileges. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Updating the Ubuntu Server
<!-- /wp:heading -->

  To begin, it’s important to update your Ubuntu system to ensure all packages are up to date: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt update &amp;&amp; sudo apt upgrade -y</code></pre>
<!-- /wp:code -->

  This command updates your package lists and installs the latest versions of all packages. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Installing Dependencies
<!-- /wp:heading -->

  FreeSWITCH requires a set of dependencies for a successful installation. Begin by installing these necessary packages: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt install -y build-essential git-core cmake automake autoconf libtool pkg-config \
libjpeg-dev libncurses5-dev libssl-dev libpcre3-dev libcurl4-openssl-dev libldns-dev \
libedit-dev libsqlite3-dev libopus-dev libsndfile1-dev libavformat-dev libswscale-dev \
libvpx-dev libavresample-dev libavfilter-dev libxml2-dev libxslt1-dev libmp3lame-dev \
libspeexdsp-dev libspeex-dev libogg-dev libvorbis-dev libtiff-dev libtiff5-dev libpq-dev</code></pre>
<!-- /wp:code -->

  This command installs all required libraries and tools needed to compile and run FreeSWITCH. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Cloning the FreeSWITCH Source Code
<!-- /wp:heading -->

  Next, clone the FreeSWITCH repository from GitHub. This will allow you to build FreeSWITCH from the latest source: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /usr/local/src
sudo git clone https://github.com/signalwire/freeswitch.git
cd freeswitch</code></pre>
<!-- /wp:code -->

  The <code>cd</code> command changes the directory to where FreeSWITCH will be downloaded, and then the <code>git clone</code> command retrieves the FreeSWITCH source code. 
 


 ### Checking Out the Latest Stable Version
<!-- /wp:heading -->

  FreeSWITCH has both master and stable branches. To ensure a stable installation, switch to the latest stable version: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo git checkout v1.10</code></pre>
<!-- /wp:code -->

  This command switches to the latest stable release, which is currently ***v1.10*** . 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Building and Compiling FreeSWITCH
<!-- /wp:heading -->

  With the source code downloaded, it’s time to build and compile FreeSWITCH. First, install FreeSWITCH’s core dependencies: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo ./bootstrap.sh -j
sudo ./configure -C</code></pre>
<!-- /wp:code -->

  The <code>bootstrap.sh</code> script prepares the FreeSWITCH environment for compilation, while <code>configure -C</code> optimizes the build process. 
 


 ### Compiling the Source Code
<!-- /wp:heading -->

  Now, compile the source code using the <code>make</code> command: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo make
sudo make install</code></pre>
<!-- /wp:code -->

  This process may take some time depending on your system’s resources. The <code>make</code> command compiles FreeSWITCH and <code>make install</code> installs it onto your system. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Installing FreeSWITCH Modules
<!-- /wp:heading -->

  FreeSWITCH’s functionality is enhanced by its modular structure, allowing you to install only the features you need. Use the following command to install all essential modules: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo make all cd-sounds-install cd-moh-install</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***cd-sounds-install*** : Installs sound files for ringtones and other audio. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***cd-moh-install*** : Installs Music on Hold files. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  These modules are essential for a fully operational FreeSWITCH instance. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Configuring FreeSWITCH
<!-- /wp:heading -->

  FreeSWITCH comes with a default configuration suitable for most basic setups. However, you may need to customize it based on your requirements. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Navigate to the Configuration Directory:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   cd /usr/local/freeswitch/conf</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Edit Core Configuration Files:***  Use any text editor to modify the configuration files, such as <code>vars.xml</code> or <code>sip_profiles</code> for SIP settings: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano vars.xml</code></pre>
<!-- /wp:code -->

  Adjust settings based on your network and user needs, including parameters for IP addresses, ports, and protocol settings. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Starting FreeSWITCH
<!-- /wp:heading -->

  Once configured, FreeSWITCH is ready to start. You can start it directly from the terminal: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/bin/freeswitch</code></pre>
<!-- /wp:code -->

  This command launches FreeSWITCH in the foreground, allowing you to see the output and check for any immediate issues. 
 


 ### Running FreeSWITCH in the Background
<!-- /wp:heading -->

  To run FreeSWITCH as a background process, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/bin/freeswitch -nc</code></pre>
<!-- /wp:code -->

  The <code>-nc</code> flag runs FreeSWITCH in non-console mode, making it ideal for production servers. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Testing the Installation
<!-- /wp:heading -->

  To ensure FreeSWITCH is working correctly, log in to the FreeSWITCH CLI by typing: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/bin/fs_cli</code></pre>
<!-- /wp:code -->

  This command opens the FreeSWITCH Command Line Interface, where you can test various commands and ensure the system is functioning as expected. 
 


 ### Basic Test Commands
<!-- /wp:heading -->

  Try using the following commands within the CLI to confirm the setup: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- <code>status</code>: Displays the status of FreeSWITCH. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>sofia status</code>: Shows SIP profiles and registration status. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>reloadxml</code>: Reloads XML configuration files without restarting FreeSWITCH. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Setting Up FreeSWITCH as a System Service
<!-- /wp:heading -->

  To simplify management, set up FreeSWITCH as a system service: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Create a Service File:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /etc/systemd/system/freeswitch.service</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Add Service Configuration:***  Paste the following configuration into the file: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   [Unit]
   Description=FreeSWITCH Service
   After=network.target

   [Service]
   Type=forking
   ExecStart=/usr/local/freeswitch/bin/freeswitch -ncwait -nonat
   ExecStop=/usr/local/freeswitch/bin/freeswitch -stop
   User=root
   Group=root
   Restart=always

   [Install]
   WantedBy=multi-user.target</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- ***Enable and Start the Service:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo systemctl enable freeswitch
   sudo systemctl start freeswitch</code></pre>
<!-- /wp:code -->

  This configuration file allows you to manage FreeSWITCH with <code>systemctl</code>, making it easier to control FreeSWITCH at boot. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Troubleshooting Common Installation Issues
<!-- /wp:heading -->


 ### Dependency Errors
<!-- /wp:heading -->

  If you encounter dependency errors, double-check that all required packages were installed in the dependencies step. Run <code>sudo apt update</code> and <code>sudo apt install</code> as needed to ensure all dependencies are in place. 
 


 ### Service Not Starting
<!-- /wp:heading -->

  If FreeSWITCH fails to start as a service, use <code>journalctl -xe</code> to check for errors in the system logs. Adjust the configuration as needed and restart the service. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Security and Best Practices
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Limit Access:***  Use firewalls to restrict access to your FreeSWITCH server and prevent unauthorized access. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Enable Logging:***  Enable detailed logging to monitor activity and troubleshoot issues. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Regular Updates:***  Keep FreeSWITCH and your Ubuntu server up to date to protect against security vulnerabilities. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## Conclusion
<!-- /wp:heading -->

  FreeSWITCH offers a robust platform for VoIP and communications solutions, and installing it on an Ubuntu server is a great way to leverage its features. By following this step-by-step guide, you should have a fully functional FreeSWITCH instance up and running. From dependencies and configuration to troubleshooting, this guide provides everything you need to set up FreeSWITCH successfully. With this setup, you’ll be well-equipped to handle VoIP and communication needs efficiently and securely. 
 