# Bash Aliases and Config
# =======================

# PATH
# ----
export PATH=$PATH:"~/.local/bin"

# Command preferences
# -------------------
# Set cli edit mode to vi
#set -o vi
export EDITOR="vim"
alias ls="ls --color -h --group-directories-first"
# rlwraps
alias sftp="rlwrap sftp"
alias vmd="rlwrap vmd"
# w3m bookmarks
alias ddg="w3m duckduckg.com"
alias hn="w3m news.ycombinator.com"
# common folders
alias edit-notes="code --folder-uri ~/Documents/Notes"
alias notes="cd ~/Documents/Notes"
alias ravilabio="cd ~/Projects/ravilabio"
alias ravilart="cd ~/Projects/ravilart"
# services
alias dark="systemctl --user start dark-gtk-theme.service"
alias light="systemctl --user start light-gtk-theme.service"
# flatpak apps
alias code="flatpak run com.visualstudio.code"
alias calibre="flatpak run com.calibre_ebook.calibre"
alias blender="flatpak run org.blender.Blender"
alias inkscape="flatpak run org.inkscape.Inkscape"
# docker containers
alias powershell="docker run --rm -v /home/ravila/:/home/ravila/:Z -it mcr.microsoft.com/powershell"
# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Functions
# ---------
function csview()
{
    column -s, -t < $1 | less -#2 -N -S
}

function tsview()
{
    column -s\t -t < $1 | less -#2 -N -S
}

# API Keys
# --------
# Spotify API
export SPOTIPY_CLIENT_ID='5739c6c8807b413281c8963851d88af7'
export SPOTIPY_CLIENT_SECRET='e4e1eefce215461086454c49069cb8a6'
# Last.fm API
export LASTFM_KEY='137465300856b0ecd99ed0372adc2d45'
export LASTFM_SECRET='54f02ffb4e8362c82192b141c8f5cb3b'
export LASTFM_USER='Aeneas42'
export LASTFM_HASH='bdbc7725c746e67c25ea6a095faa93c1'
# Google API
export GOOGLE_API_KEY='AIzaSyCIM4EzNqi1in22f4Z3Ru3iYvLaY8tc3bo'
