alias g="git"
for git_alias in $(git config -l | grep '^alias\.' | cut -d. -f2 | cut -d= -f1); do
    alias g${git_alias}="git ${git_alias}"
done

# Create worktree from current branch and cd into it
ggwta() {
    setopt localoptions pipefail
    if [[ -z "$1" ]]; then
        echo need an argument
        return 1
    fi
    dir=$(gwta $1 | tail -n1)
    cd $dir
}

# Create worktree from origin/HEAD and cd into it
ggwtah() {
    setopt localoptions pipefail
    if [[ -z "$1" ]]; then
        echo need an argument
        return
    fi
    dir=$(gwtah $1 | tail -n1)
    cd $dir
}
