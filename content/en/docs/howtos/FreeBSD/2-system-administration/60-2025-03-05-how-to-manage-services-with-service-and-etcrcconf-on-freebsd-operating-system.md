---
draft: false
title: How to Manage Services with `service` and `/etc/rc.conf` on FreeBSD Operating System
linkTitle: How to Manage Services with `service` and `/etc/rc.conf`
translationKey: how-to-manage-services-with-service-and-etcrcconf-on-freebsd-operating-system
description: This article explains how to manage services on FreeBSD using the `service` command and the `/etc/rc.conf` file.
url: how-to-manage-services-with-service-and-etcrcconf-on-freebsd-operating-system
date: 2025-03-05
weight: 60
keywords:
  - FreeBSD
  - manage services
tags:
  - FreeBSD
  - how-to guides
categories:
  - Unix
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
---

FreeBSD is a powerful, open-source Unix-like operating system known for its robustness, scalability, and advanced networking capabilities. One of the key aspects of managing a FreeBSD system is controlling services—programs that run in the background and provide essential functionality, such as web servers, databases, or network daemons. In FreeBSD, services are managed using the `service` command and configured via the `/etc/rc.conf` file. This blog post will provide a comprehensive guide on how to use these tools effectively to manage services on a FreeBSD system.

## Understanding FreeBSD Services

Before diving into the specifics of managing services, it’s important to understand what services are and how they operate in FreeBSD. Services are typically daemons or background processes that start when the system boots and continue running to provide specific functionality. Examples of services include `sshd` (Secure Shell daemon), `apache24` (Apache web server), and `nginx` (Nginx web server).

FreeBSD uses a centralized configuration file, `/etc/rc.conf`, to determine which services should start at boot and how they should be configured. Additionally, the `service` command provides a convenient way to start, stop, restart, and check the status of services without manually editing configuration files or running complex commands.

## The `/etc/rc.conf` File

The `/etc/rc.conf` file is the primary configuration file for system services and startup behavior in FreeBSD. It is a simple text file that contains key-value pairs, where each line defines a specific setting or service. By editing this file, you can enable or disable services, set service-specific options, and configure system-wide settings.

### Structure of `/etc/rc.conf`

The `/etc/rc.conf` file follows a straightforward format. Each line consists of a variable name and its corresponding value, separated by an equals sign (`=`). For example:

```bash
sshd_enable="YES"
apache24_enable="YES"
nginx_enable="NO"
```

In this example:

- `sshd_enable="YES"` enables the SSH daemon to start at boot.
- `apache24_enable="YES"` enables the Apache web server to start at boot.
- `nginx_enable="NO"` disables the Nginx web server from starting at boot.

### Enabling and Disabling Services

To enable a service to start automatically at boot, add its corresponding `_enable` variable to `/etc/rc.conf` and set its value to `"YES"`. For example, to enable the SSH daemon:

```bash
sshd_enable="YES"
```

To disable a service, set its `_enable` variable to `"NO"` or remove the line entirely. For example, to disable the Nginx web server:

```bash
nginx_enable="NO"
```

### Adding Custom Options

Many services allow you to specify additional options or arguments in `/etc/rc.conf`. These options are typically defined using variables specific to the service. For example, to pass additional flags to the SSH daemon, you can use the `sshd_flags` variable:

```bash
sshd_flags="-4"
```

This example forces the SSH daemon to listen only on IPv4 addresses.

### Best Practices for Editing `/etc/rc.conf`

1. **Backup the File**: Before making changes, create a backup of `/etc/rc.conf` in case you need to revert your modifications.

   ```bash
   cp /etc/rc.conf /etc/rc.conf.backup
   ```

2. **Use a Text Editor**: Edit the file using a text editor like `vi`, `nano`, or `ee`.

   ```bash
   ee /etc/rc.conf
   ```

3. **Test Changes**: After editing `/etc/rc.conf`, test your changes by restarting the affected services or rebooting the system.

4. **Avoid Duplicate Entries**: Ensure that each variable appears only once in the file to prevent conflicts.

## The `service` Command

While `/etc/rc.conf` is used to configure services at boot, the `service` command provides a convenient way to manage services during runtime. With `service`, you can start, stop, restart, and check the status of services without manually editing configuration files or running complex commands.

### Basic Syntax

The `service` command follows this basic syntax:

```bash
service <service_name> <action>
```

Where:

- `<service_name>` is the name of the service (e.g., `sshd`, `apache24`, `nginx`).
- `<action>` is the operation to perform (e.g., `start`, `stop`, `restart`, `status`).

### Common Actions

Here are some of the most common actions you can perform with the `service` command:

1. **Start a Service**: Start a service that is currently stopped.

   ```bash
   service sshd start
   ```

2. **Stop a Service**: Stop a running service.

   ```bash
   service apache24 stop
   ```

3. **Restart a Service**: Restart a service to apply configuration changes or refresh its state.

   ```bash
   service nginx restart
   ```

4. **Check the Status of a Service**: View the current status of a service (e.g., whether it is running or stopped).

   ```bash
   service sshd status
   ```

5. **Reload a Service**: Reload the configuration of a service without restarting it (if supported by the service).

   ```bash
   service nginx reload
   ```

6. **Enable or Disable a Service**: Enable or disable a service from starting at boot (this modifies `/etc/rc.conf`).

   ```bash
   service sshd enable
   service nginx disable
   ```

### Example: Managing the SSH Daemon

Let’s walk through an example of managing the SSH daemon (`sshd`) using the `service` command.

1. **Start the SSH Daemon**:

   ```bash
   service sshd start
   ```

2. **Check the Status of the SSH Daemon**:

   ```bash
   service sshd status
   ```

3. **Restart the SSH Daemon**:

   ```bash
   service sshd restart
   ```

4. **Disable the SSH Daemon from Starting at Boot**:

   ```bash
   service sshd disable
   ```

5. **Enable the SSH Daemon to Start at Boot**:

   ```bash
   service sshd enable
   ```

### Advanced Usage

The `service` command also supports advanced usage, such as running custom scripts or managing third-party services. For example, if you have a custom service located in `/usr/local/etc/rc.d/`, you can manage it using the `service` command:

```bash
service custom_service start
```

## Combining `/etc/rc.conf` and `service`

The `/etc/rc.conf` file and the `service` command work together to provide a comprehensive system for managing services on FreeBSD. While `/etc/rc.conf` is used to configure services at boot, the `service` command allows you to manage services during runtime. Here’s how they complement each other:

1. **Permanent Configuration**: Use `/etc/rc.conf` to define which services should start at boot and how they should be configured.
2. **Runtime Management**: Use the `service` command to start, stop, restart, or check the status of services without modifying `/etc/rc.conf`.

For example, if you want to enable the Apache web server to start at boot and then start it immediately, you would:

1. Edit `/etc/rc.conf` to enable Apache:

   ```bash
   apache24_enable="YES"
   ```

2. Start the Apache service:

   ```bash
   service apache24 start
   ```

## Troubleshooting Service Management

Occasionally, you may encounter issues when managing services. Here are some troubleshooting tips:

1. **Check Logs**: Review the system logs (`/var/log/messages`) for errors related to the service.
2. **Verify Configuration**: Ensure that the service’s configuration files are correct and free of syntax errors.
3. **Test Manually**: Try running the service manually to see if it produces any error messages.

   ```bash
   /usr/local/etc/rc.d/apache24 start
   ```

4. **Check Dependencies**: Ensure that all required dependencies for the service are installed and configured.

## Conclusion

Managing services on FreeBSD is a straightforward process thanks to the `/etc/rc.conf` file and the `service` command. By understanding how to use these tools, you can effectively control which services start at boot, configure their behavior, and manage them during runtime. Whether you’re running a web server, a database, or a custom application, mastering service management is an essential skill for any FreeBSD system administrator.

By following the guidelines and examples in this blog post, you’ll be well-equipped to manage services on your FreeBSD system with confidence and efficiency.
