#!/bin/bash
echo "Welcome to ez-exporter installer"
echo "1) install inkscape"
echo "2) install inkporter extension"
echo "3) install inkporter cli"
echo "4) install all"

function install_inkscape() {
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update -y && sudo apt install inkscape -y
echo ""
}

function install_inkporter_extension() {
sudo chmod 777 /usr/ /usr/share/ /usr/share/inkscape/ /usr/share/inkscape/extensions/
sudo cp -r ./public/inkporter_extension/* /usr/share/inkscape/extensions/
echo ""
}

function install_inkporter_cli() {
curl -s --compressed "https://gimpscape.github.io/gimpscape-ppa/tools/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/gimpscape-ppa.list "https://gimpscape.github.io/gimpscape-ppa/tools/gimpscape-ppa.list"
sudo apt update -y && sudo apt install inkporter -y
echo ""
}

read -p "Option:" opcao
case "$opcao" in 
1)
install_inkscape
;;
2)
install_inkporter_extension
;;
3)
install_inkporter_cli
;;
4)
install_inkscape
install_inkporter_extension
install_inkporter_cli
;;
*)
echo "Option not find"
esac 
echo "installation completed!"
