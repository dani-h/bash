export ZSH=/home/dani/.oh-my-zsh
ZSH_THEME="sorin"
plugins=(vi-mode git web-search)

#--------------------------------
# Bindings
#--------------------------------
bindkey -M vicmd q vi-backward-word

#--------------------------------
# Paths
#--------------------------------
export dotfiles=~/.dotfiles
export repos=~/repos
export plugged=~/.vim/plugged
export GOROOT=/opt/go
export GOPATH=/opt/go_pkg
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export NVM_DIR=~/.nvm
export PATH=$PATH:/opt/eclipse
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
# Fixes colors for lxde-terminal. Useful for vim colorschemes
export TERM="xterm-256color"
export EDITOR=neovim
export PYTHONSTARTUP=~/.pythonrc

#--------------------------------
# Aliases
#--------------------------------
alias sh="bash"
alias gno="gnome-open"
alias reboot="sudo reboot"
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias h="history"
alias cd-="cd -"
alias ls='ls --color=auto --classify'
alias aptupgrade="sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade"
alias xkbmapcaps="setxkbmap -option caps:swapescape"
alias ddmenu="dmenu_run -fn '-*-fixed-*-*-*-*-20-*-*-*-*-*-*-*' -l 5 -i"
alias vi='nvim'
alias gvi='/opt/nvim-qt/nvim-qt'
alias gs='git status'
alias example=bro
# Allows 256 colors as background in terminal, used for Vi
alias tmux="tmux -2"

# cd && ls
function chpwd() {
    emulate -L zsh
    ls
}

source $ZSH/oh-my-zsh.sh
source $NVM_DIR/nvm.sh
source $NVM_DIR/bash_completion
source $dotfiles/scripts/z.sh
source /usr/local/bin/virtualenvwrapper.sh