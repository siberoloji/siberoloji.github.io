---
draft: false

title:  'Configuring FreeSWITCH for the First Time on Ubuntu Server'
date: '2024-10-29T13:38:37+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This comprehensive guide will walk you through the initial setup and configuration process, helping you establish a solid foundation for your VoIP system with FreeSWITCH.' 
 
url:  /configuring-freeswitch-for-the-first-time-on-ubuntu-server/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


Setting up FreeSWITCH on an Ubuntu server can seem daunting at first, but with the right guidance, it becomes a manageable task. This comprehensive guide will walk you through the initial setup and configuration process, helping you establish a solid foundation for your VoIP system with FreeSWITCH.



## Introduction to FreeSWITCH



<a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> is a scalable open-source telephony platform designed to route and interconnect various communication protocols using audio, video, text, or any other form of media. It's particularly popular for its flexibility and robust performance in handling VoIP communications.



## Prerequisites



Before beginning the installation process, ensure your Ubuntu server meets these requirements:


* Ubuntu 20.04 LTS or newer

* Minimum 2GB RAM (4GB recommended)

* At least 20GB of free disk space

* Root or sudo access

* Active internet connection

* Basic knowledge of the Linux command line




## Installation Process



1. System Preparation



First, update your system and install the necessary dependencies:


```bash
sudo apt update &amp;&amp; sudo apt upgrade -y
sudo apt install -y git wget tar build-essential automake autoconf libtool \
    libtool-bin pkg-config libssl-dev zlib1g-dev libdb-dev unixodbc-dev \
    libncurses5-dev libexpat1-dev libgdbm-dev bison erlang-dev libesl-dev
```



2. Installing FreeSWITCH


#### Clone the Repository


```bash
cd /usr/src/
git clone https://github.com/signalwire/freeswitch.git -b v1.10 freeswitch
cd freeswitch
```


#### Prepare the Build


```bash
./bootstrap.sh
```


#### Configure the Build


```bash
./configure --enable-portable-binary \
           --prefix=/usr/local/freeswitch \
           --enable-core-pgsql-support \
           --enable-static-sqlite \
           --enable-core-odbc-support```


#### Compile and Install


```bash
make
sudo make install
sudo make cd-sounds-install
sudo make cd-moh-install
```



## Initial Configuration



1. Directory Structure Setup



FreeSWITCH's configuration files are located in `/usr/local/freeswitch/conf`. The main configuration hierarchy is:


```bash
/usr/local/freeswitch/conf/
├── autoload_configs/
├── dialplan/
├── directory/
├── freeswitch.xml
├── sip_profiles/
└── vars.xml
```



2. Basic Configuration Files


#### Configure vars.xml



The `vars.xml` file contains global variables. Edit it to match your environment:


```
<include>
  <X-PRE-PROCESS cmd="set" data="domain=your-domain.com"/>
  <X-PRE-PROCESS cmd="set" data="local_ip_v4=auto"/>
  <X-PRE-PROCESS cmd="set" data="external_rtp_ip=auto-nat"/>
  <X-PRE-PROCESS cmd="set" data="external_sip_ip=auto-nat"/>
</include>
```


#### Configure SIP Profiles



Navigate to `/usr/local/freeswitch/conf/sip_profiles/` and modify `internal.xml`:


```
<profile name="internal">
  <settings>
    <param name="auth-calls" value="true"/>
    <param name="apply-inbound-acl" value="domains"/>
    <param name="local-network-acl" value="localnet.auto"/>
    <param name="debug" value="0"/>
    <param name="sip-port" value="5060"/>
  </settings>
</profile>
```



3. Setting Up Extensions



Create a new user directory file in `/usr/local/freeswitch/conf/directory/default/`:


```
<include>
  <user id="1000">
    <params>
      <param name="password" value="your_secure_password"/>
      <param name="vm-password" value="1000"/>
    </params>
    <variables>
      <variable name="toll_allow" value="domestic,international,local"/>
      <variable name="accountcode" value="1000"/>
      <variable name="user_context" value="default"/>
      <variable name="effective_caller_id_name" value="Extension 1000"/>
      <variable name="effective_caller_id_number" value="1000"/>
    </variables>
  </user>
</include>
```



## Security Configuration



1. Firewall Setup



Configure UFW to allow necessary ports:


```bash
sudo ufw allow 5060/udp  # SIP
sudo ufw allow 5061/tcp  # SIP TLS
sudo ufw allow 16384:32768/udp  # RTp
```



2. ACL Configuration



Modify `/usr/local/freeswitch/conf/autoload_configs/acl.conf.xml`:


```
<configuration name="acl.conf" description="Network Lists">
  <network-lists>
    <list name="trusted" default="deny">
      <node type="allow" cidr="192.168.0.0/24"/>
      <node type="allow" cidr="10.0.0.0/8"/>
    </list>
  </network-lists>
</configuration>
```



## Starting and Managing FreeSWITCH



1. Create Systemd Service



Create `/etc/systemd/system/freeswitch.service`:


```bash
[Unit]
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
WantedBy=multi-user.target```



2. Start and Enable FreeSWITCH


```bash
sudo systemctl daemon-reload
sudo systemctl start freeswitch
sudo systemctl enable freeswitch
```



## Verification and Testing



1. Check Service Status


```bash
sudo systemctl status freeswitch
```



2. Connect to the FreeSWITCH Console


```bash
/usr/local/freeswitch/bin/fs_cli```



3. Basic Testing Commands



Within fs_cli, try these commands:


```bash
status
sofia status
sofia status profile internal
show registrations
```



## Troubleshooting Common Issues



1. Log Analysis



Monitor logs in real-time:


```bash
tail -f /usr/local/freeswitch/log/freeswitch.log```



2. Common Problems and Solutions


#### SIP Registration Issues


* Check firewall rules

* Verify SIP profile configuration

* Ensure correct credentials in directory files



#### Audio Problems


* Verify RTP port range is open in the firewall

* Check NAT settings in vars.xml

* Confirm codec settings in the configuration




## Performance Tuning



1. System Optimization



Add to `/etc/sysctl.conf`:


```bash
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216```



2. FreeSWITCH Settings



Modify `/usr/local/freeswitch/conf/autoload_configs/switch.conf.xml`:


```
<param name="max-sessions" value="1000"/>
<param name="sessions-per-second" value="30"/>
<param name="rtp-start-port" value="16384"/>
<param name="rtp-end-port" value="32768"/>
```



## Conclusion



This guide has covered the essential steps for setting up and configuring FreeSWITCH on Ubuntu Server. Remember that this is just the beginning – FreeSWITCH offers many more advanced features and configurations that you can explore based on your specific needs.



Regular maintenance, security updates, and monitoring are crucial for maintaining a healthy FreeSWITCH installation. As you become more familiar with the system, you can start exploring more advanced features like:


* Implementing complex dialplans

* Setting up conference bridges

* Configuring voicemail systems

* Integrating with external services

* Implementing WebRTC support




Keep your FreeSWITCH installation up to date and regularly check the official documentation and community forums for best practices and security advisories.
