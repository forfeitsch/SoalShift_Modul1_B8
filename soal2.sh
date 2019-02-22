#!/bin/bash

echo "2.a"
awk -F "," '{if ($7 == 2012) i[$1]+=$10} END {for (x in i) if(max<i[x]) {max=i[x]; country=x} print max, country}' ~/sisop2019/prak_mod1/WA_Sales_Products_2012-14.csv
echo ""
echo "2.b"
awk -F "," '{if ($1 == "United States" && $7 == 2012) j[$4]+=$10} END {for (x in j) {print j[x], x}}' ~/sisop2019/prak_mod1/WA_Sales_Products_2012-14.csv | sort -nr | head -n 3 | awk '{print $2" "$3}'
echo ""
echo "2.c"
awk -F "," '{if ($1 == "United States" && $7 == 2012 && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) k[$6]+=$10} END {for (x in k) {print k[x], x}}' ~/sisop2019/prak_mod1/WA_Sales_Products_2012-14.csv | sort -nr | head -n 3 | awk '{print $2" "$3}'

