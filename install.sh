#!/bin/bash
echo -e "\033[35m"


echo -ne "\033[35m██████╗░░█████╗░  "
echo -e "\033[34m░█████╗░██████╗░██╗░░░██╗██████╗░████████╗░█████╗░"

echo -ne "\033[35m██╔══██╗██╔══██╗  "
echo -e "\033[34m██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗╚══██╔══╝██╔══██╗"

echo -ne "\033[35m██████╔╝██║░░██║  "
echo -e "\033[34m██║░░╚═╝██████╔╝░╚████╔╝░██████╔╝░░░██║░░░██║░░██║"

echo -ne "\033[35m██╔══██╗██║░░██║  "
echo -e "\033[34m██║░░██╗██╔══██╗░░╚██╔╝░░██╔═══╝░░░░██║░░░██║░░██║"

echo -ne "\033[35m██║░░██║╚█████╔╝  "
echo -e "\033[34m╚█████╔╝██║░░██║░░░██║░░░██║░░░░░░░░██║░░░╚█████╔╝"

echo -ne "\033[35m╚═╝░░╚═╝░╚════╝░  "
echo -e "\033[34m░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░░░░╚═╝░░░░╚════╝░"

echo -e "\033[35m"
echo -e "--------------------------------------------------------------------"
echo -e "https://t.me/ro_cryptoo"
echo -e "https://t.me/whitelistx1000"
echo -e "--------------------------------------------------------------------"
echo -e ""

echo -e "Installing..."
sudo apt-get -qq update > /dev/null
sudo apt-get -qq install ufw -y > /dev/null
sudo ufw allow 22:65535/tcp > /dev/null
sudo ufw allow 22:65535/udp > /dev/null
sudo ufw deny out from any to 10.0.0.0/8 > /dev/null
sudo ufw deny out from any to 192.168.0.0/16 > /dev/null
sudo ufw deny out from any to 100.64.0.0/10 > /dev/null
sudo ufw deny out from any to 198.18.0.0/15 > /dev/null
sudo ufw deny out from any to 169.254.0.0/16 > /dev/null
sudo ufw --force enable > /dev/null

echo -e "\033[35m"
apt-get -qq install mc wget jq libfontconfig1 libxtst6 libxrender1 libxi6 java-common -y > /dev/null
wget -q  https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jdk11.0.11-linux_amd64.deb
dpkg -i zulu11.48.21-ca-jdk11.0.11-linux_amd64.deb > /dev/null
wget -q https://github.com/minima-global/Minima/raw/master/jar/minima.jar
sudo apt-get -qq  install --fix-broken -y  > /dev/null
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald

sudo tee <<EOF >/dev/null /etc/systemd/system/minima.service
[Unit]
Description=minima
[Service]
User=$USER
ExecStart=/usr/bin/java -Xmx1G -jar $HOME/minima.jar -daemon
Restart=always
RestartSec=100
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable minima
sudo systemctl start minima
. <(wget -qO- https://raw.githubusercontent.com/Kallen-c/utils/main/miscellaneous/insert_variable.sh) -n minima_log -v "sudo journalctl -f -n 100 -u minima" -a


echo -e "Installing completed, check logs"
echo -e "\033[0m"

echo -e '\e[0m\n'
