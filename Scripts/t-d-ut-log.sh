#!/bin/bash
logfile="/home/bogfoot/Logs/logfile.log"
echo 'Današnji dan i vrijeme (dan u godini)' > $logfile
echo "$(date +%d.%m.%y\ %H:%M:%S\ \(%j\))" >> $logfile
echo "Korisnik, UID i vrijeme paljenja" >> $logfile
echo $(who) >> $logfile
echo 'Uptime' >> $logfile
echo $(uptime) >> $logfile

echo 'Današnji dan i vrijeme (dan u godini)'
echo " $(date +%d.%m.%y\ %H:%M:%S\ \(%j\))"
echo "Korisnik, UID i vrijeme paljenja"
echo $(who)
echo 'Uptime'
echo $(uptime)


exit 0
