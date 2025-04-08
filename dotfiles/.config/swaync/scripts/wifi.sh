#!/bin/bash

#if not enabled -> enable wifi


# List available Wi-Fi networks  
LIST=$(nmcli --fields "SSID,BARS" device wifi list | awk '!seen[$1]++'| awk 'NR>1') 

##add option to disable wifi

# Select network via wofi  
SELECTED=$(echo "$LIST" | wofi --dmenu --prompt "Select Wi-Fi:")  
SSID=$(echo "$SELECTED" | cut -d '(' -f 1 | xargs)  

if [ -n "$SSID" ]; then  
    # Check if network requires a password  
    PASSWORD=""  
    if nmcli device wifi list | grep -q "$SSID.*WPA2"; then  
        PASSWORD=$(wofi --dmenu --password --prompt "Password for $SSID:")  
    fi  

    # Connect  
    if [ -n "$PASSWORD" ]; then  
        nmcli device wifi connect "$SSID" password "$PASSWORD"  
    else  
        nmcli device wifi connect "$SSID"  
    fi  

    notify-send "Wi-Fi" "Connected to $SSID"  
fi  
