#!/bin/bash
docker run -v ovpn-data:/etc/openvpn --rm -it land007/openvpn easyrsa revoke $1
docker run -v ovpn-data:/etc/openvpn --rm -it land007/openvpn easyrsa gen-crl update-db
docker restart openvpn
echo "del $1"
