#!/bin/bash

# Change Your MAC Address
# echo 'Your current MAC is:'
# ifconfig $1 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
# echo ''
# echo 'Shutting down your NIC and applying the settings'
# ifconfig $1 down hw ether $2 || echo "Well that wasn't supposed to happen"
# ifconfig $1 up
# Uncomment the line below this if you would like the NIC to automatically grab a DHCP address.
# dhclient $1
# echo ''
# echo 'Your new MAC is:'
# ifconfig $1 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
RED='\033[1;31m'
NC='\033[0m' # No Color
echo "DISPOSITIVO: "
read disp
echo 'DESLIGANDO PLACA DE REDE:' $disp
echo
ifconfig $disp down
echo "MUDANDO ENDERECO MAC"
echo
macchanger -r $disp
echo
echo 'LIGANDO PLACA DE RESDE:' $disp
echo
ifconfig $disp up
nmcli r wifi off
echo "REINICIANDO WIFI...."
nmcli r wifi on
sleep 16
echo -e "${RED}login: vpnbook${NC}"
echo -e "${RED}passwd: xETHec5x${NC}"
openvpn /root/VPNBook.com-OpenVPN-Euro1/vpnbook-euro1-tcp443.ovpn
