# !/bin/bash

awk '{if ($0 ~ /cron/ && $0 !~ /sudo/ && NF < 13) print $0 }' /var/log/syslog >> ~/modul1/soal5.log 2>&1
