OVPN_DATA="ovpn-data"
docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm land007/openvpn ovpn_genconfig -u udp://wrt.qhkly.com -n "8.8.8.8 8.8.4.4"
docker run -v $OVPN_DATA:/etc/openvpn --rm land007/openvpn ovpn_genconfig -u udp://wrt.qhkly.com -n "192.168.10.4 192.168.10.3 192.168.10.2 8.8.8.8 8.8.4.4"
docker run -v $OVPN_DATA:/etc/openvpn --rm -it land007/openvpn ovpn_initpki
