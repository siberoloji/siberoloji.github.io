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

<!-- wp:heading {"level":3} -->
 ### Introduction</h3>
<!-- /wp:heading -->

  Both <strong><a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a></strong> and <strong><a href="https://www.asterisk.org" target="_blank" rel="noopener" title="">Asterisk</a></strong> are popular open-source communication platforms, widely used for handling voice, video, and text communications. While FreeSWITCH is known for its flexibility in handling media and complex call flows, Asterisk shines as a robust telephony platform with a vast ecosystem of features and integrations. Integrating FreeSWITCH with Asterisk provides a powerful hybrid solution, combining the strengths of both platforms to support sophisticated VoIP and PBX needs. This guide walks through the process of integrating FreeSWITCH with Asterisk, covering essential configuration steps, use cases, and troubleshooting.</p>
 

<!-- wp:heading {"level":3} -->
 ### Why Integrate FreeSWITCH with Asterisk?</h3>
<!-- /wp:heading -->

  Integrating these two platforms can provide several key benefits:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Enhanced Media Handling</strong>: FreeSWITCH excels in handling complex media tasks such as video conferencing and transcoding, which can offload some of the load from Asterisk.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Scalability</strong>: FreeSWITCH’s scalability makes it ideal for expanding the capacity of an Asterisk deployment.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Customization</strong>: By leveraging both platforms, users can customize call flows and features, optimizing each system for the tasks it handles best.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Prerequisites</h3>
<!-- /wp:heading -->

  Before beginning, ensure you have:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>FreeSWITCH and Asterisk are installed</strong> on separate servers (or virtual machines).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Basic networking knowledge</strong> and familiarity with VoIP protocols (such as SIP).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Administrative access</strong> to both FreeSWITCH and Asterisk servers.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Step 1: Network and Firewall Configuration</h3>
<!-- /wp:heading -->

  For seamless communication, start by allowing network access between the Asterisk and FreeSWITCH servers. Ensure that the following ports are open on both servers:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>SIP Port</strong>: 5060 (UDP) for SIP communication</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>RTP Ports</strong>: 16384-32768 (UDP) for media traffic</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  To configure the firewall on both servers:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Open SIP port
sudo firewall-cmd --add-port=5060/udp --permanent
# Open RTP range
sudo firewall-cmd --add-port=16384-32768/udp --permanent
# Reload firewall settings
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 2: Configure SIP Trunks</h3>
<!-- /wp:heading -->

  A SIP trunk between FreeSWITCH and Asterisk enables each system to route calls to the other.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On FreeSWITCH</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open the external SIP profile configuration on FreeSWITCH:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /usr/local/freeswitch/conf/sip_profiles/external.xml</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Define a new gateway for Asterisk with its IP address:</li>
<!-- /wp:list-item --></ol>
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
<li>Save and exit. Then reload the FreeSWITCH configuration to apply the changes:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   fs_cli -x "reloadxml"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Asterisk</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open the <code>pjsip.conf</code> file on your Asterisk server (or <code>sip.conf</code> if using chan_sip):</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /etc/asterisk/pjsip.conf</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Add a configuration for a SIP trunk to FreeSWITCH:</li>
<!-- /wp:list-item --></ol>
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
<li>Specify the address and authentication details for the FreeSWITCH SIP trunk:</li>
<!-- /wp:list-item --></ol>
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
<li>Save the file and reload Asterisk’s PJSIP module:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   asterisk -rx "pjsip reload"</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Step 3: Setting Up Dial Plans</h3>
<!-- /wp:heading -->

  With SIP trunks in place, configure dial plans to handle call routing between FreeSWITCH and Asterisk.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On FreeSWITCH</h4>
<!-- /wp:heading -->

  Edit the default dial plan on FreeSWITCH to route calls intended for Asterisk.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open <code>default.xml</code> for editing:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /usr/local/freeswitch/conf/dialplan/default.xml</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Add a new extension that matches calls destined for Asterisk:</li>
<!-- /wp:list-item --></ol>
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
<li>Save and exit the file, then reload the dial plan:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   fs_cli -x "reloadxml"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">On Asterisk</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open <code>extensions.conf</code> on Asterisk:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   sudo nano /etc/asterisk/extensions.conf</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Define a new context to route calls from Asterisk to FreeSWITCH:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">   [from-internal]
   exten =&gt; _4XXX,1,Dial(PJSIP/${EXTEN}@freeswitch)
   exten =&gt; _4XXX,n,Hangup()</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Save the file and reload the Asterisk dial plan:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   asterisk -rx "dialplan reload"</code></pre>
<!-- /wp:code -->

  With these dial plans in place, calls to numbers beginning with <code>3</code> will route from FreeSWITCH to Asterisk, and calls beginning with <code>4</code> will route from Asterisk to FreeSWITCH.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Step 4: Testing the Integration</h3>
<!-- /wp:heading -->

  With the configurations set up, it’s time to test calls between FreeSWITCH and Asterisk.</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Register Extensions</strong>: Make sure devices (softphones or hardware phones) are registered to extensions on each platform.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Place a Test Call</strong>: Try dialing an extension from FreeSWITCH to Asterisk (e.g., <code>3001</code>), and vice versa, to confirm the connection works.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Check Logs</strong>: If calls don’t connect, check the logs on both platforms for errors:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Asterisk</strong>: <code>/var/log/asterisk/full</code></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>FreeSWITCH</strong>: <code>/usr/local/freeswitch/log/freeswitch.log</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Use CLI Commands</strong>: The following commands help diagnose issues:</li>
<!-- /wp:list-item --></ol>
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

<!-- wp:heading {"level":3} -->
 ### Step 5: Advanced Configuration Options</h3>
<!-- /wp:heading -->

  To maximize the integration, consider some additional configurations:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Codec Synchronization</strong>: Ensure both systems use compatible codecs to avoid transcoding, which can reduce latency and improve call quality. Typical codecs are G.711 (ulaw) and G.729.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Failover and Load Balancing</strong>: For high availability, set up multiple FreeSWITCH or Asterisk servers and use SIP options like DNS SRV records for failover.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DTMF Handling</strong>: Ensure both systems use compatible DTMF modes (RFC2833, Inband, or SIP INFO) to avoid issues with interactive menus or IVRs.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>SIP Security</strong>: Enable IP filtering, strong passwords, and transport layer security (TLS) for SIP communications, especially if the servers are accessible over the internet.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Step 6: Troubleshooting Common Issues</h3>
<!-- /wp:heading -->

  Here are some common integration challenges and tips for troubleshooting:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>SIP Registration Errors</strong>: If Asterisk or FreeSWITCH isn’t registering with the other, check the SIP configuration for correct IPs, usernames, and passwords.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Codec Mismatch</strong>: Calls failing due to unsupported codec issues can be fixed by standardizing codecs on both platforms.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Network Latency</strong>: If there’s an echo or delay, ensure both servers are in low-latency environments, especially if using external cloud instances.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Logging and Debugging</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>FreeSWITCH: Increase logging level  <code>/usr/local/freeswitch/conf/autoload_configs/logfile.conf.xml</code> if more detailed information is needed.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Asterisk: Use <code>pjsip set logger on</code> to capture detailed SIP messaging logs.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Use Cases for FreeSWITCH and Asterisk Integration</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Unified Communications and IVR Systems</strong>: FreeSWITCH’s powerful IVR capabilities complement Asterisk’s call routing, creating a comprehensive communications platform.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Scalable Conference Bridge</strong>: FreeSWITCH’s media handling allows it to act as a conference bridge while Asterisk manages call control.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Custom PBX Features</strong>: FreeSWITCH can provide complex call handling and customization, while Asterisk can support traditional PBX functionalities.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

  Integrating FreeSWITCH with Asterisk opens up a wide range of possibilities for building robust, scalable, and feature-rich telephony solutions. With careful configuration of SIP trunks, dial plans, and codecs, these two platforms can work seamlessly together, creating a hybrid solution that maximizes each system’s strengths. Whether for a business PBX, conferencing solution, or advanced VoIP system, combining FreeSWITCH and Asterisk provides flexibility, performance, and scalability for diverse communication needs.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

  <strong>FAQs</strong></p>
 

  <strong>1. Can FreeSWITCH and Asterisk run on the same server?</strong><br>Yes, but it’s generally recommended to run them on separate servers to avoid port conflicts and improve performance.</p>
 

  <strong>2. What are the benefits of using both FreeSWITCH and Asterisk?</strong><br>Combining both platforms leverages FreeSWITCH’s media capabilities and Asterisk’s call handling, creating a more versatile communication solution.</p>
 

  <strong>3. How do I ensure call quality between FreeSWITCH and Asterisk?</strong><br>Standardize compatible codecs (e.g., G.711) and minimize transcoding to improve call quality.</p>
 

  <strong>4. Can I use this setup with other VoIP providers?</strong><br>Yes, both FreeSWITCH and Asterisk can connect to external VoIP providers, allowing flexibility in routing and redundancy.</p>
 

  <strong>5. What are the best security practices for SIP integration?</strong><br>Use strong passwords, enable TLS, restrict IP access, and keep both systems updated to secure SIP integration.</p>
 