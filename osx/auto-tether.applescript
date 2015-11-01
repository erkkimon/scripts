set iPhoneName to "www.levelapp.fi" -- this assumes your device name is www.levelapp.fi, so fill in your own

try
	
	set the_URL to "http://www.google.com" as URL
	set dotted_ to dotted decimal form of host of the_URL
	return "Internet connection already exists, let's not try to tether"
	
on error
	
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
						return "Connect menu was not found, are you already connected?"
					end if
				end tell
			end tell
		end tell
	end tell
	
end try

