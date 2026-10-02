# Linux Day 5 — Short Notes

## 📌 Topics Covered

- Linux file permissions — `chmod`
- File ownership — `chown`
- Package management — `apt` and `yum`
- Jenkins installation and dependencies
- Linux boot process
- Hardware/system inspection commands
- HTTP status codes
- Website performance troubleshooting
- SSH troubleshooting
- Interview-focused scenarios

---

## 1. File Permissions

### Check Permissions

```bash
ls -l
```

Shows:
- File type
- Permissions
- Owner
- Group
- Size
- Timestamp

### Permission Groups

Linux permissions apply to:

```text
Owner | Group | Others
```

File type indicators:

```text
-  Regular file
d  Directory
l  Symbolic link
```

### Permission Values

| Permission | Symbol | Value |
|---|---|---:|
| Read | `r` | 4 |
| Write | `w` | 2 |
| Execute | `x` | 1 |

### `chmod`

`chmod` = Change Mode. Used to change file/directory permissions.

#### Symbolic

```bash
chmod +x script.sh
```

Adds execute permission.

#### Numeric

```bash
chmod 444 file.txt
```

Read-only for owner, group, and others.

```bash
chmod 222 file.txt
```

Write-only for owner, group, and others.

```bash
chmod 224 file.txt
```

Owner = write, Group = write, Others = read.

### Sticky Bit

Used on shared directories so users cannot delete files belonging to other users.

```bash
chmod +t /shared
chmod -t /shared
```

**Interview point:** Sticky bit controls deletion in a shared writable directory.

---

## 2. File Ownership

### `chown`

`chown` = Change Owner.

```bash
chown vinod file2
chown vinod:root file2
```

Verify:

```bash
ls -l
```

### `chmod` vs `chown`

| Command | Purpose |
|---|---|
| `chmod` | Change permissions |
| `chown` | Change ownership |

`chown` changes metadata/ownership; it does **not** rename the file.

---

## 3. SSH Key Basics

SSH uses a public/private key pair.

- **Public key:** can be shared and placed on the remote server.
- **Private key:** must remain secret on the local machine.
- Both keys work together for authentication.

Common SSH troubleshooting areas:

- SSH service
- Port `22`
- Firewall/security rules
- Correct private key
- Network connectivity

---

## 4. Linux Package Management

Package managers install, remove, update, and search software.

| OS Family | Package Manager |
|---|---|
| Ubuntu/Debian | `apt` |
| Red Hat/RPM family | `yum` / `dnf` |
| macOS | `brew` |
| Windows | Chocolatey |

### Common `apt` Commands

```bash
sudo apt-get update
sudo apt install <package>
sudo apt remove <package>
```

### Why `apt-get update`?

It refreshes the local package index from configured repositories.

### Repository Configuration

```text
/etc/apt/sources.list
```

This contains repository information used by `apt`.

---

## 5. Jenkins Installation Concept

If:

```bash
sudo apt install jenkins
```

cannot find Jenkins, the Jenkins repository may not be configured in the default Ubuntu sources.

Typical flow:

```text
Install Java
    ↓
Add Jenkins GPG key + repository
    ↓
apt-get update
    ↓
Install Jenkins
```

Example Java dependency:

```bash
sudo apt install openjdk-21-jre
```

**Key concept:** Jenkins requires Java, so Java is a dependency.

---

## 6. Linux Boot Process ⭐

Interview-critical sequence:

```text
Power On
   ↓
BIOS
   ↓
MBR / GPT
   ↓
Bootloader / GRUB
   ↓
Kernel
   ↓
Init
   ↓
Login / User Interface
```

### Components

- **BIOS:** detects/initializes hardware.
- **MBR/GPT:** disk partition/boot information.
- **GRUB:** bootloader that loads the kernel.
- **Kernel:** core of the operating system.
- **Init:** starts initialization and services.
- **Login/UI:** user-facing services become available.

### Run Levels

```text
init 0 → Shutdown
init 1 → Single-user / maintenance mode
init 6 → Reboot
```

---

## 7. System & Hardware Commands

### Kernel/Boot Messages

```bash
dmesg
```

Displays kernel ring-buffer messages, including boot/hardware initialization information.

Count lines:

```bash
dmesg | wc -l
```

### Storage

```bash
lsblk
```

Lists block devices and partitions.

### CPU

```bash
cat /proc/cpuinfo
```

Shows CPU information.

### Memory

```bash
free -h
```

Shows human-readable memory usage.

### Disk

```bash
df -h
```

Shows filesystem disk usage.

### Hardware

```bash
lshw
```

Lists hardware information.

---

## 8. HTTP Status Codes ⭐

| Code | Category | Meaning |
|---|---|---|
| `1xx` | Informational | Information |
| `2xx` | Success | Request successful |
| `3xx` | Redirection | Resource redirected |
| `4xx` | Client error | Request/access problem |
| `5xx` | Server error | Server/backend problem |

Important examples:

```text
200 → OK
204 → No Content
206 → Partial Content
301 → Permanent Redirect
302 → Temporary Redirect
400 → Bad Request
403 → Forbidden / Not Authorized
404 → Not Found
500 → Internal Server Error
```

**Interview tip:** `3xx` is not necessarily an error; redirection can be intentional.

---

## 9. Website Slowness Troubleshooting

Use Chrome DevTools:

```text
Ctrl + Shift + I
        ↓
Network tab
        ↓
Refresh page
        ↓
Inspect request timings + failures
```

Check:

- Slow API/request
- Failed requests
- HTTP status codes
- Backend response time
- Network-related issues

**DevOps role:** identify, analyze, and report the problem.

**Developer role:** fix application/frontend/backend issues when applicable.

---

## 10. SSH Troubleshooting

If SSH connection fails, check:

```text
1. Is the SSH service running?
2. Is port 22 allowed?
3. Are firewall/security rules correct?
4. Is the correct key being used?
5. Does the VM have network connectivity?
```

---

# 🎯 Interview Quick Revision

### Permissions

```bash
ls -l
chmod +x script.sh
chmod 444 file.txt
chmod 222 file.txt
chmod 224 file.txt
chmod +t /shared
```

### Ownership

```bash
chown vinod file2
chown vinod:root file2
```

### Packages

```bash
sudo apt-get update
sudo apt install <package>
sudo apt remove <package>
```

### System

```bash
dmesg
dmesg | wc -l
lsblk
cat /proc/cpuinfo
free -h
df -h
lshw
```

---

# ⭐ Most Important Interview Questions

### 1. `chmod` vs `chown`?

`chmod` changes permissions; `chown` changes ownership.

### 2. What are `r`, `w`, and `x`?

Read = 4, Write = 2, Execute = 1.

### 3. What does `chmod 444 file.txt` do?

Read-only permission for owner, group, and others.

### 4. What is a sticky bit?

It restricts deletion in a shared writable directory so users generally delete their own files.

### 5. Why use `apt-get update`?

To refresh the package index from configured repositories.

### 6. Why did Jenkins installation fail initially?

Jenkins was not available in the configured default package sources; its repository needed to be added.

### 7. Why install Java before Jenkins?

Jenkins requires Java to run.

### 8. Linux boot sequence?

```text
Power On → BIOS → MBR/GPT → GRUB → Kernel → Init → Login/UI
```

### 9. `dmesg` purpose?

To inspect kernel and boot-related messages.

### 10. `df -h` vs `free -h`?

- `df -h` → disk/filesystem usage
- `free -h` → memory usage

### 11. What does HTTP 404 mean?

Requested resource was not found.

### 12. What does HTTP 403 mean?

Access is forbidden/not authorized.

### 13. What does HTTP 500 mean?

A server-side/backend problem.

### 14. How do you troubleshoot website slowness?

Use browser DevTools → Network → refresh → inspect slow and failed requests.

### 15. SSH connection failed — what do you check?

SSH service, port 22, firewall/security rules, correct key, and network connectivity.

---

## 🧠 One-Minute Revision

```text
ls -l       → Check permissions/ownership
chmod       → Change permissions
chown       → Change ownership
chmod +t    → Sticky bit
apt         → Debian/Ubuntu packages
yum/dnf     → Red Hat/RPM packages
sources.list → Package repositories
dmesg       → Kernel/boot messages
lsblk       → Disks/partitions
free -h     → Memory
df -h       → Disk
lshw        → Hardware
BIOS → GRUB → Kernel → Init → Login
2xx         → Success
3xx         → Redirect
4xx         → Client/access issue
5xx         → Server issue
SSH         → Check service, port 22, key, firewall, network
```

## 📚 Source

Based on the Linux Day-5 training session covering permissions, ownership, package management, Jenkins, boot process, hardware inspection, HTTP status codes, and troubleshooting.

