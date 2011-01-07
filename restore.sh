#!/bin/bash

SCRIPT=`readlink -f $0`
BASEDIR=`dirname $SCRIPT`

echo "Restore Bash settings"
cd $BASEDIR/bash
cp -fv .bashrc .profile .bash_aliases $HOME

echo "Restore Shell scripts"
cd $BASEDIR/bin
tar cvf - . | ( cd $HOME/bin; tar xBpf -)

echo "Restore Emacs files"
cd $BASEDIR/xemacs
tar cvf - . | ( cd $HOME/.xemacs; tar xBpf -)
