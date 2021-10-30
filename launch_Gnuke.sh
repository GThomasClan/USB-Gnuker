#!/bin/sh

#clear
echo '************************************************' >> /var/log/Gnuke
echo Begin USB Gnuke >> /var/log/Gnuke
echo Drive: $1 >> /var/log/Gnuke
echo /usr/local/bin/Gnuke.sh $1 | at now
echo '************************************************' >> /var/log/Gnuke

echo >> /var/log/Gnuke
echo >> /var/log/Gnuke
