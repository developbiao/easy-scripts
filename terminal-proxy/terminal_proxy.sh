#!/usr/bin/env bash
#description switch proxy on terminal

# eanble proxy
function proxy_on(){
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    #export ALL_PROXY=socks5://127.0.0.1:8118
    export http_proxy=http://127.0.0.1:10081
    export https_proxy=https://127.0.0.1:10081
    echo -e "Enabled proxy"
}
# disable proxy
function proxy_off(){
    unset ALL_PROXY
    unset http_proxy
    unset https_proxy
    echo -e "Disabled proxy"
}
# execute proxy_off, default is off
proxy_off
#proxy_on

