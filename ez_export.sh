#!/bin/bash
#EPS EXPORT LIKE A BITMAP IMAGE

#RGB - eps,jpg,png,svg
#CMYK - jpg,pdf,eps,svg

read -p "type our logo id:" id_logo

#make folders
if [ ! -d "Logotipo" ]; then
mkdir Logotipo
mkdir $id_logo RGB CMYK
mv $id_logo ./Logotipo
mv RGB CMYK ./Logotipo/$id_logo/
fi

#// RGB EXPORT // #

#PNG
inkporter logo.svg $id_logo < ./public/export_profiles/RGB/png-rgb
mv $id_logo.png $id_logo-rgb.png && mv $id_logo-rgb.png ./Logotipo/$id_logo/RGB/

#JPG 
#inkporter logo.svg $id_logo < ./public/export_profiles/RGB/jpg-rgb 
#mv $id_logo.jpg $id_logo-rgb.jpg && mv $id_logo-rgb.jpg ./Logotipo/$id_logo/RGB

#SVG
#inkporter logo.svg $id_logo < ./public/export_profiles/RGB/svg-rgb
#mv $id_logo.svg $id_logo-rgb.svg && mv $id_logo-rgb.svg ./Logotipo/$id_logo/RGB

#// CMYK EXPORT // #

#JPG
#inkporter logo.svg $id_logo < ./public/export_profiles/CMYK/jpg-cmyk 
#mv $id_logo.jpg $id_logo-cmyk.jpg && mv $id_logo-cmyk.jpg ./Logotipo/$id_logo/CMYK

#PDF
#inkporter logo.svg $id_logo < ./public/export_profiles/CMYK/pdf-cmyk
#mv $id_logo.pdf $id_logo-cmyk.pdf && mv $id_logo-cmyk.pdf ./Logotipo/$id_logo/CMYK