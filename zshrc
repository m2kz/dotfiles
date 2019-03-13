export PATH=$PATH
export ZSH=/home/`whoami`/.oh-my-zsh
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(branch gitfast autopep8 common-aliases compleat debian dircycle extract ssh-agent zsh-syntax-highlighting zsh-autosuggestions taskwarrior tmux web-search git sudo tig colorize colored-man-page emacs)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$HOME/bin:$PATH
source $HOME/.cargo/env
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:/usr/local/go/bin:$HOME/nixnote2/appdir:$HOME/go/bin:$HOME/diff-so-fancy:/snap/bin:$HOME/dotfiles/scripts
export PATH=$HOME/.local/bin:$PATH
eval $(thefuck --alias)
source $HOME/.antigen/antigen.zsh
antigen theme geometry-zsh/geometry
antigen apply
alias ping='ping 4.2.2.1'
source $HOME/z/z.sh

alias in='task add +in'
export PS1='$(task +in +PENDING count) '$PS1
tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle
alias think='tickle +1d'
alias rnd='task add +rnd +next +@computer +@online'
bkr() {
    (nohup "$@" &>/dev/null &)
}
fpath=(~/bin/ $fpath)
alias mountp='mount | column -t'
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export TERM="xterm-256color"
NPM_PACKAGES="${HOME}/.npm-packages"
alias gs='gss'
PATH="$NPM_PACKAGES/bin:$PATH"
alias ack='ag'
alias o='xdg-open'
alias d='cd ~/dotfiles'
alias memoryhog="ps aux | sort -nk +4 | tail -n 20"
alias wget='wget -c'

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

alias e="emacsclient -t -a ''"
alias eb="emacsbare"
alias ec="emacsclient -c -n -a ''"
alias vim="e"
alias vi="e"

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' rehash true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' accept-exact-dirs true
# Pretty messages during pagination
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Nicer format for completion messages
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'
zstyle ':completion:*:warnings' format '%F{202}%BSorry, no matches for: %F{214}%d%b'

# Show message while waiting for completion
zstyle ':completion:*' show-completer true

# Prettier completion for processes
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,args -w -w"

alias sl='sl -e' # no fun allowed
alias -g LOL='| lolcat'
function cheat() {
      curl cht.sh/$1
}
alias fx='firefox --new-instance --profile $(mktemp -d)'
