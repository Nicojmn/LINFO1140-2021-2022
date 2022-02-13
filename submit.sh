#!/bin/bash

DIR=$1
NUM=$2

if [ -d "$DIR" ]; then
    cd ./"$DIR"/simu
    zip -r ./"$DIR"-Simu-Jeanmenne-Nicolas.zip ./*
    cd ../..
    cp -a "$DIR"/build_latex/main.pdf "$DIR"/
    mv "$DIR"/main.pdf "$DIR"/Rapport"$NUM"-Jeanmenne-Nicolas.pdf
else
    echo "Directory not found, aborting." && exit 1
fi

exit 0