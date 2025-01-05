# Define fzf-img function
function fzf-img
    # Store the argument in a variable 'filepath'
    set filepath $argv[1]

    # Echo the file path in green
    echo -e "\e[0;32m$filepath\e[0m"

    # Check if the file or directory exists
    if test -e $filepath
        # If it's a directory
        if test -d $filepath
            # List the files using 'exa'
            exa --oneline --color=always --group-directories-first --icons --sort=accessed $filepath | head -100
        # If it's a file
        else if test -f $filepath
            # Get the MIME type of the file
            set MIMETYPE (file -b --mime-type $filepath)

            # Depending on the MIME type, execute different commands
            switch $MIMETYPE
                case 'text/*'
                    bat -n --line-range :50 --color=always --wrap never --theme base16 --style=numbers $filepath
                case 'image/*'
                    echo $filepath
                    viu -b $filepath
                # image/*)
                    # scale=5
                    # HEIGHT=$((LINES * $scale / 10))
                    # WIDTH=$((COLUMNS * $scale / 10))
                    # timg -E --loops=2 --frames=10 -g${WIDTH}x${HEIGHT} "$1"
                    # ;;
                case 'application/pdf'
                    # $PDF_VIEWER $filetpath
                    zathura $filepath
                case '*'
                    echo "Unsupported file type"
            end
        # If it's neither a file nor a directory
        else
            echo "Uncategorized file type"
        end
    end
end
# NOTE: Save the function permanently. Fish functions are automatically loaded when needed, so we don't need to explicitly load them.
# funcsave fzf-img


# Setting fd as the default source for fzf
set -gx FZF_DEFAULT_COMMAND 'fd --color always --strip-cwd-prefix --type f --exclude node_modules'
set -gx FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# To apply the command to CTRL-T as well
# https://github.com/junegunn/fzf#fish-shell
set -gx FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
# TODO: set -gx  FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx  FZF_CTRL_T_OPTS "--height 90% --preview 'bat --color always {}'"
# To apply the command to ALT_C
# set -gx  FZF_ALT_C_COMMAND 'fd --type d --exclude node_modules'
# set -gx  FZF_ALT_C_OPTS "--height 100% --preview br --preview-window wrap"

set -gx  FZF_COMPLETION_TRIGGER '**'

# https://github.com/junegunn/fzf/issues/1593#issuecomment-498007983
set -gx  FZF_DEFAULT_OPTS '
  --height 90% --layout reverse --border
  --reverse
  --ansi
  --multi
  --preview-window=right:70
  --preview "fzf-img {}"
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,border:#6272a4
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  --bind="tab:toggle+down"
  --bind="shift-tab:toggle+up"
  --bind="change:top"
  --bind="alt-j:down"
  --bind="alt-k:up"
  --bind="ctrl-a:select-all"
  --bind="ctrl-d:deselect-all"
  --bind="ctrl-t:top"
  --bind="ctrl-p:change-preview-window(50%|hidden|)"
  --bind="ctrl-s:toggle-sort"
  --bind="ctrl-y:execute-silent(echo -n {} | xclip -selection clipboard)+abort"
  --bind="ctrl-d:change-prompt(Directories> )+reload(fd --color always --strip-cwd-prefix --type d --exclude node_modules)"
  --bind="ctrl-f:change-prompt(Files> )+reload(fd --color always --strip-cwd-prefix --type f --exclude node_modules)"
  --bind="ctrl-v:become(nvim {+})"
  --bind="ctrl-o:execute(kitty +kitten icat --hold {})"
'

# FZF plugin config
# COMMAND            |  DEFAULT KEY SEQUENCE         |  CORRESPONDING OPTION
# Search Directory   |  Ctrl+D (F for file)          |  --directory
# Search Git Log     |  Ctrl+Alt+L (L for log)       |  --git_log
# Search Git Status  |  Ctrl+Alt+S (S for status)    |  --git_status
# Search History     |  Ctrl+R     (R for reverse)   |  --history
# Search Processes   |  Ctrl+Alt+P (P for process)   |  --processes
# Search Variables   |  Ctrl+Alt+V (V for variable)  |  --variables
fzf_configure_bindings --directory=\cd --variables=\e\cv

set -gx fzf_preview_file_cmd fzf-img
 # bat -n --line-range :50 --color=always --wrap=never --style=rule
set -gx fzf_preview_dir_cmd exa --oneline --group-directories-first --icons --sort=accessed "$file_path"

set fzf_dir_opts --height=50 --bind='ctrl-v:execute(nvim {} &> /dev/tty)' --bind='ctrl-o:execute(kitty +kitten icat --hold {})'


# # Use fzf-img function in fzf command
# bind \e\cf 'fzf --height 90% --layout reverse \
#     --preview-window right:70 \
#     --multi \
#     --preview "fzf-img {}"'

# Switch between Ripgrep launcher mode (CTRL-R) and fzf filtering mode (CTRL-F)
set -x RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
set -x INITIAL_QUERY '${*:-}'

bind \e\co  '
    fzf --multi --ansi --disabled --query "$INITIAL_QUERY" \
    --header "╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱" \
    --preview "bat --color=always {1} --highlight-line {2}" \
    --preview-window "up,60%,border-bottom,+{2}+3/3,~3" \
    --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt "1. ripgrep> " \
    --delimiter : \
    --bind "enter:become(nvim {1} +{2})"'



