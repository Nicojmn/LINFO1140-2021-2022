#!/bin/bash

DIR=$1
ROOT="/home/nicolas/UCL/BAC1-Q2/LINFO1140-electronique/travaux/2021-2022/LINFO1140-2021-2022"

if [ -d "$DIR" ]; then
    zip -r ./"$DIR"/"$DIR"-Simu-Jeanmenne-Nicolas.zip ./"$DIR"/simu
    cp -a "$DIR"/build_latex/main.pdf "$DIR"/
    mv "$DIR"/main.pdf "$DIR"/Rapport-Jeanmenne-Nicolas.pdf
    find "$ROOT" -name "*.log" -or -name "*.aux" -name "*.fls" -name "*.maf" -name "*.mtc*" -name "*.out" -name "*.synctex*" -delete 
else
    echo "Directory not found, aborting." && exit 1
fi

exit 0