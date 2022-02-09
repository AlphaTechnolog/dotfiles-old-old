# Bspwm Dotfiles V2

> This is a refactor of my old [bspwm setup](https://github.com/AlphaTechnolog/bspwm-dotfiles)

My Configuration files for my new bspwm setup

![rice](./.misc/rice.png)

## Note

If you like this configuration, you can give me a star pls :)

You really make me happy if you do it :D

## Requirements

I am using Arch Linux, but I expect you have it, to make all work

- Iosevka Nerd Font
- Sauce Code Pro Nerd Font
- Material Icons
- kitty
- alacritty (optional, but alternative to kitty)
- rofi
- sxhkd
- bspwm
- polybar
- picom
- feh
- zsh
- oh my zsh (I include the configuration file for it `~/.zshrc`)
- powerlevel 10k (I include the configuration file for it `~/.p10k.zsh`)
- bat
- exa

## Installation

To install you can use this command that move your old
configs to `foldername.old` and then copy the new folder:

```sh
curl -sL https://raw.githubusercontent.com/AlphaTechnolog/bspwm-dotfiles-v2/main/install-folders.sh | bash
```

It has the next bash script content:

```sh
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2 ~/.bspwm-dotfiles
cd ~/.bspwm-dotfiles
declare -a folders=('.config' '.local/share' '.local/bin')
for folder in ${folders[@]}; do
  if ! test -d ~/$folder; then
    mkdir -p ~/$folder
  fi
  for subfolder in $(ls ./$folder); do
    if test -d ~/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv ~/$folder/$subfolder ~/$folder/$subfolder.old
    fi
    if test -f ~/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv ~/$folder/$subfolder ~/$folder/$subfolder.old
    fi
    cp -r ./$folder/$subfolder ~/$folder/
  done
done
```

## Example wallpapers

![catppuccin-cat](./.sample-wallpapers/catppuccin-cat.png)
![magenta-blue](./.sample-wallpapers/magenta-blue.png)

> You can get more catppuccin-based wallpapers [here](https://github.com/catppuccin/wallpapers)

## Dedicated to

[my brother](https://github.com/Jags1906) <3
