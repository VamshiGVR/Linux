#!/bin/bash

# Windows machine details
WINDOWS_IP="73.82.61.182"  # Change this to your Windows machine's IP
USERNAME="ATGWORKS"     # Change this to the Windows admin username
PASSWORD="6636"      # Change this to the Windows admin password

# Function to check if winexe is installed
check_winexe() {
    if ! command -v winexe &>/dev/null; then
        echo "winexe is not installed. Installing it..."
        sudo apt update && sudo apt install -y winexe
    fi
}

# Function to list Windows users
list_users() {
    echo "Fetching Windows users..."
    winexe -U "${USERNAME}%${PASSWORD}" //${WINDOWS_IP} "cmd /c net user"
}

# Function to list Windows groups
list_groups() {
    echo "Fetching Windows groups..."
    winexe -U "${USERNAME}%${PASSWORD}" //${WINDOWS_IP} "cmd /c net localgroup"
}

# Main execution
check_winexe
list_users
echo ""
list_groups