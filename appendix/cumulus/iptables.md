# cumulus-exit
```
cumulus@exit:mgmt:~$ sudo iptables -t nat -v -L -n
[sudo] password for cumulus: 
Chain PREROUTING (policy ACCEPT 441 packets, 34379 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 359 packets, 22344 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 369 packets, 23461 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 SNAT       icmp --  *      *       192.168.100.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
    0     0 SNAT       tcp  --  *      *       192.168.100.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
  134 10184 SNAT       udp  --  *      *       192.168.100.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
    0     0 SNAT       icmp --  *      *       192.168.200.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
    0     0 SNAT       tcp  --  *      *       192.168.200.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
  134 10184 SNAT       udp  --  *      *       192.168.200.0/24     0.0.0.0/0            to:172.16.100.2:1024-1200
    0     0 SNAT       icmp --  *      *       192.168.0.0/24       0.0.0.0/0            to:172.16.100.2:1024-1200
    0     0 SNAT       tcp  --  *      *       192.168.0.0/24       0.0.0.0/0            to:172.16.100.2:1024-1200
  159 12084 SNAT       udp  --  *      *       192.168.0.0/24       0.0.0.0/0            to:172.16.100.2:1024-1200
```
# cumulus01
```
cumulus@cumulus01:mgmt:~$ sudo iptables -t nat -v -L -n
[sudo] password for cumulus: 
Chain PREROUTING (policy ACCEPT 297 packets, 23161 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    3   126 DNAT       udp  --  swp1   *       0.0.0.0/0            172.16.200.253       to:192.168.100.1

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 342 packets, 21056 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 637 packets, 43422 bytes)
 pkts bytes target     prot opt in     out     source               destination 
```
# cumulus02
```
cumulus@cumulus02:mgmt:~$ sudo iptables -t nat -v -L -n
[sudo] password for cumulus: 
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
```