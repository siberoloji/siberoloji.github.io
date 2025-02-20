---
draft: false
title: Network Scanning on Linux Mint with Cinnamon Desktop
linkTitle: Network Scanning
translationKey: network-scanning-on-linux-mint-with-cinnamon-desktop
description: This guide will walk you through setting up and using various network scanning tools on Linux Mint with Cinnamon Desktop.
url: network-scanning-on-linux-mint-with-cinnamon-desktop
weight: 180
date: 2025-02-19
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - Network Scanning
featured_image: /images/linuxmint1.webp
---
Network scanning is an essential tool for system administrators and security professionals to monitor and maintain network security. This comprehensive guide will walk you through setting up and using various network scanning tools on Linux Mint with Cinnamon Desktop.

## Essential Tools Installation

First, let's install the necessary scanning tools:

```bash
sudo apt update
sudo apt install nmap masscan netcat-openbsd wireshark arp-scan nikto net-tools nbtscan
```

This installs:

- nmap: Comprehensive network scanner
- masscan: Mass IP port scanner
- netcat: Network utility for port scanning
- wireshark: Network protocol analyzer
- arp-scan: Layer 2 network scanner
- nikto: Web server scanner
- net-tools: Network utilities
- nbtscan: NetBIOS scanner

## Basic Network Scanning Setup

### Configuring Nmap

1. Create a basic scanning profile:

```bash
# Save as ~/scan-profiles/basic-scan.conf
# Basic network scan profile
timing=normal
no-ping
service-scan
os-detection
version-detection
output-normal=/var/log/nmap/basic-scan.log
```

2. Create scanning directory:

```bash
sudo mkdir -p /var/log/nmap
sudo chmod 755 /var/log/nmap
```

### Setting Up Automated Scanning

1. Create a basic scanning script:

```bash
#!/bin/bash
# Save as ~/scripts/network-scan.sh

TIMESTAMP=$(date +%Y%m%d-%H%M)
LOGDIR="/var/log/network-scans"
NETWORK="192.168.1.0/24"  # Adjust to your network

# Create log directory
mkdir -p $LOGDIR

# Basic network scan
nmap -sn $NETWORK -oN $LOGDIR/hosts-$TIMESTAMP.txt

# Detailed scan of live hosts
for host in $(grep "up" $LOGDIR/hosts-$TIMESTAMP.txt | cut -d " " -f 2); do
    nmap -A -T4 $host -oN $LOGDIR/detailed-$host-$TIMESTAMP.txt
done
```

## Advanced Scanning Configuration

### Port Scanning Setup

1. Create comprehensive port scanning script:

```bash
#!/bin/bash
# Save as ~/scripts/port-scanner.sh

TARGET=$1
OUTPUT_DIR="/var/log/port-scans"
TIMESTAMP=$(date +%Y%m%d-%H%M)

# Create output directory
mkdir -p $OUTPUT_DIR

# Quick scan
echo "Running quick scan..."
nmap -T4 -F $TARGET -oN $OUTPUT_DIR/quick-$TIMESTAMP.txt

# Full port scan
echo "Running full port scan..."
nmap -p- -T4 $TARGET -oN $OUTPUT_DIR/full-$TIMESTAMP.txt

# Service detection
echo "Running service detection..."
nmap -sV -p$(grep ^[0-9] $OUTPUT_DIR/full-$TIMESTAMP.txt | cut -d "/" -f 1 | tr "\n" ",") \
    $TARGET -oN $OUTPUT_DIR/services-$TIMESTAMP.txt
```

### Vulnerability Scanning

1. Set up Nikto scanning:

```bash
#!/bin/bash
# Save as ~/scripts/web-scanner.sh

TARGET=$1
OUTPUT_DIR="/var/log/web-scans"
TIMESTAMP=$(date +%Y%m%d-%H%M)

mkdir -p $OUTPUT_DIR

# Run Nikto scan
nikto -h $TARGET -output $OUTPUT_DIR/nikto-$TIMESTAMP.txt

# Run targeted Nmap scripts
nmap -p80,443 --script "http-*" $TARGET -oN $OUTPUT_DIR/http-scripts-$TIMESTAMP.txt
```

## Network Discovery Tools

### ARP Scanning Setup

1. Create ARP scanning script:

```bash
#!/bin/bash
# Save as ~/scripts/arp-discovery.sh

INTERFACE="eth0"  # Change to your interface
OUTPUT_DIR="/var/log/arp-scans"
TIMESTAMP=$(date +%Y%m%d-%H%M)

mkdir -p $OUTPUT_DIR

# Run ARP scan
sudo arp-scan --interface=$INTERFACE --localnet --ignoredups \
    > $OUTPUT_DIR/arp-scan-$TIMESTAMP.txt

# Compare with previous scan
if [ -f $OUTPUT_DIR/arp-scan-previous.txt ]; then
    diff $OUTPUT_DIR/arp-scan-previous.txt $OUTPUT_DIR/arp-scan-$TIMESTAMP.txt \
        > $OUTPUT_DIR/arp-changes-$TIMESTAMP.txt
fi

# Save current scan as previous
cp $OUTPUT_DIR/arp-scan-$TIMESTAMP.txt $OUTPUT_DIR/arp-scan-previous.txt
```

## Continuous Network Monitoring

### Setting Up Regular Scans

1. Create monitoring script:

```bash
#!/bin/bash
# Save as ~/scripts/network-monitor.sh

LOGDIR="/var/log/network-monitoring"
NETWORK="192.168.1.0/24"
TIMESTAMP=$(date +%Y%m%d-%H%M)

mkdir -p $LOGDIR

# Check for new hosts
nmap -sn $NETWORK -oN $LOGDIR/hosts-$TIMESTAMP.txt

# Check open ports on known hosts
while read -r host; do
    nmap -F $host -oN $LOGDIR/ports-$host-$TIMESTAMP.txt
done < $LOGDIR/known-hosts.txt

# Check for changes
if [ -f $LOGDIR/hosts-previous.txt ]; then
    diff $LOGDIR/hosts-previous.txt $LOGDIR/hosts-$TIMESTAMP.txt \
        > $LOGDIR/changes-$TIMESTAMP.txt
fi

cp $LOGDIR/hosts-$TIMESTAMP.txt $LOGDIR/hosts-previous.txt
```

### Automated Reporting

1. Create reporting script:

```bash
#!/bin/bash
# Save as ~/scripts/scan-report.sh

LOGDIR="/var/log/network-monitoring"
REPORTDIR="/var/log/reports"
TIMESTAMP=$(date +%Y%m%d-%H%M)

mkdir -p $REPORTDIR

# Generate summary report
echo "Network Scan Report - $TIMESTAMP" > $REPORTDIR/report-$TIMESTAMP.txt
echo "--------------------------------" >> $REPORTDIR/report-$TIMESTAMP.txt

# Add host changes
echo "Host Changes:" >> $REPORTDIR/report-$TIMESTAMP.txt
cat $LOGDIR/changes-$TIMESTAMP.txt >> $REPORTDIR/report-$TIMESTAMP.txt

# Add port changes
echo "Port Changes:" >> $REPORTDIR/report-$TIMESTAMP.txt
for file in $LOGDIR/ports-*-$TIMESTAMP.txt; do
    echo "$(basename $file):" >> $REPORTDIR/report-$TIMESTAMP.txt
    cat $file >> $REPORTDIR/report-$TIMESTAMP.txt
done
```

## Best Practices and Security Considerations

### Scan Policy Implementation

1. Create scanning policy document:

```text
# /etc/network-scan-policy.conf

# Scanning Windows
scan_time=22:00-06:00

# Excluded Hosts
exclude_hosts=192.168.1.10,192.168.1.11

# Scan Intensity
max_parallel_hosts=5
max_rate=1000

# Reporting
report_retention_days=30
alert_email=admin@domain.com
```

2. Policy enforcement script:

```bash
#!/bin/bash
# Save as ~/scripts/policy-check.sh

source /etc/network-scan-policy.conf

# Check scan time
current_hour=$(date +%H)
if [[ ! $scan_time =~ $current_hour ]]; then
    echo "Outside scanning window"
    exit 1
fi

# Check excluded hosts
for host in $SCAN_TARGETS; do
    if [[ $exclude_hosts =~ $host ]]; then
        echo "Host $host is excluded"
        continue
    fi
done
```

## Troubleshooting and Maintenance

### Creating Diagnostic Tools

1. Scanner diagnostic script:

```bash
#!/bin/bash
# Save as ~/scripts/scanner-diagnostic.sh

echo "Scanner Diagnostic Report"
echo "------------------------"

# Check tools installation
echo "Checking installed tools:"
for tool in nmap masscan nikto arp-scan; do
    which $tool > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$tool: Installed"
    else
        echo "$tool: Not installed"
    fi
done

# Check log directories
echo -e "\nChecking log directories:"
for dir in /var/log/{nmap,network-scans,port-scans,web-scans}; do
    if [ -d $dir ]; then
        echo "$dir: Exists"
    else
        echo "$dir: Missing"
    fi
done

# Check recent scans
echo -e "\nRecent scan status:"
find /var/log -name "*scan*.txt" -mtime -1 -ls
```

## Conclusion

Setting up network scanning on Linux Mint with Cinnamon Desktop involves careful planning, proper tool configuration, and regular maintenance. Key takeaways include:

- Proper installation and configuration of scanning tools
- Implementation of automated scanning scripts
- Regular monitoring and reporting
- Policy compliance and security considerations
- Effective troubleshooting procedures

Remember to:

- Regularly update scanning tools
- Monitor scan logs and reports
- Follow scanning policies
- Document network changes
- Maintain scanning configurations

With these tools and configurations in place, you can maintain effective network scanning capabilities on your Linux Mint system.
