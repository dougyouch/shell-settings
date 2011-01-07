
LS='/bin/ls'
if ($LS --color >& /dev/null); then
  alias dir="$LS --color -algF"
  alias l="$LS --color -olgF"
  alias la="$LS --color -a"
  alias ls="$LS --color -lF"
  alias lt="la --color -rt"
elif ($LS -o >& /dev/null); then
  alias dir="$LS -oalgF"
  alias l="$LS -olgF"
  alias la="$LS -a"
  alias ls="$LS -lF"
  alias lt="la -rt"
else
  alias dir="$LS -algF"
  alias l="$LS -lgF"
  alias la="$LS -a"
  alias ls="$LS -F"
  alias lt="la -rt"
fi  

# pick xemacs if we have a choice (and here I assume it is XEmacs

if (which xemacs >& /dev/null); then
  alias emacs='xemacs'
fi

alias du="du -h"
alias df="df -h"
alias zip='zip -y'
alias mx='nslookup -query=mx'

