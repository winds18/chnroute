#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/soffchen/GeoIP2-CN/release/CN-ip-cidr.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=China_Ip address=$net comment=AS4809"
done

} > ../China_Ip.rsc

cd ..
rm -rf ./pbr
