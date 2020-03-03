#
# ~/.profile
#

# source global profile
source /etc/profile

# setting the PATH envirorment variable
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# library path
export LD_LIBRARY_PATH="$HOME/.local/lib64:$HOME/.local/lib:$LD_LIBRARYPATH"

# go path
export GOPATH="$GOPATH:$HOME/Variable/go"
export PATH="$PATH:$GOPATH/bin"

# python path
export PYTHONUSERBASE="$HOME/Variable/python3"
export PYTHONPATH="$PYTHONUSERBASE/lib/python3.7/site-packages:$PYTHONPATH"
export PATH="$PYTHONUSERBASE/bin:$PATH"

# Experience tell me that it's rather impossible to make vdpau
# .. work with my discrete nvidia with OPTIMUS. So maybe i can make use
# .. of hardware acceleration with my Intel card
if [ "$HOST" = "rubick" ]; then
    export VDPAU_DRIVER=va_gl
elif [ "$HOST" = "spectre" ]; then
    export VDPAU_DRIVER=va_gl
elif [ "$HOST" = "tachanka" ]; then
    export VDPAU_DRIVER=va_gl
fi

# Enabling AntiAliasing for applications using the
# .. java virtual machine and use gtk default look and feel
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Default text editor
export EDITOR="nvim"

# Default browser
export BROWSER="firefox"

# Default terminal emulator
export TERMINAL="gnome-terminal"

# Start gnome keyring
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Ruby
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Rust Path, if any
[ -e "$HOME/.cargo/env" ] && source $HOME/.cargo/env

# Julia
# I am really tired of problems with julia and dynamic system libraries,
# so I will be using the binary releases directly from the Julia website.
# It is full julia developers fault here.
if [ -f "$HOME/Software/julia-current/bin/julia" ]; then
    export PATH="$HOME/Software/julia-current/bin:$PATH"
fi

# FASD
if which fasd &> /dev/null; then
    eval "$(fasd --init auto)"
fi

# linux brew
if [ -d $HOME/.linuxbrew ]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
fi

# keys for xmodmap
if [ -f $HOME/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

export QT_QPA_PLATFORMTHEME=gtk2

# Use ripgrep as default grep in fzf (and fzf.vim)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

