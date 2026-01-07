#!/bin/bash

# ==============================
# Jupiter Server Post-Install Script
# ==============================
# Autor: Comfrey
# Funció: Configura el sistema per Jupiter Server
# ==============================

echo "[INFO] Starting Jupiter Server post-installation..."

# 1️⃣ Actualitzar repositoris
echo "[INFO] Updating package lists..."
sudo apt update -y

# 2️⃣ Instal·lar paquets essencials
echo "[INFO] Installing dependencies..."
sudo apt install -y \
    python3 python3-pip \
    nodejs npm \
    golang git docker.io \
    curl wget vim htop \
    openssh-server fail2ban

# 3️⃣ Configuració de SSH segura
echo "[INFO] Configuring SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

sudo sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 4️⃣ Configuració MOTD i banner
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

# Banner abans de login
echo "Welcome to Jupiter Server - Authorized Access Only!" | sudo tee /etc/issue.net
sudo sed -i 's/#Banner none/Banner \/etc\/issue.net/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 5️⃣ Configuració Fail2Ban
echo "[INFO] Configuring Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# 6️⃣ Comandes natives i utilitats de control
echo "[INFO] Utilities like curl, wget, ping, htop are ready."

# 7️⃣ Eliminació de GNOME i entorns gràfics
echo "[INFO] Removing GNOME and desktop environments..."
sudo apt purge -y gnome* ubuntu-desktop kde* x11* lightdm* gdm* sddm*
sudo apt autoremove -y
sudo apt clean

# Canviar arrenc per defecte a mode terminal
sudo systemctl set-default multi-user.target

echo "[INFO] Jupiter Server post-installation complete!"

