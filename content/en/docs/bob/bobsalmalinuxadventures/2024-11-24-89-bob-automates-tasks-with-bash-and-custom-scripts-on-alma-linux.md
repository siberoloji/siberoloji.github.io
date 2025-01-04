---
draft: false
title: Bob Automates Tasks with Bash and Custom Scripts on AlmaLinux
linkTitle: Automates Tasks with Bash
keywords: []
description: By writing scripts to streamline repetitive tasks, he aimed to enhance his productivity and reduce manual work across his AlmaLinux systems.
date: 2024-12-11
url: bob-automates-tasks-bash-custom-scripts-almalinux
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
weight: 890
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to master **Bash scripting**, the cornerstone of Linux automation. By writing scripts to streamline repetitive tasks, he aimed to enhance his productivity and reduce manual work across his AlmaLinux systems.

> *“Why do it manually when I can write a script to do it for me?”* Bob said as he opened his terminal to dive into automation.

---

### **Chapter Outline: "Bob Automates Tasks with Bash and Custom Scripts"**

1. **Introduction: Why Learn Bash Scripting?**
   - Benefits of automation with Bash.
   - Real-world use cases.

2. **Bash Scripting Basics**
   - Writing and running a simple script.
   - Using variables and arguments.

3. **Conditional Statements and Loops**
   - Automating decisions with `if`, `else`, and `case`.
   - Processing data with `for` and `while` loops.

4. **Interacting with Files and Directories**
   - Automating file operations.
   - Managing logs and backups.

5. **Writing Advanced Scripts**
   - Using functions for modular scripting.
   - Integrating system commands for powerful scripts.

6. **Scheduling Scripts with Cron**
   - Automating script execution with `cron`.
   - Managing logs for scheduled tasks.

7. **Conclusion: Bob Reflects on Scripting Mastery**

---

### **Part 1: Introduction: Why Learn Bash Scripting?**

Bob learned that **Bash scripting** allows sysadmins to automate tasks, create custom tools, and handle complex operations with ease. Whether it’s managing files, monitoring systems, or deploying applications, Bash is indispensable.

#### **Use Cases for Bash Scripting**

- Automating system updates.
- Managing backups and logs.
- Monitoring resource usage.

> *“With Bash, I can automate almost anything on AlmaLinux!”* Bob noted.

---

### **Part 2: Bash Scripting Basics**

#### **Step 1: Writing and Running a Simple Script**

- Create a script file:

  ```bash
  nano hello.sh
  ```

- Add the following content:

  ```bash
  #!/bin/bash
  echo "Hello, AlmaLinux!"
  ```

- Make the script executable:

  ```bash
  chmod +x hello.sh
  ```

- Run the script:

  ```bash
  ./hello.sh
  ```

#### **Step 2: Using Variables and Arguments**

- Modify the script to accept arguments:

  ```bash
  #!/bin/bash
  echo "Hello, $1! Welcome to $2."
  ```

- Run the script with arguments:

  ```bash
  ./hello.sh Bob "AlmaLinux"
  ```

> *“Scripts can take inputs to make them more flexible!”* Bob said.

---

### **Part 3: Conditional Statements and Loops**

#### **Step 1: Using `if`, `else`, and `case`**

Bob wrote a script to check disk usage:

```bash
#!/bin/bash
disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $disk_usage -gt 80 ]; then
  echo "Disk usage is critically high: ${disk_usage}%"
else
  echo "Disk usage is under control: ${disk_usage}%"
fi
```

#### **Step 2: Using Loops**

- **For Loop**: Bob automated file processing:

  ```bash
  for file in *.txt; do
    echo "Processing $file"
    mv "$file" /backup/
  done
  ```

- **While Loop**: Monitoring a service:

  ```bash
  while true; do
    if ! systemctl is-active --quiet nginx; then
      echo "NGINX is down! Restarting..."
      sudo systemctl restart nginx
    fi
    sleep 60
  done
  ```

> *“Loops make it easy to handle repetitive tasks!”* Bob noted.

---

### **Part 4: Interacting with Files and Directories**

#### **Step 1: Automating File Operations**

Bob wrote a script to archive logs:

```bash
#!/bin/bash
log_dir="/var/log"
archive_dir="/backup/logs"
timestamp=$(date +%Y%m%d)

mkdir -p $archive_dir
tar -czf $archive_dir/logs_$timestamp.tar.gz $log_dir
echo "Logs archived to $archive_dir/logs_$timestamp.tar.gz"
```

#### **Step 2: Managing Backups**

- Create a backup script:

  ```bash
  #!/bin/bash
  rsync -av /home/bob /mnt/backup/
  echo "Backup completed at $(date)" >> /var/log/backup.log
  ```

> *“With scripts, backups happen without a second thought!”* Bob said.

---

### **Part 5: Writing Advanced Scripts**

#### **Step 1: Using Functions**

Bob modularized his scripts with functions:

```bash
#!/bin/bash

check_disk() {
  disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
  echo "Disk usage: ${disk_usage}%"
}

backup_files() {
  rsync -av /home/bob /mnt/backup/
  echo "Backup completed."
}

check_disk
backup_files
```

#### **Step 2: Integrating System Commands**

- Bob created a script to monitor CPU usage:

  ```bash
  #!/bin/bash
  top -b -n1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 "%"}'
  ```

> *“Functions keep my scripts organized and reusable!”* Bob said.

---

### **Part 6: Scheduling Scripts with Cron**

#### **Step 1: Automating Script Execution**

Bob scheduled a script to run daily:

- Edit the `cron` table:

  ```bash
  crontab -e
  ```

- Add a job to archive logs at midnight:

  ```plaintext
  0 0 * * * /home/bob/log_archive.sh
  ```

#### **Step 2: Managing Cron Logs**

- Enable cron logging:

  ```bash
  sudo nano /etc/rsyslog.conf
  ```

- Uncomment:

  ```plaintext
  cron.* /var/log/cron.log
  ```

- Restart `rsyslog`:

  ```bash
  sudo systemctl restart rsyslog
  ```

> *“Scheduled scripts keep my systems running smoothly around the clock!”* Bob said.

---

### **Conclusion: Bob Reflects on Scripting Mastery**

Bob mastered Bash scripting to automate tasks like backups, monitoring, and log management. With custom scripts and cron scheduling, he saved hours of manual work every week.

> Next, Bob plans to explore **AlmaLinux for Database Management**, diving into MySQL and PostgreSQL.
