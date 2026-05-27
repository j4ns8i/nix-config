# Create and enter a temporary directory
function mktempd () {
    cd "$(mktemp -d)"
}
