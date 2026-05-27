# Exit early if interactive option unset, which is common for command line AI agents.
# Note: the $NONINTERACTIVE var is a custom override, not prescribed by any tool (that I know of)
if [[ ! -o interactive ]] || [[ -n "$NONINTERACTIVE" ]]; then
    return
fi

local function run_in_tmux() {
    tmux new-session
    exit 0 # exit out after the session ends or is detached
}

local function run_normally() {
    # Uncomment for profiling
    # zmodload zsh/zprof

    export ZSH_CONFIG_DIR=~/.config/zsh

    fpath=(
        $fpath
    )

    # Glob qualifiers used:
    # N: sets NULL_GLOB to return nothing when no matches are found.
    # -: dereferences symbolic links
    # .: finds "plain" files, which only includes existing files
    # See `man zshexpn` > Glob Qualifiers.
    for rc in ${ZSH_CONFIG_DIR}/local/*.zsh(N-.); do source $rc; done
    for rc in ${ZSH_CONFIG_DIR}/share/*.zsh(N-.); do source $rc; done
    for rc in ${ZSH_CONFIG_DIR}/plugins/*.zsh(N-.); do source $rc; done

    # Uncomment for profiling
    # zprof
}

# if TMUX is set or if you don't have tmux, load normally
if [[ -n "$TMUX" ]] || [[ -f ~/.disable_tmux ]] || ! command -v tmux &>/dev/null; then
    run_normally
else
    run_in_tmux
fi
