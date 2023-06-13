# Default config here

################################################################################
# End of default config
################################################################################

### My custom configurations
alias path="echo \$PATH | tr ':' '\n'"
alias watch="watch --color --differences "
alias gcam="git add . && git commit -m "
alias prettyjson="pbpaste | jq '.' | pbcopy && echo ✅"

### tldr
# Installation instructions: https://tldr.sh/
function tldr() {
  command tldr "$@"
  (command tldr --update &>/dev/null &)
}
