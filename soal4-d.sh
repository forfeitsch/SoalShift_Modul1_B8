#!/bin/bash



lwer=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

uper=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

j="0"

SAVEIFS=$IFS

IFS=$(echo -en "\n\b")

for i in ~/modul1/*

do

	key=`echo $i | awk -F "/" '{print $6}'  | awk '{print $1}' | awk -F ":" '{print $1}'`

	key=$((26 - key))

	nama=`echo $i | awk -F "/" '{print$6}'`

	cat $i | tr [${lwer:0:26}${uper:0:26}] [${lwer:${key}:26}${uper:${key}:26}] > ~/modul1/no4/$nama

	j=$(($j+1))

done



IFS=$SAVEIFS
