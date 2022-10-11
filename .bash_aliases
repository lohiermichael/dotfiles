alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -l'
alias la='ls -lA'
alias mkdir='mkdir -p'

function mcd() {
    mkdir "$1" && cd "$1"
}

# enable color in man pages: bold is CYAN, underline is GREEN
function man() {
	LESS_TERMCAP_md=$'\e[1;36m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[1;32m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	GROFF_NO_SGR=1 \
	command man "$@"
}

# ssh connections
alias ssho='ssh 6WIND-out-VPN'
alias sshi='ssh 6WIND-in-VPN'

alias v='vim'
alias vi='vim'
