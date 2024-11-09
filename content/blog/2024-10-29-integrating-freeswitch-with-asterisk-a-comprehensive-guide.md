---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T14:12:24Z"
excerpt: Discover integrating FreeSWITCH with Asterisk to create a robust VoIP solution.
  This guide covers configuration steps, setup, and optimization techniques for seamless
  integration.
guid: https://www.siberoloji.com/?p=5562
id: 5562
image: /assets/images/2024/10/freeswitch1.webp
tags:
- asterisk
- freeswitch
title: 'Integrating FreeSWITCH with Asterisk: A Comprehensive Guide'
url: /integrating-freeswitch-with-asterisk-a-comprehensive-guide/
---


 ### Introduction
<!-- /wp:heading -->

  Both ***<a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a>***  and ***<a href="https://www.asterisk.org" target="_blank" rel="noopener" title="">Asterisk</a>***  are popular open-source communication platforms, widely used for handling voice, video, and text communications. While FreeSWITCH is known for its flexibility in handling media and complex call flows, Asterisk shines as a robust telephony platform with a vast ecosystem of features and integrations. Integrating FreeSWITCH with Asterisk provides a powerful hybrid solution, combining the strengths of both platforms to support sophisticated VoIP and PBX needs. This guide walks through the process of integrating FreeSWITCH with Asterisk, covering essential configuration steps, use cases, and troubleshooting.
 


 ### Why Integrate FreeSWITCH with Asterisk?
<!-- /wp:heading -->

  Integrating these two platforms can provide several key benefits:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Enhanced Media Handling*** : FreeSWITCH excels in handling complex media tasks such as video conferencing and transcoding, which can offload some of the load from Asterisk. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Scalability*** : FreeSWITCH’s scalability makes it ideal for expanding the capacity of an Asterisk deployment. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Customization*** : By leveraging both platforms, users can customize call flows and features, optimizing each system for the tasks it handles best. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Prerequisites
<!-- /wp:heading -->

  Before beginning, ensure you have:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***FreeSWITCH and Asterisk are installed***  on separate servers (or virtual machines). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Basic networking knowledge***  and familiarity with VoIP protocols (such as SIP). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Administrative access***  to both FreeSWITCH and Asterisk servers. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 1: Network and Firewall Configuration
<!-- /wp:heading -->

  For seamless communication, start by allowing network access between the Asterisk and FreeSWITCH servers. Ensure that the following ports are open on both servers:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***SIP Port*** : 5060 (UDP) for SIP communication 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***RTP Ports*** : 16384-32768 (UDP) for media traffic 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  To configure the firewall on both servers:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Open SIP port
sudo firewall-cmd --add-port=5060/udp --permanent
# Open RTP range
sudo firewall-cmd --add-port=16384-32768/udp --permanent
# Reload firewall settings
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->


 ### Step 2: Configure SIP Trunks
<!-- /wp:heading -->

  A SIP trunk between FreeSWITCH and Asterisk enables each system to route calls to the other.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On FreeSWITCH 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open the external SIP profile configuration on FreeSWITCH: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /usr/local/freeswitch/conf/sip_profiles/external.xml</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Define a new gateway for Asterisk with its IP address: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">   &lt;gateway name="asterisk"&gt;
       &lt;param name="username" value="freeswitch"/&gt;
       &lt;param name="password" value="strongpassword"/&gt;
       &lt;param name="realm" value="asterisk_ip"/&gt;
       &lt;param name="proxy" value="asterisk_ip"/&gt;
       &lt;param name="register" value="true"/&gt;
   &lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Save and exit. Then reload the FreeSWITCH configuration to apply the changes: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   fs_cli -x "reloadxml"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Asterisk 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open the <code>pjsip.conf</code> file on your Asterisk server (or <code>sip.conf</code> if using chan_sip): 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /etc/asterisk/pjsip.conf</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Add a configuration for a SIP trunk to FreeSWITCH: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">   [freeswitch]
   type=endpoint
   context=from-freeswitch
   disallow=all
   allow=ulaw
   aors=freeswitch_aor</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Specify the address and authentication details for the FreeSWITCH SIP trunk: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">[freeswitch_aor]
type=aor
contact=sip:freeswitch_ip:5060

[freeswitch_auth]
type=auth
auth_type=userpass
username=freeswitch
password=strongpassword</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
- Save the file and reload Asterisk’s PJSIP module: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   asterisk -rx "pjsip reload"</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 3: Setting Up Dial Plans
<!-- /wp:heading -->

  With SIP trunks in place, configure dial plans to handle call routing between FreeSWITCH and Asterisk.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On FreeSWITCH 
<!-- /wp:heading -->

  Edit the default dial plan on FreeSWITCH to route calls intended for Asterisk.
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open <code>default.xml</code> for editing: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /usr/local/freeswitch/conf/dialplan/default.xml</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Add a new extension that matches calls destined for Asterisk: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">   &lt;extension name="to-asterisk"&gt;
       &lt;condition field="destination_number" expression="^3\d{3}$"&gt;
           &lt;action application="bridge" data="sofia/external/asterisk/${destination_number}"/&gt;
       &lt;/condition&gt;
   &lt;/extension&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Save and exit the file, then reload the dial plan: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   fs_cli -x "reloadxml"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Asterisk 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Open <code>extensions.conf</code> on Asterisk: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /etc/asterisk/extensions.conf</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Define a new context to route calls from Asterisk to FreeSWITCH: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">   [from-internal]
   exten =&gt; _4XXX,1,Dial(PJSIP/${EXTEN}@freeswitch)
   exten =&gt; _4XXX,n,Hangup()</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Save the file and reload the Asterisk dial plan: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   asterisk -rx "dialplan reload"</code></pre>
<!-- /wp:code -->

  With these dial plans in place, calls to numbers beginning with <code>3</code> will route from FreeSWITCH to Asterisk, and calls beginning with <code>4</code> will route from Asterisk to FreeSWITCH.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 4: Testing the Integration
<!-- /wp:heading -->

  With the configurations set up, it’s time to test calls between FreeSWITCH and Asterisk.
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Register Extensions*** : Make sure devices (softphones or hardware phones) are registered to extensions on each platform. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Place a Test Call*** : Try dialing an extension from FreeSWITCH to Asterisk (e.g., <code>3001</code>), and vice versa, to confirm the connection works. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Check Logs*** : If calls don’t connect, check the logs on both platforms for errors: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Asterisk*** : <code>/var/log/asterisk/full</code> 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***FreeSWITCH*** : <code>/usr/local/freeswitch/log/freeswitch.log</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Use CLI Commands*** : The following commands help diagnose issues: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   # FreeSWITCH
   fs_cli -x "sofia status"

   # Asterisk
   asterisk -rx "pjsip show endpoints"</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 5: Advanced Configuration Options
<!-- /wp:heading -->

  To maximize the integration, consider some additional configurations:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Codec Synchronization*** : Ensure both systems use compatible codecs to avoid transcoding, which can reduce latency and improve call quality. Typical codecs are G.711 (ulaw) and G.729. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Failover and Load Balancing*** : For high availability, set up multiple FreeSWITCH or Asterisk servers and use SIP options like DNS SRV records for failover. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DTMF Handling*** : Ensure both systems use compatible DTMF modes (RFC2833, Inband, or SIP INFO) to avoid issues with interactive menus or IVRs. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***SIP Security*** : Enable IP filtering, strong passwords, and transport layer security (TLS) for SIP communications, especially if the servers are accessible over the internet. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Step 6: Troubleshooting Common Issues
<!-- /wp:heading -->

  Here are some common integration challenges and tips for troubleshooting:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***SIP Registration Errors*** : If Asterisk or FreeSWITCH isn’t registering with the other, check the SIP configuration for correct IPs, usernames, and passwords. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Codec Mismatch*** : Calls failing due to unsupported codec issues can be fixed by standardizing codecs on both platforms. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Network Latency*** : If there’s an echo or delay, ensure both servers are in low-latency environments, especially if using external cloud instances. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Logging and Debugging*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- FreeSWITCH: Increase logging level  <code>/usr/local/freeswitch/conf/autoload_configs/logfile.conf.xml</code> if more detailed information is needed. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Asterisk: Use <code>pjsip set logger on</code> to capture detailed SIP messaging logs. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Use Cases for FreeSWITCH and Asterisk Integration
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Unified Communications and IVR Systems*** : FreeSWITCH’s powerful IVR capabilities complement Asterisk’s call routing, creating a comprehensive communications platform. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Scalable Conference Bridge*** : FreeSWITCH’s media handling allows it to act as a conference bridge while Asterisk manages call control. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Custom PBX Features*** : FreeSWITCH can provide complex call handling and customization, while Asterisk can support traditional PBX functionalities. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### Conclusion
<!-- /wp:heading -->

  Integrating FreeSWITCH with Asterisk opens up a wide range of possibilities for building robust, scalable, and feature-rich telephony solutions. With careful configuration of SIP trunks, dial plans, and codecs, these two platforms can work seamlessly together, creating a hybrid solution that maximizes each system’s strengths. Whether for a business PBX, conferencing solution, or advanced VoIP system, combining FreeSWITCH and Asterisk provides flexibility, performance, and scalability for diverse communication needs.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

  ***FAQs*** 
 

  ***1. Can FreeSWITCH and Asterisk run on the same server?*** <br>Yes, but it’s generally recommended to run them on separate servers to avoid port conflicts and improve performance.
 

  ***2. What are the benefits of using both FreeSWITCH and Asterisk?*** <br>Combining both platforms leverages FreeSWITCH’s media capabilities and Asterisk’s call handling, creating a more versatile communication solution.
 

  ***3. How do I ensure call quality between FreeSWITCH and Asterisk?*** <br>Standardize compatible codecs (e.g., G.711) and minimize transcoding to improve call quality.
 

  ***4. Can I use this setup with other VoIP providers?*** <br>Yes, both FreeSWITCH and Asterisk can connect to external VoIP providers, allowing flexibility in routing and redundancy.
 

  ***5. What are the best security practices for SIP integration?*** <br>Use strong passwords, enable TLS, restrict IP access, and keep both systems updated to secure SIP integration.
 