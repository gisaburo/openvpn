#!/bin/bash
# --- for vpn server
sudo ip route add 192.168.100.0/24 via 172.16.100.2
# --- for vpn client
sudo ip route add 192.168.200.0/24 via 172.16.100.2
# --- for vpn router
sudo ip route add 172.16.200.0/24 via 172.16.100.2
