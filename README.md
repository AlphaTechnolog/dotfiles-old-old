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

To install you can use this commands

```sh
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2 ~/.bspwm-dotfiles
cd ~/.bspwm-dotfiles
declare -a folders=('.config' '.local/share' '.local/bin')
for folder in ${folders[@]}; do
  if ! test -d "~/${folder}"; then
    mkdir -p "~/${folder}"
  fi
  cp -r "./${folder}/*" "~/${folder}"
done
```

## Example wallpapers

![catppuccin-cat](./.sample-wallpapers/catppuccin-cat.png)
![magenta-blue](./.sample-wallpapers/magenta-blue.png)

## Dedicated to

[my brother](https://github.com/Jags1906) <3
