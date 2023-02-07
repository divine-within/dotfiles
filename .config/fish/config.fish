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
set -gx PATH /usr/local/go/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

#Pywal on shell startup
if type -q wal
    command cat ~/.cache/wal/sequences
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# Docker daemon
# Check if it's running on WSL
if [ (uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
    if service docker status 2>&1 | grep -q "is not running"; 
        wsl.exe -u root -e /usr/sbin/service docker start >/dev/null 2>&1
    end
end

