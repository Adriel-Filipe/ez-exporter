#!/bin/bash
echo "Welcome to ez-exporter installer"
echo "1) install inkscape"
echo "2) install inkporter extension"
echo "3) install inkporter cli"
echo "4) install ez-exporter"
echo "5) install all"

function install_inkscape() {
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update -y &&  sudo apt install inkscape -y
echo "Inkscape Installed!"
}
function install_inkporter_extension() {
sudo chmod 777 /usr/ /usr/share/ /usr/share/inkscape/ /usr/share/inkscape/extensions/
sudo cp -r ./public/inkporter_extension/* /usr/share/inkscape/extensions/
echo "inkporter extension installed!"
}
function install_inkporter_cli() {
sudo chmod 777 /usr/ /usr/local/ /usr/local/bin/
sudo cp -r ./public/inkporter /usr/local/bin/
sudo chmod +x /usr/local/bin/inkporter
echo "inkporter cli installed!"
}
function install_ez-exporter() {
sudo chmod 777 /usr/ /usr/local/ /usr/local/bin/
sudo cp -r ez-exporter /usr/local/bin/
sudo chmod +x /usr/local/bin/ez-exporter
mkdir /usr/share/ez-exporter/
sudo cp -r ./public/export_profiles /usr/share/ez-exporter/
echo "ez-exporter installed"
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
install_ez-exporter
;;
5)
install_inkscape
install_inkporter_extension
install_inkporter_cli
install_ez-exporter
;;
*)
echo "Option not find"
esac 
echo "installation completed!"
