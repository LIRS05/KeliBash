#!/usr/bin/bash
echo "
  _  __         _   _                     _     
 | |/ /        | | (_)                   | |    
 | ' /    ___  | |  _  __      __   ___  | |__  
 |  <    / _ \ | | | | \ \ /\ / /  / _ \ | '_ \ 
 | . \  |  __/ | | | |  \ V  V /  |  __/ | |_) |
 |_|\_\  \___| |_| |_|   \_/\_/    \___| |_.__/ 
                                                                                          
"
echo "
***********************************************************************
*                      ++++++++++++++++++++++                         *
*                        KELISpace v 1.0.1                            *
*                      ++++++++++++++++++++++                         *
***********************************************************************
"


#   read -p "Digita il nome del dominio da controllare es. /dev/: " space



echo "
***********************************************************************
*                      Spazio utilizzato                              *
*                          sul disco                                  *
***********************************************************************
"

                             df -h

echo "
***********************************************************************
*                      Spazio utilizzato                              *
*                         in /dev/disk1s1                                *
***********************************************************************
"
               #     df -h | grep $space


#echo "Capacità del disco: " df -h  | grep $domino


#df -h  | grep /dev/disk1s1 


disk1=100
disk2=100

if [[ "$disk1" = "$disk2" ]]
then
echo "Bisogna fare spazio nel disco"
else
echo "disco ok"
fi