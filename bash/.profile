# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "/var/lib/gems/1.8/bin" ] ; then
    PATH="/var/lib/gems/1.8/bin:$PATH"
fi

if [ -d "$HOME/work/flex/bin" ] ; then
    PATH="$HOME/work/flex/bin:$PATH"
fi

if [ -d "$HOME/local/node/bin" ] ; then
    PATH="$HOME/local/node/bin:$PATH"
fi

export RAILS_ENV=development
export NODE_ENV=development
export EDITOR=vi

