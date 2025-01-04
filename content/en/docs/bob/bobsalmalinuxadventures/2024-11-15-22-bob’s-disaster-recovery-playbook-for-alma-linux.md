---
title: Bob’s Disaster Recovery Playbook for AlmaLinux
linkTitle: Disaster Recovery
description: Bob will focus on creating a robust disaster recovery (DR) plan for his AlmaLinux hybrid environment.
date: 2024-11-15
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
weight: 220
toc: true
keywords:
  - Disaster Recovery on AlmaLinux
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-disaster-recovery-playbook-alma-linux
---
Let’s proceed with Chapter 22, *"Bob’s Disaster Recovery Playbook for AlmaLinux"*. In this chapter, Bob will focus on creating a robust disaster recovery (DR) plan for his AlmaLinux hybrid environment. He’ll explore backup strategies, failover configurations, and testing recovery processes to ensure resilience against unexpected failures.

## **1. Introduction: Preparing for the Worst**

Bob has built an impressive AlmaLinux infrastructure, but he knows even the best setups are vulnerable to unexpected disasters—hardware failures, cyberattacks, or natural events. His next challenge is to create a disaster recovery plan that ensures minimal downtime and data loss.

> *“A little preparation now can save me from a lot of headaches later!”* Bob says, ready to prepare for the unexpected.

---

## **2. Defining Recovery Objectives**

Bob starts by learning about **Recovery Time Objective (RTO)** and **Recovery Point Objective (RPO)**:

- **RTO**: The maximum acceptable downtime after a disaster.
- **RPO**: The maximum acceptable data loss, measured in time (e.g., one hour of data).

For his setup:

- RTO: 1 hour.
- RPO: 15 minutes.

> *“With these goals in mind, I can design my recovery process,”* Bob notes.

---

## **3. Setting Up Regular Backups**

Bob ensures all critical data and configurations are regularly backed up.

- **Local Backups**: Bob writes a script to back up `/etc` (config files), `/var/www` (web server files), and databases to a local disk:

  ```bash
  tar -czf /backups/alma_backup_$(date +%F).tar.gz /etc /var/www
  ```

- **Cloud Backups with S3**: He extends his backup process to include AWS S3:

  ```bash
  aws s3 sync /backups s3://my-dr-backup-bucket
  ```

- **Automating Backups**: Using cron, he schedules backups every 15 minutes:

  ```bash
  */15 * * * * /path/to/backup_script.sh
  ```

> *“With backups every 15 minutes, my RPO is covered!”* Bob says, feeling reassured.

---

## **4. Implementing Redundancy with High Availability**

Bob explores **high availability (HA)** configurations to minimize downtime.

- **Database Replication**: He ensures his on-premises MySQL database is continuously replicated to AWS RDS using **binlog replication**.
- **Load Balancers**: To prevent server overload, Bob sets up an AWS Elastic Load Balancer (ELB) to distribute traffic across multiple EC2 instances.

> *“If one server goes down, traffic will automatically redirect to the others!”* Bob notes, impressed by HA setups.

---

## **5. Configuring Failover for the VPN**

To ensure connectivity between his on-premises server and AWS, Bob configures a failover VPN connection.

- **Secondary VPN Configuration**:
  - He creates a second VPN gateway in AWS, associated with a different availability zone.
  - On his on-premises server, he configures the secondary connection in `ipsec.conf`:

    ```bash
    conn aws-vpn-failover
        left=%defaultroute
        leftid=<on-premises-public-ip>
        right=<aws-secondary-vpn-ip>
        keyexchange=ike
        authby=secret
    ```

- **Testing the Failover**:
  - He stops the primary VPN and checks if the connection switches to the secondary:

    ```bash
    sudo ipsec down aws-vpn
    sudo ipsec up aws-vpn-failover
    ```

> *“Now my hybrid cloud stays connected even if one VPN fails!”* Bob says, relieved.

---

## **6. Automating Recovery with Ansible Playbooks**

Bob writes **Ansible playbooks** to automate the recovery process for quick server restoration.

- **Creating a Recovery Playbook**:
  - Bob writes a playbook to restore backups and reinstall essential services:

    ```yaml
    - name: Restore AlmaLinux Server
      hosts: all
      tasks:
        - name: Restore /etc
          copy:
            src: /backups/etc_backup.tar.gz
            dest: /etc

        - name: Reinstall services
          yum:
            name: ["httpd", "mysql-server"]
            state: present

        - name: Start services
          systemd:
            name: "{{ item }}"
            state: started
          with_items:
            - httpd
            - mysqld
    ```

- **Running the Playbook**:

  ```bash
  ansible-playbook -i inventory restore_server.yml
  ```

> *“My recovery process is just one command away!”* Bob says, loving the simplicity.

---

## **7. Testing the Disaster Recovery Plan**

Bob knows a DR plan is only as good as its test results, so he simulates disasters to verify the plan.

- **Simulating Data Loss**:
  - Bob deletes a critical database table and restores it using his backup script:

    ```bash
    mysql -u root -p < /backups/db_backup.sql
    ```

- **Simulating Server Failure**:
  - Bob terminates an EC2 instance and uses his Ansible playbook to restore it:

    ```bash
    ansible-playbook -i inventory restore_server.yml
    ```

- **Documenting Results**:
  - He records recovery times for each scenario and compares them to his RTO and RPO goals.

> *“With regular testing, I know my recovery plan works when it matters most!”* Bob says, feeling confident.

---

## **8. Monitoring and Alerts for Disaster Detection**

To detect disasters early, Bob sets up monitoring and alerts.

- **AWS CloudWatch Alarms**:
  - He creates alarms for CPU usage, disk space, and VPN status, configured to send notifications via Amazon SNS.

- **Log Monitoring**:
  - Bob uses `logwatch` to monitor system logs for errors:

    ```bash
    sudo dnf install logwatch
    sudo logwatch --detail high --mailto bob@example.com
    ```

> *“Early detection means faster recovery!”* Bob notes, appreciating the importance of proactive monitoring.

---

## **9. Creating a Runbook for Disaster Recovery**

Bob documents his DR plan in a **runbook** to ensure anyone on the team can follow it during an emergency.

- **Key Sections in the Runbook**:
  1. **Overview**: Goals and objectives (RTO and RPO).
  2. **Backup Locations**: Paths for local and cloud backups.
  3. **Failover Procedures**: Steps to switch VPNs or load balancers.
  4. **Recovery Steps**: How to use scripts and Ansible playbooks for restoration.
  5. **Contact Info**: Key team members and emergency contacts.

> *“A detailed runbook ensures smooth recovery even if I’m not available!”* Bob says, proud of his documentation.

---

## **10. Conclusion: Bob’s Disaster Recovery Confidence**

With a comprehensive DR plan, automated backups, failover configurations, and regular testing, Bob feels confident his AlmaLinux hybrid environment can withstand any disaster. His team is prepared to recover quickly and keep operations running smoothly.

> Next, Bob plans to dive into **performance tuning for containerized workloads**, ensuring his hybrid environment runs at maximum efficiency.

*Stay tuned for the next chapter: "Bob’s Guide to Optimizing Containerized Workloads!"*
