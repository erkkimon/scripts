#!/usr/bin/osascript

set iPhoneName to "www.levelapp.fi" -- this assumes your device name is www.levelapp.fi, so fill in your own

on wirelessConnectionAvailable()
	set wirelessAvailable to false
	set mySSID to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'"
	if "SSID" is in mySSID then
		set wirelessAvailable to false
	else
		set wirelessAvailable to true
	end if
	return wirelessAvailable
end wirelessConnectionAvailable

on internetConnectionAvailable()
	set internetAvailable to false
	try
		do shell script "ping -c 1 -t 3 www.google.com"
		set internetAvailable to true
	on error
		set internetAvailable to false
	end try
	return internetAvailable
end internetConnectionAvailable

on toggleTethering(device)
	set iPhoneName to device
	tell application "System Events"
		tell process "SystemUIServer"
			tell (menu bar item 1 of menu bar 1 whose description is "bluetooth")
				click
				tell (menu item iPhoneName of menu 1)
					click
					if exists menu item "Connect to Network" of menu 1 then
						tell (menu iPhoneName)
							click menu item "Connect to Network"
						end tell
					else
					tell (menu iPhoneName)
						click menu item "Disconnect from Network"
						end tell
					end if
				end tell
			end tell
		end tell
	end tell
end toggleTethering

if internetConnectionAvailable() is false then
	toggleTethering(iPhoneName)
else
	if wirelessConnectionAvailable() is true then
		toggleTethering(iPhoneName)
	end if
end if

