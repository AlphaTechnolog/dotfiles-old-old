# Bspwm Dotfiles V2

> This is a refactor of my old [bspwm setup](https://github.com/AlphaTechnolog/bspwm-dotfiles)

My Configuration files for my new bspwm setup

![rice](./.misc/rice.png)

## Note

If you like this configuration, you can give me a star pls :)

You really make me happy if you do it :D

## Requirements

I am using void linux, I expect you use it to make all work, but installation
also works for Arch Linux

- Iosevka Nerd Font
- Sauce Code Pro Nerd Font
- Material Icons
- alacritty
- kitty (optional, but alternative to alacritty)
- rofi
- sxhkd
- bspwm
- polybar
- picom
- feh
- bat
- exa
- dunst
- starship
- pfetch

> This requirements will be installed with the autoinstaller

## Shells

I use `bash`, `zsh` and `fish`. I use this shells, but in combination with starship.

- bash: bash + starship `~/.bashrc`
- zsh: zsh + starship `~/.zshrc`
- fish: fish + starship `~/.config/fish/config.fish`

## Installation

- The installers only works for void linux and arch linux
- The installers setup bash as default shell, but configuration with starship are created too for `fish` and `zsh`
- The installers may copy your old configurations files to `filename.old` if it found it's folders, it don't delete your old configuration folders

### Autoinstall script

I create an autoinstaller that download the files, copy it on your system folders
and install the dependencies

To use it, execute this command:

```sh
curl https://raw.githubusercontent.com/AlphaTechnolog/bspwm-dotfiles-v2/main/install.sh | bash
```

Or at clone the dotfiles (is important that the dotfiles are in ~/.bspwm-dotfiles):

```sh
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2.git ~/.bspwm-dotfilesthe 
cd ~/.bspwm-dotfiles
./install.sh
```

## Dotbot

You can install with dotbot too with three simple bash-script commands

```sh
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2 ~/.bspwm-dotfiles
cd ~/.bspwm-dotfiles
bash install-dotbot.sh
```

And that's all

## Wallpapers

I have a lot of wallpapers, it are published in [.sample-wallpapers](https://github.com/AlphaTechnolog/bspwm-dotfiles-v2/tree/main/.sample-wallpapers) folder

> You can get more catppuccin-based wallpapers [here](https://github.com/catppuccin/wallpapers)

## Galery

![catppuccin](./.misc/showcase/catppuccin.png)
![tokyonight](./.misc/showcase/tokyonight.png)
![gruvbox](./.misc/showcase/gruvbox.png)
![material-ocean](./.misc/showcase/material-ocean.png)
![onedark](./.misc/showcase/onedark.png)

> A tool to change themes is in development :D

## Dedicated to

[my brother](https://github.com/Jags1906) <3

## Thanks to

- [Catppuccin community](https://github.com/catppuccin) (To help me with a lot of inspiration and feedback, in the discord server)
- Akali (To help me with a lot of solutions and feedback <3)
- Dlltsuki (To help me a lot with feedback and the dotbot installation <3)
- Bleyom (To help me with some inspiration and feedback <3) (He has a very beautiful rices, in his [profile](https://github.com/Bleyom))
- KOK41 (To help me with some ideas and concepts <3)
