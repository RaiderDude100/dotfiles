#!/bin/bash

# Run fzf with bat preview
FILE=$(fzf --algo=v2 +x -e +i --style=full --color=dark,pointer:red,border:blue,prompt:red --wrap --preview 'bat --style=header-filename,header-filesize,numbers -f --theme=auto --line-range :500 {}')

# If a file was selected, open it in nvim
if [[ -n "$FILE" ]]; then
    nvim "$FILE"
else
    echo "No file selected."
fi

