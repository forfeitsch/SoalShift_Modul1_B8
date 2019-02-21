#!/bin/bash
cd ~/soal1
unzip nature.zip
cd nature/

for file in *
do
	base64 -d "$file" | xxd -r  > "new$file" 
	rm "$file"
	mv "new$file" "$file"
done

cd ..
rm nature.zip 
zip -r nature.zip nature
rm -r nature


