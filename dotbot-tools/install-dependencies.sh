#!/bin/bash

get_os () {
  grep -m1 "NAME=" </etc/os-release | cut -d '"' -f 2
}

install_yay () {
  mkdir -p .repo
  cd .repo
  git clone https://aur.archlinux.org/yay.git yay
  cd yay
  makepkg -si --noconfirm
  cd ../../
  rm -rf ./.repo
}

main () {
  os=$(get_os)
  if [[ $os == 'void' ]]; then
    echo "Installing dependencies for void linux, fonts cannot be installed using package manager, install it manually! fonts in README :v"
    sudo xbps-install -Sy kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst pfetch starship
  elif [[ $os == 'Arch Linux' ]]; then
    if ! command -v yay; then
      >&2 echo "yay not found: installing!..."
      install_yay
    fi
    yay -S ttf-iosevka-nerd nerd-fonts-source-code-pro nerd-fonts-jetbrains-mono kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst pfetch starship pycritty --noconfirm
  else
    echo "Dependencies cannot be installed, because you have another operative system, skipping (autodependencies installation only works for arch linux and void linux)"
    exit 0
  fi
}

main
