#!/bin/bash
# NEED FIX
# EPS EXPORT LIKE A BITMAP IMAGE
# I think the JPG-CMYK export on RGB

#RGB - eps,jpg,png,svg
#CMYK - jpg,pdf,eps,svg
dir_profiles=""

echo "-----------"
echo "eZ-exporter"
echo "-----------"
echo ""
echo "by Adriel Filipe"

read -p "type logo id:" id_logo

#make folders
if [ ! -d "Logotipo" ]; then
mkdir Logotipo
fi

if [ ! -d "./Logotipo/$id_logo" ]; then
mkdir $id_logo RGB CMYK
mv $id_logo ./Logotipo
mv RGB CMYK ./Logotipo/$id_logo/
fi

echo "Whats is your logo version?"
echo "1) Colorfull"
echo "2) Positive"
echo "3) Negative"
read -p  "logo version:" logo_version

case "$logo_version" in
1)
dir_profiles="COLOR"
;;
2)
dir_profiles="POSITIVE"
;;
3)
dir_profiles="NEGATIVE"
;;
*)
echo "option not find!"
esac

# // RGB EXPORT // #

#PNG
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/RGB/png-rgb
mv $id_logo.png "$id_logo-rgb.png" && mv $id_logo-rgb.png ./Logotipo/$id_logo/RGB/
#JPG 
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/RGB/jpg-rgb 
mv $id_logo.jpg "$id_logo-rgb.jpg" && mv $id_logo-rgb.jpg ./Logotipo/$id_logo/RGB
#SVG
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/RGB/svg-rgb
mv $id_logo.svg "$id_logo-rgb.svg" && mv $id_logo-rgb.svg ./Logotipo/$id_logo/RGB
#EPS
inkporter logo.svg $id_logo <./public/export_profiles/$dir_profiles/RGB/eps-rgb
mv $id_logo.eps "$id_logo-rgb.eps" && mv $id_logo-rgb.eps ./Logotipo/$id_logo/RGB

#// CMYK EXPORT // #

#JPG
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/CMYK/jpg-cmyk 
mv $id_logo.jpg "$id_logo-cmyk.jpg" && mv $id_logo-cmyk.jpg ./Logotipo/$id_logo/CMYK
#PDF
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/CMYK/pdf-cmyk
mv $id_logo.pdf "$id_logo-cmyk.pdf" && mv $id_logo-cmyk.pdf ./Logotipo/$id_logo/CMYK
#EPS
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/CMYK/eps-cmyk
mv $id_logo.eps "$id_logo-cmyk.eps" && mv $id_logo-cmyk.eps ./Logotipo/$id_logo/CMYK
#SVG
inkporter logo.svg $id_logo < ./public/export_profiles/$dir_profiles/CMYK/svg-cmyk
mv $id_logo.svg "$id_logo-cmyk.svg" && mv $id_logo-cmyk.svg ./Logotipo/$id_logo/CMYK