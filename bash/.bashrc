#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $HOME/.bin/autocomplete

export TERM='rxvt-unicode'
export BROWSER='firefox'
export EDITOR='nvim'
export VISUAL='nvim'
export RHISK_COMM='zenbu'
export MPD_HOST='127.0.0.1'
export MPD_PORT='6600'
export PATH="$PATH:/$HOME/.bin"
export PATH="$PATH:/$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

# HISTORY
HISTCONTROL='ignoredups:ignorespace'
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE='wipe*:upd*'

# ALIAS
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -vr'
alias df='df -h'
alias ps='ps -ef'
alias free='free -m'
alias h='history'
alias c='clear'
alias q='exit'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --group-directories-first --color=auto'
alias la='ls -alhF --color=auto'

# PACMAN
alias upd='pikaur -Syu'
alias pac='sudo pacman -S'
alias pac?='pacman -Q | grep'
alias pkgcnt='pacman -Q | wc -l'

# PATH
alias ~='cd $HOME'
alias .bin='cd $HOME/.bin'
alias .dot='cd $HOME/.dotfiles'

# GIT
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# FFF
export FFF_LS_COLORS=1
export FFF_COL1=4
export FFF_COL2=0
export FFF_COL3=3
export FFF_COL4=8
export FFF_COL5=7

# OTHER
alias v='nvim'
alias rt='rtorrent'
alias mixer='alsamixer'
alias wttr='curl wttr.in'
alias rtx='curl rate.sx'
alias tren='trans -shell en:ru'
alias trru='trans -shell ru:en'
alias how='function hdi(){ howdoi $* -c -n 5; }; hdi'
alias ytdl='yt-dlp -f best[ext=mp4]/bestvideo[ext=mp4]+bestaudio[ext=m4a]/best'
alias webcam='mpv --demuxer-lavf-o=video_size=1280x720,input_format=mjpeg av://v4l2:/dev/video0 --profile=low-latency'

#PS1="\[$(tput setaf 4)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 4)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 4)\]└────╼\"; else echo \"\[$(tput setaf 4)\]└╼\"; fi) \[$(tput setaf 7)\]"
PS1='\[$(tput setaf 7)\]\w\[$(tput setaf 12)\]$(parse_git_branch) \[$(tput setaf 9)\]» \[$(tput setaf 7)\]'

# - Functions -

# Extract archive
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# show listening port
port() {
  sudo ss -tulpn | awk '{printf "%-6s %-9s %-19s %s\n", $1, $2, $5, $7}'
}

# mkdir & cd into it
mdcd() {
	mkdir -p "$@" && cd "$@"
}

# ls after a cd
function cd() {
 builtin cd "$*" && ls
}

# Upload-file | Usage : share /path/to/file.foo
share() {
  curl -F"file=@$*" https://0x0.st
}

ipinfo() {
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	curl ipinfo.io/"$1"
    else
	ipawk=($(hostname "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

random_password() {
  length=${1:-10}
  which openssl &> /dev/null && (openssl rand -base64 "$length" | head -c "$length") && echo
  tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c"${1:-$length}" && echo
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Touch with script shebang
touchx() {
  [ ! "$1" ] && return 1
  cat <<< "#!/usr/bin/env ${2:-bash}" > "$1"
  chmod +x "$1"
}

# pyenv configs
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
#
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init --path)"
#   eval "$(pyenv virtualenv-init -)"
# fi
