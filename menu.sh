#!/bin/bash

clear

figlet Pengkik Project | lolcat

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	echo "--------------- Welcome To Premium Script Menu ---------------"
	echo "------------------------ Moddified By Pengkik -----------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "\e[032;1mIsp Name:\e[0m $ISP"
	echo -e "\e[032;1mCity:\e[0m $CITY"
	echo -e "\e[032;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	date | lolcat
	echo -e "-----------------------------------------------------"

echo -e ""

echo -e "Tunneling Menu" | lolcat

echo -e " 1.  Control Panel SSH & OVPN"

echo -e " 2.  Control Panel Vmess/V2ray"

echo -e " 3.  Control Panel Vless"

echo -e " 4.  Control Panel Trojan"

echo -e ""

echo -e "Miscellaneous" | lolcat

echo -e " 5.   Add Subdomain Host For VPS"

echo -e " 6.  Renew Certificate V2RAY"

echo -e " 7.  Change Port All Account"

echo -e " 8.  Autobackup Data VPS"

echo -e " 9.  Backup Data VPS"

echo -e " 10.  Restore Data VPS"

echo -e " 11.  Webmin Menu"

echo -e " 12.  Limit Bandwith Speed Server"

echo -e " 13.  Check Usage of VPS Ram"

echo -e " 14.  Reboot VPS"

echo -e " 15.  Speedtest VPS"

echo -e " 16.  Information Display System"

echo -e " 17.  Info Script Auto Install"

echo -e " 18.  Restart All Service"

echo -e " 23.  Set Auto Reboot"

echo -e " 19.  Set Multi Login Akun"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e " x.   Exit From Putty / JuiceSSH / Termux"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e ""

read -p "     Please Input Number  [1-22 or x] :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

wss

;;

3)

vls

;;

4)

trj

;;

5)

addhost

;;

6)

certxray

;;

7)

changeport

;;

8)

autobackup

;;

9)

backup

;;

10)

restore

;;

11)

wbmn

;;

12)

limitspeed

;;

13)

ram

;;

14)

reboot

;;

15)

speedtest

;;

16)

info

;;

17)

about

;;

18)

restart

;;

19)

autoreboot

;;

20)

autokill

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac
