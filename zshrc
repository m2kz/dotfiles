# If you come from bash you might have to change your $PATH.
export PATH=$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/`whoami`/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast autopep8 common-aliases compleat debian dircycle history pip pyenv pylint python taskwarrior tmux web-search git git-extras sudo git-extra-commands zsh-syntax-highlighting zsh-autosuggestions git-flow-avh tig tmuxinator)

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
