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
After installed this dotfiles, your ~/.gitconfig already set to user.name=BearLin and user.email=bear.lin.001@gmail.com, you can update them again with below script:
```
  ~/.dotfiles/scripts/set_env_git.sh [your name] [our email]

  e.g.:
  ~/.dotfiles/scripts/set_env_git.sh BearLin bear.lin.001@gmail.com vim
```

#References
[USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
[Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
[dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  
https://github.com/notice501/dotfiles  
https://github.com/chinghanho/.dotfiles  
