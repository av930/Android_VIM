#!/bin/bash
rm -f cscope.*
find $PWD \( -name "*.S" -o\
           -name "*.c" -o\
           -name "*.cpp" -o\
           -name "*.h" -o\
           -name "*.java" -o\
           -name "*.xml" -o\
           -name "*.rc" -o\
           -name "*.map" -o\
           -name "*.bat" -o\
           -name "*.cmm" -o\
           -name "makefile" -o\
           -name "Makefile" -o\
           -name "*.mak" -o\
           -name "*.mk" \) -print > cscope.files
cscope -i cscope.files           
