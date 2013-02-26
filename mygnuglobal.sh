#!/bin/bash
DIRS=$1
TAGS=gtags.files
echo "$DIRS/${TAGS} will be created!"
pushd $1

#should be asked whether TAGS is to be deleted or not
if [ -f ${TAGS} ]; then rm -f ${TAGS##*/}.*; fi

#base dir 
#exclude dir list
#include file extension
time find ${DIRS} 				\
	-path "$DIRS/kernel_goldfish"			-prune -o\
	-path "$DIRS/kernel_galaxynexus"			-prune -o\
	-path "$DIRS/out"			-prune -o\
	-path "$DIRS/external"			-prune -o\
	-path "$DIRS/external/apache-harmony"			-prune -o\
	-path "$DIRS/external/tagsoup"			-prune -o\
	-path "$DIRS/development/apps"			-prune -o\
	-path "$DIRS/packages"		-prune -o\
	-path "$DIRS/libnativehelper"			-prune -o\
	-path "$DIRS/prebuilt"			-prune -o\
	-path "$DIRS/prebuilts"		-prune -o\
	-path "$DIRS/sdk"			-prune -o\
	-path "$DIRS/ndk"		-prune -o\
	-path "$DIRS/gdk"		-prune -o\
	-path "$DIRS/pdk"		-prune -o\
	-path "$DIRS/cts"			-prune -o\
	-path "$DIRS/docs"			-prune -o\
	-path "$DIRS/.repo"			-prune -o\
           \(\
           -name "*.[cChHxsS]" -o\
           -name "*.cpp" -o\
           -name "*.java" -o\
           -name "*.xml" -o\
           -name "*.rc" -o\
           -name "*.map" -o\
           -name "*.bat" -o\
           -name "*.cmm" -o\
		   -name "*.sh" -o\
		   -name "*.py" -o\
           -name "makefile" -o\
           -name "Makefile" -o\
           -name "*.mak" -o\
           -name "*.mk" \) \
    -print > $TAGS
# -b : not using cscope ui, -q : inverted index, 
gtags -f $TAGS
