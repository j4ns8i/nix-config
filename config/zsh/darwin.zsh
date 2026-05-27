alias ls='command gls --color' # coreutils homebrew package
alias docker-desktop-enter="docker run --rm -ti --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# from coreutils brew formula
eval $(gdircolors)
