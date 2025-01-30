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
<include>
  <gateway name="my_provider">
    <param name="username" value="your_username"/>
    <param name="password" value="your_password"/>
    <param name="proxy" value="sip.provider.com"/>
    <param name="register" value="true"/>
    <param name="context" value="public"/>
    <param name="caller-id-in-from" value="false"/>
    <param name="register-transport" value="udp"/>
  </gateway>
</include>
```



2. External Profile Configuration



Modify `/usr/local/freeswitch/conf/sip_profiles/external.xml`:


```
<profile name="external">
  <settings>
    <param name="ext-sip-ip" value="auto-nat"/>
    <param name="ext-rtp-ip" value="auto-nat"/>
    <param name="context" value="public"/>
    <param name="sip-port" value="5080"/>
    <param name="rtp-timer-name" value="soft"/>
  </settings>
</profile>
```



## Advanced Gateway Parameters



1. Authentication and Registration


```
<gateway name="secure_provider">
  <param name="realm" value="sip.provider.com"/>
  <param name="from-domain" value="sip.provider.com"/>
  <param name="register-proxy" value="proxy.provider.com"/>
  <param name="expire-seconds" value="3600"/>
  <param name="register-transport" value="tls"/>
  <param name="retry-seconds" value="30"/>
</gateway>
```



2. Codec Configuration


```
<gateway name="codec_specific">
  <param name="inbound-codec-prefs" value="PCMU,PCMA,G729"/>
  <param name="outbound-codec-prefs" value="PCMU,PCMA,G729"/>
  <param name="inbound-codec-negotiation" value="greedy"/>
  <param name="codec-fallback" value="PCMU"/>
</gateway>
```



## Routing Configuration



1. Outbound Route Setup



Create `/usr/local/freeswitch/conf/dialplan/default/03_outbound.xml`:


```
<include>
  <context name="default">
    <extension name="outbound_calls">
      <condition field="destination_number" expression="^(\d{11})$">
        <action application="set" data="effective_caller_id_number=${outbound_caller_id_number}"/>
        <action application="set" data="hangup_after_bridge=true"/>
        <action application="bridge" data="sofia/gateway/my_provider/$1"/>
      </condition>
    </extension>
  </context>
</include>
```



2. Inbound Route Setup



Create `/usr/local/freeswitch/conf/dialplan/public/01_inbound.xml`:


```
<include>
  <context name="public">
    <extension name="inbound_did">
      <condition field="destination_number" expression="^(1\d{10})$">
        <action application="set" data="domain_name=$${domain}"/>
        <action application="transfer" data="1000 XML default"/>
      </condition>
    </extension>
  </context>
</include>
```



## Failover and Load Balancing



1. Multiple Gateway Setup


```
<include>
  <gateway name="primary_provider">
    <param name="proxy" value="sip1.provider.com"/>
    <param name="register" value="true"/>
  </gateway>

  <gateway name="backup_provider">
    <param name="proxy" value="sip2.provider.com"/>
    <param name="register" value="true"/>
  </gateway>
</include>
```



2. Failover Dialplan


```
<extension name="outbound_with_failover">
  <condition field="destination_number" expression="^(\d{11})$">
    <action application="set" data="hangup_after_bridge=true"/>
    <action application="bridge" data="sofia/gateway/primary_provider/$1,sofia/gateway/backup_provider/$1"/>
  </condition>
</extension>
```



## Security Configurations



1. TLS Setup


```
<gateway name="secure_trunk">
  <param name="register-transport" value="tls"/>
  <param name="secure-sip" value="true"/>
  <param name="secure-rtp" value="true"/>
  <param name="ssl-cacert" value="/etc/freeswitch/tls/ca.crt"/>
  <param name="ssl-cert" value="/etc/freeswitch/tls/client.crt"/>
  <param name="ssl-key" value="/etc/freeswitch/tls/client.key"/>
</gateway>
```



2. Access Control Lists


```
<configuration name="acl.conf" description="Network Lists">
  <network-lists>
    <list name="trusted_providers" default="deny">
      <node type="allow" cidr="203.0.113.0/24"/>
      <node type="allow" cidr="198.51.100.0/24"/>
    </list>
  </network-lists>
</configuration>
```



## Quality of Service (QoS)



1. RTP Configuration


```
<gateway name="qos_enabled">
  <param name="rtp-timer-name" value="soft"/>
  <param name="rtp-ip" value="auto"/>
  <param name="apply-inbound-acl" value="trusted_providers"/>
  <param name="dtmf-type" value="rfc2833"/>
  <param name="rtp-timeout-sec" value="300"/>
  <param name="rtp-hold-timeout-sec" value="1800"/>
</gateway>
```



2. Bandwidth Management


```
<gateway name="bandwidth_managed">
  <param name="inbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/>
  <param name="outbound-codec-prefs" value="PCMU@20i,PCMA@20i,G729@20i"/>
  <param name="suppress-cng" value="true"/>
  <param name="rtp-digit-delay" value="20"/>
</gateway>
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
<param name="sip-trace" value="true"/>
<param name="log-auth-failures" value="true"/>
<param name="debug-presence" value="0"/>
<param name="debug-sla" value="0"/>
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
