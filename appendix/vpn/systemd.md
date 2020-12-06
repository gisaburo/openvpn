# vpn-server
## systemd
```
[root@vpn-server ~]# cat /usr/lib/systemd/system/openvpn-server@.service
[Unit]
Description=OpenVPN service for %I
After=syslog.target network-online.target
Wants=network-online.target
Documentation=man:openvpn(8)
Documentation=https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
Documentation=https://community.openvpn.net/openvpn/wiki/HOWTO

[Service]
Type=notify
PrivateTmp=true
WorkingDirectory=/etc/openvpn/server
ExecStart=/usr/sbin/openvpn --status %t/openvpn-server/status-%i.log --status-version 2 --suppress-timestamps --cipher AES-256-GCM --ncp-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC:BF-CBC --config %i.conf
CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_DAC_OVERRIDE CAP_AUDIT_WRITE
LimitNPROC=10
DeviceAllow=/dev/null rw
DeviceAllow=/dev/net/tun rw
ProtectSystem=true
ProtectHome=true
KillMode=process
RestartSec=5s
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
## status
```
[root@vpn-server ~]# systemctl status openvpn-server@serverudp.service 
● openvpn-server@serverudp.service - OpenVPN service for serverudp
     Loaded: loaded (/usr/lib/systemd/system/openvpn-server@.service; enabled; vendor preset: disabled)
     Active: active (running) since Sun 2020-12-06 08:54:04 JST; 1h 46min ago
       Docs: man:openvpn(8)
             https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
             https://community.openvpn.net/openvpn/wiki/HOWTO
   Main PID: 1871 (openvpn)
     Status: "Initialization Sequence Completed"
      Tasks: 1 (limit: 4665)
     Memory: 1.1M
        CPU: 453ms
     CGroup: /system.slice/system-openvpn\x2dserver.slice/openvpn-server@serverudp.service
             └─1871 /usr/sbin/openvpn --status /run/openvpn-server/status-serverudp.log --status-version 2 --suppress-timestamps --cipher AES-256-GCM --ncp-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC:BF-CBC -->

12月 06 10:36:09 vpn-server openvpn[1871]: 192.168.200.1:33453 Control Channel: TLSv1.3, cipher TLSv1.3 TLS_AES_256_GCM_SHA384, 2048 bit RSA
12月 06 10:36:09 vpn-server openvpn[1871]: 192.168.200.1:33453 [vpn-client] Peer Connection Initiated with [AF_INET]192.168.200.1:33453
12月 06 10:36:09 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 MULTI_sva: pool returned IPv4=10.8.0.6, IPv6=(Not enabled)
12月 06 10:36:09 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 MULTI: Learn: 10.8.0.6 -> vpn-client/192.168.200.1:33453
12月 06 10:36:09 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 MULTI: primary virtual IP for vpn-client/192.168.200.1:33453: 10.8.0.6
12月 06 10:36:10 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 PUSH: Received control message: 'PUSH_REQUEST'
12月 06 10:36:10 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 SENT CONTROL [vpn-client]: 'PUSH_REPLY,route 10.8.0.1 255.255.255.255,route 192.168.100.0 255.255.255.0,dhcp-option DOMAIN example.com,dhcp-option >
12月 06 10:36:10 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 Data Channel MTU parms [ L:1549 D:1450 EF:49 EB:406 ET:0 EL:3 ]
12月 06 10:36:10 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 Outgoing Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
12月 06 10:36:10 vpn-server openvpn[1871]: vpn-client/192.168.200.1:33453 Incoming Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
```
# vpn-client
## systemd
```
[fedora@vpn-client ~]$ cat /usr/lib/systemd/system/openvpn-client@.service
[Unit]
Description=OpenVPN tunnel for %I
After=syslog.target network-online.target
Wants=network-online.target
Documentation=man:openvpn(8)
Documentation=https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
Documentation=https://community.openvpn.net/openvpn/wiki/HOWTO

[Service]
Type=notify
PrivateTmp=true
WorkingDirectory=/etc/openvpn/client
ExecStart=/usr/sbin/openvpn --suppress-timestamps --nobind --config %i.conf
CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_ADMIN CAP_NET_RAW CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_DAC_OVERRIDE
LimitNPROC=10
DeviceAllow=/dev/null rw
DeviceAllow=/dev/net/tun rw
ProtectSystem=true
ProtectHome=true
KillMode=process

[Install]
WantedBy=multi-user.target
```
## status
```
[fedora@vpn-client ~]$ systemctl status openvpn-client@clientudp.service 
● openvpn-client@clientudp.service - OpenVPN tunnel for clientudp
     Loaded: loaded (/usr/lib/systemd/system/openvpn-client@.service; enabled; vendor preset: disabled)
     Active: active (running) since Sun 2020-12-06 08:55:53 JST; 1h 43min ago
       Docs: man:openvpn(8)
             https://community.openvpn.net/openvpn/wiki/Openvpn24ManPage
             https://community.openvpn.net/openvpn/wiki/HOWTO
   Main PID: 1671 (openvpn)
     Status: "Initialization Sequence Completed"
      Tasks: 1 (limit: 4665)
     Memory: 1.2M
        CPU: 523ms
     CGroup: /system.slice/system-openvpn\x2dclient.slice/openvpn-client@clientudp.service
             └─1671 /usr/sbin/openvpn --suppress-timestamps --nobind --config clientudp.conf

12月 06 10:36:10 vpn-client openvpn[1671]: Incoming Data Channel: Cipher 'AES-256-GCM' initialized with 256 bit key
12月 06 10:36:10 vpn-client openvpn[1671]: ROUTE_GATEWAY 192.168.200.254/255.255.255.0 IFACE=enp1s0 HWADDR=52:54:00:37:30:55
12月 06 10:36:10 vpn-client openvpn[1671]: TUN/TAP device tun0 opened
12月 06 10:36:10 vpn-client openvpn[1671]: TUN/TAP TX queue length set to 100
12月 06 10:36:10 vpn-client openvpn[1671]: do_ifconfig, tt->did_ifconfig_ipv6_setup=0
12月 06 10:36:10 vpn-client openvpn[1671]: /sbin/ip link set dev tun0 up mtu 1500
12月 06 10:36:10 vpn-client openvpn[1671]: /sbin/ip addr add dev tun0 local 10.8.0.6 peer 10.8.0.5
12月 06 10:36:10 vpn-client openvpn[1671]: /sbin/ip route add 10.8.0.1/32 via 10.8.0.5
12月 06 10:36:10 vpn-client openvpn[1671]: /sbin/ip route add 192.168.100.0/24 via 10.8.0.5
12月 06 10:36:10 vpn-client openvpn[1671]: Initialization Sequence Completed
```