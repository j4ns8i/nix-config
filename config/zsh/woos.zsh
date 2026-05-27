# Something weird is going on:
# * zkbd registers <Up> -> ^[[A, <Down> -> ^[[B, etc.
# * same with `showkey -a`
# * zsh shows ctrl-v <Up> -> ^[OA, <Down> -> ^[OB, etc.
# * this is unique to WSL -> ghostty -> tmux -> zsh
#
# For now, we'll just explicitly match the two sets of key codes.

bindkey -s "^[OA" "^[[A"
bindkey -s "^[OB" "^[[B"
bindkey -s "^[OC" "^[[C"
bindkey -s "^[OD" "^[[D"
