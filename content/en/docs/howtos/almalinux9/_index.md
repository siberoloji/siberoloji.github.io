---
title: AlmaLinux 9
date: 2017-01-05
description: AlmaLinux 9 Documentation and How-Tos for System Administrators and Developers alike.
categories:
    - AlmaLinux
tags:
    - almalinux
simple_list: true
url: almalinux-9-howtos
---

> This Document is actively being developed as a part of ongoing AlmaLinux learning efforts. Chapters will be added periodically.

Draft List of Chapters:
### AlmaLinux 9: Initial Settings

1. [How to Manage Users on AlmaLinux Add, Remove, and Modify](/manage-users-almalinux-add-remove-modify)
2. [How to Set Up Firewalld, Ports, and Zones on AlmaLinux](/set-firewalld-ports-zones-almalinux/)
3. [How to Set Up and Use SELinux on AlmaLinux](/set-selinux-almalinux/)
4. [How to Set up Network Settings](setup-network-settings-almalinux)
5. [How to List, Enable, or Disable Services on AlmaLinux](/list-enable-disable-services-almalinux/)
6. [How to Update AlmaLinux System](/update-almalinux-system-step-step-guide/)
7. [How to Add Additional Repositories on AlmaLinux](/add-additional-repositories-almalinux/)
8. [How to Use Web Admin Console](/web-admin-console-almalinux/)
9. [How to Set Up Vim Settings on AlmaLinux](/set-vim-settings-almalinux/)
10. [How to Set up Sudo Settings](/set-sudo-settings-almalinux/)

## [NTP](/understanding-ntp-backbone-synchronized-digital-time/) / SSH Config

### AlmaLinux 9: NTP Server

11. [How to Configure an NTP Server on AlmaLinux](/configure-ntp-server-almalinux/)
12. [How to Configure an NTP Client on AlmaLinux](/configure-ntp-client-almalinux/)

### AlmaLinux 9: SSH Server

13. [How to Set Up Password Authentication for SSH Server](/set-password-authentication-ssh-server-almalinux/)
14. [How to Make File Transfer with SSH](/file-transfer-ssh-almalinux/)
15. [How to Make SSH File Transfer from Windows](/ssh-file-transfer-windows-almalinux/)
16. [How to Set Up SSH Key Pair Authentication](/set-ssh-key-pair-authentication-almalinux/)
17. [How to Set Up SFTP-only with Chroot on AlmaLinux](/set-sftp-chroot-almalinux/)
18. How to Use SSH-Agent on AlmaLinux
19. How to Use SSHPass on AlmaLinux
20. How to Use SSHFS on AlmaLinux
21. How to Use Port Forwarding on AlmaLinux
22. How to Use Parallel SSH on AlmaLinux

## DNS/DHCP Settings

### AlmaLinux 9: Dnsmasq

23. How to Install and Configure Dnsmasq on AlmaLinux
24. How to Configure a DHCP Server on AlmaLinux

### AlmaLinux 9: DNS Server

25. What is a DNS Server and How to Install It on AlmaLinux
26. How to Configure BIND DNS Server for an Internal Network on AlmaLinux
27. How to Configure BIND DNS Server for an External Network
28. How to Configure BIND DNS Server Zone Files on AlmaLinux
29. How to Start BIND and Verify Resolution on AlmaLinux
30. How to Use BIND DNS Server View Statement on AlmaLinux
31. How to Set BIND DNS Server Alias (CNAME) on AlmaLinux
32. How to Configure DNS Server Chroot Environment on AlmaLinux
33. How to Configure BIND DNS Secondary Server on AlmaLinux

### AlmaLinux 9: DHCP Server

34. How to Configure DHCP Server
35. How to Configure DHCP Client

## Storage Server Settings

### AlmaLinux 9: NFS Server

- How to Configure NFS Server
- How to Configure NFS Client
- How to use NFS 4 ACL Tool

### AlmaLinux 9: iSCSI

- How to Configure iSCSI Target Targetcli
- How to Configure iSCSI Initiator

## Virtualization Settings

### AlmaLinux 9: KVM

- How to Install KVM
- How to Create KVM Virtual Machine
- How to Create KVM Virtual Machine GUI
- How to Make Basic Operations for KVM Virtual Machine
- How to Install KVM VM Management Tools
- How to Set VNC connection on KVM
- How to Set VNC connection Client on KVM
- How to Make Nested KVM Setting
- How to Make KVM Live Migration
- How to Make KVM Storage Migration
- How to Set up UEFI boot for KVM Virtual Machine
- How to Enable TPM 2.0 on KVM
- How to GPU Passthrough on KVM
- How to Use VirtualBMC on KVM

## Container Platform

### AlmaLinux 9: Podman

- How to Install Podman
- How to Add Podman Container Images
- How to Access to Services on Podman Containers
- How to Use Dockerfile
- How to Use External Storage
- How to Use External Storage NFS
- How to Use Registry
- How to Podman Network Basis
- How to Use Docker CLI
- How to Use Docker Compose
- How to Create Pods
- How to Use Podman Containers by Common Users
- How to generate Systemd unit file and set auto-starting for containers

## Directory Server

### AlmaLinux 9: FreeIPA

- How to Configure FreeIPA Server
- How to Add FreeIPA User Accounts
- How to Configure FreeIPA Client
- How to Configure FreeIPA Client with One-Time Pass
- How to Configure FreeIPA Basic Operation of User Management
- How to Configure FreeIPA Web Admin Console
- How to Configure FreeIPA Replication
- How to Configure FreeIPA Trust Active Directory

### AlmaLinux 9: OpenLDAP

- How to Configure LDAP Server
- How to Add LDAP User Accounts
- How to Configure LDAP Client
- How to Create OpenLDAP Replication
- How to Create Multi-Master Replication

### AlmaLinux 9: Apache httpd

- How to Install httpd
- How to Configure Virtual Hostings
- How to Configure SSL/TLS with Apache
- How to Enable Userdir with Apache
- How to Use CGI Scripts with Apache
- How to Use PHP Scripts with Apache
- How to Basic Authentication with Apache
- How to Configure WebDAV Folder with Apache
- How to Basic Authentication + PAM with Apache
- How to Basic Authentication + LDAP with Apache
- How to Configure mod_http2 with Apache
- How to Configure mod_md with Apache
- How to Configure mod_wsgi with Apache
- How to Configure mod_perl with Apache
- How to Configure mod_security with Apache

### AlmaLinux 9: Nginx

- How to Install Nginx
- How to Configure Virtual Hostings with Nginx
- How to Configure SSL/TLS with Nginx
- How to Enable Userdir with Nginx
- How to Basic Authentication with Nginx
- How to Use CGI Scripts with Nginx
- How to Use PHP Scripts with Nginx
- How to Nginx Reverse Proxy with Nginx
- How to Nginx Load Balancing with Nginx
- How to Use Stream module with Nginx

## Database

### AlmaLinux 9: PostgreSQL How to

- How to Install PostgreSQL
- How to Make Settings for Remote Connection on PostgreSQL
- How to PostgreSQL over SSL/TLS
- How to Backup and Restore PostgreSQL Database
- How to Set Up Streaming Replication on PostgreSQL

### AlmaLinux 9: MariaDB How to .5

- How to Install MariaDB
- How to Set up MariaDB over SSL/TLS
- How to Create MariaDB Backup
- How to Creare MariaDB Replication
- How to Create MariaDB Galera Cluster
- How to Install phpMyAdmin on MariaDB

## FTP / Samba / Mail Server

### AlmaLinux 9: FTP Server

- How to Install Vsftpd
- How to Install ProFTPD
- How to install FTP Client lftp
- How to install FTP Client FileZilla on Windows
- How to Configure Vsftpd over SSL/TLS
- How to Configure ProFTPD over SSL/TLS

### AlmaLinux 9: Samba

- How to Create a Fully Accessed Shared Folder with Samba
- How to Create Limited Shared Folder with Samba
- How to Access to Share from Clients with Samba
- How to Configure Samba Winbind

### AlmaLinux 9: Mail Server

- How to Install Postfix and configure SMTP Server
- How to Install Dovecot and configure POP/IMAP Server
- How to Add Mail User Accounts by using OS User Accounts
- How to Configure Postfix and Dovecot with SSL/TLS Setting
- How to Configure for Virtual Domain to Send Email by using OS User Accounts
- How to Install and Configure Postfix, Clamav and Amavisd
- How to Install Mail Log Report : pflogsumm
- How to Add Mail User Accounts by Using Virtual Users

## Proxy / Load Balance

### AlmaLinux 9: Squid

- How to Install Squid to configure Proxy server
- How to Configure Linux, Mac and Windows Proxy Clients
- How to Set Basic Authentication and limit Squid for users
- How to Configure Squid as a Reverse Proxy Server

### AlmaLinux 9: HAProxy

- HAProxy: How to Configure HTTP Load Balancing Server
- HAProxy: How to Configure SSL/TLS Setting
- HAProxy: How to Refer to the Statistics Web
- HAProxy: How to Refer to the Statistics CUI
- HAProxy: How to Layer 4 Mode Load Balancing
- HAProxy: How to Configure ACL Settings
- HAProxy: How to Configure ACL Settings L4

## Monitoring

### AlmaLinux 9: NetData

- How to Install NetData

### AlmaLinux 9: SysStat

- How to Install SysStat
- How to use SysStat

## Security

### AlmaLinux 9: Auditd

- How to Install Auditd
- How to Transfer Auditd Logs to Remote Host
- How to Search Auditd Logs with ausearch
- How to Display Auditd Summary Logs with aureport
- How to Add Audit Rules for Auditd

### AlmaLinux 9: SELinux

- How to Configure SELinux Operating Mode
- How to Configure SELinux Policy Type
- How to Configure SELinux Context
- How to Change SELinux Boolean Values
- How to Change SELinux File Types
- How to Change SELinux Port Types
- How to Search SELinux Logs
- How to Use SELinux SETroubleShoot
- How to Use SELinux audit2allow for Basic Troubleshooting on AlmaLinux
- Mastering SELinux matchpathcon on AlmaLinux
- How to SELinux sesearch Basic Usage

### AlmaLinux 9: Firewalld

-  How to Firewalld Basic Operation
- How to Set IP Masquerade

## Lang / Development

### AlmaLinux 9: Ruby

- How to Install Ruby 3.0
- How to Install Ruby 3.1
- How to Install Ruby on Rails 7

### AlmaLinux 9: .NET

- How to Install .NET Core 3.1
- How to Install .NET 6.0

### AlmaLinux 9: PHP

- How to Install PHP 8.0
- How to Install PHP 8.1
- How to Install Laravel
- How to Install CakePHP

### AlmaLinux 9: Node.js

- How to Install Node.js 16
- How to Install Node.js 18
- How to Install Angular 14
- How to Install React
- How to Install Next.js
- How to Node.js + TypeScript

### AlmaLinux 9: Python

- How to Install Python 3.9
- How to Install Django 4

## Desktop Environment

### AlmaLinux 9: Desktop Environment

- How to GNOME Desktop Environment
- How to Configure VNC Server
- How to Configure Xrdp Server
- How to VNC Client: noVNC

## Other Topics

- How to Configure Network Teaming
- How to Configure Network Bonding
- How to Join in Active Directory Domain
- How to Create SSL Certificate Self-Sign
- How to Get SSL Certificate Let’s Encrypt
- How to Change Run Level
- How to Set System Timezone
- How to Set Keymap
- How to Set System Locale
- How to Set Hostname
