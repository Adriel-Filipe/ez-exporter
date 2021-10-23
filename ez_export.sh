#!/bin/bash

#RGB - eps,jpg,png,svg
#CMYK - jpg,pdf,eps,svg

#make folders
if [ ! -d "Logotipo" ]; then
mkdir Logotipo
mkdir 'Padrão' RGB CMYK
mv 'Padrão' ./Logotipo
mv RGB CMYK ./Logotipo/'Padrão'/
fi

#// LOGO PADRÃO RGB // #

#PNG
inkporter logo.svg padrao < ./public/export_profiles/RGB/png-rgb
mv padrao.png padrao-rgb.png && mv padrao-rgb.png ./Logotipo/'Padrão'/RGB/


#EPS low quality
#inkporter logo.svg padrao < ./public/export_profiles/eps-rgb
#mv padrao.eps padrao-rgb.eps
#mv padrao-rgb.eps ./Logotipo/'Padrão'/RGB/

#JPG 
inkporter logo.svg padrao < ./public/export_profiles/RGB/jpg-rgb 
mv padrao.jpg padrao-rgb.jpg 
mv padrao-rgb.jpg ./Logotipo/'Padrão'/RGB

#SVG
inkporter logo.svg padrao < ./public/export_profiles/RGB/svg-rgb
mv padrao.svg padrao-rgb.svg
mv padrao-rgb.svg ./Logotipo/'Padrão'/RGB

#// LOGO PADRÃO CMYK // #
echo "fim do script"

#JPG
inkporter logo.svg padrao < ./public/export_profiles/CMYK/jpg-cmyk 
mv padrao.jpg padrao-cmyk.jpg 
mv padrao-cmyk.jpg ./Logotipo/'Padrão'/CMYK

#PDF
inkporter logo.svg padrao < ./public/export_profiles/CMYK/pdf-cmyk
mv padrao.pdf padrao-cmyk.pdf
mv padrao-cmyk.pdf ./Logotipo/'Padrão'/CMYK
