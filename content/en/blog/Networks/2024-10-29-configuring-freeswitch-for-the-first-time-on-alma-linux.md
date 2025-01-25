---
draft: false

title:  'Configuring FreeSWITCH for the First Time on Alma Linux'
date: '2024-10-29T13:51:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Learn configuring FreeSWITCH for the first time on Alma Linux with this detailed guide. Discover essential setup tips and configuration options to start using FreeSWITCH effectively.' 
 
url:  /configuring-freeswitch-for-the-first-time-on-alma-linux/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


Introduction



Once FreeSWITCH is successfully installed on Alma Linux, the next step is configuring it to meet your specific requirements. <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> provides a flexible and powerful platform for handling various telephony functions like voice, video, and messaging. However, to take full advantage of its capabilities, an initial setup and configuration process is crucial. This guide walks through essential configurations, including setting up SIP profiles, dialing plans, codecs, and security measures for configuring FreeSWITCH.



Prerequisites



To follow along with this guide, you should have:


* **FreeSWITCH is installed on Alma Linux** following proper <a href="https://www.siberoloji.com/installing-freeswitch-on-alma-linux-a-step-by-step-guide/" target="_blank" rel="noopener" title="">installation</a> procedures.

* **Root or sudo access** on the Alma Linux server.

* **Basic understanding of SIP and VoIP concepts** for effective configuration.

Step 1: Directory Structure and Configuration Files Overview



FreeSWITCH’s configurations are stored in the `/usr/local/freeswitch/conf` directory, with each major area divided into distinct folders:


* **dialplan**: Contains files for defining call routing rules.

* **sip_profiles**: Holds configurations for SIP profiles, which manage SIP connections.

* **vars.xml**: A core file defining global variables for the FreeSWITCH environment.
Familiarizing yourself with these directories will make configuration easier and more organized.
Step 2: Setting Global Variables



The `vars.xml` file in `/usr/local/freeswitch/conf` is the primary configuration file for setting up global variables. Here’s how to customize it:


* Open `vars.xml` with a text editor:



```bash
   sudo nano /usr/local/freeswitch/conf/vars.xml
```





* Modify key variables such as:



* **Domain Name**: Set this to the server’s IP or domain name for identification purposes. `xml <X-PRE-PROCESS cmd="set" data="domain_name=your.domain.com"/>`

* **SIP Ports**: You can specify custom SIP ports if desired: `xml <X-PRE-PROCESS cmd="set" data="external_sip_port=5060"/> <X-PRE-PROCESS cmd="set" data="internal_sip_port=5061"/>`
After making these changes, save the file and restart FreeSWITCH to apply them:


```bash
sudo systemctl restart freeswitch
```
Step 3: Configuring SIP Profiles



FreeSWITCH organizes SIP configurations in “profiles” to separate internal and external connections. The default SIP profiles are stored in `/usr/local/freeswitch/conf/sip_profiles`.


* **Internal SIP Profile**: This profile is generally used for internal devices within the same network.



* Open `internal.xml` to configure internal settings:



```bash
`sudo nano /usr/local/freeswitch/conf/sip_profiles/internal.xml
````


* Set the bind address to the local IP, or leave it as `0.0.0.0` to allow connections on any network interface: `xml <param name="sip-ip" value="0.0.0.0"/>`



* **External SIP Profile**: Configure this profile to handle external connections, often used for connecting with external providers or remote users.



* Open `external.xml`



```bash
`sudo nano /usr/local/freeswitch/conf/sip_profiles/external.xml
````


* Update the external IP and port values if needed: `xml <param name="sip-ip" value="public.ip.address"/> <param name="rtp-ip" value="public.ip.address"/>`
Save and close each file, then restart FreeSWITCH to enable these settings.
Step 4: Setting Up Dialplans



Dialplans control how calls are routed and handled within FreeSWITCH. The default dialplan files are in `/usr/local/freeswitch/conf/dialplan`.


* **Understanding Contexts**: Dialplans in FreeSWITCH operate within “contexts,” which are separate groups of rules that define call behavior. The default context is usually set to `default`.

* **Editing Default Dialplan**:



* Open the `default.xml` dialplan:



```bash
`sudo nano /usr/local/freeswitch/conf/dialplan/default.xml
````


* Add custom extensions, routing rules, and call-handling logic as needed: `xml <extension name="example_extension"> <condition field="destination_number" expression="^1001$"> <action application="answer"/> <action application="playback" data="ivr/ivr-welcome_to_freeswitch.wav"/> <action application="hangup"/> </condition> </extension>`



* **Testing Dialplans**: After editing, reload the dialplan without restarting FreeSWITCH:



```bash
   fs_cli -x "reloadxml"```
Step 5: Codec Configuration



Codec selection impacts call quality and bandwidth. FreeSWITCH supports a range of audio codecs, including G.711, G.729, and Opus.


* **Configure Codecs in SIP Profiles**:



* Edit `internal.xml` and `external.xml` profiles to set preferred codecs: `xml <param name="codec-prefs" value="OPUS,PCMU,PCMA"/>`



* **Enable Transcoding**: For calls between devices with different codec support, enable transcoding in FreeSWITCH.

* **Testing Codec Functionality**: Use `fs_cli` to verify codec setup by running:



```bash
   sofia status profile internal
```
Step 6: Configuring NAT Settings



Network Address Translation (NAT) can cause connectivity issues, especially in environments with remote clients or devices behind firewalls.


* **Configure SIP Profiles for NAT**: Open the internal and external SIP profiles and add the following NAT settings:



```bash
   <param name="ext-sip-ip" value="external.ip.address"/>
   <param name="ext-rtp-ip" value="external.ip.address"/>
   <param name="rtp-timeout-sec" value="300"/>
```





* **Set IPs in vars.xml**: Also set external IPs in `vars.xml` to ensure correct media routing:



```bash
   <X-PRE-PROCESS cmd="set" data="external_rtp_ip=your.external.ip"/>
   <X-PRE-PROCESS cmd="set" data="external_sip_ip=your.external.ip"/>
```
Step 7: Implementing Security Measures



FreeSWITCH is highly customizable for security, and securing SIP and RTP traffic is essential.


* **Password Protect SIP Accounts**: Set strong passwords for each SIP user account in `/usr/local/freeswitch/conf/directory/default/`.

* **IP-Based Restrictions**: Limit SIP connections to trusted IP addresses. For example, in `internal.xml`:



```bash
   <param name="auth-calls" value="true"/>
   <param name="apply-inbound-acl" value="trusted"/>
```





* **Enable TLS for SIP**: Encrypt SIP communications by enabling TLS in the `internal.xml` and `external.xml` profiles:



```bash
   <param name="tls" value="true"/>
   <param name="tls-bind-params" value="transport=tls"/>
```



Step 8: Testing FreeSWITCH Setup



With configurations complete, test the setup to ensure everything works as expected:


* **Check SIP Status**: Use `fs_cli` to view active SIP profiles and registrations:



```bash
   sofia status
```





* **Test Calls Between Extensions**: Try making calls between extensions configured in the dialplan to ensure call routing works.

* **Review Logs for Errors**: Logs are stored in `/usr/local/freeswitch/log/`. For example:



```bash
   tail -f /usr/local/freeswitch/log/freeswitch.log```
Step 9: Automating Startup and Shutdown



To automate FreeSWITCH to start on boot, confirm it’s enabled in systemd:


```bash
sudo systemctl enable freeswitch
```



To manage FreeSWITCH manually, use:


```bash
sudo systemctl start freeswitch
sudo systemctl stop freeswitch
```



Conclusion



Setting up and configuring FreeSWITCH on Alma Linux offers a comprehensive telephony platform suitable for a range of VoIP and unified communication needs. By following these initial configuration steps, including setting up SIP profiles, dialing plans, codecs, and security options, you’ll be able to make the most of FreeSWITCH’s powerful capabilities. This guide provides a foundation for configuring FreeSWITCH to ensure efficient and secure communication across your network.
**FAQs**



**1. Can I use FreeSWITCH for video calls on Alma Linux?** Yes, FreeSWITCH supports video conferencing and SIP-based video calls. Additional modules and codecs, like VP8, may need configuration.



**2. How can I back up my FreeSWITCH configuration?** Simply back up the `/usr/local/freeswitch/conf` directory to save all configuration settings.



**3. What is the default FreeSWITCH admin password?** FreeSWITCH does not have a default password. Users set this up during initial configuration.



**4. How do I troubleshoot SIP connectivity issues?** Use the `sofia status` and `sofia status profile <profile_name>` commands in `fs



_cli` to check SIP profiles and diagnose connectivity issues.



**5. Can I run FreeSWITCH with other PBX software?** While it’s technically possible, it’s recommended to run FreeSWITCH on a dedicated server to avoid conflicts.



**6. What are the best practices for securing FreeSWITCH?** Implement strong password policies, limit IP access, enable TLS, and configure access control lists (ACLs) for SIP profiles.
