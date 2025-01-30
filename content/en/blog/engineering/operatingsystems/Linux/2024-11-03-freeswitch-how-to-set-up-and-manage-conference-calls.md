---
draft: false

title:  'FreeSWITCH: How to Set Up and Manage Conference Calls'
date: '2024-11-03T19:40:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This guide will walk you through creating and managing conference calls using FreeSWITCH, offering tips on setup, configurations, and best practices.' 
 
url:  /freeswitch-how-to-set-up-and-manage-conference-calls/
 
featured_image: /images/freeswitch1.webp
categories:
    - Networks
tags:
    - freeswitch
    - pbx
---

In today’s globalized world, conference calls are essential for efficient communication, remote work collaboration, and large-scale project management. FreeSWITCH, a powerful open-source platform, has emerged as a reliable solution for voice and video communication, and it’s highly adaptable to various configurations, including virtual conference rooms. This guide will walk you through creating and managing conference calls using FreeSWITCH, offering tips on setup, configurations, and best practices.

---

### 1. **What is FreeSWITCH?**

FreeSWITCH is an open-source telephony platform designed to handle complex voice, video, chat, and other multimedia. It’s popular among developers and organizations due to its flexibility, extensive configuration options, and compatibility with various platforms. With FreeSWITCH, you can set up virtual conference rooms, routing calls, bridging, and even multimedia streaming.

FreeSWITCH's conferencing features include:
- Multi-party calling
- Noise suppression
- Individual participant controls
- Customizable audio prompts
- Recording options

To start, you’ll need a FreeSWITCH installation. For production-level setups, dedicated or cloud-based servers are recommended.

---

### 2. **Setting Up FreeSWITCH for Conference Calls**

To enable conference calls, FreeSWITCH must be installed, and the conferencing module activated. The following steps provide an overview of the setup:

#### **Step 1: Install FreeSWITCH**

You can install FreeSWITCH on various platforms, including Linux, Windows, and macOS, but Linux (specifically Ubuntu) is generally recommended for stability and support. Here’s a basic installation command for Ubuntu:

```bash
sudo apt-get update
sudo apt-get install freeswitch
```

Alternatively, you can compile FreeSWITCH from the source to gain greater control over customization.

#### **Step 2: Enable the Conferencing Module**

The conferencing module (`mod_conference`) is essential for creating and managing conference rooms. It usually comes pre-installed, but you can confirm and activate it if needed:

1. Open the FreeSWITCH configuration file:
```bash
sudo nano /etc/freeswitch/autoload_configs/modules.conf.xml
```

2. Locate the `mod_conference` line and ensure it’s uncommented:
```xml
<load module="mod_conference"/>
```

3. Save the file and restart FreeSWITCH to load the module:
```bash
sudo systemctl restart freeswitch
```

#### **Step 3: Configuring Conference Profiles**

FreeSWITCH allows you to create conference profiles, each with its own set of configurations. Conference profiles are defined in the `conference.conf.xml` file, found in the `autoload_configs` directory.

1. Open `conference.conf.xml`:
```bash
sudo nano /etc/freeswitch/autoload_configs/conference.conf.xml
```

2. Edit or add `<profile>` elements to define conference parameters like codec, bitrate, and maximum participants. Example configuration:
```xml
<profile name="default">
<param name="rate" value="8000"/>
<param name="interval" value="20"/>
<param name="energy-level" value="100"/>
<param name="comfort-noise" value="true"/>
<param name="max-members" value="100"/>
</profile>
```

3. Save changes and restart FreeSWITCH.

---

### 3. **Creating Conference Rooms**

A conference room is essentially a unique extension number that participants can dial to join a shared call. Here’s how to create one:

#### **Step 1: Define Conference Extensions**

In the `dialplan`, assign extensions that will link users to specific conference rooms. This configuration is typically in `default.xml` in the `dialplan/default` folder.

1. Open `default.xml`:
```bash
sudo nano /etc/freeswitch/dialplan/default.xml
```

2. Define a conference room:
```xml
<extension name="Conference Room 1000">
<condition field="destination_number" expression="^1000$">
<action application="conference" data="1000@default"/>
</condition>
</extension>
```

3. Save and close the file, then reload the dialplan:
```bash
fs_cli -x "reloadxml"
```

#### **Step 2: Set Conference Room Permissions**

Each room can have permissions, such as admin and moderator privileges, mute control, and more. These permissions can be specified in `conference.conf.xml`.

1. Open `conference.conf.xml` and locate your conference room profile.

2. Add parameters to control participant roles:
```xml
<param name="caller-controls" value="moderator"/>
<param name="mute-on-entry" value="true"/>
<param name="announce" value="false"/>
```

---

### 4. **Advanced Conference Room Management**

FreeSWITCH offers several advanced features to enhance the conference experience:

#### **Participant Management**

1. **Mute/Unmute Participants**: As a moderator, you can mute or unmute individual participants using commands:
```bash
fs_cli -x "conference 1000 mute <member_id>"
fs_cli -x "conference 1000 unmute <member_id>"
```

2. **Kick Participants**: To remove a participant:
```bash
fs_cli -x "conference 1000 kick <member_id>"
```

3. **List Participants**: To get a list of members in a conference room:
```bash
fs_cli -x "conference 1000 list"
```

#### **Recording Conferences**

Recording is invaluable for documentation, reviews, and sharing with absent participants. Configure recording by adding this line to the conference extension:

```xml
<action application="conference" data="1000@default record /path/to/recordings/conference_1000.wav"/>
```

#### **Using Dynamic Conference Controls**

Dynamic controls allow participants to interact with the conference using DTMF (dual-tone multi-frequency) tones. You can configure custom controls for tasks like muting, recording, or kicking participants. In `conference.conf.xml`, add:

```xml
<caller-controls>
<group name="default">
<control action="mute" digits="0"/>
<control action="deaf" digits="1"/>
<control action="kick" digits="2"/>
</group>
</caller-controls>
```

Participants can then press assigned numbers to perform these actions.

---

### 5. **Monitoring and Troubleshooting Conferences**

#### **Monitoring with `fs_cli`**

The FreeSWITCH command-line interface (`fs_cli`) allows real-time monitoring and control. Use `fs_cli` to monitor active calls, manage participants, and check the system's health.

- To view active conferences:
```bash
fs_cli -x "conference list"
```

- To see conference logs, which are essential for troubleshooting, consult FreeSWITCH log files located at `/var/log/freeswitch`.

#### **Common Issues and Solutions**

1. **Audio Echoes**: Adjust `energy-level` and `comfort-noise` parameters in the `conference.conf.xml` to reduce noise.

2. **Dropped Participants**: Check network stability, ensure ports are correctly opened, and test NAT traversal settings if on a NATed network.

3. **High CPU Usage**: If the server is under heavy load, consider reducing bitrate, limiting participants, or upgrading hardware.

---

### 6. **Best Practices for Effective Conference Management**

1. **Optimize Audio Settings**: Adjust parameters to maintain good audio quality without straining resources. This includes selecting suitable codecs and setting the `max-members` limit thoughtfully.

2. **Implement Access Control**: Use PIN codes or authentication for private conferences. Set passwords in `conference.conf.xml`:
```xml
<param name="pin" value="1234"/>
```

3. **Plan for Redundancy**: In case of a server failure, consider a redundant FreeSWITCH setup or backup conferencing system to ensure uninterrupted service.

4. **Document and Train Moderators**: Provide clear instructions for moderators on using conference commands, troubleshooting common issues, and maintaining a productive environment.

---

### Conclusion

Setting up and managing conference calls on FreeSWITCH can streamline collaboration, save time, and foster efficient communication. With proper setup, configuration, and troubleshooting, FreeSWITCH offers a flexible, scalable platform for virtual meetings and conferences. Follow these steps to create robust conference rooms tailored to your organization’s needs, ensuring that all team members have the tools they need for productive, seamless meetings.