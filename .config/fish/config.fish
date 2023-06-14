set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Go
set -gx GOPATH ~/go
set -gx GOBIN $GOPATH/bin/
set -gx PATH /usr/local/go/bin $PATH
set -gx PATH $GOPATH/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Lua
set -gx PATH ~/.config/lsp/lua-language-server/bin $PATH

#Pywal on shell startup
if type -q wal
    command cat ~/.cache/wal/sequences
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# WSL
if [ (uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
    # Docker daemon
    if service docker status 2>&1 | grep -q "is not running"; 
        wsl.exe -u root -e /usr/sbin/service docker start >/dev/null 2>&1
    end

    # Clear memory - WSL2
    #   Details: https://github.com/microsoft/WSL/issues/4166#issuecomment-628493643
    alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""
end

# TMUX
if status is-interactive
and not set -q TMUX
    exec tmux new-session -A -s main
end

