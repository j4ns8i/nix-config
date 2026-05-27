fpath=(
    ${ZSH_CONFIG_DIR}/plugins/pure
    $fpath
)
autoload -U promptinit; promptinit

prompt pure

export PURE_PROMPT_SYMBOL='$'
export PURE_GIT_UP_ARROW="↑"
export PURE_GIT_DOWN_ARROW="↓"
zstyle :prompt:pure:prompt:success color 2
zstyle :prompt:pure:virtualenv     color 8
zstyle :prompt:pure:git:branch     color 8
zstyle :prompt:pure:git:action     color 8
zstyle :prompt:pure:git:dirty      color 13
zstyle :prompt:pure:git:arrow      color 6
