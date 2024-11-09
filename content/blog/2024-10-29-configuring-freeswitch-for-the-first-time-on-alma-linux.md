---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T13:51:00Z"
excerpt: Learn configuring FreeSWITCH for the first time on Alma Linux with this detailed
  guide. Discover essential setup tips and configuration options to start using FreeSWITCH
  effectively.
guid: https://www.siberoloji.com/?p=5555
id: 5555
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: Configuring FreeSWITCH for the First Time on Alma Linux
url: /configuring-freeswitch-for-the-first-time-on-alma-linux/
---


 ### Introduction
<!-- /wp:heading -->

  Once FreeSWITCH is successfully installed on Alma Linux, the next step is configuring it to meet your specific requirements. <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> provides a flexible and powerful platform for handling various telephony functions like voice, video, and messaging. However, to take full advantage of its capabilities, an initial setup and configuration process is crucial. This guide walks through essential configurations, including setting up SIP profiles, dialing plans, codecs, and security measures for configuring FreeSWITCH. 
 


 ### Prerequisites
<!-- /wp:heading -->

  To follow along with this guide, you should have: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***FreeSWITCH is installed on Alma Linux***  following proper <a href="https://www.siberoloji.com/installing-freeswitch-on-alma-linux-a-step-by-step-guide/" target="_blank" rel="noopener" title="">installation</a> procedures. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Root or sudo access***  on the Alma Linux server. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Basic understanding of SIP and VoIP concepts***  for effective configuration. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 1: Directory Structure and Configuration Files Overview
<!-- /wp:heading -->

  FreeSWITCH’s configurations are stored in the <code>/usr/local/freeswitch/conf</code> directory, with each major area divided into distinct folders: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***dialplan*** : Contains files for defining call routing rules. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***sip_profiles*** : Holds configurations for SIP profiles, which manage SIP connections. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***vars.xml*** : A core file defining global variables for the FreeSWITCH environment. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Familiarizing yourself with these directories will make configuration easier and more organized. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 2: Setting Global Variables
<!-- /wp:heading -->

  The <code>vars.xml</code> file in <code>/usr/local/freeswitch/conf</code> is the primary configuration file for setting up global variables. Here’s how to customize it: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open <code>vars.xml</code> with a text editor: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /usr/local/freeswitch/conf/vars.xml</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Modify key variables such as: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Domain Name*** : Set this to the server’s IP or domain name for identification purposes.<br><code>xml &lt;X-PRE-PROCESS cmd="set" data="domain_name=your.domain.com"/&gt;</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***SIP Ports*** : You can specify custom SIP ports if desired:<br><code>xml &lt;X-PRE-PROCESS cmd="set" data="external_sip_port=5060"/&gt; &lt;X-PRE-PROCESS cmd="set" data="internal_sip_port=5061"/&gt;</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  After making these changes, save the file and restart FreeSWITCH to apply them: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl restart freeswitch</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 3: Configuring SIP Profiles
<!-- /wp:heading -->

  FreeSWITCH organizes SIP configurations in “profiles” to separate internal and external connections. The default SIP profiles are stored in <code>/usr/local/freeswitch/conf/sip_profiles</code>. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Internal SIP Profile*** : This profile is generally used for internal devices within the same network. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Open <code>internal.xml</code> to configure internal settings: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>sudo nano /usr/local/freeswitch/conf/sip_profiles/internal.xml</code></code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Set the bind address to the local IP, or leave it as <code>0.0.0.0</code> to allow connections on any network interface:<br><code>xml &lt;param name="sip-ip" value="0.0.0.0"/&gt;</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***External SIP Profile*** : Configure this profile to handle external connections, often used for connecting with external providers or remote users. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Open <code>external.xml</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>sudo nano /usr/local/freeswitch/conf/sip_profiles/external.xml</code></code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Update the external IP and port values if needed:<br><code>xml &lt;param name="sip-ip" value="public.ip.address"/&gt; &lt;param name="rtp-ip" value="public.ip.address"/&gt;</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Save and close each file, then restart FreeSWITCH to enable these settings. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 4: Setting Up Dialplans
<!-- /wp:heading -->

  Dialplans control how calls are routed and handled within FreeSWITCH. The default dialplan files are in <code>/usr/local/freeswitch/conf/dialplan</code>. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Understanding Contexts*** : Dialplans in FreeSWITCH operate within “contexts,” which are separate groups of rules that define call behavior. The default context is usually set to <code>default</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Editing Default Dialplan*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Open the <code>default.xml</code> dialplan: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>sudo nano /usr/local/freeswitch/conf/dialplan/default.xml</code></code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Add custom extensions, routing rules, and call-handling logic as needed:<br><code>xml &lt;extension name="example_extension"&gt; &lt;condition field="destination_number" expression="^1001$"&gt; &lt;action application="answer"/&gt; &lt;action application="playback" data="ivr/ivr-welcome_to_freeswitch.wav"/&gt; &lt;action application="hangup"/&gt; &lt;/condition&gt; &lt;/extension&gt;</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Testing Dialplans*** : After editing, reload the dialplan without restarting FreeSWITCH: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   fs_cli -x "reloadxml"</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 5: Codec Configuration
<!-- /wp:heading -->

  Codec selection impacts call quality and bandwidth. FreeSWITCH supports a range of audio codecs, including G.711, G.729, and Opus. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Configure Codecs in SIP Profiles*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Edit <code>internal.xml</code> and <code>external.xml</code> profiles to set preferred codecs:<br><code>xml &lt;param name="codec-prefs" value="OPUS,PCMU,PCMA"/&gt;</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Enable Transcoding*** : For calls between devices with different codec support, enable transcoding in FreeSWITCH. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Testing Codec Functionality*** : Use <code>fs_cli</code> to verify codec setup by running: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sofia status profile internal</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 6: Configuring NAT Settings
<!-- /wp:heading -->

  Network Address Translation (NAT) can cause connectivity issues, especially in environments with remote clients or devices behind firewalls. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Configure SIP Profiles for NAT*** : Open the internal and external SIP profiles and add the following NAT settings: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   &lt;param name="ext-sip-ip" value="external.ip.address"/&gt;
   &lt;param name="ext-rtp-ip" value="external.ip.address"/&gt;
   &lt;param name="rtp-timeout-sec" value="300"/&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Set IPs in vars.xml*** : Also set external IPs in <code>vars.xml</code> to ensure correct media routing: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   &lt;X-PRE-PROCESS cmd="set" data="external_rtp_ip=your.external.ip"/&gt;
   &lt;X-PRE-PROCESS cmd="set" data="external_sip_ip=your.external.ip"/&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 7: Implementing Security Measures
<!-- /wp:heading -->

  FreeSWITCH is highly customizable for security, and securing SIP and RTP traffic is essential. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Password Protect SIP Accounts*** : Set strong passwords for each SIP user account in <code>/usr/local/freeswitch/conf/directory/default/</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***IP-Based Restrictions*** : Limit SIP connections to trusted IP addresses. For example, in <code>internal.xml</code>: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   &lt;param name="auth-calls" value="true"/&gt;
   &lt;param name="apply-inbound-acl" value="trusted"/&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- ***Enable TLS for SIP*** : Encrypt SIP communications by enabling TLS in the <code>internal.xml</code> and <code>external.xml</code> profiles: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   &lt;param name="tls" value="true"/&gt;
   &lt;param name="tls-bind-params" value="transport=tls"/&gt;</code></pre>
<!-- /wp:code -->


 ### Step 8: Testing FreeSWITCH Setup
<!-- /wp:heading -->

  With configurations complete, test the setup to ensure everything works as expected: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Check SIP Status*** : Use <code>fs_cli</code> to view active SIP profiles and registrations: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sofia status</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Test Calls Between Extensions*** : Try making calls between extensions configured in the dialplan to ensure call routing works. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Review Logs for Errors*** : Logs are stored in <code>/usr/local/freeswitch/log/</code>. For example: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   tail -f /usr/local/freeswitch/log/freeswitch.log</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 9: Automating Startup and Shutdown
<!-- /wp:heading -->

  To automate FreeSWITCH to start on boot, confirm it’s enabled in systemd: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable freeswitch</code></pre>
<!-- /wp:code -->

  To manage FreeSWITCH manually, use: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start freeswitch
sudo systemctl stop freeswitch</code></pre>
<!-- /wp:code -->


 ### Conclusion
<!-- /wp:heading -->

  Setting up and configuring FreeSWITCH on Alma Linux offers a comprehensive telephony platform suitable for a range of VoIP and unified communication needs. By following these initial configuration steps, including setting up SIP profiles, dialing plans, codecs, and security options, you’ll be able to make the most of FreeSWITCH’s powerful capabilities. This guide provides a foundation for configuring FreeSWITCH to ensure efficient and secure communication across your network. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

  ***FAQs***  
 

  ***1. Can I use FreeSWITCH for video calls on Alma Linux?*** <br>Yes, FreeSWITCH supports video conferencing and SIP-based video calls. Additional modules and codecs, like VP8, may need configuration. 
 

  ***2. How can I back up my FreeSWITCH configuration?*** <br>Simply back up the <code>/usr/local/freeswitch/conf</code> directory to save all configuration settings. 
 

  ***3. What is the default FreeSWITCH admin password?*** <br>FreeSWITCH does not have a default password. Users set this up during initial configuration. 
 

  ***4. How do I troubleshoot SIP connectivity issues?*** <br>Use the <code>sofia status</code> and <code>sofia status profile &lt;profile_name&gt;</code> commands in `fs 
 

  _cli` to check SIP profiles and diagnose connectivity issues. 
 

  ***5. Can I run FreeSWITCH with other PBX software?*** <br>While it’s technically possible, it’s recommended to run FreeSWITCH on a dedicated server to avoid conflicts. 
 

  ***6. What are the best practices for securing FreeSWITCH?*** <br>Implement strong password policies, limit IP access, enable TLS, and configure access control lists (ACLs) for SIP profiles. 
 