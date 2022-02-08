# Alacritty Config

## Install pycritty

To apply this config, first install [pycritty](https://github.com/antoniosarosi/pycritty):

```sh
python -m pip install pycritty
```

## Clone my config

Then clone my configs:

```sh
git clone https://github.com/AlphaTechnolog/dotfiles ~/.dotfiles && cd ~/.dotfiles
# then run the installer
./install.sh
```

And the installer will be create a symlink in your `~/.config/alacritty`
that loads my config, but you can customize it with pycritty

## Customizing

If you execute:

```sh
pycritty ls -t
```

It shows this output

```
Themes:
    iceberg-dark
    gruvbox-light
    nord-wave
    ayu-mirage
    rosepine
    bluescreen
    onedark
    darkside
    kitty
    nord
    gruvbox-dark
    catppuccin
    breeze
    ayu-dark
    ir-black
    darktooth
    afterglow
    iceberg-light
    hybrid
    campbell
    gnome-dark
    material-ocean
    cobalt-2
    dracula
    monokai
    material-darker
    base16-default-dark
    greenscreen
    argonaut
    hyper
    jellybeans
    iterm-default
    blood-moon
```

It is the themes list you can use, e.g: If you can change the alacritty theme
to `onedark`, you can run a command like this:

```sh
pycritty -t onedark
```

Or a more complex pycritty usage:

```sh
pycritty -t onedark -o 0.92 -p 0 0 -f UbuntuMono -s 12
```

It changes:

- theme to onedark
- opacity to 0.92
- padding:
  - x to 0
  - y to 0
- font to UbuntuMono
- size to 12px

If you want to show all the fonts and available themes, you can run
this command:

```sh
pycritty ls
```

See [pycritty](https://github.com/antoniosarosi/pycritty)

Thanks to @antoniosarosi to create this awesome script, got a star to the pycritty
repository.

## Enjoy

If you love my work, you can give me a star :)
