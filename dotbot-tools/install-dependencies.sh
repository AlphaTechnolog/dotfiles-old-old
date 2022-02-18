#!/bin/bash

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
  if ! command -v pacman; then
    error "Pacman is not found, skiping"
  fi
  if ! command -v yay; then
    error "Yay is not found, trying to install yay"
    install_yay
  fi
  yay -S ttf-iosevka-nerd nerd-fonts-source-code-pro nerd-fonts-jetbrains-mono kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst --noconfirm
}

main
