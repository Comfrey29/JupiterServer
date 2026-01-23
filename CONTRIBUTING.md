# CONTRIBUTING.md

## 🎉 Thanks for your interest in Jupiter Server!

Jupiter Server és un projecte obert sota **GPLv3**. Totes les contribucions són benvingudes! 🌟

***

## 🚀 Quick Start for Contributors

### 1. **Star the repo** ☕
```
https://github.com/Comfrey29/JupiterServer
```

### 2. **Fork & clone**
```bash
git clone https://github.com/Comfrey29/JupiterServer.git
cd JupiterServer
```

### 3. **Test the script locally**
```bash
# Fresh Debian VM/Container
curl -fsSL ./jupiter-server-setup.sh | bash
```

***

## 🐛 Bug Reports

**Great first contribution!**

1. **Test on fresh Debian 12+**
2. **Run**: `curl -fsSL https://github.com/Comfrey29/JupiterServer/releases/latest/download/jupiter-server-setup.sh | bash`
3. **Open issue** amb:
   - `cat /etc/debian_version` (versió)
   - `uname -a` (kernel/arch)
   - Error exacte + logs
   - Com replicar

**Example:**
```
Tested on: Debian 12.5 amd64 VPS
Command: curl | bash
Error: "docker: command not found"
Log: [paste aquí]
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

**Open issue** amb:
```
Feature: [PostgreSQL 16]
Why: [Perfect for Rails apps]
Priority: [P2]
Tested: [Yes/No]
```

***

## 🔧 Development Workflow

### Test changes
```bash
# Edit jupiter-server-setup.sh
chmod +x jupiter-server-setup.sh
./jupiter-server-setup.sh --dry-run  # Preview only

# Full test (use fresh VM/container)
./jupiter-server-setup.sh
```

### Commit message format
```
feat: add PostgreSQL 16 support
fix: resolve Docker CE repo conflicts  
refactor: split nginx config into modules
docs: update README badges
```

### PR Checklist ✅
- [ ] Works on **fresh Debian 12+**
- [ ] Tested on **2GB RAM VPS** 
- [ ] No breaking changes
- [ ] Updated **CHANGELOG.md**
- [ ] Added **tests** (if applicable)

***

## 📋 `good first issue` Ideas

| Issue | Effort | Labels |
|-------|--------|--------|
| Fix SSH keygen error on ARM | 30min | `good first issue` `bug` |
| Add Redis 7 | 15min | `good first issue` `enhancement` |
| Improve MOTD colors | 10min | `good first issue` `ui` |
| Add PostgreSQL option | 1h | `help wanted` `feature` |

***

## 🤝 Code Style

```bash
# Script follows:
- 4 spaces indent
- 100 char line limit  
- "set -euo pipefail" sempre
- Comments en anglès
- Colors amb tput (no ANSI direct)
```

**Exemple good code:**
```bash
#!/bin/bash
set -euo pipefail

info() { echo "[INFO] $*" >&2; }
error() { echo "[ERROR] $*" >&2; exit 1; }

info "Installing Docker CE..."
apt-get install -y docker-ce || error "Docker failed"
```

***

## 🚫 What we DON'T accept

❌ **Breaking changes** sense `--dry-run` option  
❌ **Ubuntu/CentOS support** (Debian only)  
❌ **GUI/X11 packages** (server only)  
❌ **Unreviewed security changes**

***

## 🌍 Translation Help

**README in your language?** Open PR:
```
docs(i18n): add Catalan README.ca.md
docs(i18n): add Spanish README.es.md
```

***

## 💬 Need help?

- **Questions**: [Discussions](https://github.com/Comfrey29/JupiterServer/discussions)
- **Bugs**: [Issues](https://github.com/Comfrey29/JupiterServer/issues/new)

**Your first PR gets a shoutout on Twitter!** 🚀

***

**Happy hacking!**  
**Jupiter Server Team @ ArCom Corporation** 🎉

***

