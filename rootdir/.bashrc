
# README
# this code should be inserted in .bashrc file

USR_FILE='unknown'
if [ $(expr match "$OSTYPE" 'cygwin') -ne 0 ] 
then USR_FILE=${HOME}/.vim/rootdir/cygwin/bashrc
else USR_FILE=${HOME}/.vim/rootdir/linux/bashrc
fi

if [ -f "${USR_FILE}" ]; then source "${USR_FILE}" ;fi
