# 🐧 Linux Training — Day 1

> **Focus:** Linux fundamentals, SSH, Git, basic commands, and GCP VM setup for Cloud & DevOps.

## 🎯 Day 1 Outcomes
- Understand **OS, Kernel, Shell, Linux, and distributions**
- Learn basic Linux commands
- Set up **Git** and **MobaXterm** (Windows)
- Practice **SSH**
- Create an **Ubuntu 24.04 LTS VM on GCP**
- Configure a **GCP budget alert**
- Practice with **Bandit / OverTheWire**

## 🧠 1. Operating System

An **Operating System (OS)** connects applications/users with hardware and manages resources such as CPU, memory, and disk.

```text
Application
    ↓
   OS
    ↓
Hardware
```

### Kernel vs Shell

| Component | Meaning |
|---|---|
| **Kernel** | Core of the OS; manages resources and hardware |
| **Shell** | Interface used to interact with the OS |
| **Bash** | Common Linux/Unix shell |

```text
Application → Shell → Kernel → Hardware
```

> **Interview tip:** Linux technically refers to the **kernel**; a Linux distribution combines the kernel with other tools and components.

## 🐧 2. Linux Basics

- Open source and community developed
- Developed by **Linus Torvalds in 1991**
- Widely used in **servers, cloud, containers, and DevOps**
- Based on many **Unix** design principles
- Known for being lightweight, stable, and flexible

## 📦 3. Linux Distributions

A distribution combines the Linux kernel with tools, libraries, packages, and package management.

**Examples:** Ubuntu, Debian, Red Hat, Fedora, Amazon Linux, CentOS, OpenSUSE, Arch Linux, Mint.

| Ubuntu | Red Hat |
|---|---|
| Learning, cloud, personal projects | Enterprise environments |
| Open source | Enterprise support/vendor services |

## 🆚 4. Linux vs Windows

| Linux | Windows |
|---|---|
| Open source | Closed source |
| Common on servers/cloud | Common on desktops |
| CLI heavily used on servers | GUI commonly used |
| `/` path separator | `\` path separator |
| Lightweight server environments | More GUI/resource overhead |

## 🛠️ 5. Git, MobaXterm & SSH

### Git

```bash
git clone <repository-url>
```

Downloads a remote repository to your local machine.

### MobaXterm
Windows terminal tool commonly used for SSH connections. Mac/Linux users can use their built-in terminal.

### SSH

**SSH (Secure Shell)** provides secure command-line access to remote servers.

```bash
ssh username@hostname -p 2220
```

> Port **22** is commonly used for normal SSH servers.

### Bandit
**OverTheWire Bandit** is a practical Linux CLI challenge that uses SSH.

## ☁️ 6. GCP Linux VM

The session used **Ubuntu 24.04 LTS, 64-bit**.

```text
GCP Console
    ↓
Compute Engine
    ↓
Enable Compute Engine API
    ↓
VM Instances
    ↓
Create Instance
    ↓
Ubuntu 24.04 LTS
    ↓
Create → SSH
```

### Budget Alert

```text
Billing
  ↓
Budgets & Alerts
  ↓
Create Budget
  ↓
50% → 90% → 100%
```

**Important:** Delete unused VMs because they can consume cloud credits.

## 📁 7. Linux File System

| Path | Meaning |
|---|---|
| `/` | Root of filesystem |
| `~` | Current user's home directory |
| `/usr` | User/system-related data |
| `/dev` | Device information |
| `/bin` | Executable/binary files |

⚠️ **`/` root directory ≠ root user.** The root user is a superuser with extensive permissions.

## 💻 8. Essential Commands

| Command | Purpose |
|---|---|
| `pwd` | Show current directory |
| `ls` | List files/directories |
| `cd <dir>` | Enter a directory |
| `cd ..` | Move one level up |
| `cd ~` | Go to home directory |
| `whoami` | Show current user |
| `uname` | Show system/kernel information |
| `mkdir <name>` | Create directory |
| `ssh user@host` | Connect to remote server |
| `git clone <url>` | Clone repository |

Example:

```bash
pwd
ls
mkdir devops
cd devops
cd ..
whoami
uname
```

> Linux commands, file names, and paths are **case-sensitive**.

# 🎯 Interview Quick Revision

**What is Linux?**  
An open-source kernel widely used in servers, cloud, containers, and other systems.

**What is an OS?**  
System software that manages hardware resources and provides services to applications.

**Kernel vs Shell?**  
Kernel manages system resources; Shell provides the user interface.

**What is Bash?**  
A commonly used command-line shell in Linux and Unix.

**What is Ubuntu?**  
A Linux distribution based on Debian.

**`/` vs `~`?**  
`/` is the filesystem root; `~` is the current user's home directory.

**What is SSH?**  
A secure protocol for remote command-line access.

**What does `pwd` do?**  
Shows the current working directory.

**What does `ls` do?**  
Lists files and directories.

**What does `whoami` do?**  
Shows the current logged-in user.

**What does `git clone` do?**  
Downloads a remote Git repository locally.

## 🧪 Scenario Revision

| Scenario | Solution |
|---|---|
| Connect to Linux server | **SSH** |
| Find current user | `whoami` |
| Find current location | `pwd` |
| List files | `ls` |
| Enter directory | `cd <dir>` |
| Go back | `cd ..` |
| Create directory | `mkdir <name>` |
| Create GCP VM | Compute Engine → VM Instances |
| Connect to GCP VM | **SSH** |
| Protect GCP credits | **Budget & Alerts** |
| VM no longer needed | Delete the VM |
| Practice Linux | **Bandit / OverTheWire** |
| Download repository | `git clone <url>` |

## ✅ Day 1 Takeaway

```text
Linux Fundamentals
       ↓
Kernel + Shell
       ↓
Linux Commands
       ↓
Git + SSH
       ↓
GCP Ubuntu VM
       ↓
Cloud & DevOps Foundation
```

> **Interview tip:** Don't just memorize commands. Understand **what the command does, why you use it, and where you would use it on a cloud Linux VM.**
