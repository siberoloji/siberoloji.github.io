---
title: Bob Builds a Hybrid Cloud Environment on AlmaLinux
linkTitle: Hybrid Cloud Env.
description: How to connect his on-premises AlmaLinux server with cloud resources to create a hybrid cloud setup.
date: 2024-11-15
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 210

keywords:
  - Hybrid Cloud Environment

featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-builds-hybrid-cloud-environment-alma-linux on integrating local and cloud environments
---
Let’s dive into Chapter 21, *"Bob Builds a Hybrid Cloud Environment"*, where Bob will learn how to connect his on-premises AlmaLinux server with cloud resources to create a hybrid cloud setup. This chapter focuses seamlessly for workload flexibility and scalability.

## **1. Introduction: Bob’s Hybrid Cloud Challenge**

Bob’s team has decided to keep some workloads on their on-premises AlmaLinux servers while leveraging the cloud for scalable tasks like backups and heavy computations. Bob’s mission is to connect his on-premises server with AWS to create a **hybrid cloud environment** that combines the best of both worlds.

> *“This is the ultimate challenge—integrating my server with the cloud!”* Bob says, ready to tackle this complex but rewarding task.

---

## **2. Setting Up a VPN Between On-Premises and AWS**

The first step in building a hybrid cloud is establishing a **Virtual Private Network (VPN)** to securely connect Bob’s on-premises server to the AWS VPC.

- **Configuring a VPN Gateway on AWS**:
  - Bob logs into the AWS Management Console, navigates to **VPC**, and creates a **VPN Gateway**.
  - He attaches the gateway to the target VPC and downloads the configuration file for his on-premises server.

- **Installing `strongSwan` on AlmaLinux**:
  - Bob installs `strongSwan`, a popular IPsec VPN solution, to handle the connection:

    ```bash
    sudo dnf install strongswan
    ```

- **Configuring `ipsec.conf`**:
  - He configures the VPN parameters using the AWS-provided configuration file. The file includes details like the VPN gateway’s public IP, shared secret, and encryption methods:

    ```bash
    sudo nano /etc/strongswan/ipsec.conf
    ```

    Example configuration:

    ```bash
    conn aws-vpn
        left=%defaultroute
        leftid=<on-premises-public-ip>
        right=<aws-vpn-public-ip>
        keyexchange=ike
        ike=aes256-sha1-modp1024!
        esp=aes256-sha1!
        authby=secret
    ```

- **Starting the VPN**:
  - Bob starts the VPN service and connects:

    ```bash
    sudo systemctl start strongswan
    sudo ipsec up aws-vpn
    ```

> *“The secure tunnel is up—my server and AWS are now connected!”* Bob says, thrilled to see it working.

---

## **3. Configuring AWS Direct Connect for Better Performance**

To improve the hybrid cloud connection’s performance, Bob learns about **AWS Direct Connect**, which offers a dedicated link between on-premises data centers and AWS.

- **Provisioning Direct Connect**:
  - Bob works with his network provider to set up a Direct Connect link.
  - In the AWS Management Console, he configures a Direct Connect connection and associates it with his VPC.

- **Testing the Connection**:
  - Once the Direct Connect link is active, Bob verifies it by pinging resources in his AWS VPC:

    ```bash
    ping <aws-resource-ip>
    ```

> *“With Direct Connect, I get low-latency and high-speed access to the cloud!”* Bob says, enjoying the enhanced connection.

---

## **4. Setting Up Shared Storage with AWS EFS**

Bob decides to use **AWS Elastic File System (EFS)** to share files between his on-premises server and cloud instances.

- **Creating an EFS File System**:
  - Bob navigates to **EFS** in the AWS Management Console and creates a new file system.
  - He associates the file system with the AWS VPC and configures access permissions.

- **Mounting EFS on AWS EC2**:
  - On an EC2 instance, Bob installs the EFS mount helper and mounts the file system:

    ```bash
    sudo dnf install amazon-efs-utils
    sudo mount -t efs <efs-id>:/ /mnt/efs
    ```

- **Mounting EFS on AlmaLinux**:
  - Bob sets up the same mount point on his on-premises server, using the VPN to access the file system:

    ```bash
    sudo mount -t nfs4 <efs-endpoint>:/ /mnt/efs
    ```

> *“Now my on-premises server and cloud instances share the same files in real time!”* Bob says, excited by the seamless integration.

---

## **5. Implementing a Hybrid Database Setup**

Bob decides to set up a hybrid database using **AWS RDS** for scalability while keeping a local replica on his AlmaLinux server for low-latency access.

- **Setting Up an AWS RDS Database**:
  - Bob creates a new MySQL database in RDS via the AWS Console and configures it to allow access from his on-premises server’s IP.

- **Replicating the Database Locally**:
  - Bob installs MySQL on his AlmaLinux server and sets it up as a replica:

    ```bash
    sudo dnf install mysql-server
    ```

    - Configuring replication in MySQL:

      ```sql
      CHANGE MASTER TO
          MASTER_HOST='<aws-rds-endpoint>',
          MASTER_USER='replication_user',
          MASTER_PASSWORD='password',
          MASTER_LOG_FILE='mysql-bin.000001',
          MASTER_LOG_POS=4;
      START SLAVE;
      ```

> *“With database replication, I have the best of both worlds—local speed and cloud scalability!”* Bob says, feeling like a hybrid master.

---

## **6. Automating Workloads Across Hybrid Infrastructure**

To manage hybrid workloads, Bob uses **AWS Systems Manager** to automate tasks across both environments.

- **Installing the SSM Agent**:
  - Bob installs the AWS SSM Agent on his AlmaLinux server:

    ```bash
    sudo dnf install amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent
    ```

- **Running Commands Across Environments**:
  - Using the AWS Console, Bob sends a command to update packages on both the on-premises server and AWS EC2 instances simultaneously.

> *“Now I can automate tasks across my hybrid environment with one click!”* Bob says, amazed by the possibilities.

---

## **7. Monitoring Hybrid Resources with AWS CloudWatch**

Bob integrates CloudWatch to monitor the performance of his hybrid cloud setup.

- **Installing the CloudWatch Agent**:
  - Bob installs the agent on his AlmaLinux server:

    ```bash
    sudo dnf install amazon-cloudwatch-agent
    ```

- **Configuring CloudWatch Metrics**:
  - Bob configures the agent to send CPU, memory, and disk metrics to CloudWatch:

    ```bash
    sudo nano /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
    ```

    Example configuration:

    ```json
    {
      "metrics": {
        "append_dimensions": {
          "InstanceId": "${aws:InstanceId}"
        },
        "metrics_collected": {
          "mem": { "measurement": ["mem_used_percent"] },
          "disk": { "measurement": ["disk_used_percent"] }
        }
      }
    }
    ```

  - Starting the agent:

    ```bash
    sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s
    ```

> *“Now I can monitor everything in one dashboard!”* Bob says, feeling in control of his hybrid setup.

---

## **8. Conclusion: Bob’s Hybrid Cloud Success**

With a secure VPN, shared storage, database replication, and automated workload management, Bob has successfully built a robust hybrid cloud environment. His AlmaLinux server and AWS cloud resources work seamlessly together, ready to handle any workload.

> Next up, Bob plans to explore **disaster recovery planning** to make his hybrid environment resilient to failures.

*Stay tuned for the next chapter: "Bob’s Disaster Recovery Playbook for AlmaLinux!"*
