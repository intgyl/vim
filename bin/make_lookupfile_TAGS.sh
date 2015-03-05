#!/bin/sh

# generate tag file for lookupfile plugin

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> TAGS 

find . -not -regex '.*\.\(png\|gif\)'  ! -path "*.git*" -type f -printf "%f\t%p\t1\n" | sort -f>> TAGS
