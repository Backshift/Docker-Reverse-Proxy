#!/bin/bash

# WIN => bash add_dns.sh 192.168.0.1 host.dev
# LINUX => .\add_dns.ps1 192.168.1.100 host.dev


# Function to add DNS entry to Linux hosts file
add_dns_linux() {
    echo "Adding DNS entry to Linux hosts file"
    echo "$1 $2" | sudo tee -a /etc/hosts >/dev/null
}

# Function to add DNS entry to Windows hosts file
add_dns_windows() {
    echo "Adding DNS entry to Windows hosts file"
    echo "$1 $2" | Out-File -FilePath C:\Windows\System32\drivers\etc\hosts -Append
}

# Check operating system
if [[ "$(uname)" == "Linux" ]]; then
    # Linux
    add_dns_linux "$1" "$2"
elif [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    echo "macOS is not supported."
elif [[ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]]; then
    # Windows
    add_dns_windows "$1" "$2"
else
    echo "Unsupported operating system."
fi
