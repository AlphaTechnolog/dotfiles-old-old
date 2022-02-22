# exit if not in interactive mode
status -i || exit

set fish_greeting ""

# aliases
alias ls='exa --icons'
alias la='exa --icons -la'
alias tree='exa --icons --tree'
alias cat='bat --theme base16 --paging=never --style=plain'
alias g='copier -c github_token 2>&1 > /dev/null && git'
alias clear='clear && pfetch'

# color
set fish_color_normal brwhite
set fish_color_command brblue
set fish_color_param brcyan
set fish_color_error brred

# vi-mode
set fish_cursor_default line
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_color_quote brgreen

# prompt
starship init fish | source

# startup
pfetch
