#!/bin/sh

konsole -e tmux new dotfiles/scripts/timewarrior.sh \; split-window "/bin/sh -c 'timew help; exec zsh'" \;
