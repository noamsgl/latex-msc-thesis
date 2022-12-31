#!/bin/bash
# This script converts a given pdf file, into png file with DRAFT watermark
#echo "$1"
input=$1


#filename=$(basename -- "$input") #strip dir
filename=$input #use abs/rel dir
# extension="${filename##*.}" #get extension

filename="${filename%.*}" #strip extension

#echo $filename

# fix no authorized problem on `Imagick`:
# https://alexvanderbist.com/posts/2018/fixing-imagick-error-unauthorized

#convert -density 150 $name.pdf -quality 90 $name.png

#the [0] is for overwriting output
#gray background
# convert -background "#f0f0f0" -alpha remove -alpha off -density 150 "$filename.pdf[0]" -quality 90 $filename.png

# convert -density 150 "$filename.pdf[0]" -background transparent -font "Impact" -pointsize 70 -stroke black -strokewidth 5 -fill "#F5F5F5" label:'DRAFT' \
          # -gravity Center -composite -quality 90 $filename.png

convert -density 150 "$filename.pdf[0]" -background transparent -font "Impact" -pointsize 70 -stroke black -strokewidth 3 -fill "rgba(125,125,125,.2)" label:'DRAFT' \
          -gravity Center -composite -quality 90 $filename.png
