# hostname
```
net add hostname cumulus01
```
# interface
```
net add interface swp1 ip address 172.16.200.253/24
net add interface swp2 ip address 192.168.100.254/24
net add interface swp3 ip address 192.168.0.254/24
```
# ip route
```
net add routing route 0.0.0.0/0 172.16.200.252
net add routing route 192.168.200.0/24 172.16.200.254
net add routing route 172.16.100.0/24 172.16.200.252
```
# dnat
```
net add nat static dnat udp 172.16.200.253 in-interface swp1 translate 192.168.100.1
```