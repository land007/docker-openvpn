#!/bin/bash
docker rm -f openvpn; docker run --restart always -v ovpn-data:/etc/openvpn -d -p 21194:1194/udp --cap-add=NET_ADMIN --restart always --name openvpn land007/openvpn
docker run -v ovpn-data:/etc/openvpn --rm -it land007/openvpn easyrsa build-client-full CLIENTNAME nopass
docker run -v ovpn-data:/etc/openvpn --rm land007/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn