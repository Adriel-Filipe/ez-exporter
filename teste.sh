#!/bin/bash

read -p "qual a id:" id_logo

echo "$id_logo"
inkporter logo.svg $id_logo < ./public/export_profiles/RGB/png-rgb
mv $id_logo.png $id_logo+"-rgb".png