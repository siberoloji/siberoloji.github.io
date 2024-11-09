---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Networks
date: "2024-10-29T13:59:28Z"
excerpt: 'In this comprehensive guide, we''ll explore how to create and configure
  a FreeSWITCH basic dialplan that handles common calling scenarios. '
guid: https://www.siberoloji.com/?p=5559
id: 5559
image: /assets/images/2024/10/freeswitch1.webp
tags:
- freeswitch
title: Setting Up a FreeSWITCH Basic Dialplan
url: /setting-up-a-freeswitch-basic-dialplan/
---

  Dialplans are the heart of FreeSWITCH, determining how calls are routed and processed within your system. In this comprehensive guide, we'll explore how to create and configure a FreeSWITCH basic dialplan that handles common calling scenarios. Whether you're new to FreeSWITCH or looking to enhance your existing setup, this guide will help you understand and implement effective call routing strategies. 
 

 
 ## Understanding Dialplan Basics
<!-- /wp:heading -->


 ### What is a Dialplan?
<!-- /wp:heading -->

  A dialplan is a set of instructions that tells FreeSWITCH how to handle calls. It's essentially a routing table that determines what happens when someone makes a call through your system. Dialplans in FreeSWITCH are written in XML and consist of several key components: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Contexts 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Extensions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Conditions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Actions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Anti-Actions 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Dialplan Structure
<!-- /wp:heading -->


 ### Basic XML Structure
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;context name="my_context"&gt;
    &lt;extension name="my_extension"&gt;
      &lt;condition field="destination_number" expression="^(\d+)$"&gt;
        &lt;action application="bridge" data="user/${destination_number}"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->


 ### Key Components Explained
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Context*** : A logical grouping of extensions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Extension*** : A set of rules for handling specific calls 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Condition*** : Criteria that must be met for actions to execute 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Action*** : What happens when conditions are met 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Anti-Action*** : What happens when conditions are not met 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Creating Your First Dialplan
<!-- /wp:heading -->


 ### 1. Basic Internal Calls
<!-- /wp:heading -->

  Create a new file <code>/usr/local/freeswitch/conf/dialplan/default/01_internal.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;context name="default"&gt;
    &lt;!-- Extension to Extension Calls --&gt;
    &lt;extension name="internal"&gt;
      &lt;condition field="destination_number" expression="^(10[01][0-9])$"&gt;
        &lt;action application="set" data="ringback=${us-ring}"/&gt;
        &lt;action application="bridge" data="user/$1"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;

    &lt;!-- Voicemail Access --&gt;
    &lt;extension name="voicemail"&gt;
      &lt;condition field="destination_number" expression="^(\*98)$"&gt;
        &lt;action application="answer"/&gt;
        &lt;action application="voicemail" data="check default ${domain_name} ${caller_id_number}"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->


 ### 2. Adding External Calls
<!-- /wp:heading -->

  Create <code>/usr/local/freeswitch/conf/dialplan/default/02_external.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;include&gt;
  &lt;context name="default"&gt;
    &lt;!-- Outbound Calls --&gt;
    &lt;extension name="outbound"&gt;
      &lt;condition field="destination_number" expression="^(1?\d{10})$"&gt;
        &lt;action application="set" data="effective_caller_id_number=${outbound_caller_id_number}"/&gt;
        &lt;action application="bridge" data="sofia/gateway/my_provider/$1"/&gt;
      &lt;/condition&gt;
    &lt;/extension&gt;
  &lt;/context&gt;
&lt;/include&gt;</code></pre>
<!-- /wp:code -->

 
 ## Common Dialplan Features
<!-- /wp:heading -->


 ### 1. Time-Based Routing
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="business_hours"&gt;
  &lt;condition wday="2-6" hour="9-17"&gt; &lt;!-- Monday-Friday, 9 AM-5 PM --&gt;
    &lt;action application="bridge" data="user/1000"/&gt;
  &lt;anti-action application="voicemail" data="default ${domain_name} 1000"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->


 ### 2. IVR (Interactive Voice Response)
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="main_ivr"&gt;
  &lt;condition field="destination_number" expression="^(5000)$"&gt;
    &lt;action application="answer"/&gt;
    &lt;action application="sleep" data="1000"/&gt;
    &lt;action application="ivr" data="main_menu"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->


 ### 3. Conference Rooms
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="conferences"&gt;
  &lt;condition field="destination_number" expression="^(3\d{3})$"&gt;
    &lt;action application="answer"/&gt;
    &lt;action application="conference" data="$1@default"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Advanced Dialplan Techniques
<!-- /wp:heading -->


 ### 1. Call Recording
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="record_calls"&gt;
  &lt;condition field="destination_number" expression="^(record_\d+)$"&gt;
    &lt;action application="set" data="RECORD_STEREO=true"/&gt;
    &lt;action application="set" data="record_file=/recordings/${strftime(%Y-%m-%d_%H-%M-%S)}_${destination_number}.wav"/&gt;
    &lt;action application="record_session" data="${record_file}"/&gt;
    &lt;action application="bridge" data="user/$1"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->


 ### 2. Call Queues
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="support_queue"&gt;
  &lt;condition field="destination_number" expression="^(7000)$"&gt;
    &lt;action application="answer"/&gt;
    &lt;action application="set" data="queue_moh=$${hold_music}"/&gt;
    &lt;action application="callcenter" data="support@default"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->


 ### 3. Failover Routing
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="failover"&gt;
  &lt;condition field="destination_number" expression="^(2\d{3})$"&gt;
    &lt;action application="set" data="call_timeout=20"/&gt;
    &lt;action application="set" data="hangup_after_bridge=true"/&gt;
    &lt;action application="bridge" data="user/$1,user/${default_gateway}"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Best Practices
<!-- /wp:heading -->


 ### 1. Organization
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Use numbered files for loading order (01_internal.xml, 02_external.xml, etc.) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Group similar extensions together 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Comment your dialplan thoroughly 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 2. Security
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="limit_international"&gt;
  &lt;condition field="destination_number" expression="^(011\d+)$"&gt;
    &lt;condition field="${user_data(${caller_id_number} international_allowed)}" expression="^true$"&gt;
      &lt;action application="bridge" data="sofia/gateway/my_provider/$1"/&gt;
    &lt;anti-action application="playback" data="not_authorized.wav"/&gt;
    &lt;/condition&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->


 ### 3. Error Handling
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="handle_failed_calls"&gt;
  &lt;condition field="${originate_disposition}" expression="^(BUSY|NO_ANSWER|USER_NOT_REGISTERED)$"&gt;
    &lt;action application="voicemail" data="default ${domain_name} ${dialed_extension}"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Testing and Debugging
<!-- /wp:heading -->


 ### 1. Log Configuration
<!-- /wp:heading -->

  Add to <code>/usr/local/freeswitch/conf/autoload_configs/switch.conf.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;param name="loglevel" value="debug"/&gt;</code></pre>
<!-- /wp:code -->


 ### 2. Testing Commands
<!-- /wp:heading -->

  In fs_cli: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">reloadxml
show dialplan
eval ${destination_number}</code></pre>
<!-- /wp:code -->

 
 ## Common Troubleshooting
<!-- /wp:heading -->


 ### 1. Dialplan Not Working
<!-- /wp:heading -->

  Check these common issues: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- XML syntax errors 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Regular expression patterns 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- File permissions 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Context names matching the user's context 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 2. Call Routing Issues
<!-- /wp:heading -->

  Verify: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Gateway configurations 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- User directory settings 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Network connectivity 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SIP profile settings 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Monitoring and Maintenance
<!-- /wp:heading -->


 ### 1. Regular Checks
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Check dialplan syntax
/usr/local/freeswitch/bin/fs_cli -x "xml_validate"

# Monitor active calls
/usr/local/freeswitch/bin/fs_cli -x "show calls"</code></pre>
<!-- /wp:code -->


 ### 2. Performance Monitoring
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="performance_monitoring"&gt;
  &lt;condition field="destination_number" expression=".*"&gt;
    &lt;action application="set" data="call_start=${strftime()}"/&gt;
    &lt;action application="log" data="info Call started: ${call_start}"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Conclusion
<!-- /wp:heading -->

  Creating an effective dialplan is crucial for a well-functioning FreeSWITCH system. Start with basic call routing and gradually add more complex features as needed. Remember to: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Keep your dialplan organized and well-documented 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Test thoroughly before deploying changes 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Monitor performance and logs regularly 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Implement security measures 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Plan for scalability 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  As your system grows, you can expand your dialplan to include more advanced features like: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Multi-tenant configurations 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Advanced IVR systems 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Custom applications 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Integration with external systems 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Regular maintenance and updates will ensure your <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> system continues to handle calls efficiently and reliably. 
 