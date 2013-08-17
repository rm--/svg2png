#! /bin/bash

#=========================================================
#author: René Muhl
#from: Leipzig, Germany
#last change: 16.7.2013
#email: ReneM{dot}github{at}gmail{dot}com
#=========================================================


background="black"
#########################

if [[ -z $1 ]]; then
	if [[ -z $2 ]]; then
  		echo "start program with \"./svg2png.sh \"input folder name\" \"output folder name\"\""
  		#example "./svg2png.sh input output"
		exit
	fi
fi

inputpath=$1
outputpath=$2
if [[ ! -d "$inputpath"  ]]; then
 	echo "$inputpath doesn't exists"
 	exit
fi 
	
if [[ ! -d "$outputpath"  ]]; then
 	echo "$outputpath doesn't exists"
 	mkdir -p "$outputpath"
 	if [[ ! -d "$outputpath" ]]; then
 		echo "couldn't create %outputpath"
 		exit
 	fi
fi 


images=`ls "$inputpath"`
for img in $images
do
	extension=`echo "$img" | awk -F. '{print $2}'`
	if [[ "$extension" = "svg" ]]; then
		echo "file: $img"
		newFilename=`echo "$img" | awk -F. '{print $1}'`
		newFilename+=".png"
		echo "./$outputpath/$newFilename"
		convert -background "$background" "./$inputpath/$img" "./$outputpath/$newFilename"
	fi
done
