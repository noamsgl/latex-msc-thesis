#!/bin/bash
# This script looks for pdf recursively in `dirs`, then converts each pdf file, into png file with DRAFT watermark

dirs="2HOMER 3SeizurePrediction 4Spiking 6Appendix"
#dirs="Images"
for d in $dirs; do
	for input in $(find ../$d -name '*.pdf'); do
	    dest="${input%.*}.png" #replace ext
	    
	    if [ -f "$dest" ]; then
		    echo "'$dest' exists."
		else 
		    #echo "$dest does not exist."
		    
		    echo "Converting '$dest' ..."
		    ./pdf2png.sh "$dest"
		fi
	done
done


