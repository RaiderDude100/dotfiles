# Greeting
set -g fish_greeting ""

# Env
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less

# Aliases
abbr -a ls 'eza --icons -lh'
abbr -a mysql '~/.config/hypr/scripts/mysql.sh'
abbr -a cp 'rsync -a --info=progress2'
alias cd=z
zoxide init fish | source

