#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
MAGENTA='\033[1;35m'
GREY='\033[1;37m'
ORANGE='\033[33m'

basebanner () {
cat << EOF
                                        
▗▄▄              ▄▄   █  ▗▄▖            
▐▛▀█       ▐▌   ▐▛▀   ▀  ▝▜▌            
▐▌ ▐▌ ▟█▙ ▐███ ▐███  ██   ▐▌   ▟█▙ ▗▟██▖
▐▌ ▐▌▐▛ ▜▌ ▐▌   ▐▌    █   ▐▌  ▐▙▄▟▌▐▙▄▖▘
▐▌ ▐▌▐▌ ▐▌ ▐▌   ▐▌    █   ▐▌  ▐▛▀▀▘ ▀▀█▖
▐▙▄█ ▝█▄█▘ ▐▙▄  ▐▌  ▗▄█▄▖ ▐▙▄ ▝█▄▄▌▐▄▄▟▌
▝▀▀   ▝▀▘   ▀▀  ▝▘  ▝▀▀▀▘  ▀▀  ▝▀▀  ▀▀▀ 
                                        
                                        
EOF
}

banner () {
  clear
  printf "${BLUE}$(basebanner)${NC}\n"
  printf "                                                                        ${MAGENTA}By: ${GREEN}AlphaTechnolog${NC}\n\n"
  printf "${MAGENTA}┌─>Notice: ${ORANGE}See more of my work in: ${BLUE}https://github.com/AlphaTechnolog${NC}\n"
  printf "${MAGENTA}└────────> ${ORANGE}This installer only works for an ${BLUE}arch-based system${ORANGE}, or in a ${GREEN}void linux installation${ORANGE}, because dependencies are installed with ${BLUE}pacman${ORANGE} and ${BLUE}yay${ORANGE} or for void with ${GREEN}xbps-install${ORANGE}.${NC}\n\n"
}

error () {
  >&2 printf "${ORANGE}[${RED}x${ORANGE}] ${RED}$@${NC}\n"
  exit 1
}

info () {
  >&2 printf "${BLUE}[${MAGENTA}I${BLUE}]${BLUE} <==> ${GREEN}$@${BLUE} <==> ${NC}\n"
}

warning () {
  >&2 printf "${ORANGE}[${BLUE}W${ORANGE}]${MAGENTA} <==> ${ORANGE}$@${MAGENTA} <==> ${NC}\n"
}

cmd () {
  printf "${MAGENTA}\$ ${GREY}${@}${NC}\n"
  $@
  if [[ $? != 0 ]]; then
    error "The above command does not return a valid status code, valid status code = 0, exiting..."
  fi
}

success () {
  printf "${GREEN}[${BLUE}S${GREEN}]${MAGENTA} <==> ${BLUE}$@ ${MAGENTA}<==>${NC}\n"
}

download_dotfiles () {
  if ! test -d $HOME/.dotfiles; then
    info "Downloading dotfiles (using git)"
    cmd "git clone https://github.com/AlphaTechnolog/dotfiles-old-old.git $HOME/.dotfiles"
    success "Downloaded dotfiles successfully"
  fi
}

download_yay () {
  cmd "mkdir -p $HOME/repo"
  cmd "git clone https://aur.archlinux.org/yay-bin.git $HOME/repo/yay"
  cmd "cd $HOME/repo/yay"
  cmd "makepkg -si --noconfirm"
}

install_yay () {
  os=$(get_os)
  if [[ $os == 'Arch Linux' ]]; then
    if ! command -v yay; then
      info "Installing yay: Cannot found it on your system!"
      download_yay
      success "Done"
    fi
  fi
}

check_deps () {
  declare -a deps=('git')
  for dep in ${deps[@]}; do
    if ! command -v $dep 2>&1 > /dev/null; then
      error "Dependency $dep is required, you must install it"
    fi
  done
  install_yay
}

copy_files () {
  info "Copying the files to your system"
  cd $HOME/.dotfiles
  declare -a folders=('.config' '.local/share' '.local/bin')
  for folder in ${folders[@]}; do
    if ! test -d $HOME/$folder; then
      mkdir -p $HOME/$folder
    fi
    # looping each directory with folder in ~/.dotfiles
    for subfolder in $(ls ./$folder); do
      # checking if a exists a folder with the same name of this item subitem
      # e.g: checking for exists a folder alacritty in ~/.config because I am iterating
      # in ~/.dotfiles/.config and I found a folder named alacritty
      if test -d $HOME/$folder/$subfolder; then
        warning "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
        mv $HOME/$folder/$subfolder $HOME/$folder/$subfolder.old
      fi
      if test -f $HOME/$folder/$subfolder; then
        warning "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
        mv $HOME/$folder/$subfolder $HOME/$folder/$subfolder.old
      fi
      cp -r ./$folder/$subfolder $HOME/$folder/
    done
  done
  declare -a files=('.bashrc' '.zshrc')
  for file in ${files[@]}; do
    if test -f $HOME/$file; then
      warning "Moving $HOME/$file to $HOME/${file}.old"
      mv $HOME/$file $HOME/${file}.old
    fi
    cp -r ./$file $HOME/$file
  done
  success "Done, copied the files successfully"
}

get_os () {
  grep -m1 "NAME=" </etc/os-release | cut -d '"' -f 2
}

install_dependencies () {
  os=$(get_os)
  if [[ $os == 'void' ]]; then
    info "Installing dependencies using xbps-install (for void linux)"
    warning "The fonts, cannot be installed using the package manager, check required fonts in README and install it from https://nerdfonts.com/font-downloads"
    cmd "sudo xbps-install -Sy kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst pfetch starship"
    success "Installed base dependencies successfully"
  elif [[ $os == 'Arch Linux' ]]; then
    info "Trying to install dependencies with yay (for arch-linux-based systems)"
    cmd "yay -S ttf-iosevka-nerd nerd-fonts-source-code-pro nerd-fonts-jetbrains-mono kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst pfetch starship pycritty --noconfirm"
    success "Installed base dependencies successfully"
  else
    warning "This installer only works for arch linux and void linux distributions, you have another system! skipping auto dependencies installation"
  fi
}

setup_bash () {
  info "Setting bash as default shell"
  cmd "sudo usermod --shell /bin/bash $(whoami)"
  success "Done"
}

setup_chadwm () {
  info "Recompiling dwm (chadwm)"
  cd $HOME/.config/chadwm/chadwm
  sudo make clean install
  success "Done"
  info "Instaling fonts"
  cmd "mkdir -p $HOME/.local/share/fonts"
  printf "${MAGENTA}\$ ${GREY}cp -r $HOME/.config/chadwm/fonts/* $HOME/.local/share/fonts${NC}\n"
  cp -r $HOME/.config/chadwm/fonts/* $HOME/.local/share/fonts
  success "Done"
}

confirm_continue () {
  info "Press enter to continue with the instalation... "
  read choice
  if [[ $choice != "" ]]; then
    error "Canceled Installation"
  fi
}

main () {
  banner
  check_deps
  confirm_continue
  download_dotfiles
  install_dependencies
  copy_files
  setup_bash
  setup_chadwm
  warning "More functionalities like auto bspwm monitors fixes coming soon..."
  success "Dotfiles installed successfully restart your system and login with bspwm to see changes"
}

main
