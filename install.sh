#!/bin/bash

echo "Welcome to installer"
echo "1) install inkscape"
echo "2) install inkporter extension"
echo "3) install inkporter cli"
echo "4) install all"

read -p "Option:" opcao
case "$opcao" in 
1)
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update -y
sudo apt install inkscape -y
;;
2)
sudo chmod 777 /usr/
sudo chmod 777 /usr/share/
sudo chmod 777 /usr/share/inkscape/
sudo chmod 777 /usr/share/inkscape/extensions/
sudo cp -r ./inkporter_extension/* /usr/share/inkscape/extensions/
;;
3)
curl -s --compressed "https://gimpscape.github.io/gimpscape-ppa/tools/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/gimpscape-ppa.list "https://gimpscape.github.io/gimpscape-ppa/tools/gimpscape-ppa.list"
sudo apt update -y
sudo apt install inkporter -y
;;
4)
#installing inkscape PPA Version
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update -y
sudo apt install inkscape -y

#install inkporter extension

sudo chmod 777 /usr/
sudo chmod 777 /usr/share/
sudo chmod 777 /usr/share/inkscape/
sudo chmod 777 /usr/share/inkscape/extensions/

sudo cp -r ./public/inkporter_extension/* /usr/share/inkscape/extensions/

#install inkporter cli 
curl -s --compressed "https://gimpscape.github.io/gimpscape-ppa/tools/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/gimpscape-ppa.list "https://gimpscape.github.io/gimpscape-ppa/tools/gimpscape-ppa.list"
sudo apt update -y
sudo apt install inkporter -y
;;
*)
echo "Option not find"
exit 1
esac 