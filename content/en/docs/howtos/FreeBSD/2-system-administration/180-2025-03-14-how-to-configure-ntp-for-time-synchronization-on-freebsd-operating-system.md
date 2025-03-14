---
draft: false
title: How to Configure NTP for Time Synchronization on FreeBSD Operating System
linkTitle: Configure NTP
translationKey: how-to-configure-ntp-for-time-synchronization-on-freebsd-operating-system
description: How to Configure NTP for Time Synchronization on FreeBSD Operating System
url: how-to-configure-ntp-for-time-synchronization-on-freebsd-operating-system
date: 2025-03-14
weight: 180
keywords:
  - FreeBSD
  - NTP
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

Accurate time synchronization is crucial for modern computing systems, particularly for servers and networked environments. Properly synchronized clocks ensure correct timestamps in logs, valid certificate validation, and consistent database transactions. FreeBSD, known for its reliability and performance, offers robust support for time synchronization through the Network Time Protocol (NTP). This guide will walk you through configuring NTP on FreeBSD systems, covering both the traditional NTP daemon and the newer Chrony implementation.

## Understanding Time Synchronization on FreeBSD

FreeBSD supports multiple time synchronization implementations:

1. **ntpd**: The traditional NTP daemon included in the base system
2. **Chrony**: A modern alternative available in the ports collection
3. **OpenNTPD**: A lightweight alternative from the OpenBSD project
4. **ntimed**: A newer implementation focused on security

This guide will focus primarily on ntpd (which comes with FreeBSD) and Chrony (which many administrators prefer for its improved performance and accuracy).

## Why Time Synchronization Matters

Before diving into configuration, it's worth understanding why precise time synchronization is essential:

- **Security**: Authentication protocols like Kerberos require synchronized clocks
- **Logging**: Accurate timestamps help with incident response and troubleshooting
- **Certificates**: TLS certificates rely on correct system time for validation
- **Databases**: Distributed databases need consistent time across nodes
- **Scheduling**: Cron jobs and other scheduled tasks depend on accurate time

## Checking Current Time Settings

Before configuring NTP, let's check the current time configuration on your FreeBSD system:

```sh
# Display current date and time
date

# View current time zone
ls -l /etc/localtime

# Check if NTP is already running
service ntpd status
```

## Method 1: Using ntpd from the Base System

FreeBSD includes the traditional NTP daemon in its base system, making it the most straightforward option for time synchronization.

### Basic Configuration

1. First, edit the NTP configuration file:

```sh
vi /etc/ntp.conf
```

2. A basic configuration might look like this:

```
# Use public NTP pool servers
server 0.freebsd.pool.ntp.org iburst
server 1.freebsd.pool.ntp.org iburst
server 2.freebsd.pool.ntp.org iburst
server 3.freebsd.pool.ntp.org iburst

# Allow NTP client access from local network (optional)
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1

# Drift file to remember clock rate adjustments
driftfile /var/db/ntp.drift

# Enable logging (optional)
logfile /var/log/ntp.log
```

3. Enable the NTP service in `/etc/rc.conf`:

```sh
echo 'ntpd_enable="YES"' >> /etc/rc.conf
echo 'ntpd_sync_on_start="YES"' >> /etc/rc.conf
```

4. Start the NTP service:

```sh
service ntpd start
```

### Advanced ntpd Configuration Options

For more advanced deployments, consider these additional configuration options:

#### Choosing NTP Servers

You can use different NTP server pools based on your geographic location:

```
# North America
server 0.north-america.pool.ntp.org iburst
server 1.north-america.pool.ntp.org iburst

# Europe
server 0.europe.pool.ntp.org iburst
server 1.europe.pool.ntp.org iburst

# Use internal time servers (for corporate environments)
server ntp1.example.com iburst
server ntp2.example.com iburst
```

The `iburst` option speeds up the initial synchronization by sending a burst of packets when the connection is first established.

#### Configuring NTP as a Time Server

If your FreeBSD system will serve time to other machines on your network:

```
# Allow service to internal network only
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap

# Add this line if you want to allow these clients to sync with your server
# but not use your server to sync with other servers
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap nopeer
```

#### Using PPS (Pulse Per Second) for High Accuracy

For systems requiring extremely precise timekeeping:

```
# GPS PPS reference
server 127.127.20.0 mode 17 prefer
fudge 127.127.20.0 flag1 1 flag2 0 flag3 0 flag4 0
```

This configuration is useful for systems connected to GPS receivers or other high-precision time sources.

### Monitoring ntpd

To check if ntpd is synchronizing correctly:

```sh
# Check NTP peers and status
ntpq -p

# More detailed information
ntpq -c peers
ntpq -c assoc
```

The output should show your configured servers with an indicator of which one is currently being used as the reference clock.

## Method 2: Using Chrony

Chrony is a modern alternative to ntpd, offering better performance on systems with intermittent network connectivity and generally providing more accurate timekeeping.

### Installing Chrony

```sh
# Install Chrony via pkg
pkg install chrony

# Or via ports
cd /usr/ports/net/chrony
make install clean
```

### Basic Chrony Configuration

1. Edit the Chrony configuration file:

```sh
vi /usr/local/etc/chrony/chrony.conf
```

2. A basic configuration might look like this:

```
# Use NTP pool servers with iburst option
server 0.freebsd.pool.ntp.org iburst
server 1.freebsd.pool.ntp.org iburst
server 2.freebsd.pool.ntp.org iburst

# Allow NTP client access from localhost only
allow 127.0.0.1
allow ::1

# Record the rate at which the system clock gains/loses time
driftfile /var/db/chrony/drift

# Enable logging
logdir /var/log/chrony
log measurements statistics tracking

# Serve time even if not synchronized to a time source
local stratum 10
```

3. Enable the Chrony service in `/etc/rc.conf`:

```sh
echo 'chronyd_enable="YES"' >> /etc/rc.conf
```

4. Start the Chrony service:

```sh
service chronyd start
```

### Advanced Chrony Configuration

#### Fine-tuning Chrony for Better Performance

```
# Increase the minimum number of selectable sources
minsources 2

# Faster initial synchronization
makestep 1.0 3

# Use NTP servers from DHCP
sourcedir /var/run/chrony-dhcp

# Allow higher stratum servers if lower stratum servers are unreachable
stratumweight 0
```

#### Configuring Chrony as a Time Server

```
# Allow clients from local network
allow 192.168.1.0/24

# Enable NTP server
port 123

# Rate limiting for NTP packets
ratelimit interval 3 burst 8
```

### Monitoring Chrony

To check if Chrony is synchronizing correctly:

```sh
# Check time sources
chronyc sources

# Check detailed source statistics
chronyc sourcestats

# Check tracking information
chronyc tracking
```

## Securing NTP

Time synchronization services can be a target for attacks, so it's important to secure your NTP configuration:

### Restricting Access

For ntpd:

```
# Restrict access to only what's necessary
restrict default kod nomodify notrap nopeer noquery limited
restrict -6 default kod nomodify notrap nopeer noquery limited

# Allow only local queries
restrict 127.0.0.1
restrict -6 ::1

# If needed, allow only specific networks
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
```

For Chrony:

```
# Only allow localhost by default
deny all
allow 127.0.0.1
allow ::1

# If needed, allow specific networks
allow 192.168.1.0/24
```

### Using NTP Authentication

For ntpd, you can enable symmetric key authentication:

```
# Define keys
keys /etc/ntp.keys
trustedkey 1 2 3

# Use authentication with servers
server time.example.com key 1
```

Create the keys file with:

```sh
cat > /etc/ntp.keys << EOF
1 MD5 ThisIsASecretKey
2 MD5 AnotherSecretKey
3 MD5 YetAnotherSecretKey
EOF
chmod 600 /etc/ntp.keys
```

For Chrony, similar authentication can be configured:

```
# Specify key file
keyfile /usr/local/etc/chrony/chrony.keys

# Use authentication with servers
server time.example.com key 1
```

## Handling Virtual Environments

FreeBSD running in virtual machines requires special consideration for time synchronization:

### VMware

For FreeBSD running on VMware:

```
# For ntpd
tinker panic 0
```

### VirtualBox

For FreeBSD running on VirtualBox, you might want to use the VirtualBox Guest Additions time synchronization instead of or in addition to NTP.

## Troubleshooting NTP Issues

### Common Problems and Solutions

1. **NTP not synchronizing**:
   - Check network connectivity to NTP servers
   - Verify firewall settings (NTP uses UDP port 123)
   - Run `ntpdate -d` or `chronyd -Q` to debug

2. **Large time drift**:
   - If the time difference is too large, use `ntpdate` to set the time initially:

     ```sh
     ntpdate pool.ntp.org
     ```

   - For Chrony, use:

     ```sh
     chronyd -q 'server pool.ntp.org iburst'
     ```

3. **Clock jumps**:
   - Check for hardware clock issues with:

     ```sh
     hwclock --debug
     ```

   - Consider setting the `tinker` options in ntpd or `makestep` in Chrony

### Diagnostic Commands

For ntpd:

```sh
# Check if ntpd is running
service ntpd status

# View peers and their status
ntpq -p

# Check system NTP variables
ntpq -c sysinfo

# Check configuration issues
ntpd -c /etc/ntp.conf
```

For Chrony:

```sh
# Check if chronyd is running
service chronyd status

# View sources
chronyc sources

# Check tracking
chronyc tracking

# Check configuration issues
chronyd -f /usr/local/etc/chrony/chrony.conf
```

## Setting Up NTP with PF Firewall

If you're using PF (packet filter) firewall on FreeBSD, you'll need to allow NTP traffic:

```
# In /etc/pf.conf
pass out proto udp from any to any port ntp
```

And for a server:

```
pass in proto udp from any to any port ntp
```

Reload the firewall rules:

```sh
service pf reload
```

## Setting the Correct Time Zone

Ensure your system has the correct time zone set:

```sh
# List available time zones
ls /usr/share/zoneinfo

# Set the time zone
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Verify
date
```

## Conclusion

Proper time synchronization is essential for modern computing systems, and FreeBSD offers robust options for maintaining accurate time. Whether you choose the traditional ntpd from the base system or the modern Chrony alternative, this guide has provided you with the knowledge to configure, secure, and troubleshoot time synchronization on your FreeBSD systems.

For most installations, a basic configuration with multiple NTP pool servers will be sufficient. However, for environments requiring higher precision or security, the advanced options discussed here will help you fine-tune your time synchronization setup.

Remember to regularly check your time synchronization status and logs to ensure ongoing accuracy, especially after system updates or network changes.
