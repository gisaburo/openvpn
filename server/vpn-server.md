# interface
```
nmcli connection modify enp1s0 ipv4.addresses 192.168.100.1/24
nmcli connection modify enp1s0 ipv4.gateway 192.168.100.254
nmcli connection modify enp1s0 ipv4.dns 172.16.100.1
```
# install
```
dnf install openvpn easy-rsa
```
# create server crt
```
mkdir /etc/openvpn/easy-rsa; cp -rai /usr/share/easy-rsa/3/* /etc/openvpn/easy-rsa/
cd /etc/openvpn/easy-rsa
./easyrsa clean-all
./easyrsa build-ca
./easyrsa build-server-full $( hostname | cut -d. -f1 )
./easyrsa gen-dh
mkdir /etc/openvpn/keys
cp -ai pki/issued/$( hostname | cut -d. -f1 ).crt pki/private/$( hostname | cut -d. -f1 ).key pki/ca.crt pki/dh*.pem /etc/openvpn/keys/
restorecon -Rv /etc/openvpn
```
# edit server conf 
```
cp -ai /usr/share/doc/openvpn/sample/sample-config-files/roadwarrior-server.conf /etc/openvpn/serverudp.conf
vi serverudp.conf
```
# create client crt
```
./easyrsa build-client-full vpn-client
```
# copy client crt from vpn-server to vpn-client
```
cp -ai /etc/openvpn/keys/{ca.crt} pki/issuedi/vpn-client.crt pki/private/vpn-client.key /home/user/
chmod 644 ca.crt vpn-client.key vpn-client.crt
```
# ipv forward
```
vi /etc/sysctl.d/10-ipv4_forward.conf
net.ipv4.ip_forward = 1
```
`sysctl --system`
# firewalld
```
firewall-cmd --add-service=openvpn --permanent
firewall-cmd --direct --passthrough ipv4 -t nat -A POSTROUTING -s 10.8.0.0/24 -o enp1s0 -j MASQUERADE --permanent
firewall-cmd --zone=trusted --add-interface=tun+ --permanent
firewall-cmd --zone=trusted --add-interface=tun+
```
# start service
```
systemctl enable openvpn-server@serverudp.service
systemctl start openvpn-server@serverudp.service
```
# password set
```
sudo systemd-tty-ask-password-agent --query
```