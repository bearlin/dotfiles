[alias]
	lg = log --branches --remotes --tags --decorate=full --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
	co = checkout
	br = branch
	rem = remote
	ci = commit
	st = status
[color]
	branch = auto
	diff = auto
	status = auto
	ui = auto
[color "branch"]
	current = yellow reverse
	local = yellow
	remote = green
[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
[color "status"]
	added = yellow
	changed = green
	untracked = cyan
[user]
	name = Chih Han (Steven) Lin
	email = clix@cypress.com
[core]
	editor = vim