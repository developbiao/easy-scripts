:: Add an IP address in Ubuntu, 192.168.6.38, named eth0:1
wsl -d Ubuntu -u root ip addr add 192.168.6.38/24 broadcast 192.168.6.255 dev eth0 label eth0:1

:: Add an IP address in Win10, 192.168.6.88
netsh interface ip add address "vEthernet (WSL)" 192.168.6.88 255.255.255.0