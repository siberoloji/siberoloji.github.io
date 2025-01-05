---
draft: false

title:  'Configuring SIP Trunks in FreeSWITCH'
date: '2024-10-29T14:21:13+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This comprehensive guide will walk you through the process of configuring SIP trunks in FreeSWITCH, from basic setup to advanced configurations.' 
 
url:  /configuring-sip-trunks-in-freeswitch/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


SIP trunking is a crucial component of modern VoIP systems, allowing FreeSWITCH to connect with external service providers for making and receiving calls. This comprehensive guide will walk you through the process of configuring SIP trunks in FreeSWITCH, from basic setup to advanced configurations.



## Understanding SIP Trunks



What is an SIP Trunk?



A SIP trunk is a virtual connection between your <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> system and an Internet Telephony Service Provider (ITSP). It enables:


* Outbound calls to the PSTN network

* Inbound calls from external numbers

* Cost-effective long-distance calling

* Multiple concurrent call channels




## Basic SIP Trunk Configuration



1. Gateway Configuration



Create a new file in `/usr/local/freeswitch/conf/sip_profiles/external/`:


```
&lt;include&gt;
  &lt;gateway name="my_provider"&gt;
    &lt;param name="username" value="your_username"/&gt;
    &lt;param name="password" value="your_password"/&gt;
    &lt;param name="proxy" value="sip.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
    &lt;param name="context" value="public"/&gt;
    &lt;param name="caller-id-in-from" value="false"/&gt;
    &lt;param name="register-transport" value="udp"/&gt;
  &lt;/gateway&gt;
&lt;/include&gt;
```



2. External Profile Configuration



Modify `/usr/local/freeswitch/conf/sip_profiles/external.xml`:


```
&lt;profile name="external"&gt;
  &lt;settings&gt;
    &lt;param name="ext-sip-ip" value="auto-nat"/&gt;
    &lt;param name="ext-rtp-ip" value="auto-nat"/&gt;
    &lt;param name="context" value="public"/&gt;
    &lt;param name="sip-port" value="5080"/&gt;
    &lt;param name="rtp-timer-name" value="soft"/&gt;
  &lt;/settings&gt;
&lt;/profile&gt;
```



## Advanced Gateway Parameters



1. Authentication and Registration


```
&lt;gateway name="secure_provider"&gt;
  &lt;param name="realm" value="sip.provider.com"/&gt;
  &lt;param name="from-domain" value="sip.provider.com"/&gt;
  &lt;param name="register-proxy" value="proxy.provider.com"/&gt;
  &lt;param name="expire-seconds" value="3600"/&gt;
  &lt;param name="register-transport" value="tls"/&gt;
  &lt;param name="retry-seconds" value="30"/&gt;
&lt;/gateway&gt;
```



2. Codec Configuration


```
&lt;gateway name="codec_specific"&gt;
  &lt;param name="inbound-codec-prefs" value="PCMU,PCMA,G729"/&gt;
  &lt;param name="outbound-codec-prefs" value="PCMU,PCMA,G729"/&gt;
  &lt;param name="inbound-codec-negotiation" value="greedy"/&gt;
  &lt;param name="codec-fallback" value="PCMU"/&gt;
&lt;/gateway&gt;
```



## Routing Configuration



1. Outbound Route Setup



Create `/usr/local/freeswitch/conf/dialplan/default/03_outbound.xml`:


```
&lt;include&gt;
  &lt;context name="default"&gt;
    &lt;extension name="outbound_calls"&gt;
      &lt;condition field="destination_number" expression="^(\d{11})$"&gt;
        &lt;action application="set" data="effective_caller_id_number=${outbound_caller_id_number}"/&gt;
        &lt;action application="set" data="hangup_after_bridge=true"/&gt;
        &lt;action application="bridge" data="sofia/gateway/my_provider/$1"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;
```



2. Inbound Route Setup



Create `/usr/local/freeswitch/conf/dialplan/public/01_inbound.xml`:


```
&lt;include&gt;
  &lt;context name="public"&gt;
    &lt;extension name="inbound_did"&gt;
      &lt;condition field="destination_number" expression="^(1\d{10})$"&gt;
        &lt;action application="set" data="domain_name=$${domain}"/&gt;
        &lt;action application="transfer" data="1000 XML default"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;
```



## Failover and Load Balancing



1. Multiple Gateway Setup


```
&lt;include&gt;
  &lt;gateway name="primary_provider"&gt;
    &lt;param name="proxy" value="sip1.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
  &lt;/gateway&gt;

  &lt;gateway name="backup_provider"&gt;
    &lt;param name="proxy" value="sip2.provider.com"/&gt;
    &lt;param name="register" value="true"/&gt;
  &lt;/gateway&gt;
&lt;/include&gt;
```



2. Failover Dialplan


```
&lt;extension name="outbound_with_failover"&gt;
  &lt;condition field="destination_number" expression="^(\d{11})$"&gt;
    &lt;action application="set" data="hangup_after_bridge=true"/&gt;
    &lt;action application="bridge" data="sofia/gateway/primary_provider/$1,sofia/gateway/backup_provider/$1"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;
```



## Security Configurations



1. TLS Setup


```
&lt;gateway name="secure_trunk"&gt;
  &lt;param name="register-transport" value="tls"/&gt;
  &lt;param name="secure-sip" value="true"/&gt;
  &lt;param name="secure-rtp" value="true"/&gt;
  &lt;param name="ssl-cacert" value="/etc/freeswitch/tls/ca.crt"/&gt;
  &lt;param name="ssl-cert" value="/etc/freeswitch/tls/client.crt"/&gt;
  &lt;param name="ssl-key" value="/etc/freeswitch/tls/client.key"/&gt;
&lt;/gateway&gt;
```



2. Access Control Lists


```
&lt;configuration name="acl.conf" description="Network Lists"&gt;
  &lt;network-lists&gt;
    &lt;list name="trusted_providers" default="deny"&gt;
      &lt;node type="allow" cidr="203.0.113.0/24"/&gt;
      &lt;node type="allow" cidr="198.51.100.0/24"/&gt;
    &lt;/list&gt;
  &lt;/network-lists&gt;
&lt;/configuration&gt;
```



## Quality of Service (QoS)



1. RTP Configuration


```
&lt;gateway name="qos_enabled"&gt;
  &lt;param name="rtp-timer-name" value="soft"/&gt;
  &lt;param name="rtp-ip" value="auto"/&gt;
  &lt;param name="apply-inbound-acl" value="trusted_providers"/&gt;
  &lt;param name="dtmf-type" value="rfc2833"/&gt;
  &lt;param name="rtp-timeout-sec" value="300"/&gt;
  &lt;param name="rtp-hold-timeout-sec" value="1800"/&gt;
&lt;/gateway&gt;
```



2. Bandwidth Management


```
&lt;gateway name="bandwidth_managed"&gt;
  &lt;param name="inbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/&gt;
  &lt;param name="outbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/&gt;
  &lt;param name="suppress-cng" value="true"/&gt;
  &lt;param name="rtp-digit-delay" value="20"/&gt;
&lt;/gateway&gt;
```



## Monitoring and Troubleshooting



1. Sofia Status Commands



In fs_cli:


```bash
sofia status
sofia status gateway my_provider
sofia loglevel all 9```



2. Logging Configuration


```
&lt;param name="sip-trace" value="true"/&gt;
&lt;param name="log-auth-failures" value="true"/&gt;
&lt;param name="debug-presence" value="0"/&gt;
&lt;param name="debug-sla" value="0"/&gt;
```



## Best Practices



1. Gateway Organization


* Use meaningful gateway names

* Group similar providers

* Document configurations

* Regular backup of configurations




2. Security Measures


* Implement strong passwords

* Use TLS when possible

* Regular security audits

* Monitor for suspicious activity




3. Performance Optimization


* Regular monitoring of call quality

* Bandwidth management

* Codec optimization

* Connection testing




## Testing and Verification



1. Basic Tests


```bash
# Check gateway registration
fs_cli -x "sofia status gateway my_provider"

# Test outbound calling
fs_cli -x "originate sofia/gateway/my_provider/11234567890 &amp;echo"

# Check SIP messages
fs_cli -x "sofia global siptrace on"```



2. Ongoing Maintenance


* Regular registration checks

* Call quality monitoring

* Performance metrics collection

* Log analysis




## Conclusion



Properly configured SIP trunks are essential for a reliable FreeSWITCH system. Key points to remember for configuring SIP trunks in FreeSWITCH:


* Start with basic configuration and build up

* Implement proper security measures

* Monitor and maintain regularly

* Document all changes

* Test thoroughly before production deployment




As your system grows, consider:


* Implementing redundancy

* Load balancing

* Advanced security measures

* Quality of service optimization

* Regular audits and updates




Keep your FreeSWITCH system up to date and regularly check for security advisories and best practices from your ITSP and the FreeSWITCH community.
