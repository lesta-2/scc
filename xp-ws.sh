#!/bin/bash
data=( `cat /etc/xray/vmess.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/xray/vmess.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess.json
rm -f /etc/xray/$user-tls.json /etc/xray/$user-vmess.json
fi
done
systemctl restart xray
systemctl restart xray@vmess
