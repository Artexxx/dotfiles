# My aliases

# Basic
alias .. "cd .."
alias ... "cd ../.."

# Editor
#######################################
alias v="nvim"
alias vi="nvim"

# File managers
#######################################
alias ra="ranger"
alias joshuto="jo"

# Other
#######################################
alias weather="curl 'wttr.in/Moscow?F&lang=ru'"

alias kbl="kb list"
alias kbe="kb edit"
alias kba="kb add"
alias kbv="kb view"
alias kbd="kb delete --id"
alias kbg="kb grep"
alias kbt="kb list --tags"

alias tsh='trans -b -I --theme ~/.config/.translate-shell/neon.trans'
alias tshw='trans -I --theme ~/.config/.translate-shell/neon.trans'

# List directory
#######################################
alias l="lsd --group-directories-first"
alias ls="lsd --group-directories-first --sort extension"
alias la="lsd -a --group-directories-first"
alias lsa="lsd -a --group-directories-first --sort extension"
alias ll="lsd -alFh --header --group-directories-first"
alias lt='lsd --tree --group-directories-first'
alias llt='lsd -l --header --tree --group-directories-first'
alias ea="exa --icons --color=always --group-directories-first --sort ext --all"


if type -q exa
    alias ls="exa --icons --color=always --group-directories-first"
    alias xls="exa -a --icons --color=always --group-directories-first"
    alias xll="exa -lag --icons --color=always --group-directories-first --octal-permissions"
end

#fix obvious typo's
alias cd..="cd .."
alias pdw="pwd"

# if type -q exa
#     alias la='exa --long --all --group --header --binary --links --inode --blocks'
#     alias ld='exa --long --all --group --header --list-dirs'
#     alias ll='exa --long --all --group --header --git'
#     alias lt='exa --long --all --group --header --tree --level'
# end

if type -q bat
    alias cat='bat --paging=never'
end

# NOTE: https://github.com/asdf-community/asdf-direnv
# if type -q asdf -a asdf exec direnv 1>&2 2>/dev/null
#     test $status -eq 0
#     alias direnv "asdf exec direnv"
# end

# Kitty
#######################################
if test "$TERM" = xterm-kitty
    alias icat="kitty +kitten icat"
    alias idiff="kitty +kitten diff"
    alias icb="kitty +kitten clipboard"
    alias issh="kitty +kitten ssh"
end


# git
#######################################
# alias g git
alias ga "git add"
# alias gb "git branch"
# alias gba "git branch -a"
# alias gbd "git branch -D"
# alias gca "git commit -a -m"
alias gcm "git commit -m"
# alias gco "git checkout"
# alias gcob "git checkout -b"
# alias gcp "git cherry-pick"
# alias gd "git diff"
# alias gdc "git diff --cached"
# alias gl "git lg"
# alias gm "git merge --no-ff"
alias gp "git push"
# alias gpom "git pull origin master"
# alias gpt "git push --tags"
# alias grh "git reset --hard"
# alias grs "git reset --soft"
# alias gst "git status -sb --ignore-submodules"
# alias undopush "git push -f origin HEAD^:master"
alias lg="lazygit"
alias gu="gitui"
# using plugin
# omf install https://github.com/jhillyerd/plugin-git
alias undopush "git push -f origin HEAD^:master"

alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"
function gl
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv | fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` --bind "ctrl-m:execute: echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R'"
end

# docker / k8s
#######################################
# alias d docker
# alias k kubectl


### ALIASES ###

#list
# alias ls='lsd'

# alias ls="ls --color=auto"
# alias la="ls -a"
# alias ll="ls -alFh"
# alias l="ls"
alias l.="ls -A | egrep '^\.'"
# alias listdir="ls -d */ > list"

#pacman
alias sps='sudo pacman -S'
alias spr='sudo pacman -R'
alias sprs='sudo pacman -Rs'
alias sprdd='sudo pacman -Rdd'
alias spqo='sudo pacman -Qo'
alias spsii='sudo pacman -Sii'

# show the list of packages that need this package - depends mpv as example
function function_depends
    set search $argv[1]
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
end

alias depends='function_depends'
alias update="sudo pacman -Syyu"
alias update="sudo pacman -Syyu"
alias update="sudo pacman -Syyu"
alias updqte="sudo pacman -Syyu"
alias upqll="paru -Syu --noconfirm"
alias upal="paru -Syu --noconfirm"

## Colorize the grep command output for ease of use (good for log files)##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Color output of ip
alias ip="ip -color"

#readable output
alias df="df -h"

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

#setlocale
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap be && sudo localectl set-locale LANG=en_US.UTF-8"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd | sort"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software management
# pacman
alias pacman="sudo pacman --color auto"
alias update="sudo pacman -Syyu"

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

#add new fonts
alias update-fc="sudo fc-cache -fv"

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel="cp -Rf /etc/skel ~/.skel-backup-(date +%Y.%m.%d-%H.%M.%S)"

#copy shell configs
alias cb="cp /etc/skel/.bashrc ~/.bashrc && echo "Copied.""
alias cz="cp /etc/skel/.zshrc ~/.zshrc && echo "Copied.""
alias cf="cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && exec fish"

#switch between bash, zsh and fish
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Done. Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Done. Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Done. Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc="killall conky"
# quickly kill polybar
alias kp="killall polybar"
# quickly kill picom
alias kpi="killall picom"

#hardware info --short
alias hw="hwinfo --short"

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#skip integrity check
alias paruskip="paru -S --mflags --skipinteg"
alias yayskip="yay -S --mflags --skipinteg"
alias trizenskip="trizen -S --skipinteg"

#check vulnerabilities microcode
alias microcode="grep . /sys/devices/system/cpu/vulnerabilities/*"

#check cpu
alias cpu="cpuid -i | grep uarch | head -n 1"

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram="rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"
alias rams="rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac"
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"
alias isoo="cat /etc/dev-rel"

#Cleanup orphaned packages
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

# This will generate a list of explicitly installed packages
alias list="sudo pacman -Qqe"
#This will generate a list of explicitly installed packages without dependencies
alias listt="sudo pacman -Qqet"
# list of AUR packages
alias listaur="sudo pacman -Qqem"
# add > list at the end to write to a file

# install packages from list
# pacman -S --needed - < my-list-of-packages.txt

#clear
alias clean="clear; seq 1 (tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nhostname="sudo $EDITOR /etc/hostname"
alias nf="$EDITOR ~/.config/fish/config.fish"
alias nneofetch="$EDITOR ~/.config/neofetch/config.conf"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
#fix-sddm-config is no longer an alias but an application - part of ATT
#alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

#maintenance
alias big="expac -H M "%m\t%n" | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"

#wayland aliases
alias wsimplescreenrecorder="wf-recorder -a"

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#arcolinux applications
#att is a symbolic link now
#alias att="archlinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#pamac
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"

#moving your personal files and folders from /personal to ~
function personal
    cp -rf /personal/ ~
    cp -rf /personal/.* ~
end


