# ~~~~~~~~~~~~~
# ~~ General ~~
# ~~~~~~~~~~~~~

# If not running interactively, don't do anything.
# By convention, .bashrc is the place where users store the customize configuration for the shell.
# These customize configuration can be environment variables, aliases, fancy prompt. 
# With a non-interactive shell, those sort of things are meaningless. 
[[ $- != *i* ]] && return

# Set PATH (for my personal bin folders):
export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# Delete lesshst file:
export LESSHISTFILE=-


# ~~~~~~~~~~~
# ~~ Alias ~~
# ~~~~~~~~~~~

# Pacman:
alias pup="sudo pacman -Syu"  # Update system.
alias psp="pacman -Ss"        # Search package.
alias pdp="pacman -Qi"        # Show package info.
alias pcp="pacman -Q | wc -l" # Number of packages installed.
alias pcc="sudo pacman -Scc"  # Clean cache.
alias pdo="sudo pacman -Rns $(pacman -Qtdq)" # Delete orphans packages.

# Tools:
alias grep="grep --color=auto"
alias free="free -ht"     
alias ll="ls -lAhXF --color=auto --group-directories-first"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv" # Con -f (--force) desactivamos la confirmación antes de eliminar.
alias mkd="mkdir -pv"
alias myip="curl -s ipinfo.io/ip" # Show public IP (hostname -i muestra IP privada).
alias untar="tar xf"
alias unrar="unrar x"
alias un7z="7z x"

# Download mp3:
alias ytmp3="youtube-dl --extract-audio --no-playlist --audio-format mp3 -o '~/Downloads/%(title)s.%(ext)s'"

# Rank mirrors:
alias rank="sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist"

# Reload grub config:
alias regrub="grub-mkconfig -o /boot/grub/grub.cfg"


# ~~~~~~~~~~~~~~~~
# ~~ Appearance ~~
# ~~~~~~~~~~~~~~~~

# Font colors:
BLACK="\001$(tput setaf 0)\002"
RED="\001$(tput setaf 1)\002"
GREEN="\001$(tput setaf 2)\002"
YELLOW="\001$(tput setaf 3)\002"
BLUE="\001$(tput setaf 4)\002"
MAGENTA="\001$(tput setaf 5)\002"
CYAN="\001$(tput setaf 6)\002"

# Background colors:
BBLACK="\001$(tput setab 0)\002"
BRED="\001$(tput setab 1)\002"
BGREEN="\001$(tput setab 2)\002"
BYELLOW="\001$(tput setab 3)\002"
BBLUE="\001$(tput setab 4)\002"
BMAGENTA="\001$(tput setab 5)\002"
BCYAN="\001$(tput setab 6)\002"

# Properties:
BOLD="\001$(tput bold)\002"
DIM="\001$(tput dim)\002"
UNDER="\001$(tput smul)\002"
REVERSE="\001$(tput rev)\002"
RESET="\001$(tput sgr0)\002"

# Set prompt:
export PS1="$BOLD$CYAN[$YELLOW\w$CYAN]$RESET$BOLD > $RESET"


# ~~~~~~~~~~~~~~~
# ~~ Variables ~~
# ~~~~~~~~~~~~~~~

export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export FMANAGER="vifm"
