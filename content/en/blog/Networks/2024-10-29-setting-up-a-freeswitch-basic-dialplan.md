---
draft: false

title:  'Setting Up a FreeSWITCH Basic Dialplan'
date: '2024-10-29T13:59:28+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this comprehensive guide, we''ll explore how to create and configure a FreeSWITCH basic dialplan that handles common calling scenarios. ' 
 
url:  /setting-up-a-freeswitch-basic-dialplan/
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
---


Dialplans are the heart of FreeSWITCH, determining how calls are routed and processed within your system. In this comprehensive guide, we'll explore how to create and configure a FreeSWITCH basic dialplan that handles common calling scenarios. Whether you're new to FreeSWITCH or looking to enhance your existing setup, this guide will help you understand and implement effective call routing strategies.



## Understanding Dialplan Basics



What is a Dialplan?



A dialplan is a set of instructions that tells FreeSWITCH how to handle calls. It's essentially a routing table that determines what happens when someone makes a call through your system. Dialplans in FreeSWITCH are written in XML and consist of several key components:


* Contexts

* Extensions

* Conditions

* Actions

* Anti-Actions




## Dialplan Structure



Basic XML Structure


```xml
<include>
  <context name="my_context">
    <extension name="my_extension">
      <condition field="destination_number" expression="^(\d+)$">
        <action application="bridge" data="user/${destination_number}"/>
      </condition>
    </extension>
  </context>
</include>
```



Key Components Explained


* **Context**: A logical grouping of extensions

* **Extension**: A set of rules for handling specific calls

* **Condition**: Criteria that must be met for actions to execute

* **Action**: What happens when conditions are met

* **Anti-Action**: What happens when conditions are not met




## Creating Your First Dialplan



1. Basic Internal Calls



Create a new file `/usr/local/freeswitch/conf/dialplan/default/01_internal.xml`:


```xml
<include>
  <context name="default">
    <!-- Extension to Extension Calls -->
    <extension name="internal">
      <condition field="destination_number" expression="^(10[01][0-9])$">
        <action application="set" data="ringback=${us-ring}"/>
        <action application="bridge" data="user/$1"/>
      </condition>
    </extension>

    <!-- Voicemail Access -->
    <extension name="voicemail">
      <condition field="destination_number" expression="^(\*98)$">
        <action application="answer"/>
        <action application="voicemail" data="check default ${domain_name} ${caller_id_number}"/>
      </condition>
    </extension>
  </context>
</include>
```



2. Adding External Calls



Create `/usr/local/freeswitch/conf/dialplan/default/02_external.xml`:


```xml
<include>
  <context name="default">
    <!-- Outbound Calls -->
    <extension name="outbound">
      <condition field="destination_number" expression="^(1?\d{10})$">
        <action application="set" data="effective_caller_id_number=${outbound_caller_id_number}"/>
        <action application="bridge" data="sofia/gateway/my_provider/$1"/>
      </condition>
    </extension>
  </context>
</include>
```



## Common Dialplan Features



1. Time-Based Routing


```
<extension name="business_hours">
  <condition wday="2-6" hour="9-17"> <!-- Monday-Friday, 9 AM-5 PM -->
    <action application="bridge" data="user/1000"/>
  <anti-action application="voicemail" data="default ${domain_name} 1000"/>
  </condition>
</extension>
```



2. IVR (Interactive Voice Response)


```
<extension name="main_ivr">
  <condition field="destination_number" expression="^(5000)$">
    <action application="answer"/>
    <action application="sleep" data="1000"/>
    <action application="ivr" data="main_menu"/>
  </condition>
</extension>
```



3. Conference Rooms


```
<extension name="conferences">
  <condition field="destination_number" expression="^(3\d{3})$">
    <action application="answer"/>
    <action application="conference" data="$1@default"/>
  </condition>
</extension>
```



## Advanced Dialplan Techniques



1. Call Recording


```
<extension name="record_calls">
  <condition field="destination_number" expression="^(record_\d+)$">
    <action application="set" data="RECORD_STEREO=true"/>
    <action application="set" data="record_file=/recordings/${strftime(%Y-%m-%d_%H-%M-%S)}_${destination_number}.wav"/>
    <action application="record_session" data="${record_file}"/>
    <action application="bridge" data="user/$1"/>
  </condition>
</extension>
```



2. Call Queues


```
<extension name="support_queue">
  <condition field="destination_number" expression="^(7000)$">
    <action application="answer"/>
    <action application="set" data="queue_moh=$${hold_music}"/>
    <action application="callcenter" data="support@default"/>
  </condition>
</extension>
```



3. Failover Routing


```
<extension name="failover">
  <condition field="destination_number" expression="^(2\d{3})$">
    <action application="set" data="call_timeout=20"/>
    <action application="set" data="hangup_after_bridge=true"/>
    <action application="bridge" data="user/$1,user/${default_gateway}"/>
  </condition>
</extension>
```



## Best Practices



1. Organization


* Use numbered files for loading order (01_internal.xml, 02_external.xml, etc.)

* Group similar extensions together

* Comment your dialplan thoroughly




2. Security


```
<extension name="limit_international">
  <condition field="destination_number" expression="^(011\d+)$">
    <condition field="${user_data(${caller_id_number} international_allowed)}" expression="^true$">
      <action application="bridge" data="sofia/gateway/my_provider/$1"/>
    <anti-action application="playback" data="not_authorized.wav"/>
    </condition>
  </condition>
</extension>
```



3. Error Handling


```
<extension name="handle_failed_calls">
  <condition field="${originate_disposition}" expression="^(BUSY|NO_ANSWER|USER_NOT_REGISTERED)$">
    <action application="voicemail" data="default ${domain_name} ${dialed_extension}"/>
  </condition>
</extension>
```



## Testing and Debugging



1. Log Configuration



Add to `/usr/local/freeswitch/conf/autoload_configs/switch.conf.xml`:


```
<param name="loglevel" value="debug"/>
```



2. Testing Commands



In fs_cli:


```
reloadxml
show dialplan
eval ${destination_number}
```



## Common Troubleshooting



1. Dialplan Not Working



Check these common issues:


* XML syntax errors

* Regular expression patterns

* File permissions

* Context names matching the user's context




2. Call Routing Issues



Verify:


* Gateway configurations

* User directory settings

* Network connectivity

* SIP profile settings




## Monitoring and Maintenance



1. Regular Checks


```bash
# Check dialplan syntax
/usr/local/freeswitch/bin/fs_cli -x "xml_validate"

# Monitor active calls
/usr/local/freeswitch/bin/fs_cli -x "show calls"```



2. Performance Monitoring


```
<extension name="performance_monitoring">
  <condition field="destination_number" expression=".*">
    <action application="set" data="call_start=${strftime()}"/>
    <action application="log" data="info Call started: ${call_start}"/>
  </condition>
</extension>
```



## Conclusion



Creating an effective dialplan is crucial for a well-functioning FreeSWITCH system. Start with basic call routing and gradually add more complex features as needed. Remember to:


* Keep your dialplan organized and well-documented

* Test thoroughly before deploying changes

* Monitor performance and logs regularly

* Implement security measures

* Plan for scalability




As your system grows, you can expand your dialplan to include more advanced features like:


* Multi-tenant configurations

* Advanced IVR systems

* Custom applications

* Integration with external systems




Regular maintenance and updates will ensure your <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> system continues to handle calls efficiently and reliably.
