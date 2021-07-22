# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
unsetopt BEEP

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
plugins=(git jump term_tab zsh-interactive-cd zsh-navigation-tools colored-man-pages colorize zsh-autosuggestions zsh-syntax-highlighting lol vscode history sudo node fzf rsync)

ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="colorful"

ZSH_COLORIZE_CHROMA_FORMATTER=terminal256


source $ZSH/oh-my-zsh.sh

function optimize(){
  if pgrep dwm; then
    killall picom;
  fi
  killall redshift;
  killall conky;
  brightnessctl set 10%;
  echo Test;
}

function mountx(){
  sudo mkdir /run/media/gumfig
  sudo mkdir /run/media/gumfig/gumfig
  sudo mkdir /run/media/gumfig/Windows
  sudo mount /dev/sda /run/media/gumfig/gumfig
  sudo mount /dev/nvme0n1p3 /run/media/gumfig/Windows
}

function countdown(){
  date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r" | figlet;
     sleep 0.1
     clear
   done
   dunstify "Countdown Finished: $2"
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# shortcut for changing pywal themes
alias ca="~/.config/polybarscripts/pywal.sh ~/Pictures/AT"
alias cb="~/.config/polybarscripts/pywal.sh ~/Pictures/BlueHour"
alias c="~/.config/polybar/scripts/pywal.sh"
alias watchwala="watch -n 500 ~/.config/polybar/scripts/pywal.sh ~/Pictures/AT"
alias watchwalb="watch -n 500 ~/.config/polybar/scripts/pywal.sh ~/Pictures/BlueHour"

alias weather="curl https://wttr.in; echo"
alias myip="curl https://ipecho.net/plain; echo"
alias crypto="curl https://cad.rate.sx/btc"
alias matrix="cmatrix -rb"
alias speed="speedometer -r wlo1 -t wlo1"
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias rm=trash-put
alias pt="if pgrep polybar; then
  killall polybar
else
  ~/.config/polybar/./launch.sh
fi
"

# Changing "ls" to "exa"
alias ls='exa -a --color=always --group-directories-first' # my preferred listing
alias l='exa -la --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -la --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphaned packages

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias vi="nvim"
alias vim="nvim"

alias view="viewnior"

alias wal="wal -e"
alias nord="c base16-nord"
alias gruvbox="c base16-gruvbox-medium"
alias future="c tempus_future"
alias rebecca="c base16-rebecca"
alias material="c base16-material"
alias palenight="c base16-material-palenight"
alias rand="c random"
alias metal="c base16-black-metal-immortal"
alias gotham="c sexy-gotham"
alias ivory="c sexy-navy-and-ivory"
alias ashes="c ashes"

alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

alias cat="ccat"
alias htop="bpytop"

alias um="tuxi"
alias zat="zathura"
alias trs="trans"
alias trd="trans -d"
alias mpv="mpv --shuffle"

alias gumfig="/run/media/gumfig/gumfig"
alias windows="/run/media/gumfig/Windows/Users/Navi"

PATH="~/.local/bin:$PATH"

#sudo iwconfig wlan0 essid wifiName key s:wifiPass
export FZF_BASE=/usr/share/fzf

export VISUAL=nvim
export EDITOR=nvim

alias topmon="xrandr --output HDMI-1 --above eDP-1"

eval "$(starship init zsh)"
