#!/usr/bin/bash
peso="$1"
altezza="$2"
pesoideale=$[$altezza - 110]
if [ $peso -le $pesoideale ] ; then
 echo "Dovreste mangiare un poco di grassi in più."
else
 echo "Dovreste mangiare un poco di frutta in più."
fi

echo "i valori inseristo sono : Peso $1 e altezza $2"