# interface
```
nmcli connection modify enp1s0 ipv4.addresses 192.168.200.1/24
nmcli connection modify enp1s0 ipv4.gateway 192.168.200.254
nmcli connection modify enp1s0 ipv4.dns 172.16.100.1
```
# copy from vpn-server to vpn-client
```
scp user@ip:/home/user/ca.crt /home/user/
scp user@ip:/home/user/vpn-client.key /home/user/
scp user@ip:/home/user/vpn-client.crt /home/user/
```
# install
```
dnf install openvpn
```
# edit client conf 
```
cp -ai /usr/share/doc/openvpn/*/sample-config-files/roadwarrior-client.conf /etc/openvpn/client/clientudp.conf
vi /etc/openvpn/client/clientudp.conf
```
# start service
```
systemctl enable openvpn-client@clientudp.service
systemctl start openvpn-client@clientudp.service
```
# password set
```
sudo systemd-tty-ask-password-agent --query
```