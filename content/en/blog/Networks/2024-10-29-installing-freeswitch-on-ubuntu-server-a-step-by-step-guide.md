---
draft: false

title:  'Installing FreeSWITCH on Ubuntu Server: A Step-by-Step Guide'
date: '2024-10-29T13:19:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Follow our detailed guide on installing FreeSWITCH on Ubuntu. Learn each step, from prerequisites to configuration, to build a high-performance VoIP server on your Ubuntu system.' 
 
url:  /installing-freeswitch-on-ubuntu-server-a-step-by-step-guide/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


## Introduction



**FreeSWITCH** is a powerful open-source communications platform widely used for VoIP, video, and chat applications. It’s designed to facilitate large-scale telecommunication systems, supporting a broad range of protocols and codecs, making it highly versatile and efficient. Setting up <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> on an Ubuntu server offers a reliable and cost-effective way to manage and scale communications. This step-by-step guide will walk you through the process of installing FreeSWITCH on Ubuntu. Whether you’re a beginner or a seasoned system administrator, this guide will help you get FreeSWITCH up and running in no time.



## System Requirements



Before starting the installation, make sure you have the following:


* **Ubuntu Server**: This guide is compatible with Ubuntu 18.04, 20.04, and later versions.

* **2 GB RAM or higher**: A minimum of 2 GB of RAM is recommended.

* **Processor**: A modern multi-core processor is preferred.

* **Root or Sudo Access**: Ensure you have administrative privileges.






## Updating the Ubuntu Server



To begin, it’s important to update your Ubuntu system to ensure all packages are up to date:


```bash
sudo apt update &amp;&amp; sudo apt upgrade -y
```



This command updates your package lists and installs the latest versions of all packages.





## Installing Dependencies



FreeSWITCH requires a set of dependencies for a successful installation. Begin by installing these necessary packages:


```bash
sudo apt install -y build-essential git-core cmake automake autoconf libtool pkg-config \
libjpeg-dev libncurses5-dev libssl-dev libpcre3-dev libcurl4-openssl-dev libldns-dev \
libedit-dev libsqlite3-dev libopus-dev libsndfile1-dev libavformat-dev libswscale-dev \
libvpx-dev libavresample-dev libavfilter-dev libxml2-dev libxslt1-dev libmp3lame-dev \
libspeexdsp-dev libspeex-dev libogg-dev libvorbis-dev libtiff-dev libtiff5-dev libpq-dev
```



This command installs all required libraries and tools needed to compile and run FreeSWITCH.





## Cloning the FreeSWITCH Source Code



Next, clone the FreeSWITCH repository from GitHub. This will allow you to build FreeSWITCH from the latest source:


```bash
cd /usr/local/src
sudo git clone https://github.com/signalwire/freeswitch.git
cd freeswitch
```



The `cd` command changes the directory to where FreeSWITCH will be downloaded, and then the `git clone` command retrieves the FreeSWITCH source code.



Checking Out the Latest Stable Version



FreeSWITCH has both master and stable branches. To ensure a stable installation, switch to the latest stable version:


```bash
sudo git checkout v1.10
```



This command switches to the latest stable release, which is currently **v1.10**.





## Building and Compiling FreeSWITCH



With the source code downloaded, it’s time to build and compile FreeSWITCH. First, install FreeSWITCH’s core dependencies:


```bash
sudo ./bootstrap.sh -j
sudo ./configure -C
```



The `bootstrap.sh` script prepares the FreeSWITCH environment for compilation, while `configure -C` optimizes the build process.



Compiling the Source Code



Now, compile the source code using the `make` command:


```bash
sudo make
sudo make install
```



This process may take some time depending on your system’s resources. The `make` command compiles FreeSWITCH and `make install` installs it onto your system.





## Installing FreeSWITCH Modules



FreeSWITCH’s functionality is enhanced by its modular structure, allowing you to install only the features you need. Use the following command to install all essential modules:


```bash
sudo make all cd-sounds-install cd-moh-install
```


* **cd-sounds-install**: Installs sound files for ringtones and other audio.

* **cd-moh-install**: Installs Music on Hold files.




These modules are essential for a fully operational FreeSWITCH instance.





## Configuring FreeSWITCH



FreeSWITCH comes with a default configuration suitable for most basic setups. However, you may need to customize it based on your requirements.


* **Navigate to the Configuration Directory:**



```bash
   cd /usr/local/freeswitch/conf```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Edit Core Configuration Files:** Use any text editor to modify the configuration files, such as `vars.xml` or `sip_profiles` for SIP settings:



```bash
   sudo nano vars.xml
```



Adjust settings based on your network and user needs, including parameters for IP addresses, ports, and protocol settings.





## Starting FreeSWITCH



Once configured, FreeSWITCH is ready to start. You can start it directly from the terminal:


```bash
/usr/local/freeswitch/bin/freeswitch
```



This command launches FreeSWITCH in the foreground, allowing you to see the output and check for any immediate issues.



Running FreeSWITCH in the Background



To run FreeSWITCH as a background process, use:


```bash
/usr/local/freeswitch/bin/freeswitch -nc```



The `-nc` flag runs FreeSWITCH in non-console mode, making it ideal for production servers.





## Testing the Installation



To ensure FreeSWITCH is working correctly, log in to the FreeSWITCH CLI by typing:


```bash
/usr/local/freeswitch/bin/fs_cli```



This command opens the FreeSWITCH Command Line Interface, where you can test various commands and ensure the system is functioning as expected.



Basic Test Commands



Try using the following commands within the CLI to confirm the setup:


* `status`: Displays the status of FreeSWITCH.

* `sofia status`: Shows SIP profiles and registration status.

* `reloadxml`: Reloads XML configuration files without restarting FreeSWITCH.






## Setting Up FreeSWITCH as a System Service



To simplify management, set up FreeSWITCH as a system service:


* **Create a Service File:**



```bash
   sudo nano /etc/systemd/system/freeswitch.service```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Add Service Configuration:** Paste the following configuration into the file:



```bash
   [Unit]
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
   WantedBy=multi-user.target```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* **Enable and Start the Service:**



```bash
   sudo systemctl enable freeswitch
   sudo systemctl start freeswitch
```



This configuration file allows you to manage FreeSWITCH with `systemctl`, making it easier to control FreeSWITCH at boot.





## Troubleshooting Common Installation Issues



Dependency Errors



If you encounter dependency errors, double-check that all required packages were installed in the dependencies step. Run `sudo apt update` and `sudo apt install` as needed to ensure all dependencies are in place.



Service Not Starting



If FreeSWITCH fails to start as a service, use `journalctl -xe` to check for errors in the system logs. Adjust the configuration as needed and restart the service.





## Security and Best Practices


* **Limit Access:** Use firewalls to restrict access to your FreeSWITCH server and prevent unauthorized access.

* **Enable Logging:** Enable detailed logging to monitor activity and troubleshoot issues.

* **Regular Updates:** Keep FreeSWITCH and your Ubuntu server up to date to protect against security vulnerabilities.






## Conclusion



FreeSWITCH offers a robust platform for VoIP and communications solutions, and installing it on an Ubuntu server is a great way to leverage its features. By following this step-by-step guide, you should have a fully functional FreeSWITCH instance up and running. From dependencies and configuration to troubleshooting, this guide provides everything you need to set up FreeSWITCH successfully. With this setup, you’ll be well-equipped to handle VoIP and communication needs efficiently and securely.
