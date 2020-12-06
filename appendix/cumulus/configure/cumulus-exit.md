# cumulus-exit configure
```
cumulus@exit:mgmt:~$ net show configuration 

dns
  
  nameserver
    172.16.100.1 # vrf mgmt

time
  
  ntp
    
    servers
      0.cumulusnetworks.pool.ntp.org iburst
      1.cumulusnetworks.pool.ntp.org iburst
      2.cumulusnetworks.pool.ntp.org iburst
      3.cumulusnetworks.pool.ntp.org iburst
    
    source
      eth0
  
  zone
    Etc/UTC

snmp-server
  listening-address localhost

ptp
  
  global
    
    slaveOnly
      0
    
    priority1
      255
    
    priority2
      255
    
    domainNumber
      0
    
    logging_level
      5
    
    path_trace_enabled
      0
    
    use_syslog
      1
    
    verbose
      0
    
    summary_interval
      0
    
    time_stamping
      hardware

frr version 7.4+cl4.2.1u1

frr defaults datacenter

hostname exit

log syslog informational

service integrated-vtysh-config

ip route 0.0.0.0/0 172.16.100.1
ip route 192.168.100.0/24 172.16.200.253
ip route 192.168.200.0/24 172.16.200.254
line vty

ip route 192.168.0.0/24 172.16.200.253
interface lo
  # The primary network interface

interface eth0
  address dhcp
  vrf mgmt

interface swp1
  address 172.16.100.2/24

interface swp2
  address 172.16.200.252/24
  acl ipv4 C01toC02 inbound
  acl ipv4 C02toC01 inbound

interface mgmt
  address 127.0.0.1/8
  address ::1/128
  vrf-table auto

acl ipv4 C01toC02 priority 10 drop source-ip 192.168.100.0/24 dest-ip 192.168.200.0/24
acl ipv4 C02toC01 priority 10 drop source-ip 192.168.200.0/24 dest-ip 192.168.100.0/24
dot1x
  mab-activation-delay 30
  default-dacl-preauth-filename default_preauth_dacl.rules
  eap-reauth-period 0
  
  radius
    accounting-port 1813
    authentication-port 1812


# The above output is a summary of the configuration state of the switch.
# Do not cut and paste this output into /etc/network/interfaces or any other
# configuration file.  This output is intended to be used for troubleshooting
# when you need to see a summary of configuration settings.
#
# Please use "net show configuration commands" for a configuration that
# you can back up or copy and paste into a new device.
```