### Load the default .profile #############################
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

### Load Ruby VM ##########################################
# From turing prework: https://github.com/turingschool/prework/blob/master/prework-month.md
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

### Additional Tab Completion #############################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

### Aliases ###############################################
alias aliases="atom ~/.bash_profile"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
# -A print all hidden items except for `.` and `..`
alias l="ls -lAFGgohq"

# Navigation  aliases
alias cdt="cd ~/gdrive/turing/3module"
alias cdp="cd ~/gdrive/turing/3module/projects/"
alias cd0="cd ~/gdrive/turing/3module/0week/"
alias cd1="cd ~/gdrive/turing/3module/1week/"
alias cd2="cd ~/gdrive/turing/3module/2week/"
alias cd3="cd ~/gdrive/turing/3module/3week/"
alias cd4="cd ~/gdrive/turing/3module/4week/"
alias cd5="cd ~/gdrive/turing/3module/5week/"
alias cd6="cd ~/gdrive/turing/3module/6week/"

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gcom="git checkout master"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D "
alias ga="git add"
alias gcm="git commit -m "
alias gac="git add . && git commit -m"
alias gh="git hist"
alias gp="git push"
alias gi="git init"
alias gpom="git push origin master"
alias pull="git pull"

# Show/hide dot files in Finder. From http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showdotfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidedotfiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


### Shortcut Functions #####################################
function cs {
  cd "$1" && l
}
function mkdircd {
  mkdir "$1" && cd "$1"
}
function opennew {
	touch "$@" && open "$@"
}


### Customized Prompt ######################################
# From http://ezprompt.net/
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

### My Customized Prompt ###################################
PROMPT_COLOR='1;31m'
export PS1="\[\033[$PROMPT_COLOR\][\A]☘ <\W> \`parse_git_branch\`\\$ \[\033[m\]"