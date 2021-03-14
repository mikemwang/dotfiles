fpath=($ZDOTDIR/external $fpath)

# load our aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# autocomplete
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source "$DOTFILES/zsh/external/completion.zsh"

# pretty prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# directory stack, press d to see list of last 10 visited dirs
# press 1-9 to go to that dir
setopt AUTO_PUSHD  # Push the current directory visited on to the stack.
setopt PUSHD_IGNORE_DUPS  # Do not store duplicate directories in the stack
setopt PUSHD_SILENT  # Do not print the directory stack after using

# leave insert mode in the command line with esc
bindkey -v
export KEYTIMEOUT=1

# bar cursor in insert mode, block cursor in normal mode
autoload -Uz cursor_mode && cursor_mode

# navigate the completion menu using vim keys
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# edit commands using nvim. press esc to enter normal mode,
# then press n to open the editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd n edit-command-line

# allows us to jump back multiple dirs without cd ../../../ etc
source "$DOTFILES/zsh/external/bd.zsh"

# verify that the fzf command exists and source it if so
# C+t search for a file in the current dir and sub dirs
# C+r search for entry in command history
# Alt+c change working dir to a subdir
# kill + TAB will fuzzy search processes
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# custom scripts
source $DOTFILES/zsh/scripts.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
