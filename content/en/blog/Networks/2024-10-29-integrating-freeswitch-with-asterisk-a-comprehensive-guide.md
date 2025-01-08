---
draft: false

title:  'Integrating FreeSWITCH with Asterisk: A Comprehensive Guide'
date: '2024-10-29T14:12:24+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Discover integrating FreeSWITCH with Asterisk to create a robust VoIP solution. This guide covers configuration steps, setup, and optimization techniques for seamless integration.' 
 
url:  /integrating-freeswitch-with-asterisk-a-comprehensive-guide/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - asterisk
    - freeswitch
---


Introduction



Both **<a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a>** and **<a href="https://www.asterisk.org" target="_blank" rel="noopener" title="">Asterisk</a>** are popular open-source communication platforms, widely used for handling voice, video, and text communications. While FreeSWITCH is known for its flexibility in handling media and complex call flows, Asterisk shines as a robust telephony platform with a vast ecosystem of features and integrations. Integrating FreeSWITCH with Asterisk provides a powerful hybrid solution, combining the strengths of both platforms to support sophisticated VoIP and PBX needs. This guide walks through the process of integrating FreeSWITCH with Asterisk, covering essential configuration steps, use cases, and troubleshooting.



Why Integrate FreeSWITCH with Asterisk?



Integrating these two platforms can provide several key benefits:


* **Enhanced Media Handling**: FreeSWITCH excels in handling complex media tasks such as video conferencing and transcoding, which can offload some of the load from Asterisk.

* **Scalability**: FreeSWITCH’s scalability makes it ideal for expanding the capacity of an Asterisk deployment.

* **Customization**: By leveraging both platforms, users can customize call flows and features, optimizing each system for the tasks it handles best.

Prerequisites



Before beginning, ensure you have:


* **FreeSWITCH and Asterisk are installed** on separate servers (or virtual machines).

* **Basic networking knowledge** and familiarity with VoIP protocols (such as SIP).

* **Administrative access** to both FreeSWITCH and Asterisk servers.

Step 1: Network and Firewall Configuration



For seamless communication, start by allowing network access between the Asterisk and FreeSWITCH servers. Ensure that the following ports are open on both servers:


* **SIP Port**: 5060 (UDP) for SIP communication

* **RTP Ports**: 16384-32768 (UDP) for media traffic




To configure the firewall on both servers:


```bash
# Open SIP port
sudo firewall-cmd --add-port=5060/udp --permanent
# Open RTP range
sudo firewall-cmd --add-port=16384-32768/udp --permanent
# Reload firewall settings
sudo firewall-cmd --reload
```



Step 2: Configure SIP Trunks



A SIP trunk between FreeSWITCH and Asterisk enables each system to route calls to the other.


#### On FreeSWITCH


* Open the external SIP profile configuration on FreeSWITCH:



```bash
   sudo nano /usr/local/freeswitch/conf/sip_profiles/external.xml
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Define a new gateway for Asterisk with its IP address:



```
   <gateway name="asterisk">
       <param name="username" value="freeswitch"/>
       <param name="password" value="strongpassword"/>
       <param name="realm" value="asterisk_ip"/>
       <param name="proxy" value="asterisk_ip"/>
       <param name="register" value="true"/>
   </gateway>
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Save and exit. Then reload the FreeSWITCH configuration to apply the changes:



```bash
   fs_cli -x "reloadxml"```


#### On Asterisk


* Open the `pjsip.conf` file on your Asterisk server (or `sip.conf` if using chan_sip):



```bash
   sudo nano /etc/asterisk/pjsip.conf```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Add a configuration for a SIP trunk to FreeSWITCH:



```
   [freeswitch]
   type=endpoint
   context=from-freeswitch
   disallow=all
   allow=ulaw
   aors=freeswitch_aor```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Specify the address and authentication details for the FreeSWITCH SIP trunk:



```
[freeswitch_aor]
type=aor
contact=sip:freeswitch_ip:5060

[freeswitch_auth]
type=auth
auth_type=userpass
username=freeswitch
password=strongpassword
```


<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* Save the file and reload Asterisk’s PJSIP module:



```bash
   asterisk -rx "pjsip reload"```
Step 3: Setting Up Dial Plans



With SIP trunks in place, configure dial plans to handle call routing between FreeSWITCH and Asterisk.


#### On FreeSWITCH



Edit the default dial plan on FreeSWITCH to route calls intended for Asterisk.


* Open `default.xml` for editing:



```bash
   sudo nano /usr/local/freeswitch/conf/dialplan/default.xml
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Add a new extension that matches calls destined for Asterisk:



```
   <extension name="to-asterisk">
       <condition field="destination_number" expression="^3\d{3}$">
           <action application="bridge" data="sofia/external/asterisk/${destination_number}"/>
       </condition>
   </extension>
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Save and exit the file, then reload the dial plan:



```bash
   fs_cli -x "reloadxml"```


#### On Asterisk


* Open `extensions.conf` on Asterisk:



```bash
   sudo nano /etc/asterisk/extensions.conf```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Define a new context to route calls from Asterisk to FreeSWITCH:



```
   [from-internal]
   exten => _4XXX,1,Dial(PJSIP/${EXTEN}@freeswitch)
   exten => _4XXX,n,Hangup()```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Save the file and reload the Asterisk dial plan:



```bash
   asterisk -rx "dialplan reload"```



With these dial plans in place, calls to numbers beginning with `3` will route from FreeSWITCH to Asterisk, and calls beginning with `4` will route from Asterisk to FreeSWITCH.
Step 4: Testing the Integration



With the configurations set up, it’s time to test calls between FreeSWITCH and Asterisk.


* **Register Extensions**: Make sure devices (softphones or hardware phones) are registered to extensions on each platform.

* **Place a Test Call**: Try dialing an extension from FreeSWITCH to Asterisk (e.g., `3001`), and vice versa, to confirm the connection works.

* **Check Logs**: If calls don’t connect, check the logs on both platforms for errors:



* **Asterisk**: `/var/log/asterisk/full`

* **FreeSWITCH**: `/usr/local/freeswitch/log/freeswitch.log`



* **Use CLI Commands**: The following commands help diagnose issues:



```bash
   # FreeSWITCH
   fs_cli -x "sofia status"

   # Asterisk
   asterisk -rx "pjsip show endpoints"```
Step 5: Advanced Configuration Options



To maximize the integration, consider some additional configurations:


* **Codec Synchronization**: Ensure both systems use compatible codecs to avoid transcoding, which can reduce latency and improve call quality. Typical codecs are G.711 (ulaw) and G.729.

* **Failover and Load Balancing**: For high availability, set up multiple FreeSWITCH or Asterisk servers and use SIP options like DNS SRV records for failover.

* **DTMF Handling**: Ensure both systems use compatible DTMF modes (RFC2833, Inband, or SIP INFO) to avoid issues with interactive menus or IVRs.

* **SIP Security**: Enable IP filtering, strong passwords, and transport layer security (TLS) for SIP communications, especially if the servers are accessible over the internet.

Step 6: Troubleshooting Common Issues



Here are some common integration challenges and tips for troubleshooting:


* **SIP Registration Errors**: If Asterisk or FreeSWITCH isn’t registering with the other, check the SIP configuration for correct IPs, usernames, and passwords.

* **Codec Mismatch**: Calls failing due to unsupported codec issues can be fixed by standardizing codecs on both platforms.

* **Network Latency**: If there’s an echo or delay, ensure both servers are in low-latency environments, especially if using external cloud instances.

* **Logging and Debugging**:



* FreeSWITCH: Increase logging level  `/usr/local/freeswitch/conf/autoload_configs/logfile.conf.xml` if more detailed information is needed.

* Asterisk: Use `pjsip set logger on` to capture detailed SIP messaging logs.

Use Cases for FreeSWITCH and Asterisk Integration


* **Unified Communications and IVR Systems**: FreeSWITCH’s powerful IVR capabilities complement Asterisk’s call routing, creating a comprehensive communications platform.

* **Scalable Conference Bridge**: FreeSWITCH’s media handling allows it to act as a conference bridge while Asterisk manages call control.

* **Custom PBX Features**: FreeSWITCH can provide complex call handling and customization, while Asterisk can support traditional PBX functionalities.

Conclusion



Integrating FreeSWITCH with Asterisk opens up a wide range of possibilities for building robust, scalable, and feature-rich telephony solutions. With careful configuration of SIP trunks, dial plans, and codecs, these two platforms can work seamlessly together, creating a hybrid solution that maximizes each system’s strengths. Whether for a business PBX, conferencing solution, or advanced VoIP system, combining FreeSWITCH and Asterisk provides flexibility, performance, and scalability for diverse communication needs.
**FAQs**



**1. Can FreeSWITCH and Asterisk run on the same server?** Yes, but it’s generally recommended to run them on separate servers to avoid port conflicts and improve performance.



**2. What are the benefits of using both FreeSWITCH and Asterisk?** Combining both platforms leverages FreeSWITCH’s media capabilities and Asterisk’s call handling, creating a more versatile communication solution.



**3. How do I ensure call quality between FreeSWITCH and Asterisk?** Standardize compatible codecs (e.g., G.711) and minimize transcoding to improve call quality.



**4. Can I use this setup with other VoIP providers?** Yes, both FreeSWITCH and Asterisk can connect to external VoIP providers, allowing flexibility in routing and redundancy.



**5. What are the best security practices for SIP integration?** Use strong passwords, enable TLS, restrict IP access, and keep both systems updated to secure SIP integration.
