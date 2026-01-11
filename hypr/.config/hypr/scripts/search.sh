#!/bin/sh

# Run fzf with bat preview
FILE=$(fzf --algo=v1 -e --preview 'bat --style=numbers --color=always --line-range :500 {}')

# If a file was selected, open it in vim
if [[ -n "$FILE" ]]; then
    nvim "$FILE"
else
    echo "No file selected."
fi

