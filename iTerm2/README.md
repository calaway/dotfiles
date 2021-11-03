# iTerm 2 Settings

## Add Native MacOS Keybindings

These keybinding settings come from [this wonderful StackOverflow answer](http://stackoverflow.com/questions/6205157/iterm2-how-to-get-jump-to-beginning-end-of-line-in-bash-shell/29403520#29403520). This will set the following keybindings:

Keys | Action
:---: | ---
`⌘`+`←` | Move cursor to the beginning of line
`⌘`+`→` | Move cursor to the end of line
`⌥`+`←` | Move cursor one word left
`⌥`+`→` | Move cursor one word right
`⌘`+`←Delete` | Delete to the beginning of the line
`⌘`+`fn`+`←Delete` or `⌘`+`Delete→` | Delete to the end of the line
`⌥`+`←Delete` | Delete to the beginning of the word
`⌥`+`fn`+`←Delete` or `⌥`+`Delete→` | Delete to the end of the word
`⌘`+`Z` | Undo
`⇧`+`⌘`+`Z` or `⌘`+`Y` | Redo

### Step 1

Download the file [iTerm2_native_macos_keybindings.itermkeymap](iTerm2_native_macos_keybindings.itermkeymap) from this repo by right clicking [here](https://github.com/calaway/dotfiles/raw/master/iTerm2/iTerm2_native_macos_keybindings.itermkeymap) and selecting `Save link as...`. Then import it into iTerm2 under:
- `Preferences` >> `Profiles` >> select `Profile Name` >> `Keys` tab >> `Key Mappings` sub-tab >> `Presets...` >> `Import...` >> `Keep`

### Step 2 (for zsh only)

Add the following to your `~/.zshrc`:
```bash
### iTerm2 Native MacOS Keybindings
bindkey "^U" backward-kill-line
bindkey "^X\x7f" backward-kill-line
bindkey "^X^_" redo
```
