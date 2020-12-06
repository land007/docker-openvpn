#!/bin/bash
docker run -v ~/docker/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $1
docker run -v ~/docker/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn
echo "$1.ovpn"
sed -i -e 's/redirect-gateway/#redirect-gateway/g' $1.ovpn
echo '
route-nopull
route 192.168.181.0 255.255.255.0 vpn_gateway
' >> $1.ovpn
cat $1.ovpn
