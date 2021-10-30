#!/bin/bash
# inspiration for tool from here:https://www.reddit.com/r/raspberry_pi/comments/4w5p53/idea_raspberry_pi_appliance_autoformat_usb_thumb/

date=$(date)
echo ------------------------------------------------ >> /var/log/Gnuke
echo $date >>var/log/Gnuke
echo  Gnuking Drive $1 >> /var/log/Gnuke

# instantiate pi led
echo gpio | sudo tee /sys/class/leds/led0/trigger

#  blink light to show activity
echo heartbeat | sudo tee /sys/class/leds/led0/trigger 
#play bomb noise and send to background
omxplayer --no-keys /usr/local/bin/bomb.wav &

#zero  is faster than random
#sudo dd if=/dev/urandom of=/dev/$1 bs=4096 conv=fsync
#sudo dd if=/dev/zero of=/dev/$1 bs=4096 conv=fsync

echo Creating Partition on $1 USB drive >> /var/log/Gnuke


#create label for usb device
echo label\: Gnuked | sudo sfdisk/dev/$1

#send command to sfdisk  to create W95 FAT32 (LBA) from:https://suntong.github.io/blogs/2015/12/25/use-sfdisk-to-partition-disks/ 
echo ,,c\; | sudo  sfdisk /dev/$1 --no-reread

#debug check if usb is mounted
#df -h


#after sfdisk, seems disk is automounted, unmount so it can be formatted
#unmount with umount /pi/media
for device in /media/pi/*
do
    umount $device
done

# Format drive FAT32
sudo mkfs.vfat /dev/$1 -I

#change the drive lable  as our calling card
sudo mlabel -i /dev/sda \:\:Gnuked


echo Detaching $1 >> /var/log/Gnuke
echo Detaching $1
sudo udisks --detach /dev/$1

# Turn off LED  activity 
echo 0 | sudo tee /sys/class/leds/led0/brightness 

date=$(date)
echo $date >> /var/log/Gnuke


echo USB drive $1 Gnuked. Ready for removal >> /var/log/Gnuke

# To restore LED outside of script use this command
# echo mmc0 | sudo tee /sys/class/leds/led0/trigger
echo ------------------------------------------------ >> /var/log/Gnuke
echo >> /var/log/Gnuke
echo >> /var/log/Gnuke
echo >> /var/log/Gnuke

echo >> /var/log/Gnuke
echo >> /var/log/Gnuke
echo >> /var/log/Gnuke
echo >> /var/log/Gnuke
