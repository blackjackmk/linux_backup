#!/bin/bash

#if not enabled -> enable wifi
wifi_status=$(nmcli radio wifi)
if [ "$wifi_status" = "disabled" ]; then
    choice=$(echo -e "Enable Wi-Fi" | wofi --dmenu --prompt "Wi-Fi is disabled")
    if [ "$choice" = "Enable Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send "Wi-Fi" "Wi-Fi enabled"
    fi
    exit 0
fi
	
	

# List available Wi-Fi networks  
LIST=$(nmcli --fields "SSID,BARS" device wifi list | awk '!seen[$1]++'| awk 'NR>1') 

LIST=$(echo -e "$LIST\n[Disable Wi-Fi]")


##add option to disable wifi

# Select network via wofi  
SELECTED=$(echo "$LIST" | wofi --dmenu --prompt "Select Wi-Fi:")  


if [ -z "$SELECTED" ]; then
    # Nothing selected
    exit 0
elif [ "$SELECTED" = "[Disable Wi-Fi]" ]; then
    nmcli radio wifi off
    notify-send "Wi-Fi" "Wi-Fi disabled"
else
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
fi
