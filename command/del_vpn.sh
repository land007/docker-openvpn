#!/bin/bash

docker run -v ~/docker/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa revoke $1
docker run -v ~/docker/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa gen-crl update-db
docker restart openvpn
echo "del $1"
