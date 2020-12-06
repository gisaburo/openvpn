# vpn-server
## route
```
[fedora@vpn-server ~]$ route 
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    100    0        0 enp1s0
10.8.0.0        10.8.0.2        255.255.255.0   UG    0      0        0 tun0
10.8.0.2        0.0.0.0         255.255.255.255 UH    0      0        0 tun0
192.168.100.0   0.0.0.0         255.255.255.0   U     100    0        0 enp1s0
```
## ip a
```
[fedora@vpn-server ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:67:7e:8a brd ff:ff:ff:ff:ff:ff
    inet 192.168.100.1/24 brd 192.168.100.255 scope global noprefixroute enp1s0
       valid_lft forever preferred_lft forever
    inet6 fe80::5054:ff:fe67:7e8a/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
4: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 100
    link/none 
    inet 10.8.0.1 peer 10.8.0.2/32 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::a0d5:dff9:ab9a:ea0/64 scope link stable-privacy 
       valid_lft forever preferred_lft forever
```
# vpn-client
## route
```
[fedora@vpn-client ~]$ route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    100    0        0 enp1s0
10.8.0.1        10.8.0.5        255.255.255.255 UGH   0      0        0 tun0
10.8.0.5        0.0.0.0         255.255.255.255 UH    0      0        0 tun0
192.168.100.0   10.8.0.5        255.255.255.0   UG    0      0        0 tun0
192.168.200.0   0.0.0.0         255.255.255.0   U     100    0        0 enp1s0
```
## ip a
```
[fedora@vpn-client ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:37:30:55 brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.1/24 brd 192.168.200.255 scope global noprefixroute enp1s0
       valid_lft forever preferred_lft forever
    inet6 fe80::5054:ff:fe37:3055/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
7: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 100
    link/none 
    inet 10.8.0.6 peer 10.8.0.5/32 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::2e0b:5141:664a:259/64 scope link stable-privacy 
       valid_lft forever preferred_lft forever
```