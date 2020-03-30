# load zgen  -*- mode: sh; -*-

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# These lines needs to be before loading oh-my-zsh
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/tig
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/fzf
    zgen oh-my-zsh plugins/gpg-agent
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/npx
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/gradle
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/nmap
    zgen oh-my-zsh plugins/last-working-dir
    zgen oh-my-zsh plugins/themes
    zgen oh-my-zsh plugins/mosh
    zgen oh-my-zsh plugins/cp
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/history-substring-search
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zaw
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-autosuggestions
    zgen load changyuheng/zsh-interactive-cd
    zgen load marzocchi/zsh-notify
    zgen load joel-porquet/zsh-dircolors-solarized
    zgen load djui/alias-tips
    zgen load Tarrasch/zsh-bd
    zgen load larkery/zsh-histdb
    # zgen load lukechilds/zsh-nvm

    # theme
    zgen oh-my-zsh themes/agnoster

    # save all to init script
    zgen save
fi

export FZF_BASE="/usr/bin/fzf"

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

tmb() {
    local WHERE=$TOMBS/$1
    tomb open "$TOMBS/$1.tomb" $WHERE -k "$TOMBS/$1.tomb.key" -g
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# Zaw
zstyle ':filter-select' max-lines 6 # use $LINES - 4 for filter-select
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

bindkey '^R' zaw-history
bindkey -M filterselect '^[j' down-line-or-history
bindkey -M filterselect '^[k' up-line-or-history
bindkey -M filterselect '^E' accept-search
bindkey '^P' zaw-process
bindkey '^F' zaw-open-file
bindkey '^[^M' autosuggest-execute
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export JAVA_HOME=/usr/lib/jvm/default
export DEFAULT_USER="sharp"
export GOPATH="$HOME/.go"
export ANDROID_HOME="/home/sharp/Android/Sdk"
export EDITOR=nvr
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"
export PYENV_ROOT="$HOME/.pyenv"
export LEDGER_FILE="$HOME/Notes/accounting/ledger.ledger"
export LEDGER_PRICE_DB="$HOME/Notes/accounting/price-db.ledger"
export TOMBS="$HOME/tombs"
export PASSWORD_STORE_TOMB_FILE="$TOMBS/pass.tomb" # for pass-tomb
export PASSWORD_STORE_TOMB_KEY="$TOMBS/pass.tomb.key" # for pass-tomb
export BORG_CONFIG_DIR="/home/sharp/borg"
export BORG_CACHE_DIR="/home/sharp/borg/cache"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500' "
alias e=$EDITOR
alias vim=nvim
alias down="aria2c --conf-path=${HOME}/.aria2/down.conf"
alias bdown="aria2c --conf-path=${HOME}/.aria2/bersam.conf"
alias tdown="aria2c --all-proxy=http://127.0.0.1:7777 --conf-path=${HOME}/.aria2/down.conf"
alias rdown="aria2c --enable-rpc --rpc-listen-port=6800 --rpc-listen-all=true --conf-path=${HOME}/.aria2/down.conf"
alias o='xdg-open'
alias xclip='xclip -selection clipboard'
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias tags="grep -orh '@.*' ~/Notes/journal | sort | uniq -c"
alias ledger="ledger --pedantic --explicit --strict"
alias whc="tig HEAD..origin/master"
alias tt="npm run test:enlite"
alias se="npm run start:enlite"
alias sd="npm run start:delite"
alias fs="flow status"
alias es="eslint"
alias tr="systemctl restart tor"
alias lg="journalctl -exfu"
alias dl="aria2c -x16"
alias gblu="git remote update origin --prune"
alias nord="nordvpn connect United_States New_York"
alias p="protonvpn"

export PATH=$PATH:$HOME/.cabal/bin
export PATH=$HOME/.bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
