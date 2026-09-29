# 🐧 Linux for DevOps — Day 5

> **Focus:** System Monitoring • File Search • TAR • Users & Groups • Sudo • APT • SSH Keys • GCP IAM

## 🔥 Day 3 Overview

```text
Monitor → Search → Compress → Manage Users → Control Access
                         ↓
                 Packages + SSH Security
                         ↓
                      GCP IAM
```

## 1. 🖥️ System Monitoring

| Command | Purpose |
|---|---|
| `uname -a` | System, kernel and architecture info |
| `top` / `htop` | CPU, memory and process monitoring |
| `uptime` | Server uptime and load |
| `ps` | Running processes |
| `free -h` | RAM and swap usage |
| `df -h` | Disk usage |
| `who` / `w` | Logged-in users |
| `last` | Login history |
| `ping` | Network connectivity |
| `wget` | Download resources |
| `pwd` | Current directory |
| `history` | Previous commands |

**Zombie process:** A child process whose parent has exited but the process entry has not been cleaned up.

**Swap:** Disk space used as virtual memory when physical RAM is insufficient.

---

## 2. 🔎 File Search

### `locate`

Fast search using a file database.

```bash
sudo apt-get update
sudo apt install plocate
locate "*.log"
```

### `find`

Searches the filesystem directly.

```bash
find /var/log -name "*.log"
```

| `locate` | `find` |
|---|---|
| Uses database | Searches filesystem |
| Usually faster | More direct/flexible |
| Database may need updating | No database required |

---

## 3. 📦 TAR Archives

Create an archive:

```bash
tar -cvf all_files.tar my_files
```

Extract:

```bash
tar -xvf all_files.tar
```

- `c` = create
- `x` = extract
- `v` = verbose
- `f` = archive filename

---

## 4. 👤 Users & Groups

### User Management

```bash
adduser username
su username
passwd username
userdel username
```

### Group Management

```bash
addgroup DevOps45
getent group
usermod -aG DevOps45 username
delgroup DevOps45
```

### Account Expiry

```bash
chage username
```

Useful for controlling password/account expiry, including temporary access.

> `userdel` does not necessarily remove the user's home directory.

---

## 5. 📁 Important Linux Files

| File | Purpose |
|---|---|
| `/etc/passwd` | User account information |
| `/etc/shadow` | Password-related authentication data |
| `/etc/group` | Group information |
| `/etc/sudoers` | Elevated/sudo access rules |

```bash
cat /etc/passwd
cat /etc/group
sudo cat /etc/shadow
sudo visudo
```

### 🔐 Sudo

`/etc/sudoers` controls which users/groups can run commands with elevated privileges.

**Best practice:** Give users only the permissions they need.

---

## 6. 📦 APT Package Management

```bash
sudo apt-get update
sudo apt install <package>
sudo apt-get upgrade
sudo apt install <package>=<version>
```

Remember:

```text
apt-get update
      ↓
Refresh package information
      ↓
apt install
      ↓
Install package
```

---

## 7. 🔑 SSH Keys

### Public Key
- Can be shared.
- Used by the remote server during authentication.

### Private Key
- Must remain secret.
- Stays securely on your local machine.
- **Never upload it to GitHub or share it.**

Generate a key pair:

```bash
ssh-keygen
```

### SSH Authentication

```text
Laptop
Private Key 🔐
     ↓
    SSH
     ↓
Linux Server
Public Key 🔓
     ↓
Authentication
```

Common algorithms mentioned: **RSA, Ed25519**

---

## 8. ☁️ GCP Project & IAM

### Create a Project

```text
GCP Console
   ↓
Project Selector
   ↓
New Project
   ↓
Unique Project Name
   ↓
Create
```

### Switch Projects

Use the project selector to move between:

```text
Dev → QA → Production
```

### Grant Project Access

```text
GCP Project
    ↓
IAM
    ↓
Grant Access
    ↓
Enter User
    ↓
Select Required Role
    ↓
Save
```

> **Project-level IAM access ≠ VM-level access.**

### Least Privilege

Give users the **minimum permissions required** for their job.

---

## 💰 GCP Billing Reminder

Stopping a VM does not necessarily stop all charges.

For training VMs:

```text
Finish Practice
      ↓
Delete Unused VM
      ↓
Avoid Unnecessary Charges
```

---

# 🎯 Interview Quick Revision

| Question | Short Answer |
|---|---|
| `uname -a`? | System/kernel/architecture information |
| `top` vs `htop`? | Both monitor resources; `htop` is more interactive |
| `uptime`? | Uptime and system load |
| Zombie process? | Uncleaned child process after parent exits |
| Swap? | Disk used as virtual memory |
| `df -h`? | Human-readable disk usage |
| `last`? | Login history |
| `who` vs `w`? | Both show users; `w` gives more details |
| `ping`? | Network connectivity test |
| `locate` vs `find`? | Database search vs direct filesystem search |
| `tar -cvf`? | Create TAR archive |
| `tar -xvf`? | Extract TAR archive |
| `adduser`? | Create user |
| `usermod -aG`? | Add user to a supplementary group |
| `chage`? | Manage password/account expiry |
| `/etc/passwd`? | User account information |
| `/etc/shadow`? | Password-related authentication data |
| `/etc/sudoers`? | Sudo/elevated access rules |
| `ssh-keygen`? | Generate SSH key pair |
| GCP IAM? | Identity and access management |

---

# 🧪 Scenario Revision

| Scenario | What to Use |
|---|---|
| CPU is very high | `top` / `htop` |
| Check RAM | `free -h` |
| Check disk | `df -h` |
| Verify restart | `uptime` |
| Find `.log` files | `find /var/log -name "*.log"` |
| Fast filename search | `locate` |
| Archive files | `tar -cvf` |
| Extract archive | `tar -xvf` |
| Create account | `adduser` |
| Reset password | `passwd` |
| Add user to group | `usermod -aG` |
| Set account expiry | `chage` |
| Controlled admin access | `visudo` / sudoers |
| Secure SSH login | `ssh-keygen` |
| Give GCP project access | IAM |
| Avoid training VM charges | Delete VM |

---

# ⚡ Quick Command Cheat Sheet

```bash
# Monitoring
uname -a
top
htop
uptime
free -h
df -h
ps
who
w
last
ping www.google.com
pwd
history

# Search
locate "*.log"
find /var/log -name "*.log"

# Packages
sudo apt-get update
sudo apt install plocate
sudo apt-get upgrade

# Archive
tar -cvf all_files.tar my_files
tar -xvf all_files.tar

# Users
adduser username
su username
passwd username
userdel username

# Groups
addgroup DevOps45
getent group
usermod -aG DevOps45 username
chage username

# Access
sudo visudo
ssh-keygen
```

## ✅ Key Takeaways

- 🖥️ Monitor systems with `top`, `htop`, `free`, `df`, and `uptime`.
- 🔎 Know when to use `locate` vs `find`.
- 📦 Use `tar` to archive and extract files.
- 👤 Understand Linux users, groups, and account expiry.
- 🔐 Protect private SSH keys and follow least privilege.
- 📦 Run `apt-get update` before installing packages.
- ☁️ Use GCP IAM for project-level access control.
- 💰 Delete unused training VMs to avoid unnecessary charges.
- 🧪 Practice commands instead of only memorizing them.

> **Day 3 takeaway:** Linux administration = **Monitor → Troubleshoot → Manage Access → Secure → Automate**.

