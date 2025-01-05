---
title: Bob’s Guide to Linux Scripting and Automation on AlmaLinux
linkTitle: Linux Automation
description: Bob will learn how to write basic shell scripts to automate repetitive tasks, making his daily work on AlmaLinux more efficient and consistent.
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 180
toc: true
keywords:
  - Linux Automation
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bobs-guide-linux-scripting-automation-alma-linux
---

Let’s move on to Chapter 18, *"Bob’s Guide to Linux Scripting and Automation"*. In this chapter, Bob will learn how to write basic shell scripts to automate repetitive tasks, making his daily work on AlmaLinux more efficient and consistent.

---

## **1. Introduction: Bob’s Automation Inspiration**

With a growing list of regular tasks, Bob knows that scripting could save him a lot of time. He decides to dive into **Linux scripting** to automate everything from system maintenance to backups and deployments. Scripting will give him a new level of control over AlmaLinux and help him manage tasks without constant manual input.

> *“If I can automate these tasks, I’ll have more time for the fun stuff!”* Bob says, excited to explore scripting.

---

## **2. Writing a Basic Shell Script**

Bob begins with a simple script to get comfortable with basic syntax and structure. He learns that shell scripts are just text files containing Linux commands, and they can be run as if they’re regular programs.

- **Creating a New Script**: Bob creates a file called `hello.sh`:

  ```bash
  nano hello.sh
  ```

- **Adding Script Content**: He types a few commands into the file:

  ```bash
  #!/bin/bash
  echo "Hello, AlmaLinux!"
  date
  uptime
  ```

- **Making the Script Executable**: To run the script, he gives it execute permissions:

  ```bash
  chmod +x hello.sh
  ```

- **Running the Script**: Bob runs the script by typing:

  ```bash
  ./hello.sh
  ```

  The script displays a welcome message, the current date, and system uptime, confirming that it’s working.

> *“That was easier than I thought—now I’m ready to build more complex scripts!”* Bob says, feeling accomplished.

---

## **3. Automating System Updates with a Script**

Bob decides to automate his system updates with a script. This will ensure his AlmaLinux server stays secure and up to date.

- **Creating the Update Script**: Bob creates a new script called `update_system.sh`:

  ```bash
  nano update_system.sh
  ```

- **Adding Commands for Updates**: He adds commands to update his system:

  ```bash
  #!/bin/bash
  echo "Starting system update..."
  sudo dnf update -y
  echo "System update complete!"
  ```

- **Scheduling the Script with Cron**: Bob uses cron to schedule this script to run weekly. He edits his crontab:

  ```bash
  crontab -e
  ```

  And adds the following line to run the update script every Sunday at midnight:

  ```bash
  0 0 * * 0 /path/to/update_system.sh
  ```

> *“Now my server will stay updated automatically!”* Bob notes, pleased with his first useful automation.

---

## **4. Creating a Backup Script with Conditional Checks**

Bob knows that backups are critical, so he decides to write a script that checks for available space before creating a backup.

- **Writing the Backup Script**: Bob creates `backup_home.sh`:

  ```bash
  nano backup_home.sh
  ```

- **Adding Backup Logic**: In the script, he uses an `if` statement to check for available disk space:

  ```bash
  #!/bin/bash
  BACKUP_DIR="/backups"
  SOURCE_DIR="/home/bob"
  FREE_SPACE=$(df "$BACKUP_DIR" | tail -1 | awk '{print $4}')
  
  if [ "$FREE_SPACE" -ge 1000000 ]; then
      echo "Sufficient space available. Starting backup..."
      tar -czf "$BACKUP_DIR/home_backup_$(date +%F).tar.gz" "$SOURCE_DIR"
      echo "Backup complete!"
  else
      echo "Not enough space for backup."
  fi
  ```

- **Testing the Script**: Bob runs the script to test its functionality:

  ```bash
  ./backup_home.sh
  ```

> *“My backup script checks for space before running—no more failed backups!”* Bob says, glad to have added a smart check.

---

## **5. Creating a Log Cleanup Script**

Bob wants to automate log cleanup to prevent his server from filling up with old log files. He writes a script to delete logs older than 30 days.

- **Writing the Log Cleanup Script**: He creates `clean_logs.sh`:

  ```bash
  nano clean_logs.sh
  ```

- **Adding Log Deletion Command**: Bob adds a command to find and delete old log files:

  ```bash
  #!/bin/bash
  LOG_DIR="/var/log"
  find "$LOG_DIR" -type f -name "*.log" -mtime +30 -exec rm {} \;
  echo "Old log files deleted."
  ```

- **Scheduling with Cron**: To run this script monthly, he adds it to cron:

  ```bash
  0 2 1 * * /path/to/clean_logs.sh
  ```

> *“Now old logs will be cleaned up automatically—no more manual deletions!”* Bob says, enjoying his newfound efficiency.

---

## **6. Using Variables and User Input in Scripts**

Bob learns to make his scripts more interactive by adding variables and prompts for user input.

- **Creating a Script with Variables**: Bob writes a simple script to gather system information based on user input:

  ```bash
  nano system_info.sh
  ```

- **Adding User Prompts**: He adds `read` commands to get user input and uses `case` to handle different choices:

  ```bash
  #!/bin/bash
  echo "Choose an option: 1) CPU info 2) Memory info 3) Disk usage"
  read -r OPTION

  case $OPTION in
      1) echo "CPU Information:"; lscpu ;;
      2) echo "Memory Information:"; free -h ;;
      3) echo "Disk Usage:"; df -h ;;
      *) echo "Invalid option";;
  esac
  ```

- **Testing the Script**: Bob runs the script and tries different options to make sure it works:

  ```bash
  ./system_info.sh
  ```

> *“With user input, I can make scripts that adjust to different needs!”* Bob notes, happy with the flexibility.

---

## **7. Writing a Notification Script with `mail`**

Bob learns how to send email notifications from his scripts using the `mail` command, allowing him to receive alerts when tasks complete.

- **Setting Up `mail`**: Bob installs a mail client (if needed) and configures it:

  ```bash
  sudo dnf install mailx
  ```

- **Creating a Notification Script**: He writes a script that sends him an email after a task completes:

  ```bash
  nano notify_backup.sh
  ```

  - **Adding the Notification Logic**:

  ```bash
  #!/bin/bash
  BACKUP_FILE="/backups/home_backup_$(date +%F).tar.gz"

  tar -czf "$BACKUP_FILE" /home/bob
  echo "Backup completed successfully" | mail -s "Backup Notification" bob@example.com
  ```

> *“Now I’ll get notified when my backup completes!”* Bob says, glad for the real-time updates.

---

## **8. Organizing and Managing Scripts**

As Bob’s collection of scripts grows, he organizes them to stay efficient.

- **Creating a Scripts Directory**: He creates a folder to store all his scripts:

  ```bash
  mkdir ~/scripts
  ```

- **Adding Directory to PATH**: Bob adds his scripts folder to the PATH, allowing him to run scripts from anywhere:

  ```bash
  echo 'export PATH=$PATH:~/scripts' >> ~/.bashrc
  source ~/.bashrc
  ```

> *“Now I can run my scripts from any location,”* Bob says, happy with his clean setup.

---

## **9. Debugging Scripts with `set -x`**

Bob learns that `set -x` can help him debug scripts by showing each command as it executes.

- **Adding `set -x` to Debug**: When testing a new script, Bob adds `set -x` to the top:

  ```bash
  #!/bin/bash
  set -x
  # Script content here
  ```

- **Running the Script**: With debugging on, each command is shown in the terminal as it runs, making it easier to spot errors.

> *“Debugging scripts is simple with `set -x`—no more guessing where issues are!”* Bob says, relieved to have this tool.

---

## **10. Conclusion: Bob’s Scripting Skills Take Flight**

With his new scripting skills, Bob has transformed his AlmaLinux experience. His automated tasks, backup notifications, and custom scripts give him more control and efficiency than ever before.

> Next, Bob is ready to tackle **AlmaLinux system optimization techniques** to push performance and responsiveness to the max.

*Stay tuned for the next chapter: "Bob’s Guide to System Optimization on AlmaLinux!"*
