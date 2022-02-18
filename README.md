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
- bat
- exa
- dunst

## Shells

I use `bash` and `zsh` I include the configuration for it and it's frameworks

- bash: oh my bash `~/.bashrc`
  - Subrequirements: pfetch
- zsh: oh my zsh `~/.zshrc`

For zsh I use powerlevel 10k, I include the configuration in `~/.p10k.zsh`

## Installation

### Auto install script

I create an autoinstaller that download the files, copy it on your system folders
and install the dependencies

> This installer only works in an arch-based system because the dependencies installation works with yay and pacman

To use it, execute this command:

```sh
curl https://raw.githubusercontent.com/AlphaTechnolog/bspwm-dotfiles-v2/main/install.sh | bash
```

## Dotbot

You can install with dotbot

```sh
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2 ~/.bspwm-dotfiles
cd ~/.bspwm-dotfiles
bash install-dotbot.sh
```

And that's all

> It will backup your old configs, if it found it folders

## Example wallpapers

![catppuccin-cat](./.sample-wallpapers/catppuccin-cat.png)
![magenta-blue](./.sample-wallpapers/magenta-blue.png)

> You can get more catppuccin-based wallpapers [here](https://github.com/catppuccin/wallpapers)

## Dedicated to

[my brother](https://github.com/Jags1906) <3
