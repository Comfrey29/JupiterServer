# Jupiter Server 🚀

[
[
[

**Minimal Debian for VPS/DevOps** - **One script transforms any Debian into production-ready server** in 5 minutes.

**v1.0** | [📦 Download Setup Script](https://github.com/Comfrey29/JupiterServer/releases/latest/download/jupiter-server-setup.sh)


*(Add GIF: wget script → bash → docker run nginx live!)*

***

## ✅ Why Jupiter Server?

| Common Problem | Jupiter Server |
|----------------|----------------|
| Fresh Debian = 2h manual setup | **5-min script** does everything |
| Missing dev tools on VPS | **Docker + Node + Python + Go** pre-installed |
| SSH vulnerable to bots | **Fail2Ban + SSH keys only** |
| Complex server hardening | **Production-ready security** |

**Perfect for**: Cheap VPS ($5-6/mo), quick deployments, self-hosting, CI/CD runners.

***

## ✨ What the script does automatically

```bash
# After: curl | bash
docker run hello-world ✅
node -v  # v20.x ✅
python3 -m pip --version ✅
go version ✅
nginx -v ✅
htop ✅
ss -tuln | grep :22  # SSH keys only ✅
fail2ban-client status  # Active ✅
```

- **Zero bloat**: Only production essentials (~800MB total)
- **Production security**: Fail2Ban, SSH keys only, UFW enabled, no root login
- **Nginx** ready for static sites/API proxy
- **Custom MOTD**: `Jupiter Server by ArCom Corporation`

***

## 💾 Minimum Requirements
```
Any Debian 12+ | RAM: 2GB | Disk: 10GB | Network: Yes
```

***

## 🚀 3-Minute Setup (works on ANY Debian VPS)

### 1. Fresh Debian VPS (DigitalOcean/Hetzner ~$6/mo)
```bash
ssh root@your-ip
apt update && apt install curl -y
```

### 2. **One command transforms everything** 🔥
```bash
curl -fsSL https://github.com/Comfrey29/JupiterServer/releases/latest/download/jupiter-server-setup.sh | bash
```

### 3. **Reboot and you're done!**
```bash
reboot
ssh user@your-ip  # New secure user ready
docker run -d -p 80:80 nginx  # 🎉 Live website!
```

**That's it!** Script handles users, security, packages, services automatically.

***

## 🛠️ Roadmap

| Version | Features |
|---------|----------|
| **v1.0** | Core script + Docker/Node/Python/Go |
| **v1.1** | Cockpit dashboard + monitoring |
| **v1.2** | ARM64 support (RPi5/Oracle Cloud) |
| **v2.0** | Auto-updates + backups |

***

## 🤝 How to Contribute

1. ☕ **⭐ Star** this repo
2. 🐛 Open [Issues](https://github.com/Comfrey29/JupiterServer/issues/new)
3. 🚀 Submit PRs (see [CONTRIBUTING.md](CONTRIBUTING.md))

**`good first issue`** labels always welcome!

***

## 📄 License
[GPLv3](LICENSE) - 100% Free Software!

***

**Jupiter Server by [ArCom Corporation](https://arcom-corporation-web.onrender.com)**  


***

## **🚀 Next Steps = First Stars Today:**
1. **Upload `jupiter-server-setup.sh` as v1.0 release**
2. **Record 30s GIF**: `curl | bash → reboot → docker nginx`
3. **Post to r/debian**: "5-min script: Fresh Debian → Production Docker server"
4. **HN Show**: "Show HN: JupiterServer - One bash script for production Debian"
