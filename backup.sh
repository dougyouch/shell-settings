#!/bin/bash

SCRIPT=`readlink -f $0`
BASEDIR=`dirname $SCRIPT`

echo "Backup Bash settings"
cd $HOME
cp .bashrc .profile .bash_aliases $BASEDIR/bash/.

echo "Backup Shell scripts"
cd $HOME/bin
tar cvf - . | ( cd $BASEDIR/bin/.; tar xBpf -)

echo "Backup Emacs files"
cd $HOME/.xemacs
tar cvf - . | ( cd $BASEDIR/xemacs/.; tar xBpf -)