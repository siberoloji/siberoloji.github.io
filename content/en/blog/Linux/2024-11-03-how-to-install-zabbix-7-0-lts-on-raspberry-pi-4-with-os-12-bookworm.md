---
draft: false
title: How to Install Zabbix 7.0 on Raspberry Pi 4 OS 12 Bookworm
translationKey: how-to-install-zabbix-7-0-lts-on-raspberry-pi-4-with-os-12-bookworm
date: 2024-11-03T00:47:03+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: This guide provides a step-by-step approach to installing Zabbix 7.0 LTS on Raspberry Pi 4 running OS 12 Bookworm
url: /how-to-install-zabbix-7-0-lts-on-raspberry-pi-4-with-os-12-bookworm/
featured_image: /images/zabbixhero.webp
categories:
    - Raspberry Pi
tags:
    - zabbix
linkTitle: Install Zabbix 7.0 LTS
keywords:
    - zabbix
---

If you're looking to monitor networks, servers, or IoT devices at home or in a small office, **Zabbix 7.0 LTS** on a **Raspberry Pi 4** can be an efficient and affordable solution. This guide provides a step-by-step approach to installing **Zabbix 7.0 LTS on Raspberry Pi 4 running OS 12 Bookworm**.

With its long-term support (LTS), Zabbix 7.0 is a reliable monitoring platform that works well with the latest Raspberry Pi OS. Let's dive in and set up this powerful monitoring tool!

---

### Prerequisites

Before we start, make sure you have the following:

1. **Raspberry Pi 4** with at least 4GB of RAM (the 8GB version is preferable for optimal performance).
2. **Raspberry Pi OS 12 Bookworm** (the latest OS version).
3. **Internet connection** to download Zabbix packages.
4. **Static IP address** assigned to your Raspberry Pi to maintain a stable monitoring environment.

### Step 1: Set Up Raspberry Pi OS 12 Bookworm

If you haven’t already set up your Raspberry Pi with OS 12 Bookworm, start by installing the latest OS version.

1. Download **Raspberry Pi Imager** from the [official Raspberry Pi website](https://www.raspberrypi.org/software/).
2. Insert your microSD card into your computer, and use the Imager tool to flash **Raspberry Pi OS 12 Bookworm** onto the card.
3. Boot your Raspberry Pi with the new OS, and complete the initial setup process, ensuring it’s connected to the internet.

For remote management, you can enable SSH by navigating to **Settings > Interfaces** and turning on SSH.

### Step 2: Update System Packages

Before installing Zabbix, it’s essential to update the system packages.

```bash
sudo apt update && sudo apt upgrade -y
```

This command will update all the installed packages to their latest versions, ensuring the system is ready for Zabbix.

### Step 3: Install and Configure the LAMP Stack

Zabbix requires a **LAMP stack** (Linux, Apache, MySQL, PHP) to function. Let's install each component one by one.

#### 1. Install Apache

Apache is the web server that Zabbix will use to display its monitoring interface.

```bash
sudo apt install apache2 -y
```

Once installed, start and enable Apache:

```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

Verify Apache is running by visiting the IP address of your Raspberry Pi in a browser. You should see the default Apache welcome page.

#### 2. Install MySQL (MariaDB)

Zabbix uses a database to store monitoring data. MariaDB is an open-source alternative to MySQL and works well on Raspberry Pi.

```bash
sudo apt install mariadb-server mariadb-client -y
```

Secure your MariaDB installation:

```bash
sudo mysql_secure_installation
```

Follow the prompts to set a root password and remove unnecessary users.

#### 3. Create the Zabbix Database and User

Log in to MySQL and set up a database for Zabbix:

```bash
sudo mysql -u root -p
```

Run the following commands inside the MySQL prompt:

```sql
CREATE DATABASE zabbixdb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbixuser'@'localhost' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON zabbixdb.* TO 'zabbixuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Replace `strongpassword` with a secure password. This creates a database (`zabbixdb`) and a user (`zabbixuser`) for Zabbix.

#### 4. Install PHP and Required Modules

Zabbix needs specific PHP modules to work correctly. Install these using the following command:

```bash
sudo apt install php php-mysql php-xml php-bcmath php-mbstring php-gd php-ldap php-zip php-xmlreader -y
```

Adjust PHP settings in the configuration file:

```bash
sudo nano /etc/php/8.2/apache2/php.ini
```

Find and set the following parameters:

```ini
max_execution_time = 300
memory_limit = 128M
post_max_size = 16M
upload_max_filesize = 2M
date.timezone = "YOUR_TIMEZONE"
```

Replace `YOUR_TIMEZONE` with your actual time zone, e.g., `America/New_York`. Save and close the file.

### Step 4: Install Zabbix 7.0 LTS

1. Download the Zabbix repository package:

```bash
wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-1+bookworm_all.deb
```

2. Install the downloaded package:

```bash
sudo dpkg -i zabbix-release_7.0-1+bookworm_all.deb
sudo apt update
```

3. Now, install the Zabbix server, frontend, and agent:

```bash
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent -y
```

### Step 5: Configure Zabbix Database Connection

1. Import the initial schema and data into the Zabbix database:

```bash
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u zabbixuser -p zabbixdb
```

2. Configure Zabbix to connect to the database. Open the Zabbix server configuration file:

```bash
sudo nano /etc/zabbix/zabbix_server.conf
```

3. Find and set the following parameters:

```ini
DBName=zabbixdb
DBUser=zabbixuser
DBPassword=strongpassword
```

Replace `strongpassword` with the password you set earlier.

### Step 6: Start and Enable Zabbix Services

1. Start the Zabbix server and agent:

```bash
sudo systemctl start zabbix-server zabbix-agent apache2
```

2. Enable the services to start automatically on boot:

```bash
sudo systemctl enable zabbix-server zabbix-agent apache2
```

Verify the services are running:

```bash
sudo systemctl status zabbix-server zabbix-agent apache2
```

### Step 7: Complete Zabbix Frontend Setup

1. Open a web browser and navigate to `http://<Raspberry_Pi_IP>/zabbix`.
2. Follow the setup wizard to complete the configuration.

- **Step 1:** Welcome screen, click **Next**.
- **Step 2:** Ensure all prerequisites are met.
- **Step 3:** Database configuration. Enter the database name, user, and password.
- **Step 4:** Zabbix server details. Default values are typically sufficient.
- **Step 5:** Confirm configuration.

3. After the setup, log in to the Zabbix front end using the default credentials:

- **Username:** `Admin`
- **Password:** `zabbix`

### Step 8: Configure Zabbix Agent

The Zabbix agent collects data from the Raspberry Pi. Modify its configuration to monitor the server itself:

```bash
sudo nano /etc/zabbix/zabbix_agentd.conf
```

Find and adjust the following:

```ini
Server=127.0.0.1
ServerActive=127.0.0.1
Hostname=RaspberryPi4
```

Save and close the file, then restart the Zabbix agent:

```bash
sudo systemctl restart Zabbix-agent
```

### Step 9: Testing and Monitoring

1. add the Raspberry Pi as a host from the Zabbix dashboard.
2. Configure triggers, graphs, and alerts to monitor CPU, memory, disk usage, and other metrics.

With Zabbix 7.0 LTS successfully installed on Raspberry Pi OS 12 Bookworm, you can monitor your network and devices with a lightweight, efficient setup!

---

## FAQs

1. **Can Zabbix run efficiently on Raspberry Pi 4?**

- Yes, especially with 4GB or 8GB RAM. For small networks, Zabbix is very effective on Raspberry Pi.

2. **Do I need a static IP for Zabbix?**

- While not mandatory, a static IP makes it easier to access your Zabbix server consistently.

3. **What if I encounter PHP errors during setup?**

- Ensure PHP modules are correctly installed and PHP settings are optimized in `php.ini`.

4. **How secure is Zabbix on a Raspberry Pi?**

- Basic security involves securing the MySQL instance and ensuring the server is behind a firewall. For internet exposure, consider adding SSL.

5. **Can I use Zabbix to monitor IoT devices?**

- Zabbix is highly compatible with IoT monitoring and can track metrics via SNMP or custom scripts.
