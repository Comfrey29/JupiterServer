#!/bin/bash

# ==============================
# Jupiter Server Post-Install Script
# ==============================
# Author: ArCom Corporation
# Purpose: Configure the system for Jupiter Server
# ==============================

echo "[INFO] Starting Jupiter Server post-installation..."

# 1️⃣ Update repositories
echo "[INFO] Updating package lists..."
sudo apt update -y

# 2️⃣ Install essential packages
echo "[INFO] Installing dependencies..."
sudo apt install -y \
    python3 python3-pip \
    nodejs npm \
    golang git docker.io \
    curl wget vim htop \
    openssh-server fail2ban

# 3️⃣ Secure SSH configuration
echo "[INFO] Configuring SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

sudo sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 4️⃣ MOTD and login banner configuration
echo "[INFO] Setting MOTD..."
sudo tee /etc/motd > /dev/null <<EOF
-------------------------------------------------------
                   Debian Jupiter Server
-------------------------------------------------------
                   ArCom Corporation
                   Based on Debian 13
                   All rights reserved
-------------------------------------------------------
If you need help go to arcom-corporation.onrender.com
EOF

# Pre-login SSH banner
echo "Welcome to Jupiter Server - Authorized Access Only!" | sudo tee /etc/issue.net
sudo sed -i 's/#Banner none/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 5️⃣ Fail2Ban configuration
echo "[INFO] Configuring Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# 6️⃣ Native commands and monitoring utilities
echo "[INFO] Utilities like curl, wget, ping, and htop are ready."

# 7️⃣ Remove GNOME and desktop environments
echo "[INFO] Removing GNOME and desktop environments..."
sudo apt purge -y gnome* ubuntu-desktop kde* x11* lightdm* gdm* sddm*
sudo apt autoremove -y
sudo apt clean

# Set default boot target to terminal (no GUI)
sudo systemctl set-default multi-user.target

echo "[INFO] Jupiter Server post-installation complete!"
