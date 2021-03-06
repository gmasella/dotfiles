# needed because of leaking emulate -L sh on the cluster
emulate -R zsh

# source local definitions
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# ignore certain commands from history
export HISTORY_IGNORE="cd:cd ..:ls:la:make"
export HISTFILE="$HOME/.zsh_history"

eval "$(dircolors ~/.dircolors)"

# color scheme for console theme
if [ "$TERM" = "linux" ]; then
    source $HOME/.vconsole_theme
    clear
fi

# show time for every program which run for more than 10 seconds
export REPORTTIME=10

# init screen
fortune -s

if which pacman &> /dev/null; then
    echo ""
    echo "$fg[red]Last -Syu:$reset_color $(grep "pacman -Syu" /var/log/pacman.log | tail -n2 | head -n1 | cut -c 2- | cut -c-16)"
    echo "$reset_color"
fi

# include files in zsh folder
for file in $HOME/.zsh/*; do
    if [ -e "$file" ]; then
        source $file
    fi
done

################################## zplug ######################################

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update
fi

# use zplug
source ~/.zplug/init.zsh

# PACKAGES

# Oh my zsh libs
zplug "lib/*", from:oh-my-zsh

# oh my zsh plugins
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "plugins/git-extras", from:oh-my-zsh, if:"which git"
zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux"
zplug "plugins/tmuxinator", from:oh-my-zsh, if:"which tmuxinator"
zplug "plugins/fasd", from:oh-my-zsh, if:"which fasd"
zplug "plugins/archlinux", from:oh-my-zsh, if:"which pacman"
zplug "plugins/cargo", from:oh-my-zsh, if:"which cargo"
zplug "plugins/vagrant", from:oh-my-zsh, if:"which vagrant"
zplug "plugins/rsync", from:oh-my-zsh, if:"which rsync"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh, defer:1
zplug "plugins/jump", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0

# Theme!
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Syntax highlighting for commands, load last
zplug "plugins/history-substring-search", from:oh-my-zsh, defer:2
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# FZF
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*linux*amd64*"
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# hook direnv into the shell
if (( $+commands[direnv] )); then eval "$(direnv hook zsh)"; fi

# bindkeys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# remove aliases
unalias cp
unalias mv
unalias rm
