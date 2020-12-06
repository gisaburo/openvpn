# hostname
```
net add hostname cumulus02
```
# interface
```
net add interface swp1 ip address 172.16.200.254/24
net add interface swp2 ip address 192.168.200.254/24
```
# ip route
```
net add routing route 0.0.0.0/0 172.16.200.252
net add routing route 192.168.100.0/24 172.16.200.253
net add routing route 172.16.100.0/24 172.16.200.252
```