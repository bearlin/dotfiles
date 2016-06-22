# dotfiles
my dotfiles

# Auto install steps:  
Get auto_install_dotfiles.sh use curl or wget :  
```sh
  curl -LSso "auto_install_dotfiles.sh" "https://raw.githubusercontent.com/bearlin/dotfiles/master/auto_install_dotfiles.sh"
  # Or..
  wget "https://raw.githubusercontent.com/bearlin/dotfiles/master/auto_install_dotfiles.sh" -O "auto_install_dotfiles.sh" 
```

Then run the script:  
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

# Install oh-my-zsh (Optional):
After installed my dotfiles, a ~/.zshrc will be created, and then if you want to use "zsh + oh-my-zsh", just follow the install instructions at https://github.com/robbyrussell/oh-my-zsh, below are my steps :  
```
bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#References
[USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
[Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
[dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  
https://github.com/notice501/dotfiles  
https://github.com/chinghanho/.dotfiles  
