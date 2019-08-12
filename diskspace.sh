#!/usr/bin/bash
echo "
  _  __         _   _                     _     
 | |/ /        | | (_)                   | |    
 | ' /    ___  | |  _  __      __   ___  | |__  
 |  <    / _ \ | | | | \ \ /\ / /  / _ \ | '_ \ 
 | . \  |  __/ | | | |  \ V  V /  |  __/ | |_) |
 |_|\_\  \___| |_| |_|   \_/\_/    \___| |_.__/ 
                                                                                          
"

alert_threshold=90

# Email di alert
rcpt1="l.irvasi@keliweb.it"

# Hostname
host=`hostname -f`

i=0
for disk in `df |grep dev |grep -v tmpfs |grep -v udev| awk -F" " '{print $1}' | cut -d/ -f3`
do
space_use=`df | grep $disk | awk -F" " '{print $5}' | cut -d% -f1`

if [ "$space_use" -gt "$alert_threshold" ]
then
i=$((i + 1))
over_threshold["$i"]="$disk"
fi
done

if [ ${#over_threshold[*]} -gt 0 ]
then
echo >/tmp/mail.txt
subject="Disk space over threshold on $host"
echo "">> /tmp/mail.txt
echo "Disks with space problem with more than $alert_threshold% occupied space" >> /tmp/mail.txt
echo "">> /tmp/mail.txt

for disk in ${over_threshold[*]}
do
info_disk=(`df -h | grep $disk | awk -F" " '{print $6, $2, $3, $4, $5}'`)
echo "- Mount point : ${info_disk[O]} - Total space : ${info_disk[1]} - Used space : ${info_disk[2]} - Free space : ${info_disk[3]} - Used space in percents : ${info_disk[4]}" >> /tmp/mail.txt ; echo "" >> /tmp/mail.txt
done

# Now send the email alert

cat /tmp/mail.txt |mail -s "$subject" $rcpt1
fi