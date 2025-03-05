---
draft: false
title: "AlmaLinux 9: How to List, Enable, Disable, and Configure Services"
date: 2024-10-04T14:49:21+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /almalinux-9-how-to-list-enable-disable-and-configure-services/
featured_image: /images/almalinux.webp
categories:
  - Linux How-to
tags:
  - AlmaLinux
  - how-to guides
  - linux how-to
---
Managing services is a crucial part of system administration, especially in server environments. **AlmaLinux 9**, an open-source and community-driven alternative to CentOS, provides robust tools for managing system services. Services refer to processes that run in the background, such as web servers, database engines, and network managers. Proper control over services ensures optimal performance, security, and resource allocation on your server.

In this article, we will explore how to **list**, **enable**, **disable**, and **configure services** in AlmaLinux 9, using powerful system utilities like `systemctl` and `service`. By the end of this guide, you'll be able to manage your server's services efficiently.
Table of Contents
* Introduction to Services in AlmaLinux 9

* Understanding Systemd and Service Management

* How to List Active and Inactive Services

* Enabling and Disabling Services

* Starting and Stopping Services

* Configuring Services

* Viewing Service Logs and Status

* Best Practices for Service Management in AlmaLinux 9

* Conclusion

1. Introduction to Services in AlmaLinux 9

Services are essential components of server operations. They are programs or scripts that run in the background to perform various tasks, such as serving web pages, managing databases, or handling network traffic. In AlmaLinux 9, most services are managed by **systemd**, a modern init system that manages system processes during startup and runtime.

Understanding how to control and configure services is crucial for:
* Ensuring critical applications are always running.

* Improving system performance by disabling unnecessary services.

* Enhancing security by turning off vulnerable or unwanted services.

2. Understanding Systemd and Service Management

**Systemd** is the default system and service manager in AlmaLinux 9, as it is in most modern Linux distributions. It replaces older init systems like SysV and Upstart and introduces a more efficient way to start services and manage their dependencies.

With **systemd**, you use the `systemctl` command to control services, which provides more functionality and control than older `service` commands.

Common `systemctl` options:
* `start`: Start a service.

* `stop`: Stop a service.

* `enable`: Start a service at boot.

* `disable`: Prevent a service from starting at boot.

* `status`: Check the status of a service.

* `restart`: Restart a running service.
Now that we have an understanding of systemd, let's get into how to list services in AlmaLinux 9.
3. How to List Active and Inactive Services

To manage services effectively, you first need to see which services are running, inactive, or failed. Listing services allows you to assess the status of each one and take action if needed.
#### Listing All Services

To list all services—both active and inactive—use the following command:
```bash
systemctl list-unit-files --type=service```

This command will display a detailed list of services, their current state, and whether they are enabled or disabled at boot.

Example output:
```bash
UNIT FILE                               STATE
sshd.service                             enabled
firewalld.service                        enabled
httpd.service                            disabled
crond.service                            enabled
```
#### Listing Only Active Services

If you want to see only the services that are currently running (active), use:
```bash
systemctl list-units --type=service --state=running```

This will display a list of all active services on your system. This command is especially useful for troubleshooting if a specific service is not functioning as expected.
#### Checking Service Status

For detailed information about a specific service, such as `sshd`, use the `status` option:
```bash
systemctl status sshd
```

This command gives you a comprehensive breakdown of the service’s status, including its state (running or stopped), uptime, and any recent errors or warnings in the logs.
4. Enabling and Disabling Services

Services can be configured to start automatically at boot time or to remain disabled until manually started. Let’s look at how to enable and disable services.
#### Enabling a Service at Boot

To ensure a service starts automatically when your system boots, use the `enable` command:
```bash
sudo systemctl enable httpd
```

In this example, `httpd` (Apache web server) is enabled to start on boot. This means whenever the server is rebooted, the `httpd` service will start automatically.
#### Disabling a Service at Boot

To prevent a service from starting at boot, use the `disable` command:
```bash
sudo systemctl disable httpd
```

This will stop the `httpd` service from running automatically when the server boots. You may want to disable services that are not essential to save system resources.
5. Starting and Stopping Services

In addition to enabling or disabling services at boot time, you can manually start or stop services as needed. This is useful when you want to temporarily activate or deactivate a service without affecting its boot behavior.
#### Starting a Service

To start a service immediately, use:
```bash
sudo systemctl start httpd
```

This command will start the `httpd` service right away. However, if the service is disabled, it will not start at the next boot unless you enable it.
#### Stopping a Service

To stop a running service, use:
```bash
sudo systemctl stop httpd
```

This will stop the service from running, but will not change its boot behavior (enabled or disabled). Stopping services that you do not need is an effective way to free up system resources.
#### Restarting a Service

Sometimes, services need to be restarted to apply configuration changes or to refresh the service state. To restart a service, use:
```bash
sudo systemctl restart httpd
```

This will stop and then immediately start the service again.
6. Configuring Services

Service configuration typically involves editing the service’s configuration files, which define how the service operates, its dependencies, and its environment. Each service has its own configuration files, usually located in `/etc` or its subdirectories.
#### Editing Service Configuration Files

For example, the configuration file for the **Apache** (`httpd`) service is usually located at:
```bash
/etc/httpd/conf/httpd.conf```

You can edit this file using a text editor such as `nano` or `vim`:
```bash
sudo nano /etc/httpd/conf/httpd.conf```

After making changes to a service's configuration, you need to reload or restart the service for the changes to take effect.
#### Reloading a Service

Some services support a "reload" operation, which re-reads the configuration without fully stopping and starting the service:
```bash
sudo systemctl reload httpd
```

Reloading is less disruptive than a full restart and is preferred for services like web servers and database servers, where downtime must be minimized.
7. Viewing Service Logs and Status

Service logs provide essential insights into how a service is performing and help troubleshoot any issues that arise. With **systemd**, you can view logs directly from the `journalctl` command.
#### Viewing Logs for a Specific Service

To view the logs for a specific service, such as `httpd`, use:
```bash
sudo journalctl -u httpd
```

This will display all logs related to the `httpd` service. You can scroll through these logs to find specific errors, warnings, or events that can help you diagnose issues.
#### Filtering Logs by Time

You can filter logs by time to see recent events using the `--since` option:
```bash
sudo journalctl -u httpd --since "2023-10-01"```

This will show only logs generated since October 1, 2023, which can help narrow down logs when troubleshooting.
8. Best Practices for Service Management in AlmaLinux 9

Effective service management is critical to maintaining the stability, performance, and security of your AlmaLinux 9 server. Here are some best practices to keep in mind:
* **Disable Unnecessary Services**: Services that are not required for your server's functionality should be disabled to save resources and reduce potential security risks.

* **Monitor Service Logs Regularly**: Use `journalctl` to check logs frequently, especially for critical services like web servers, firewalls, and databases.

* **Automate with Systemd Timers**: Consider using `systemd` timers instead of traditional cron jobs to schedule tasks. They offer better integration with the systemd ecosystem.

* **Test Configuration Changes**: Always test changes to service configuration files in a development or testing environment before applying them to production.

* **Backup Configuration Files**: Before making any significant changes to service configurations, make sure to back up the original configuration files.

9. Conclusion

Managing services on **AlmaLinux 9** is a critical skill for system administrators, whether you're running a web server, database, or any other service. By mastering the use of `systemctl`, you can easily list, enable, disable, start, stop, and configure services. With the best practices outlined in this guide, you can maintain a well-functioning and secure server environment.

AlmaLinux’s reliance on **systemd** and **systemctl** ensures that service management is efficient and powerful, helping you control the services that run on your system with ease.

By regularly monitoring, enabling only essential services, and configuring them properly, you will be able to optimize both performance and security on your AlmaLinux 9 server.
