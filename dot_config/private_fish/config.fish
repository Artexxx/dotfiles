###############################################################################
#                    НЕИНТЕРАКТИВНЫЙ БЛОК (глобальные env)
###############################################################################

# XDG Base Directory Specification
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_STATE_HOME $HOME/.local/state

# Если логин-оболочка, расширяем PATH
if status --is-login
    set -gx PATH $PATH ~/.bin
    set -gx PATH $PATH ~/.local/bin
    set -gx PATH $PATH $HOME/.foundry/bin
end

# Add .local/bin to `PATH`
mkdir -p "$HOME/.local/bin"
fish_add_path "$HOME/.local/bin"

# sets tools
set -x EDITOR nvim
set -x VISUAL nvim
set -g EDITOR nvim
set -g TERM kitty
set TERM "xterm-kitty"
set MANPAGER "nvim +Man!"

# Если установлен bat -> alias cat=bat
if type -q bat
    alias cat="bat --paging=never"
    set -x -U BAT_THEME "base16"
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

###############################################################################
#                   (Закомментированные цветовые настройки Fish)
###############################################################################
# colors to set or unset
# set fish_color_autosuggestion "#969896"
# set fish_color_cancel -r
# set fish_color_command "#0782DE"
# set fish_color_comment "#f0c674"
# set fish_color_cwd "#008000"
# set fish_color_cwd_root red
# set fish_color_end "#b294bb"
# set fish_color_error "#fb4934"
# set fish_color_escape "#fe8019"
# set fish_color_history_current --bold
# set fish_color_host "#85AD82"
# set fish_color_host_remote yellow
# set fish_color_match --background=brblue
# set fish_color_normal normal
# set fish_color_operator "#fe8019"
# set fish_color_param "#81a2be"
# set fish_color_quote "#b8bb26"
# set fish_color_redirection "#d3869b"
# set fish_color_search_match bryellow background=brblack
# set fish_color_selection white --bold background=brblack
# set fish_color_status red
# set fish_color_user brgreen
# set fish_color_valid_path --underline
# set fish_pager_color_completion normal
# set fish_pager_color_description "#B3A06D" yellow
# set fish_pager_color_prefix normal --bold underline
# set fish_pager_color_prefix white --bold --underline
# set fish_pager_color_progress brwhite --background=cyan
# set fish_color_search_match --background="#60AEFF"

###############################################################################
#                 ИНТЕРАКТИВНЫЙ БЛОК
###############################################################################
if status is-interactive
    # Отключаем приветствие
    set -g fish_greeting ""

    # Предотвращаем сокращение имен директорий в prompt
    set fish_prompt_pwd_dir_length 0

    # FZF настройки 
    set -x FZF_DEFAULT_OPTS \
        "--color=16,header:13,info:5,pointer:3,marker:9,spinner:1,prompt:5,fg:7,hl:14,fg+:3,hl+:9 \
         --inline-info \
         --tiebreak=end,length \
         --bind=shift-tab:toggle-down,tab:toggle-up"

    # Подключаем nerd fonts тему
    set -g theme_nerd_fonts yes

    # Настройки Tide + vi mode
    set -U tide_vi_mode_bg_color_default ff00ff
    set -U tide_vi_mode_color_default ffffff
    set -U tide_vi_mode_icon_default 󰊠
    set -U tide_vi_mode_bg_color_insert 5f3fff
    set -U tide_vi_mode_color_insert ffffff
    set -U tide_vi_mode_icon_insert 󰢚
    set -U tide_vi_mode_bg_color_replace 038AF9
    set -U tide_vi_mode_color_replace ffffff
    set -U tide_vi_mode_icon_replace 󱥒
    set -U tide_vi_mode_bg_color_visual 03edf9
    set -U tide_vi_mode_icon_visual 

    # Run fish_vi_key_bindings to start vi mode
    function fish_user_key_bindings
        fish_vi_key_bindings
        bind -M insert \cn accept-autosuggestion
        bind \cn accept-autosuggestion
        for mode in insert default visual
            bind -M $mode \ck 'history --merge ; up-or-search'
            bind -M $mode \cj 'history --merge ; down-or-search'
        end
    end

    # Языковые настройки (в интерактивном режиме)
    set -x LC_ALL en_US.UTF-8
    set -x LC_CTYPE en_US.UTF-8

    # Autostart zellij
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
            zellij attach -c
        else
            zellij
        end

        if test "$ZELLIJ_AUTO_EXIT" = "true"
            kill $fish_pid
        end
    end  

    source "$HOME/.config/fish/fzf.fish"
    source "$HOME/.config/fish/utils.fish"
    source "$HOME/.config/fish/pyenv.fish"

    zoxide init fish | source
    thefuck --alias | source
end

