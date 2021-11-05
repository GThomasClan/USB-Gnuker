# USB-Gnuker
Raspberry Pi USB drive sanitizer

This is a raspberry pi project that automatically partitions and formats any usb drive plugged into it.

Project created by Gavin Thomas.
##### inspiration for tool from here:https://www.reddit.com/r/raspberry_pi/comments/4w5p53/idea_raspberry_pi_appliance_autoformat_usb_thumb/


this tool uses speakers to play a bomb.wav file on completion of the drive wipe. 
this isn't necessary for the tool to work. you can use the onboard pi led light for status.

# load your raspberry pi with raspian.
# In /etc/udev/rules.d/ add 99-Gnuker.rules.
# In /usr/local/bin add Gnuke.sh and launch_Gnuke.sh.
# reboot the pi to activate the udev rule.
# anything plugged into the USB ports will be repartitioned and formatted.



