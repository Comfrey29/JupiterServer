# CONTRIBUTING.md

## 🎉 Thanks for your interest in Jupiter Server!

Jupiter Server is an open-source project under **GPLv3**. All contributions are welcome! 🌟

***

## 🚀 Quick Start for Contributors

### 1. **⭐ Star the repo**
```
https://github.com/Comfrey29/JupiterServer
```

### 2. **Fork & clone**
```bash
git clone https://github.com/YOUR-USERNAME/JupiterServer.git
cd JupiterServer
```

### 3. **Test the script locally**
```bash
# Fresh Debian VM/Container (Docker/Proxmox/VirtualBox)
curl -fsSL ./jupiter-server-setup.sh | bash
```

***

## 🐛 Bug Reports

**Great first contribution!** 

1. **Test on fresh Debian 12+** (Bookworm or later)
2. **Run**: `curl -fsSL https://github.com/Comfrey29/JupiterServer/releases/latest/download/jupiter-server-setup.sh | bash`
3. **Open issue** with:
   - `cat /etc/debian_version` (version)
   - `uname -a` (kernel/architecture)
   - **Exact error + logs**
   - Steps to reproduce

**Example:**
```
Tested on: Debian 12.5 amd64 VPS (DigitalOcean)
Command: curl | bash
Error: "docker: command not found after reboot"
Log: 
[2026-01-23 15:30:00] E: Failed to fetch docker-ce repo
```

***

## ✨ Feature Requests

**Priority order:**
```
🔥 P1: Fix security/bugs
🚀 P2: New packages (Traefik, PostgreSQL, Redis)
🎨 P3: UX improvements (fancy MOTD, colors)
🔮 P4: ARM64, auto-updates
```

**Open issue** with:
```
Feature: PostgreSQL 16 support
Why: Perfect for Rails/Django apps
Priority: P2
Tested: No
Estimated effort: 30min
```

***

## 🔧 Development Workflow

### Test changes locally
```bash
# Edit the script
chmod +x jupiter-server-setup.sh

# Dry-run (preview only)
./jupiter-server-setup.sh --dry-run

# Full test (use fresh VM/container)
./jupiter-server-setup.sh
```

### Commit message format
```
feat: add PostgreSQL 16 support
fix: resolve Docker CE repo conflicts
refactor: split nginx config into modules
docs: update README badges
chore: bump Node.js to v22
```

### PR Checklist ✅
- [ ] Works on **fresh Debian 12+**
- [ ] Tested on **2GB RAM VPS** 
- [ ] No breaking changes
- [ ] Updated **CHANGELOG.md**
- [ ] Added `--dry-run` support if needed
- [ ] Script is idempotent (safe to re-run)

***

## 📋 `good first issue` Ideas

| Issue | Effort | Labels |
|-------|--------|--------|
| Fix SSH keygen error on ARM | 30min | `good first issue` `bug` |
| Add Redis 7 | 15min | `good first issue` `enhancement` |
| Improve MOTD colors | 10min | `good first issue` `ui` |
| Add PostgreSQL option | 1h | `help wanted` `feature` |
| Docker Compose v2 | 20min | `good first issue` `enhancement` |

***

## 🤝 Code Style Guidelines

```bash
# Script must follow:
- 4 spaces indentation (no tabs)
- 100 char line limit
- "set -euo pipefail" at top
- English comments only
- Colors with `tput` (avoid direct ANSI)
- Functions for repeated tasks
```

**Good code example:**
```bash
#!/bin/bash
set -euo pipefail

info() { echo "[INFO] $*" >&2; }
error() { echo "[ERROR] $*" >&2; exit 1; }
success() { echo "[OK] $*" >&2; }

info "Installing Docker CE..."
apt-get update
apt-get install -y docker-ce || error "Docker installation failed"
success "Docker installed successfully"
```

***

## 🚫 What we DON'T accept

❌ **Breaking changes** without `--dry-run` option  
❌ **Ubuntu/CentOS/RHEL support** (Debian 12+ only)  
❌ **GUI/X11 packages** (headless server only)  
❌ **Unreviewed security changes**  
❌ **Non-idempotent scripts** (can't safely re-run)

***

## 🌍 Translation Help

Want README in your language? Open PR:
```
docs(i18n): add Spanish README.es.md
docs(i18n): add Catalan README.ca.md
docs(i18n): add German README.de.md
```

***

## 💬 Need help?

- **Questions**: [Discussions](https://github.com/Comfrey29/JupiterServer/discussions)
- **Quick bugs**: [Issues](https://github.com/Comfrey29/JupiterServer/issues/new)

**Your first PR gets a shoutout on Twitter!** 🚀

***

## 🎁 Contributor Rewards

| Contribution | Reward |
|--------------|--------|
| First PR merged | Twitter shoutout + Discord role |
| 3+ PRs | Listed in README |
| 10+ PRs | Core team invite |

***

**Happy hacking!**  
**Jupiter Server Team @ ArCom Corporation** 🎉

***
