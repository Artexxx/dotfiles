if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sets tools
set -x EDITOR nvim
set -x VISUAL nvim
set -g EDITOR nvim
set -g TERM kitty
set TERM "xterm-kitty"

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0
set -x FZF_DEFAULT_OPTS "--color=16,header:13,info:5,pointer:3,marker:9,spinner:1,prompt:5,fg:7,hl:14,fg+:3,hl+:9 --inline-info --tiebreak=end,length --bind=shift-tab:toggle-down,tab:toggle-up"

# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -g theme_nerd_fonts yes

if type -q bat
    alias cat="bat --paging=never"
    set -x -U BAT_THEME "base16"
end

if status --is-login
    set -gx PATH $PATH ~/.bin
    set -gx PATH $PATH ~/.local/bin
    set -gx PATH $PATH $HOME/.foundry/bin
end

# go
set -x GOPATH "$HOME/go"
set -x PATH "$HOME/go/bin" $PATH
set -x PATH "$HOME/.go/current/bin" $PATH
# Set GOPATH
set -Ux GOPATH $XDG_DATA_HOME/go
fish_add_path $GOPATH/bin

# rust
set -x PATH "$HOME/.cargo/bin" $PATH

# haskell
set -x PATH "$HOME/.cabal/bin" $PATH

# colors to set or unset

set fish_color_autosuggestion "#969896"
set fish_color_cancel -r
set fish_color_command "#0782DE"
set fish_color_comment "#f0c674"
set fish_color_cwd "#008000"
set fish_color_cwd_root red
set fish_color_end "#b294bb"
set fish_color_error "#fb4934"
set fish_color_escape "#fe8019"
set fish_color_history_current --bold
set fish_color_host "#85AD82"
set fish_color_host_remote yellow
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator "#fe8019"
set fish_color_param "#81a2be"
set fish_color_quote "#b8bb26"
set fish_color_redirection "#d3869b"
set fish_color_search_match bryellow background=brblack
set fish_color_selection white --bold background=brblack
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description "#B3A06D" yellow
set fish_pager_color_prefix normal --bold underline
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_progress brwhite --background=cyan
set fish_color_search_match --background="#60AEFF"

# Run fish_vi_key_bindings to start vi mode
fish_vi_key_bindings 

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# User configs
source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/fzf.fish"
source "$HOME/.config/fish/utils.fish"

# XDG Base Directory Specification
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_STATE_HOME $HOME/.local/state

# Add .local/bin to `PATH`
mkdir -p "$HOME/.local/bin"
fish_add_path "$HOME/.local/bin"

# XDG Base Directory Specification
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_STATE_HOME $HOME/.local/state

# Add .local/bin to `PATH`
mkdir -p "$HOME/.local/bin"
fish_add_path "$HOME/.local/bin"

zoxide init fish | source
thefuck --alias | source
