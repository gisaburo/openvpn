# hostname
```
net add hostname exit
```
# interface
```
net add interface swp1 ip address 172.16.100.2/24
net add interface swp2 ip address 172.16.200.252/24
```
# ip route 
```
net add routing route 0.0.0.0/0 172.16.100.1
net add routing route 192.168.100.0/24 172.16.200.253
net add routing route 192.168.200.0/24 172.16.200.254
net add routing route 192.168.0.0/24 172.16.200.253
```
# pat
```
net add nat dynamic snat icmp source-ip 192.168.0.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat tcp source-ip 192.168.0.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat udp source-ip 192.168.0.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat icmp source-ip 192.168.100.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat tcp source-ip 192.168.100.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat udp source-ip 192.168.100.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat icmp source-ip 192.168.200.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat tcp source-ip 192.168.200.0/24 translate 172.16.100.2 1024-1200
net add nat dynamic snat udp source-ip 192.168.200.0/24 translate 172.16.100.2 1024-1200
```
# acl
```
net add acl ipv4 C01toC02 drop source-ip 192.168.100.0/24 dest-ip 192.168.200.0/24
net add acl ipv4 C02toC01 drop source-ip 192.168.200.0/24 dest-ip 192.168.100.0/24
net add int swp2 acl ipv4 C01toC02 inbound
net add int swp2 acl ipv4 C02toC01 inbound
```