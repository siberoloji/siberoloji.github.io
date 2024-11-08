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
 

 
 ## Understanding Dialplan Basics</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### What is a Dialplan?</h3>
<!-- /wp:heading -->

  A dialplan is a set of instructions that tells FreeSWITCH how to handle calls. It's essentially a routing table that determines what happens when someone makes a call through your system. Dialplans in FreeSWITCH are written in XML and consist of several key components: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Contexts</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Extensions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Conditions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Actions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Anti-Actions</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Dialplan Structure</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Basic XML Structure</h3>
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

<!-- wp:heading {"level":3} -->
 ### Key Components Explained</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Context</strong>: A logical grouping of extensions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Extension</strong>: A set of rules for handling specific calls</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Condition</strong>: Criteria that must be met for actions to execute</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Action</strong>: What happens when conditions are met</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Anti-Action</strong>: What happens when conditions are not met</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Creating Your First Dialplan</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Basic Internal Calls</h3>
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

<!-- wp:heading {"level":3} -->
 ### 2. Adding External Calls</h3>
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

 
 ## Common Dialplan Features</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Time-Based Routing</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="business_hours"&gt;
  &lt;condition wday="2-6" hour="9-17"&gt; &lt;!-- Monday-Friday, 9 AM-5 PM --&gt;
    &lt;action application="bridge" data="user/1000"/&gt;
  &lt;anti-action application="voicemail" data="default ${domain_name} 1000"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. IVR (Interactive Voice Response)</h3>
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

<!-- wp:heading {"level":3} -->
 ### 3. Conference Rooms</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="conferences"&gt;
  &lt;condition field="destination_number" expression="^(3\d{3})$"&gt;
    &lt;action application="answer"/&gt;
    &lt;action application="conference" data="$1@default"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Advanced Dialplan Techniques</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Call Recording</h3>
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

<!-- wp:heading {"level":3} -->
 ### 2. Call Queues</h3>
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

<!-- wp:heading {"level":3} -->
 ### 3. Failover Routing</h3>
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

 
 ## Best Practices</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Organization</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Use numbered files for loading order (01_internal.xml, 02_external.xml, etc.)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Group similar extensions together</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Comment your dialplan thoroughly</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 2. Security</h3>
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

<!-- wp:heading {"level":3} -->
 ### 3. Error Handling</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="handle_failed_calls"&gt;
  &lt;condition field="${originate_disposition}" expression="^(BUSY|NO_ANSWER|USER_NOT_REGISTERED)$"&gt;
    &lt;action application="voicemail" data="default ${domain_name} ${dialed_extension}"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Testing and Debugging</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Log Configuration</h3>
<!-- /wp:heading -->

  Add to <code>/usr/local/freeswitch/conf/autoload_configs/switch.conf.xml</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;param name="loglevel" value="debug"/&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Testing Commands</h3>
<!-- /wp:heading -->

  In fs_cli: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">reloadxml
show dialplan
eval ${destination_number}</code></pre>
<!-- /wp:code -->

 
 ## Common Troubleshooting</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Dialplan Not Working</h3>
<!-- /wp:heading -->

  Check these common issues: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>XML syntax errors</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Regular expression patterns</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>File permissions</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Context names matching the user's context</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 2. Call Routing Issues</h3>
<!-- /wp:heading -->

  Verify: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Gateway configurations</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>User directory settings</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Network connectivity</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>SIP profile settings</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Monitoring and Maintenance</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### 1. Regular Checks</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Check dialplan syntax
/usr/local/freeswitch/bin/fs_cli -x "xml_validate"

# Monitor active calls
/usr/local/freeswitch/bin/fs_cli -x "show calls"</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### 2. Performance Monitoring</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="xml" class="language-xml">&lt;extension name="performance_monitoring"&gt;
  &lt;condition field="destination_number" expression=".*"&gt;
    &lt;action application="set" data="call_start=${strftime()}"/&gt;
    &lt;action application="log" data="info Call started: ${call_start}"/&gt;
  &lt;/condition&gt;
&lt;/extension&gt;</code></pre>
<!-- /wp:code -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

  Creating an effective dialplan is crucial for a well-functioning FreeSWITCH system. Start with basic call routing and gradually add more complex features as needed. Remember to: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Keep your dialplan organized and well-documented</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Test thoroughly before deploying changes</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Monitor performance and logs regularly</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Implement security measures</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Plan for scalability</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  As your system grows, you can expand your dialplan to include more advanced features like: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Multi-tenant configurations</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Advanced IVR systems</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Custom applications</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Integration with external systems</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Regular maintenance and updates will ensure your <a href="https://signalwire.com/freeswitch" target="_blank" rel="noopener" title="">FreeSWITCH</a> system continues to handle calls efficiently and reliably. 
 