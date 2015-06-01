#!/bin/sh
#generate tag file for lookupfile plugin
#echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > ~/.vim/filenametags
(echo "!_TAG_FILE_SORTED	2	/2=foldcase/";
find . \( -name .svn -o -wholename ./classes \) -prune -o -not -iregex '.*\.\(jar\|gif\|jpg\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' -type f -printf "%f\t%p\t1\n" \
	| sort -f) > ./filenametags
