#################################
### Network Related
#################################

alias localip "ipconfig getifaddr en1"
alias ips "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois "whois -h whois-servers.net"

# View HTTP traffic
alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

function server --description "Start an HTTP server from a directory"
    open http://localhost:8080/
    and python2 -m SimpleHTTPServer 8080
end

function digga --description "All the dig info"
    dig +nocmd $argv[1] any +multiline +noall +answer
end

alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"

################################
###  Unix Related
################################
# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function randpw --description "generate a random password"
    dd if=/dev/urandom bs=1 count=16 2>/dev/null | base64 | rev | cut -b 2- | rev
end

function ex --description "Extract bundled & compressed files"
    if test -f "$argv[1]"
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z $argv[1]
            case '*.deb'
                ar $argv[1]
            case '*.tar.xz'
                tar xf $argv[1]
            case '*.tar.zst'
                tar xf $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via ex"
        end
   else
       echo "'$argv[1]' is not a valid file"
   end
end

function extract --description "Expand or extract bundled & compressed files"
  for file in $argv
    if test -f $file
      echo -s "Extracting " (set_color --bold blue) $file (set_color normal)
      switch $file
        case "*.tar"
          tar -xvf $file
        case "*.tar.bz2" "*.tbz2"
          tar --bzip2 -xvf $file
        case "*.tar.gz" "*.tgz"
          tar --gzip -xvf $file
        case "*.bz" "*.bz2"
          bunzip2 $file
        case "*.gz"
          gunzip $file
        case "*.rar"
          unrar x $file
        case "*.zip"
          unzip -uo $file -d (basename $file .zip)
        case "*.Z"
          uncompress $file
        case "*.pax"
          pax -r < $file
        case "*.7z"
          7z x $file -o(basename $file .7z)
        case '*'
          echo "Extension not recognized, cannot extract $file"
      end
    else
      echo "$file is not a valid file"
    end
  end
end
