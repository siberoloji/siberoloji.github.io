---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T14:21:13Z"
excerpt: This comprehensive guide will walk you through the process of configuring
  SIP trunks in FreeSWITCH, from basic setup to advanced configurations.
guid: https://www.siberoloji.com/?p=5564
id: 5564
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: Configuring SIP Trunks in FreeSWITCH
url: /configuring-sip-trunks-in-freeswitch/
---

  SIP trunking is a crucial component of modern VoIP systems, allowing FreeSWITCH to connect with external service providers for making and receiving calls. This comprehensive guide will walk you through the process of configuring SIP trunks in FreeSWITCH, from basic setup to advanced configurations.</p>
 

 
 ## Understanding SIP Trunks</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### What is an SIP Trunk?</h3>
<!-- /wp:heading -->

  A SIP trunk is a virtual connection between your <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> system and an Internet Telephony Service Provider (ITSP). It enables:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Outbound calls to the PSTN network</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Inbound calls from external numbers</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Cost-effective long-distance calling</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Multiple concurrent call channels</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Basic SIP Trunk Configuration</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Gateway Configuration</h3>
<!-- /wp:heading -->

  Create a new file in <code>/usr/local/freeswitch/conf/sip_profiles/external/</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;gateway name="my_provider"&gt;
    &lt;param name="username" value="your_username"/&gt;
    &lt;param name="password" value="your_password"/&gt;
    &lt;param name="proxy" value="sip.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
    &lt;param name="context" value="public"/&gt;
    &lt;param name="caller-id-in-from" value="false"/&gt;
    &lt;param name="register-transport" value="udp"/&gt;
  &lt;/gateway&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. External Profile Configuration</h3>
<!-- /wp:heading -->

  Modify <code>/usr/local/freeswitch/conf/sip_profiles/external.xml</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;profile name="external"&gt;
  &lt;settings&gt;
    &lt;param name="ext-sip-ip" value="auto-nat"/&gt;
    &lt;param name="ext-rtp-ip" value="auto-nat"/&gt;
    &lt;param name="context" value="public"/&gt;
    &lt;param name="sip-port" value="5080"/&gt;
    &lt;param name="rtp-timer-name" value="soft"/&gt;
  &lt;/settings&gt;
&lt;/profile&gt;</code></pre>
<!-- /wp:code -->

 
 ## Advanced Gateway Parameters</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Authentication and Registration</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;gateway name="secure_provider"&gt;
  &lt;param name="realm" value="sip.provider.com"/&gt;
  &lt;param name="from-domain" value="sip.provider.com"/&gt;
  &lt;param name="register-proxy" value="proxy.provider.com"/&gt;
  &lt;param name="expire-seconds" value="3600"/&gt;
  &lt;param name="register-transport" value="tls"/&gt;
  &lt;param name="retry-seconds" value="30"/&gt;
&lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Codec Configuration</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;gateway name="codec_specific"&gt;
  &lt;param name="inbound-codec-prefs" value="PCMU,PCMA,G729"/&gt;
  &lt;param name="outbound-codec-prefs" value="PCMU,PCMA,G729"/&gt;
  &lt;param name="inbound-codec-negotiation" value="greedy"/&gt;
  &lt;param name="codec-fallback" value="PCMU"/&gt;
&lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

 
 ## Routing Configuration</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Outbound Route Setup</h3>
<!-- /wp:heading -->

  Create <code>/usr/local/freeswitch/conf/dialplan/default/03_outbound.xml</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;context name="default"&gt;
    &lt;extension name="outbound_calls"&gt;
      &lt;condition field="destination_number" expression="^(\d{11})$"&gt;
        &lt;action application="set" data="effective_caller_id_number=${outbound_caller_id_number}"/&gt;
        &lt;action application="set" data="hangup_after_bridge=true"/&gt;
        &lt;action application="bridge" data="sofia/gateway/my_provider/$1"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Inbound Route Setup</h3>
<!-- /wp:heading -->

  Create <code>/usr/local/freeswitch/conf/dialplan/public/01_inbound.xml</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;context name="public"&gt;
    &lt;extension name="inbound_did"&gt;
      &lt;condition field="destination_number" expression="^(1\d{10})$"&gt;
        &lt;action application="set" data="domain_name=$${domain}"/&gt;
        &lt;action application="transfer" data="1000 XML default"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

 
 ## Failover and Load Balancing</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Multiple Gateway Setup</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;gateway name="primary_provider"&gt;
    &lt;param name="proxy" value="sip1.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
  &lt;/gateway&gt;

  &lt;gateway name="backup_provider"&gt;
    &lt;param name="proxy" value="sip2.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
  &lt;/gateway&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Failover Dialplan</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="outbound_with_failover"&gt;
  &lt;condition field="destination_number" expression="^(\d{11})$"&gt;
    &lt;action application="set" data="hangup_after_bridge=true"/&gt;
    &lt;action application="bridge" data="sofia/gateway/primary_provider/$1,sofia/gateway/backup_provider/$1"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Security Configurations</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. TLS Setup</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;gateway name="secure_trunk"&gt;
  &lt;param name="register-transport" value="tls"/&gt;
  &lt;param name="secure-sip" value="true"/&gt;
  &lt;param name="secure-rtp" value="true"/&gt;
  &lt;param name="ssl-cacert" value="/etc/freeswitch/tls/ca.crt"/&gt;
  &lt;param name="ssl-cert" value="/etc/freeswitch/tls/client.crt"/&gt;
  &lt;param name="ssl-key" value="/etc/freeswitch/tls/client.key"/&gt;
&lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Access Control Lists</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;configuration name="acl.conf" description="Network Lists"&gt;
  &lt;network-lists&gt;
    &lt;list name="trusted_providers" default="deny"&gt;
      &lt;node type="allow" cidr="203.0.113.0/24"/&gt;
      &lt;node type="allow" cidr="198.51.100.0/24"/&gt;
    &lt;/list&gt;
  &lt;/network-lists&gt;
&lt;/configuration&gt;</code></pre>
<!-- /wp:code -->

 
 ## Quality of Service (QoS)</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. RTP Configuration</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;gateway name="qos_enabled"&gt;
  &lt;param name="rtp-timer-name" value="soft"/&gt;
  &lt;param name="rtp-ip" value="auto"/&gt;
  &lt;param name="apply-inbound-acl" value="trusted_providers"/&gt;
  &lt;param name="dtmf-type" value="rfc2833"/&gt;
  &lt;param name="rtp-timeout-sec" value="300"/&gt;
  &lt;param name="rtp-hold-timeout-sec" value="1800"/&gt;
&lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Bandwidth Management</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;gateway name="bandwidth_managed"&gt;
  &lt;param name="inbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/&gt;
  &lt;param name="outbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/&gt;
  &lt;param name="suppress-cng" value="true"/&gt;
  &lt;param name="rtp-digit-delay" value="20"/&gt;
&lt;/gateway&gt;</code></pre>
<!-- /wp:code -->

 
 ## Monitoring and Troubleshooting</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Sofia Status Commands</h3>
<!-- /wp:heading -->

  In fs_cli:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sofia status
sofia status gateway my_provider
sofia loglevel all 9</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Logging Configuration</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;param name="sip-trace" value="true"/&gt;
&lt;param name="log-auth-failures" value="true"/&gt;
&lt;param name="debug-presence" value="0"/&gt;
&lt;param name="debug-sla" value="0"/&gt;</code></pre>
<!-- /wp:code -->

 
 ## Best Practices</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Gateway Organization</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Use meaningful gateway names</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Group similar providers</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Document configurations</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Regular backup of configurations</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 2. Security Measures</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Implement strong passwords</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Use TLS when possible</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Regular security audits</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitor for suspicious activity</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 3. Performance Optimization</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Regular monitoring of call quality</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bandwidth management</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Codec optimization</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Connection testing</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Testing and Verification</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Basic Tests</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Check gateway registration
fs_cli -x "sofia status gateway my_provider"

# Test outbound calling
fs_cli -x "originate sofia/gateway/my_provider/11234567890 &amp;echo"

# Check SIP messages
fs_cli -x "sofia global siptrace on"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Ongoing Maintenance</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Regular registration checks</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Call quality monitoring</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Performance metrics collection</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Log analysis</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

  Properly configured SIP trunks are essential for a reliable FreeSWITCH system. Key points to remember for configuring SIP trunks in FreeSWITCH:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Start with basic configuration and build up</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Implement proper security measures</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitor and maintain regularly</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Document all changes</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Test thoroughly before production deployment</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  As your system grows, consider:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Implementing redundancy</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Load balancing</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Advanced security measures</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Quality of service optimization</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Regular audits and updates</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Keep your FreeSWITCH system up to date and regularly check for security advisories and best practices from your ITSP and the FreeSWITCH community.</p>
 