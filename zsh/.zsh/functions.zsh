#
# ~/.zsh/functions.zsh
#
# User defined functions

function avestc {
    ave --delimiter " " --noheaders $@ | column -s, -t
}

export -f avestc

function aveez {
    ave $@ | column -s, -t
}

export -f aveez
