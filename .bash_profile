# THIS FILE IS PART OF THE DOTFILES REPO
# PLEASE DO NOT EDIT DIRECTLY.
# 
# CREATE/EDIT .extra OR .path FOR LOCAL CUSTOMIZATIONS

# Load the shell dotfiles
for file in ~/.{path,bash_prompt,exports,bash_aliases,dotfiles_dir,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Extras for github codespaces
if [[ -v CODESPACES ]]; then
    if [ -f ~/.bash_codespaces ]; then
        . ~/.bash_codespaces
    fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Always have bun in path if available 
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun" 
    export PATH="$BUN_INSTALL/bin:$PATH" 
fi

# Always have deno in path if available
if [ -d "$HOME/.deno" ]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Always have NVM in path if available
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Always have global dotfile scripts in path
if [ -d "$HOME/scripts/global" ]; then
    export DOTFILES_GLOBAL_SCRIPTS="$HOME/scripts/global"
    export PATH="$DOTFILES_GLOBAL_SCRIPTS:$PATH"
fi