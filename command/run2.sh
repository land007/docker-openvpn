docker stop openvpn
docker rm openvpn
OVPN_DATA="ovpn-data"
docker run --restart always -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN --restart always --name openvpn kylemanna/openvpn
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn