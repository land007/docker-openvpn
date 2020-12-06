#!/bin/bash
docker run -v ovpn-data:/etc/openvpn --rm -it land007/openvpn easyrsa build-client-full $1
docker run -v ovpn-data:/etc/openvpn --rm land007/openvpn ovpn_getclient $1 > $1.ovpn
echo "$1.ovpn"
sed -i -e 's/redirect-gateway/#redirect-gateway/g' $1.ovpn
echo '
route-nopull
route 192.168.181.0 255.255.255.0 vpn_gateway
' >> $1.ovpn
cat $1.ovpn
