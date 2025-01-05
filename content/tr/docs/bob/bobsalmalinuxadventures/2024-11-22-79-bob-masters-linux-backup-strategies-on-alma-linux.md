---
draft: false
title: Bob Masters Linux Backup Strategies on AlmaLinux
linkTitle: Backup Strategies
keywords:
  - Backup Strategies on AlmaLinux
  - AlmaLinux
description: He learned to use tools like `rsync` for file backups, snapshots for system states, and automated solutions to ensure regular, reliable backups.
date: 2024-12-09
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 790
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-masters-linux-backup-strategies-almalinux
---
After securing his AlmaLinux server, Bob’s next mission was to implement **backup strategies** to protect against data loss. He learned to use tools like `rsync` for file backups, snapshots for system states, and automated solutions to ensure regular, reliable backups.

> *“A good backup is like a time machine—time to build mine!”* Bob said, ready to safeguard his data.

---

### **Chapter Outline: "Bob Masters Linux Backup Strategies"**

1. **Introduction: Why Backups Are Essential**
   - The importance of data protection.
   - Types of backups: full, incremental, and differential.

2. **Using `rsync` for File Backups**
   - Creating manual backups.
   - Synchronizing files between systems.

3. **Creating System Snapshots with `LVM`**
   - Understanding Logical Volume Manager (LVM) snapshots.
   - Creating and restoring snapshots.

4. **Automating Backups with Cron Jobs**
   - Writing backup scripts.
   - Scheduling backups using `cron`.

5. **Exploring Advanced Backup Tools**
   - Using `borg` for deduplicated backups.
   - Setting up `restic` for encrypted cloud backups.

6. **Testing and Restoring Backups**
   - Verifying backup integrity.
   - Performing recovery simulations.

7. **Conclusion: Bob Reflects on Backup Mastery**

---

### **Part 1: Introduction: Why Backups Are Essential**

Bob learned that backups are crucial for recovering from hardware failures, accidental deletions, and ransomware attacks. A good backup strategy includes both local and remote backups, ensuring data redundancy.

#### **Backup Types**

1. **Full Backup**: All data is backed up every time. Simple but time-consuming.
2. **Incremental Backup**: Only changes since the last backup are saved.
3. **Differential Backup**: Backs up changes since the last full backup.

> *“Backups are my insurance policy against disaster!”* Bob thought.

---

### **Part 2: Using `rsync` for File Backups**

#### **Step 1: Creating Manual Backups**

Bob used `rsync` to back up `/home/bob` to an external drive.

- Backup command:

  ```bash
  rsync -avh /home/bob /mnt/backup
  ```

- Explanation:
  - `-a`: Archive mode (preserves permissions, timestamps, etc.).
  - `-v`: Verbose output.
  - `-h`: Human-readable file sizes.

#### **Step 2: Synchronizing Files Between Systems**

Bob set up `rsync` to sync files between two servers:

```bash
rsync -az /home/bob/ bob@192.168.1.20:/backup/bob
```

- Explanation:
  - `-z`: Compresses data during transfer.
  - `bob@192.168.1.20`: Remote server and user.

> *“With `rsync`, I can create fast, efficient backups!”* Bob said.

---

### **Part 3: Creating System Snapshots with `LVM`**

#### **Step 1: Setting Up LVM**

Bob ensured his system used LVM for managing logical volumes:

```bash
lsblk
```

#### **Step 2: Creating an LVM Snapshot**

- Create a snapshot of the root volume:

  ```bash
  sudo lvcreate --size 1G --snapshot --name root_snap /dev/mapper/root_lv
  ```

- Verify the snapshot:

  ```bash
  sudo lvs
  ```

#### **Step 3: Restoring from a Snapshot**

- Restore the snapshot to the original volume:

  ```bash
  sudo lvconvert --merge /dev/mapper/root_snap
  ```

- Reboot to apply changes:

  ```bash
  sudo reboot
  ```

> *“Snapshots let me roll back changes like magic!”* Bob said.

---

### **Part 4: Automating Backups with Cron Jobs**

#### **Step 1: Writing a Backup Script**

Bob created a script to automate his `rsync` backups:

```bash
#!/bin/bash

rsync -avh /home/bob /mnt/backup
echo "Backup completed on $(date)" >> /var/log/backup.log
```

- Save the script as `/usr/local/bin/backup.sh` and make it executable:

  ```bash
  sudo chmod +x /usr/local/bin/backup.sh
  ```

#### **Step 2: Scheduling Backups with `cron`**

- Edit the `cron` table:

  ```bash
  crontab -e
  ```

- Schedule the script to run daily at midnight:

  ```plaintext
  0 0 * * * /usr/local/bin/backup.sh
  ```

> *“Automation ensures I never forget a backup!”* Bob said.

---

### **Part 5: Exploring Advanced Backup Tools**

#### **Using `borg` for Deduplicated Backups**

- Install `borg`:

  ```bash
  sudo dnf install -y borgbackup
  ```

- Initialize a backup repository:

  ```bash
  borg init --encryption=repokey /mnt/backup/borg
  ```

- Create a backup:

  ```bash
  borg create /mnt/backup/borg::$(date +%Y-%m-%d) /home/bob
  ```

- Verify backups:

  ```bash
  borg list /mnt/backup/borg
  ```

#### **Using `restic` for Encrypted Cloud Backups**

- Install `restic`:

  ```bash
  sudo dnf install -y restic
  ```

- Initialize a local repository:

  ```bash
  restic init -r /mnt/backup/restic
  ```

- Back up files to the repository:

  ```bash
  restic -r /mnt/backup/restic backup /home/bob
  ```

> *“Modern tools like `borg` and `restic` make backups fast and secure!”* Bob noted.

---

### **Part 6: Testing and Restoring Backups**

#### **Step 1: Verifying Backup Integrity**

Bob checked his backups for corruption:

- For `rsync` backups:

  ```bash
  diff -r /home/bob /mnt/backup/bob
  ```

- For `borg`:

  ```bash
  borg check /mnt/backup/borg
  ```

#### **Step 2: Performing a Recovery Simulation**

Bob tested restoring files from his backups:

- For `rsync`:

  ```bash
  rsync -avh /mnt/backup/bob /home/bob
  ```

- For `borg`:

  ```bash
  borg extract /mnt/backup/borg::2023-11-11
  ```

> *“Testing ensures my backups work when I need them!”* Bob said.

---

### **Conclusion: Bob Reflects on Backup Mastery**

Bob now had a robust backup strategy using `rsync`, LVM snapshots, and advanced tools like `borg`. With automated scripts and regular testing, he ensured his AlmaLinux server’s data was safe from any disaster.

> Next, Bob plans to explore **Linux Containers and Podman** on AlmaLinux.
