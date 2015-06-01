#!/bin/bash

tounix () {
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            tounix $1"/"$file
        else
            dos2unix $1"/"$file
            #echo $1"/"$file
        fi
    done
}
