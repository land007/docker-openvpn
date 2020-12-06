docker rm -f openvpn-tcp; docker run --restart always -v ovpn-data:/etc/openvpn -d -p 7071:1194/tcp --cap-add=NET_ADMIN --restart always --name openvpn-tcp land007/openvpn ovpn_run --proto tcp
