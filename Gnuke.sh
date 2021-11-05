#!/bin/bash
# inspiration for tool from here:https://www.reddit.com/r/raspberry_pi/comments/4w5p53/idea_raspberry_pi_appliance_autoformat_usb_thumb/

# instantiate pi led
echo gpio | sudo tee /sys/class/leds/led0/trigger 
date=$(date) 
echo ------------------------------------------------ >> /var/log/Gnuke 
echo $date >>var/log/Gnuke echo Gnuking Drive $1 >> /var/log/Gnuke
#Commands grouped by the braces with ampersand after them will be executed asynchronously in a subshell


#  blink light to show activity
echo heartbeat | sudo tee /sys/class/leds/led0/trigger


echo Creating Partition on $1 USB drive >> /var/log/Gnuke

#send command to sfdisk  to create W95 FAT32 (LBA) from:https://suntong.github.io/blogs/2015/12/25/use-sfdisk-to-partition-disks/ 
echo ,,c\; | sudo  sfdisk /dev/$1 --no-reread
echo created fat32 partition on /dev/$1 >> var/log/Gnuke

#after sfdisk, seems disk is automounted, unmount so it can be formatted

for device in /media/pi/*
do
   umount $device
   echo unmounted $device >> /var/log/Gnuke
done


# Format drive FAT32 for compatibilty with mac, windows,linux up to 2TB limit
sudo mkfs.vfat /dev/$11 -I
echo formatted /dev/$1 Fat32 >> /var/log/Gnuke

#check number of files on disk to make sure it is empty
sudo mount /dev/$1 /media/pi/$1
files=$(sudo ls /media/pi/$1 | wc -l)
echo dircount = $files >> /var/log/Gnuke
if [ $files -gt 1 ];
then
echo /dev/$1 is not empty >> /var/log/Gnuke
else
echo /dev/$1 is empty >> /var/log/Gnuke
(echo sudo speaker-test -c1 -r22050 -l1 --test=wav -w /usr/local/bin/bomb.wav | at now) &
fi

#(echo sudo speaker-test -c1 -r22050 -l1 --test=wav -w /usr/local/bin/bomb.wav | at now) &

#get date again, since time has passed since our last get
date=$(date)

echo USB drive $1 Gnuked $date. Ready for removal >> /var/log/Gnuke

# Turn off LED activity
echo 0 | sudo tee /sys/class/leds/led0/brightness 

echo Contents of /dev/$1: >> /var/log/Gnuke ls -al /dev/$1 >> /var/log/Gnuke

