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
# brew install tldr
function tldr() {
  /usr/local/bin/tldr "$@"
  (/usr/local/bin/tldr --update &)
}
