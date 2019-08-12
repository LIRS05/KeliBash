#!/bin/bash

echo "

 _        _ _              _     
| |      | (_)            | |    
| | _____| |___      _____| |__  
| |/ / _ \ | \ \ /\ / / _ \ '_ \ 
|   <  __/ | |\ V  V /  __/ |_) |
|_|\_\___|_|_| \_/\_/ \___|_.__/ 
                                 
                                 
"

echo "
########################################################################
#                                                                      #
#                          CONTROLLO DISCO                             #
#                                                                      #
########################################################################

"
#Spazio su disco
df -h
#sysadmin email account
ADMIN="l.iervasi@keliweb.it"

# impostazione soglia massima
THRESHOLD=99

#hostname
HOSTNAME=$(hostname)

#mail client
MAIL=/usr/bin/mail

#email di archiviazione alert 
EMAIL="l.iervasi@keliweb.it"

for line in $(df -hP | egrep '^/dev/disk1s1' | awk '{ print $6 "_:_" $5 }')
do

part=$(echo "$line" | awk -F"_:_" '{ print $1 }')
part_usage=$(echo "$line" | awk -F"_:_" '{ print $2 }' | cut -d'%' -f1 )

if [ $part_usage -ge $THRESHOLD -a -z "$EMAIL" ];

then
EMAIL="$(date): spazio su disco $HOSTNAME\n"
EMAIL="$EMAIL\n$part ($part_usage%) >= (Threshold = $THRESHOLD%)"

elif [ $part_usage -ge $THRESHOLD ];
then
EMAIL="$EMAIL\n$part ($part_usage%) >= (Threshold = $THRESHOLD%)"
fi
done
if [ -n "$EMAIL" ];
then
echo -e "$EMAIL" | $MAIL -s "Spazio disco in esaurimento su $HOSTNAME" "$ADMIN"
echo "Spazio disco insufficiente. Tutte le partizioni sono sotto la soglia del "$THRESHOLD"%"
else 
echo "Spazio disco sufficiente. Tutte le partizioni sono sotto la soglia del "$THRESHOLD"%"
fi