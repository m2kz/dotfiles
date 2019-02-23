export PATH=$PATH
export ZSH=/home/`whoami`/.oh-my-zsh
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(autopep8 common-aliases compleat debian dircycle history pip pyenv pylint python taskwarrior tmux web-search git sudo zsh-syntax-highlighting zsh-autosuggestions tmuxinator colorize colored-man-pages)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$HOME/bin:$PATH
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
	. ~/.config/exercism/exercism_completion.zsh
fi
source $HOME/.cargo/env

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:/usr/local/go/bin:$HOME/nixnote2/appdir:$HOME/go/bin:$HOME/diff-so-fancy:/snap/bin:$HOME/.local/bin:$HOME/dotfiles/scripts
eval $(thefuck --alias)
source $HOME/.antigen/antigen.zsh
antigen theme geometry-zsh/geometry
antigen apply
export LFS=/mnt/lfs
alias ping='ping 8.8.8.8'
export EDITOR=nvim
. $HOME/z/z.sh
alias la="exa -abghl --git --color=automatic"
alias c='pygmentize -O style=colorful -f console256 -g'
# source /etc/profile.d/rvm.sh
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
webpage_title (){
    wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null
}

read_and_review (){
    link="$1"
    title=$(webpage_title $link)
    echo $title
    descr="\"Read and review: $title\""
    id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

alias rnr=read_and_review
bkr() {
    (nohup "$@" &>/dev/null &)
}
alias mux=tmuxinator
# export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"
# export IDF_PATH=$HOME/esp/esp-idf
fpath=(~/bin/ $fpath)
alias mountp='mount | column -t'
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
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
alias zshedit="nvim ~/.zshrc"

function mkcd() {
  mkdir -p "$1" && cd "$1"
}
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
