#!/bin/sh
PATH=$PATH:/usr/local/bin:/usr/bin:
INDENT=indent

for file in $@
do
        if [ -f "$file" ]; then
                case $file in
                *.hxx | *.h | *.cpp| *.cc | *.cxx | *.c)
                        $INDENT ${INDENT_OPT} $file
                        sed -e "s/(  )/()/g" $file > $file.tmp
                        cp $file.tmp $file
                        ;;
                esac
        fi
done
