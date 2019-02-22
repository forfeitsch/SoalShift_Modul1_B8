#!/bin/bash



lwer=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

uper=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ



phrase="/var/log/syslog"

rotat=`date | awk -F ":" '{print $1}' | awk '{print $4}'`

jam=`date | awk '{print $4}' | awk -F ":" '{print $1":"$2}'`

tanggal=`date | awk '{print $3"-"$2"-"$6}'`



cat $phrase | tr [${lwer:0:26}${uper:0:26}] [${lwer:${rotat}:26}${uper:${rotat}:26}] > ~/modul1/no4/$jam\ $tanggal

