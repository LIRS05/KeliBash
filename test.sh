#!/usr/bin/bash
echo "
  _  __         _   _                     _     
 | |/ /        | | (_)                   | |    
 | ' /    ___  | |  _  __      __   ___  | |__  
 |  <    / _ \ | | | | \ \ /\ / /  / _ \ | '_ \ 
 | . \  |  __/ | | | |  \ V  V /  |  __/ | |_) |
 |_|\_\  \___| |_| |_|   \_/\_/    \___| |_.__/ 
                                                                                          
"
echo "*****************************************************************
*                      ++++++++++++++++++++++                         *
*                        KELIControl v 1.0.1                          *
*                      ++++++++++++++++++++++                         *
***********************************************************************"
# avvio script
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                                     +
+                            ~AVVIO~                                  +
+                                                                     +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
read -p "Digita il nome del dominio da controllare : " dominio
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "avvio il controllo sul dominio: $dominio, resta in attesa per il risultato"
echo ""
echo "
########################################################################
#                             Whois                                    #
#                            $dominio                                  #
########################################################################"

                      whois $dominio | grep Status  

echo "
########################################################################
#                            Record A                                  #
#                            $dominio                                  #
########################################################################"

                         host -t a $dominio

echo "
########################################################################
#                             Name Server                              #
#                              $dominio                                #
########################################################################"

                          nslookup $dominio

echo "
########################################################################"

                        host -t ns $dominio

echo "
########################################################################
#                           REVERSE IP                                  #
#                            $dominio                                  #
########################################################################"

#host -t a $dominio +short
#dig -x  
#host   $dominio +short
host 185.17.106.200
echo "
########################################################################
#                           Record MX                                  #
#                            $dominio                                  #
########################################################################"

                        host -t mx $dominio

echo "\\
#########################################################################
#                           Record TXT                                #
#                            $dominio                                   #
########################################################################"

                    host -t txt $dominio

echo "
########################################################################
#                               SOA                                    #
#                            $dominio                                  #
########################################################################"

host -t soa $dominio
