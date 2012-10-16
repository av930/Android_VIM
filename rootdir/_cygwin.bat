@echo off
REM 내컴퓨터->환경변수 설정에서 HOME 변수된 dir가 시작 dir로 된다. 이 dir은 변경가능함.
cd /D C:\DevTools\_Cygwin\bin
REM set CYGWIN=tty

REM rxvt -tn xterm -color -rv -sr -sw -sl 1000 -sbt 15 -fn Terminal -e /bin/bash --login -i
REM rxvt -tn xterm -rv -sr -sl 1000 -e bash --login -if
REM rxvt -tn xterm -rv -sr -sw -sl 9999 -geometry 130X70 -sbt 15 -fn Terminal -e bash --login -i

REM for console
REM rxvt.exe -rv -sr -sw -sl 9999 -fg black -bg white -fn Terminal -mcc -ls -g 120X70 -e /usr/bin/bash --login -i
REM for project
REM rxvt.exe -rv -sr -sw -sl 9999 -fg black -bg white -fn "Lucida Sans Typewriter" -fn 8x16 -mcc -ls -g 100X50 -e /usr/bin/bash --login -i
rxvt.exe -rv -sr -sw -sl 9999 -fg black -bg white -fn "Lucida Sans Typewriter" -mcc -ls -g 100X55 -e /bin/bash --login -i