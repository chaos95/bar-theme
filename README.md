## Bar theme

Based on https://github.com/anki-code/bar-theme - with some improvements and a change of colour scheme

Features:

* Clean, clear design without lots of colours

* Displays important information in three well-defined areas: first - command and path, second - output, third - pills/sections 👓 

* Full-width prompt bar to help separate command invocations clearly on-screen ⬛️ 

* Command entry starts at a fixed position and is easily visible thanks to increased intensity. It's great for reading and typing 💚 

* The pills/sections are located on the right-hand side of the bar and not in RPROMPT, allowing you to securely copy the command and output without environmental disclosure 🔒 

* The pills/sections can have additional background or color accent if you need 💊 

## Appearance

![zsh bar theme](zsh-bar-theme-example.png)

Screenshot from [Hyper](https://hyper.is) with [Fira Code](https://github.com/tonsky/FiraCode) or something like this.

## [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/)
```
git clone https://github.com/chaos95/bar-theme ~/.oh-my-zsh/custom/themes/bar-theme
ln -s ~/.oh-my-zsh/custom/themes/bar-theme/bar.zsh-theme ~/.oh-my-zsh/custom/themes/bar.zsh-theme
sed -i  's/^ZSH_THEME=/ZSH_THEME="bar"\n#ZSH_THEME=/g' ~/.zshrc
zsh
```
