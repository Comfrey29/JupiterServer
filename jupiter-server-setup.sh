#!/bin/bash

# ==============================
# Jupiter Server Post-Install Script v2.0
# ==============================
# Author: ArCom Corporation
# Enterprise-grade server hardening + DevOps ready
# ==============================

set -e  # Exit on error

echo "[INFO] Starting Jupiter Server post-installation v2.0..."

# 1️⃣ Update system
echo "[INFO] Updating repositories..."
sudo apt update -y && sudo apt upgrade -y

# 2️⃣ Essential packages + enterprise tools
echo "[INFO] Installing production dependencies..."
sudo apt install -y \
    python3 python3-pip \
    nodejs npm \
    golang git docker.io \
    curl wget vim htop \
    openssh-server fail2ban ufw \
    walinuxagent cloud-init hyperv-daemons

sudo systemctl enable walinuxagent cloud-init --now

# 3️⃣ Secure SSH (idempotent)
echo "[INFO] Hardening SSH configuration..."
sudo systemctl enable ssh --now

SSH_CONFIG="/etc/ssh/sshd_config"
sudo sed -i 's/^#*Port 22$/Port 22/' "$SSH_CONFIG"
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG"
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG"
sudo sed -i 's/^#*PermitEmptyPasswords.*/PermitEmptyPasswords no/' "$SSH_CONFIG"

# 4️⃣ Professional MOTD + banner
echo "[INFO] Setting enterprise MOTD..."
sudo tee /etc/motd > /dev/null <<EOF
-------------------------------------------------------
              🚀 Jupiter Server Enterprise Edition
-------------------------------------------------------
    ArCom Corporation | Production-Ready DevOps Server
    Docker • Node.js • Python • Go | Fully Hardened
    Based on Debian 13 | Enterprise Security Standards
-------------------------------------------------------
Support: arcom-corporation.onrender.com
EOF

echo "Jupiter Server Enterprise - Authorized Personnel Only" | sudo tee /etc/issue.net
sudo sed -i 's/^#*Banner.*/Banner \/etc\/issue.net/' "$SSH_CONFIG"
sudo systemctl restart ssh

# 5️⃣ Enterprise security stack
echo "[INFO] Deploying security stack (UFW + Fail2Ban)..."
sudo tee /etc/fail2ban/jail.local > /dev/null <<EOF
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 1h
findtime = 10m
EOF

# Production firewall
sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw --reload

sudo systemctl enable fail2ban --now
sudo systemctl restart fail2ban

# 6️⃣ Server optimization (headless)
echo "[INFO] Optimizing for server workloads..."
sudo apt purge -y gnome* ubuntu-desktop kde* x11* lightdm* gdm* sddm* || true
sudo apt autoremove -y && sudo apt clean
sudo systemctl set-default multi-user.target

# 7️⃣ Docker optimization
echo "[INFO] Optimizing Docker for production..."
sudo systemctl enable docker --now
sudo usermod -aG docker $USER || true

echo "[INFO] 🚀 Jupiter Server Enterprise installation complete!"
echo "     Reboot recommended: sudo reboot"
echo "     Ready for Docker/Node/Python/Go production workloads"

