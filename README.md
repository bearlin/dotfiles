# dotfiles
my dotfiles

# Install oh-my-zsh first (Optional):
If you want to use "zsh + oh-my-zsh", just first change your shell to zsh (e.g. 'chsh -s /bin/zsh' in MAC) and then follow the install instructions at http://ohmyz.sh/ or https://github.com/robbyrussell/oh-my-zsh, below are my steps :  
```bash
# via curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# via wget
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

After installed ~/.oh-my-zsh, a ~/.zshrc will be created, you shold now download the auto install script from next section and then run './auto_install_dotfiles.sh {platform}' to replace ~/.zshrc with /zsh/{platform}/zshrc  

# [tmux] Fix 'Using the Mac OS X programs pbpaste and pbcopy under tmux does not work':
[IMPORTANT] MAC may need to 'brew install reattach-to-user-namespace' or the tmux will [exited] at startup:  
```sh
brew install reattach-to-user-namespace
```

# Download and run auto install script:  
Get auto_install_dotfiles.sh use curl or wget :  
```sh
  curl -LSso "auto_install_dotfiles.sh" "https://raw.githubusercontent.com/bearlin/dotfiles/master/auto_install_dotfiles.sh"
  # Or..
  wget "https://raw.githubusercontent.com/bearlin/dotfiles/master/auto_install_dotfiles.sh" -O "auto_install_dotfiles.sh" 
```

Then run the script according to your platform type:  
```sh
  chmod +x auto_install_dotfiles.sh
  ./auto_install_dotfiles.sh mac
  # Or..
  ./auto_install_dotfiles.sh ubuntu
  # Or..
  ./auto_install_dotfiles.sh cygwin

  NOTE: Defaul = ubuntu
```
# Set git env (Optional):
After installed this dotfiles, your ~/.gitconfig already set to user.name=BearLin , user.email=bear.lin.001@gmail.com and core.editor=vim, you can update them with below commands:  
```
  git config --global user.name [your name]
  git config --global user.email [your email]
  git config --global core.editor [your prefered editor]

  e.g.:
  git config --global user.name "BearLin"
  git config --global user.email "bear.lin.001@gmail.com"
  git config --global core.editor vim
```
Or with below script:  
```
  ~/.dotfiles/scripts/set_env_git.sh [your name] [your email] [your prefered editor]

  e.g.:
  ~/.dotfiles/scripts/set_env_git.sh BearLin bear.lin.001@gmail.com vim
```

#References
[USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
[Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
[dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  
https://github.com/notice501/dotfiles  
https://github.com/chinghanho/.dotfiles  
