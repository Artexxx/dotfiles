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
