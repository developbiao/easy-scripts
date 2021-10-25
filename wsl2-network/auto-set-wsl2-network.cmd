rem The ip address of a WSL2 machine cannot be made static
rem So this script can reslove ip address problem
rem This script program can easy set wsl2 netwok to 192.168.3.38
rem You can can network address if you want


:REM echo "Easy set wsl2 ubuntu ip address is 192.168.3.38"

wsl -d Ubuntu -u root ip addr del $(ip addr show eth0 ^| grep 'inet\b' ^| awk '{print $2}' ^| head -n 1) dev eth0

wsl -d Ubuntu -u root ip addr add 192.168.3.38/24 broadcast 192.168.3.255 dev eth0

rem Add customzie route 192.168.3.1
wsl -d Ubuntu -u root ip route add 0.0.0.0/0 via 192.168.3.1 dev eth0

rem Add nameserver to local reslove config file
wsl -d Ubuntu -u root echo nameserver 192.168.3.1 ^> /etc/resolv.conf
powershell -c "Get-NetAdapter 'vEthernet (WSL)' | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$False; New-NetIPAddress -IPAddress 192.168.3.1 -PrefixLength 24 -InterfaceAlias 'vEthernet (WSL)'; Get-NetNat | ? Name -Eq WSLNat | Remove-NetNat -Confirm:$False; New-NetNat -Name WSLNat -InternalIPInterfaceAddressPrefix 192.168.3.0/24;"

:REM echo "Get new WSL network address"
powershell -c "Get-NetAdapter 'vEthernet (WSL)' | Get-NetIPAddress;"

