export PATH=/usr/local/bin:$PATH
#export PS1="\W\$>" #prompt settings
source ~/.git-prompt.sh
source ~/.git-completion.bash

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
export DOTFILES=$HOME/Repos/.dotfiles
export PATH="./bin:/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export EDITOR='vim'

PS1='\e[0;33m[\w$(__git_ps1 " (%s)")]\$ \e[m'

#fuzzy finder for command line
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ..="cd ../"
alias cdn='cd ~/Repos/fdp_cdn'
alias dup='mkdir html && ditto ~/Repos/fed-framework/gulp2.0/ ./html'
alias misc='cd ~/Repos/fed-framework'
alias docker='cd ~/Repos/fdp-design-container/projects/cdn'
alias mockup='cd ~/Documents/Custom_Designs/THEMES/In_Process/'
alias clean='git com && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d && clr'
alias list="ls | tr ' ' '\n'"
alias editbash="e ~/.bash_profile"
alias cd=cdee
alias gl='/usr/local/bin/gitline.sh'
alias gitline='/usr/local/bin/gitline.sh'
# dtags - tag and cd to directories
alias dt=". dtags"


#keep the last focused finder window up to date when cd in terminal
function cdee() {
	[ $# == 0 ] && \cd ~ || \cd "$1"
	[ $? != 0 ] && return
	osascript -e 'on run pwd
	set f to posix file pwd
		tell app "Finder"
			if number of Finder windows is 0 then
			open f
			else
			set target of window 1 to f
			end
		end
	end' "$PWD" > /dev/null
}


#pretty diff
function prettydiff() {
  ~/go/src/github.com/prettydiff/prettydiff/bin/prettydiff source:"$1" mode:"beautify" readmethod:"file" output:"$1" commline:"true" cssinsertlines:"true" insize:"2" preserve:"0" wrap:"0" braceline:"true" methodchain:"chain" summaryonly:"true" tagmerge:"false" spaceclose:"true" noleadzero:"true" html:"true" $2
}
