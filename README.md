# Calaway's dot files

Backup any original files first.

*Example:*  
```bash
mv -v ~/.bash_profile ~/.bash_profile_original
```

Then make symlinks to the dotfiles.

*Example:*  
```bash
ln -sv ~/.dotfiles/.bash_profile ~
ln -sv ~/.dotfiles/.gitconfig ~
ln -sv ~/.dotfiles/.gitignore_global ~
```
