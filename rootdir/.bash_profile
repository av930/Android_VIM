
# README
# this code should be inserted in .bashrc file

USR_FILE='unknown'
if [ $(expr match "$OSTYPE" 'cygwin') -ne 0 ] 
then USR_FILE=${HOME}/.vim/rootdir/cygwin/profile
else USR_FILE=${HOME}/.vim/rootdir/linux/profile
fi

if [ -f "${USR_FILE}" ]; then source "${USR_FILE}" ;fi

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then source "${HOME}/.bashrc"; fi


#Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi
