#!/bin/bash

read -p "Input New Domain : " domainbaru

#Validate
if [[ $domainbaru == "" ]]; then
echo "Please Input New Domain"
exit 1
fi

#Input To Domain
cat > /etc/xray/domain << END
$domainbaru
END

clear 
echo "SUCCESS"
