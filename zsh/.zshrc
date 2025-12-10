# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------- Oh My Zsh --------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"  # or switch to powerlevel10k for max speed

# Use only one syntax highlighter (fastest)
plugins=(
  git
  fast-syntax-highlighting
)

# -------- Improve startup speed --------

# Enable compinit caching
zstyle ':completion:*' rehash true
autoload -Uz compinit
compinit -C

# Faster completion feedback
COMPLETION_WAITING_DOTS="true"

# -------- Remove slow plugin auto-installer --------
# (This caused a slowdown every shell start)

# -------- User configuration --------
alias ls="eza --icons -lh"
alias mysql="~/.config/hypr/scripts/mysql.sh"
alias cp="rsync -a --info=progress2"

# zoxide (fast)
eval "$(zoxide init zsh --cmd cd)"

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="vim"

# Load Oh My Zsh last
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

