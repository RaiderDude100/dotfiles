# Greeting
set -g fish_greeting ""

# Env
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less

# Aliases
alias ls='eza --icons -lha'
alias mysql='~/.config/hypr/scripts/mysql.sh'
alias cp='rsync -a --info=progress2'
zoxide init fish | source
alias cd=z

