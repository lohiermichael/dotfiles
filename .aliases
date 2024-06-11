# Enable easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lh'
alias la='ls -lhA'
alias mkdir='mkdir -p'

function mcd() {
    mkdir "$1" && cd "$1"
}

# Enable color in man pages: bold is CYAN, underline is GREEN
function man() {
	LESS_TERMCAP_md=$'\e[1;36m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[1;32m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	GROFF_NO_SGR=1 \
	command man "$@"
}

alias n='nvim'
alias nv='nvim'

alias v='vim'
alias vi='vim'

# Always use python3
alias python='python3'
alias pip='pip3'

# Utils
alias dotfiles='code ~/dev/config/dotfiles'
