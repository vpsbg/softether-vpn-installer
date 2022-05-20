#!/bin/bash

AdminUserPass=$(</dev/urandom tr -dc '[:alnum:]' | head -c15; echo "")
HubPass=$(</dev/urandom tr -dc '[:alnum:]' | head -c15; echo "")
VPNUserPass=$(</dev/urandom tr -dc '[:alnum:]' | head -c15; echo "")
IPSecKey=$(shuf -i10000-99999999 -n1)
IPAddress=$(dig @resolver4.opendns.com myip.opendns.com +short)
export DEBIAN_FRONTEND=noninteractive

echo "
================================================================
VPSBG SoftEther Installer Script
================================================================
"

apt-get -yq --allow-releaseinfo-change update
apt install -y gcc expect e2fsprogs curl build-essential

cd /usr/local/
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
tar xvf softether-vpnserver-*
cd vpnserver && make

tee /lib/systemd/system/vpnserver.service <<EOF
[Unit]
Description=SoftEther VPN Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/vpnserver/vpnserver start
ExecStop=/usr/local/vpnserver/vpnserver stop

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start vpnserver
systemctl enable vpnserver

tee /root/expect.sh <<EOF
#!/usr/bin/expect -f

set timeout -1

spawn /usr/local/vpnserver/vpncmd

expect "Select 1, 2 or 3:"

send -- "1\n"
sleep 2
expect "Hostname of IP Address of Destination:"

send -- "\n"
sleep 2
expect "Specify Virtual Hub Name"

send -- "\n"
sleep 2
expect "VPN Server>"

send -- "ServerPasswordSet\n"
sleep 2
expect "Password:"

send -- "$AdminUserPass\n"
sleep 2
expect "Confirm input:"

send -- "$AdminUserPass\n"
sleep 2
expect "VPN Server>"

send -- "HubCreate dedicatedvpn\n"
sleep 2
expect "Password:"

send -- "$HubPass\n"
sleep 2
expect "Confirm input:"

send -- "$HubPass\n"
sleep 2
expect "VPN Server>"

send -- "Hub dedicatedvpn\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "SecureNatEnable\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "IPsecEnable\n"
sleep 2
expect "Enable L2TP over IPsec Server Function (yes / no):"

send -- "yes\n"
sleep 2
expect "Enable Raw L2TP Server Function (yes / no):"

send -- "no\n"
sleep 2
expect "Enable EtherIP / L2TPv3 over IPsec Server Function (yes / no):"

send -- "no\n"
sleep 2
expect "Pre Shared Key for IPsec (Recommended: 9 letters at maximum):"

send -- "$IPSecKey\n"
sleep 2
expect "Default Virtual HUB in a case of omitting the HUB on the Username:"

send -- "dedicatedvpn\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "UserCreate dedicatedvpn\n"
sleep 2
expect "Assigned Group Name:"

send -- "\n"
sleep 2
expect "User Full Name:"

send -- "\n"
sleep 2
expect "User Description:"

send -- "\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "UserPasswordSet dedicatedvpn\n"
sleep 2
expect "Password:"

send -- "$VPNUserPass\n"
sleep 2
expect "Confirm input:"

send -- "$VPNUserPass\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "LogDisable\n"
sleep 2
expect "Select Security or Packet:"

send -- "Security\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "LogDisable\n"
sleep 2
expect "Select Security or Packet:"

send -- "Packet\n"
sleep 2
expect "VPN Server/dedicatedvpn>"

send -- "exit\n"

expect eof
EOF
chmod +x /root/expect.sh && /root/expect.sh

truncate -s 0 /usr/local/vpnserver/security_log/**/*.log
rm -rf /usr/local/vpnserver/server_log/*
chattr +i /usr/local/vpnserver/server_log/

printf "\n\n\n\n\n\n\n\n\n\nIP Address: $IPAddress\n------------------------------------------\nHub Name: dedicatedvpn\n------------------------------------------\nHub Password: $HubPass\n------------------------------------------\nUsername: dedicatedvpn\n------------------------------------------\nPassword: $VPNUserPass\n------------------------------------------\nAdministrator password: $AdminUserPass\n------------------------------------------\nIPSec: $IPSecKey\n------------------------------------------\n"

apt-get clean