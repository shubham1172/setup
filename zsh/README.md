# ZSH

Note, this README is outdated. TODO: update it.

## Setup

Install
```zsh
pacman -S zsh
```

Change to default shell
```zsh
chsh -l # list all shells
chsh -s /usr/bin/zsh
```

OhMyZsh

```zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Plugins

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

[fzf](https://github.com/junegunn/fzf) for zsh-autocomplete-cd
```zsh
sudo pacman -S fzf
```
