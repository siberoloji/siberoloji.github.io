---
draft: false

title:  'Installing FreeSWITCH on Alma Linux: A Step-by-Step Guide'
date: '2024-10-29T13:26:36+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Learn how to install FreeSWITCH on Alma Linux with this comprehensive guide. Follow each step to set up a robust telephony server on Alma Linux for a reliable VoIP solution.' 
 
url:  /installing-freeswitch-on-alma-linux-a-step-by-step-guide/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


Introduction



FreeSWITCH is a highly flexible and powerful open-source communications platform used for voice, video, and messaging across a variety of protocols. For those using Alma Linux—a reliable RHEL-based distribution—installing FreeSWITCH allows organizations to leverage a sophisticated telephony solution for VoIP applications, PBX systems, and conferencing. This guide provides a detailed, step-by-step walkthrough for installing FreeSWITCH on Alma Linux.



Prerequisites



Before beginning the installation, make sure you have:


* **A server or virtual machine running Alma Linux** (preferably version 8 or newer).

* **Root access** to the server or a user with sudo privileges.

* **Basic understanding of Linux commands**.

* **An internet connection** to download necessary packages.




Step 1: Update the Alma Linux System



Start by updating your Alma Linux system. This ensures you have the latest security patches and package updates.


```bash
sudo dnf update -y
```



Once the update is complete, reboot the system if necessary:


```bash
sudo reboot```



Step 2: Install Development Tools and Dependencies



FreeSWITCH relies on multiple development tools and libraries. You can install these packages with the following command:


```bash
sudo dnf groupinstall "Development Tools" -y
sudo dnf install git wget cmake autoconf automake libtool -y
```



Next, install additional dependencies that FreeSWITCH requires:


```bash
sudo dnf install epel-release -y
sudo dnf install libedit-devel sqlite-devel pcre-devel speex-devel openssl-devel -y
```



Step 3: Set Up FreeSWITCH User and Directories



For security and management, it’s best to create a dedicated user for running FreeSWITCH.


```bash
sudo adduser --system --no-create-home --group freeswitch
```



Create necessary directories for FreeSWITCH:


```bash
sudo mkdir -p /usr/local/freeswitch
sudo mkdir -p /usr/local/freeswitch/log
sudo mkdir -p /usr/local/freeswitch/run
```



Assign appropriate permissions to the FreeSWITCH user:


```bash
sudo chown -R freeswitch:freeswitch /usr/local/freeswitch
sudo chmod -R 775 /usr/local/freeswitch
```



Step 4: Download FreeSWITCH Source Code



Head to the FreeSWITCH GitHub repository to download the latest stable version of FreeSWITCH.


```bash
cd /usr/src
sudo git clone https://github.com/signalwire/freeswitch.git
cd freeswitch
sudo git checkout v1.10```



The `checkout` command will switch to the stable version 1.10, which is suitable for production use.



Step 5: Build and Compile FreeSWITCH



FreeSWITCH offers various configuration options; the default configuration works for most installations. First, install the necessary codecs, modules, and configurations:


```bash
./bootstrap.sh
./configure```



After configuring, compile the source code using:


```bash
make```



This process may take several minutes. If there are any errors, ensure that all dependencies are correctly installed. After successfully compiling FreeSWITCH, install it by running:


```bash
sudo make install
```



Step 6: Install Additional FreeSWITCH Modules



FreeSWITCH’s functionality can be extended by adding modules. Here’s how to install the basic modules often needed in a standard telephony environment:


```bash
sudo make cd-sounds-install cd-moh-install
sudo make samples
```



The `samples` command installs sample configuration files in `/usr/local/freeswitch/conf`.



Step 7: Configure Systemd Service for FreeSWITCH



To ensure FreeSWITCH starts automatically and runs as a background service, create a systemd service file:


```bash
sudo nano /etc/systemd/system/freeswitch.service```



Insert the following configuration into the file:


```bash
[Unit]
Description=FreeSWITCH Service
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/freeswitch/bin/freeswitch -ncwait -nonat
ExecStop=/usr/local/freeswitch/bin/freeswitch -stop
PIDFile=/usr/local/freeswitch/run/freeswitch.pid
User=freeswitch
Group=freeswitch
Restart=always
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target```



Save and exit the file. Reload the systemd daemon to recognize the new FreeSWITCH service:


```bash
sudo systemctl daemon-reload
```



Enable the FreeSWITCH service to start automatically on boot:


```bash
sudo systemctl enable freeswitch
```



Step 8: Start FreeSWITCH Service



Start FreeSWITCH by executing:


```bash
sudo systemctl start freeswitch
```



To confirm it’s running, check the status:


```bash
sudo systemctl status freeswitch
```



If the service is running, you should see an “active (running)” message.



Step 9: Configure Firewall for FreeSWITCH



To allow external access to FreeSWITCH, open the necessary ports on your firewall. By default, FreeSWITCH uses:


* **5060 (UDP)** for SIP

* **5061 (UDP)** for secure SIP (SIP-TLS)

* **16384–32768 (UDP)** for RTP (Real-Time Protocol)




Use the following commands to open these ports:


```bash
sudo firewall-cmd --add-port=5060/udp --permanent
sudo firewall-cmd --add-port=5061/udp --permanent
sudo firewall-cmd --add-port=16384-32768/udp --permanent
sudo firewall-cmd --reload
```



Step 10: Test FreeSWITCH Installation



To verify the FreeSWITCH installation, connect to the FreeSWITCH CLI by running:


```bash
/usr/local/freeswitch/bin/fs_cli```



Once inside the CLI, you can test a few commands, such as:


```bash
status
sofia status
```



These commands should display FreeSWITCH’s current status and protocol details, confirming that it’s correctly set up.



Step 11: Basic Configuration Tips



FreeSWITCH’s default configuration may not suit all needs. Here are a few tips to help configure it:


* **Edit SIP Profiles**: Modify SIP profiles in `/usr/local/freeswitch/conf/sip_profiles` to suit your network setup.

* **Set Up Extensions**: Define extensions in `/usr/local/freeswitch/conf/dialplan/default.xml`.

* **Configure NAT**: If behind NAT, add your public IP and local network information in the SIP profiles.

* **Add Security Features**: Enable password protections, and consider limiting IP access to the FreeSWITCH server.




Troubleshooting Common Issues



Here are a few common issues that might arise during installation and their solutions:


* **Missing Dependencies**: Ensure all libraries are installed, especially `openssl-devel` and `libedit-devel`.

* **Firewall Blocks**: Confirm all required ports are open on the firewall.

* **FreeSWITCH Doesn’t Start**: Check the system log (`journalctl -xe`) for details on errors-preventing startup.




Conclusion



Installing FreeSWITCH on Alma Linux gives users access to a highly flexible telephony platform for handling voice, video, and messaging services. By following this guide, you’ll be able to successfully set up FreeSWITCH on Alma Linux, allowing your organization or personal projects to take advantage of its powerful communication capabilities. With FreeSWITCH running, you can begin configuring and customizing it to meet your specific telephony requirements.
**FAQs**



**1. What is FreeSWITCH used for?** FreeSWITCH is an open-source telephony platform used for handling voice, video, and messaging over various protocols, ideal for creating VoIP, PBX, and conferencing solutions.



**2. Why use Alma Linux for FreeSWITCH?** Alma Linux is a stable, RHEL-compatible OS, making it a reliable choice for hosting applications like FreeSWITCH that require enterprise-level stability.



**3. How much RAM is recommended for FreeSWITCH?** For basic setups, 1 GB of RAM is sufficient, but for larger deployments, consider 4 GB or more to handle higher call volumes and multiple concurrent calls.



**4. Can FreeSWITCH run alongside other VoIP software?** Yes, but it’s generally recommended to run it on a dedicated server to avoid port conflicts and performance issues.



**5. How do I secure FreeSWITCH?** Implement strong password policies, restrict access to SIP ports, and enable TLS for secure communication.



**6. Where can I get additional FreeSWITCH modules?** Modules can be installed from the FreeSWITCH source repository, and the <a href="https://developer.signalwire.com/freeswitch/" target="_blank" rel="noopener" title="">FreeSWITCH documentation</a> provides details on individual module functions and configurations.
