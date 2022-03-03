# env

export SHELL=$(which zsh)
export PATH="$HOME/.local/bin:$PATH"

# aliases
alias ls='exa --icons'
alias la='exa --icons -la'
alias tree='exa --icons --tree'
alias cat='bat --theme base16 --paging=never --style=plain'
alias g='copier -c github_token 2>&1 > /dev/null && git'
alias clear='clear && pfetch'

# startup
function startup {
  pfetch
}

startup

# prompt

eval "$(starship init zsh)"
