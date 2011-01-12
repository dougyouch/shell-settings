#!/bin/bash

# Resource page
# https://github.com/remvee/emacs-rails

sudo apt-get install ruby-elisp

git clone https://github.com/remvee/emacs-rails.git ~/.emacs.d/emacs-rails

git clone git://github.com/remvee/emacs-rails.git ~/.emacs.d/rails-minor-mode

git clone git://github.com/eschulte/rhtml.git ~/.emacs.d/rhtml-minor-mode

svn co http://svn.clouder.jp/repos/public/yaml-mode/trunk/ ~/.emacs.d/yaml-mode

