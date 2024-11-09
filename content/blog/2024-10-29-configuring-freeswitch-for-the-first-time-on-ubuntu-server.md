---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T13:38:37Z"
excerpt: This comprehensive guide will walk you through the initial setup and configuration
  process, helping you establish a solid foundation for your VoIP system with FreeSWITCH.
guid: https://www.siberoloji.com/?p=5551
id: 5551
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: Configuring FreeSWITCH for the First Time on Ubuntu Server
url: /configuring-freeswitch-for-the-first-time-on-ubuntu-server/
---

  Setting up FreeSWITCH on an Ubuntu server can seem daunting at first, but with the right guidance, it becomes a manageable task. This comprehensive guide will walk you through the initial setup and configuration process, helping you establish a solid foundation for your VoIP system with FreeSWITCH. 
 

 
 ## Introduction to FreeSWITCH
<!-- /wp:heading -->

  <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> is a scalable open-source telephony platform designed to route and interconnect various communication protocols using audio, video, text, or any other form of media. It's particularly popular for its flexibility and robust performance in handling VoIP communications. 
 

 
 ## Prerequisites
<!-- /wp:heading -->

  Before beginning the installation process, ensure your Ubuntu server meets these requirements: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Ubuntu 20.04 LTS or newer 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Minimum 2GB RAM (4GB recommended) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- At least 20GB of free disk space 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Root or sudo access 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Active internet connection 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Basic knowledge of the Linux command line 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Installation Process
<!-- /wp:heading -->


 ### 1. System Preparation
<!-- /wp:heading -->

  First, update your system and install the necessary dependencies: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt update &amp;&amp; sudo apt upgrade -y
sudo apt install -y git wget tar build-essential automake autoconf libtool \
    libtool-bin pkg-config libssl-dev zlib1g-dev libdb-dev unixodbc-dev \
    libncurses5-dev libexpat1-dev libgdbm-dev bison erlang-dev libesl-dev</code></pre>
<!-- /wp:code -->


 ### 2. Installing FreeSWITCH
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Clone the Repository 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /usr/src/
git clone https://github.com/signalwire/freeswitch.git -b v1.10 freeswitch
cd freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Prepare the Build 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">./bootstrap.sh</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configure the Build 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">./configure --enable-portable-binary \
           --prefix=/usr/local/freeswitch \
           --enable-core-pgsql-support \
           --enable-static-sqlite \
           --enable-core-odbc-support</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Compile and Install 
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">make
sudo make install
sudo make cd-sounds-install
sudo make cd-moh-install</code></pre>
<!-- /wp:code -->

 
 ## Initial Configuration
<!-- /wp:heading -->


 ### 1. Directory Structure Setup
<!-- /wp:heading -->

  FreeSWITCH's configuration files are located in <code>/usr/local/freeswitch/conf</code>. The main configuration hierarchy is: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/conf/
├── autoload_configs/
├── dialplan/
├── directory/
├── freeswitch.xml
├── sip_profiles/
└── vars.xml</code></pre>
<!-- /wp:code -->


 ### 2. Basic Configuration Files
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configure vars.xml 
<!-- /wp:heading -->

  The <code>vars.xml</code> file contains global variables. Edit it to match your environment: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;X-PRE-PROCESS cmd="set" data="domain=your-domain.com"/&gt;
  &lt;X-PRE-PROCESS cmd="set" data="local_ip_v4=auto"/&gt;
  &lt;X-PRE-PROCESS cmd="set" data="external_rtp_ip=auto-nat"/&gt;
  &lt;X-PRE-PROCESS cmd="set" data="external_sip_ip=auto-nat"/&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Configure SIP Profiles 
<!-- /wp:heading -->

  Navigate to <code>/usr/local/freeswitch/conf/sip_profiles/</code> and modify <code>internal.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;profile name="internal"&gt;
  &lt;settings&gt;
    &lt;param name="auth-calls" value="true"/&gt;
    &lt;param name="apply-inbound-acl" value="domains"/&gt;
    &lt;param name="local-network-acl" value="localnet.auto"/&gt;
    &lt;param name="debug" value="0"/&gt;
    &lt;param name="sip-port" value="5060"/&gt;
  &lt;/settings&gt;
&lt;/profile&gt;</code></pre>
<!-- /wp:code -->


 ### 3. Setting Up Extensions
<!-- /wp:heading -->

  Create a new user directory file in <code>/usr/local/freeswitch/conf/directory/default/</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;user id="1000"&gt;
    &lt;params&gt;
      &lt;param name="password" value="your_secure_password"/&gt;
      &lt;param name="vm-password" value="1000"/&gt;
    &lt;/params&gt;
    &lt;variables&gt;
      &lt;variable name="toll_allow" value="domestic,international,local"/&gt;
      &lt;variable name="accountcode" value="1000"/&gt;
      &lt;variable name="user_context" value="default"/&gt;
      &lt;variable name="effective_caller_id_name" value="Extension 1000"/&gt;
      &lt;variable name="effective_caller_id_number" value="1000"/&gt;
    &lt;/variables&gt;
  &lt;/user&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

 
 ## Security Configuration
<!-- /wp:heading -->


 ### 1. Firewall Setup
<!-- /wp:heading -->

  Configure UFW to allow necessary ports: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo ufw allow 5060/udp  # SIP
sudo ufw allow 5061/tcp  # SIP TLS
sudo ufw allow 16384:32768/udp  # RTP</code></pre>
<!-- /wp:code -->


 ### 2. ACL Configuration
<!-- /wp:heading -->

  Modify <code>/usr/local/freeswitch/conf/autoload_configs/acl.conf.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;configuration name="acl.conf" description="Network Lists"&gt;
  &lt;network-lists&gt;
    &lt;list name="trusted" default="deny"&gt;
      &lt;node type="allow" cidr="192.168.0.0/24"/&gt;
      &lt;node type="allow" cidr="10.0.0.0/8"/&gt;
    &lt;/list&gt;
  &lt;/network-lists&gt;
&lt;/configuration&gt;</code></pre>
<!-- /wp:code -->

 
 ## Starting and Managing FreeSWITCH
<!-- /wp:heading -->


 ### 1. Create Systemd Service
<!-- /wp:heading -->

  Create <code>/etc/systemd/system/freeswitch.service</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">[Unit]
Description=FreeSWITCH
After=syslog.target network.target local-fs.target

[Service]
User=freeswitch
Group=freeswitch
Type=forking
EnvironmentFile=-/etc/default/freeswitch
ExecStart=/usr/local/freeswitch/bin/freeswitch -nc -nonat
ExecReload=/usr/local/freeswitch/bin/fs_cli -x reload
Restart=on-failure
TimeoutStartSec=45

[Install]
WantedBy=multi-user.target</code></pre>
<!-- /wp:code -->


 ### 2. Start and Enable FreeSWITCH
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl daemon-reload
sudo systemctl start freeswitch
sudo systemctl enable freeswitch</code></pre>
<!-- /wp:code -->

 
 ## Verification and Testing
<!-- /wp:heading -->


 ### 1. Check Service Status
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl status freeswitch</code></pre>
<!-- /wp:code -->


 ### 2. Connect to the FreeSWITCH Console
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">/usr/local/freeswitch/bin/fs_cli</code></pre>
<!-- /wp:code -->


 ### 3. Basic Testing Commands
<!-- /wp:heading -->

  Within fs_cli, try these commands: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">status
sofia status
sofia status profile internal
show registrations</code></pre>
<!-- /wp:code -->

 
 ## Troubleshooting Common Issues
<!-- /wp:heading -->


 ### 1. Log Analysis
<!-- /wp:heading -->

  Monitor logs in real-time: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">tail -f /usr/local/freeswitch/log/freeswitch.log</code></pre>
<!-- /wp:code -->


 ### 2. Common Problems and Solutions
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">SIP Registration Issues 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Check firewall rules 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Verify SIP profile configuration 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Ensure correct credentials in directory files 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Audio Problems 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Verify RTP port range is open in the firewall 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Check NAT settings in vars.xml 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Confirm codec settings in the configuration 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Performance Tuning
<!-- /wp:heading -->


 ### 1. System Optimization
<!-- /wp:heading -->

  Add to <code>/etc/sysctl.conf</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216</code></pre>
<!-- /wp:code -->


 ### 2. FreeSWITCH Settings
<!-- /wp:heading -->

  Modify <code>/usr/local/freeswitch/conf/autoload_configs/switch.conf.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;param name="max-sessions" value="1000"/&gt;
&lt;param name="sessions-per-second" value="30"/&gt;
&lt;param name="rtp-start-port" value="16384"/&gt;
&lt;param name="rtp-end-port" value="32768"/&gt;</code></pre>
<!-- /wp:code -->

 
 ## Conclusion
<!-- /wp:heading -->

  This guide has covered the essential steps for setting up and configuring FreeSWITCH on Ubuntu Server. Remember that this is just the beginning – FreeSWITCH offers many more advanced features and configurations that you can explore based on your specific needs. 
 

  Regular maintenance, security updates, and monitoring are crucial for maintaining a healthy FreeSWITCH installation. As you become more familiar with the system, you can start exploring more advanced features like: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Implementing complex dialplans 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Setting up conference bridges 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configuring voicemail systems 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Integrating with external services 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Implementing WebRTC support 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Keep your FreeSWITCH installation up to date and regularly check the official documentation and community forums for best practices and security advisories. 
 