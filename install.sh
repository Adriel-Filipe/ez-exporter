#!/bin/bash
op1="0"
op2="0"
op3="0"

echo "Welcome to installer"
echo "1) install inkscape"
echo "2) install inkporter extension"
echo "3) install inkporter cli"
echo "4) install all"

read -p "Option:" opcao
case "$opcao" in 
1)
op1="1"
;;
2)
op2="1"
;;
3)
op3="1"
;;
4)
op1="1"
op2="1"
op3="1"
;;
*)
echo "Option not find"
exit 1
esac 

if [ $op1="1" ]; then
#installing inkscape PPA Version
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update -y && sudo apt install inkscape -y
fi

if [ $op2="1" ]; then
#install inkporter extension
sudo chmod 777 /usr/ /usr/share/ /usr/share/inkscape/ /usr/share/inkscape/extensions/
sudo cp -r ./public/inkporter_extension/* /usr/share/inkscape/extensions/
fi

if [ $op3="3" ]; then
#install inkporter cli 
curl -s --compressed "https://gimpscape.github.io/gimpscape-ppa/tools/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/gimpscape-ppa.list "https://gimpscape.github.io/gimpscape-ppa/tools/gimpscape-ppa.list"
sudo apt update -y && sudo apt install inkporter -y
fi
