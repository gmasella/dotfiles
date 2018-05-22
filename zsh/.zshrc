
# username to hide for themes
DEFAULT_USER="gdmsl"

# ignore certain commands from history
export HISTORY_IGNORE="cd:cd ..:ls:la:make"

# eval dircolors for ls
eval $(dircolors ~/.dircolors)

# color scheme for console theme
if [ "$TERM" = "linux" ]; then
    source $HOME/.vconsole_theme
    clear
fi

# start ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# show time for every program which run for more than 10 seconds
export REPORTTIME=10

# init screen
curl wttr.in/\?0
echo
echo "$fg[red]Last -Syu:$reset_color $(grep "pacman -Syu" /var/log/pacman.log | tail -n1 | cut -c 2- | cut -c-16)"
echo "$reset_color"

# include files in zsh folder
for file in `ls $HOME/.zsh/`; do
    [ -f $file ] && source $file
done

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle jump
antigen bundle git
antigen bundle archlinux
antigen bundle cp
antigen bundle tmux
antigen bundle github
antigen bundle history-substring-search
antigen bundle vi-mode
antigen bundle fasd
antigen bundle sudo
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply
