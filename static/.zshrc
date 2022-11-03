# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# export LANG=sv_SE.UTF-8

# Load the shell dotfiles
for file in ~/.{path,exports,aliases,dotfiles_dir,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Extras for github codespaces
if [[ -v CODESPACES ]]; then
    if [ -f ~/.codespaces ]; then
        source ~/.codespaces
    fi
fi