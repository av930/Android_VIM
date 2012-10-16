#!/bin/bash
TAGS=tags 
echo "$1/$TAGS will be created!"
echo "$1/$TAGS will be created!" > /dev/null
pushd $1
#should be asked whether TAGS is to be deleted or not
if [ -f ${TAGS} ]; then rm -f ${TAGS}; fi
time ctags -f ${TAGS}\
	--languages=C,C++,Asm,Java,Sh,Make,Python\
    --exclude=*.{js,html,htm,css,php,guess,log,txt}	\
    --sort=foldcase             \
	-R	\
	abi			\
	build			\
	bionic			\
	bootable		\
	dalvik			\
	development/samples/ApiDemos			\
	development/samples/HelloActivity		\
	device			\
	frameworks		\
	hardware		\
	libcore		\
	system			\
	vendor			\
	#

#remove special char from language encoding ex UTF-8
#or you can encounter "cstag is not ~~~~ "msg
if [ "CYGWIN" = "$(uname | grep CYGWIN -o)" ];then
    echo " running on cygwin"
    cat ${TAGS} | sed '1,/^\!/d' > ${TAGS}_
    mv ${TAGS}_ ${TAGS}
fi
popd

#option의 순서가 중요하네
#OmniCppComplete에서 클래스별 자동완성 기능
#--c++-kinds=+p --fields=+iaS --extra=+q --links=no
# -h filetype.txt	: 지원파일 확장자 등록파일
