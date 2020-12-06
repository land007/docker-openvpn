#!/bin/bash
docker volume create --name ovpn-data
docker run -v ovpn-data:/etc/openvpn --rm land007/openvpn ovpn_genconfig -u udp://192.168.8.188 -n "8.8.8.8 8.8.4.4"
docker run -v ovpn-data:/etc/openvpn --rm -it land007/openvpn ovpn_initpki
