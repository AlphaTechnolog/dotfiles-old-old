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
                                                                      
▗▄▄▖                          ▗▄▄              ▄▄   █  ▗▄▖            
▐▛▀▜▌                         ▐▛▀█       ▐▌   ▐▛▀   ▀  ▝▜▌            
▐▌ ▐▌▗▟██▖▐▙█▙ █   █▐█▙█▖     ▐▌ ▐▌ ▟█▙ ▐███ ▐███  ██   ▐▌   ▟█▙ ▗▟██▖
▐███ ▐▙▄▖▘▐▛ ▜▌▜ █ ▛▐▌█▐▌     ▐▌ ▐▌▐▛ ▜▌ ▐▌   ▐▌    █   ▐▌  ▐▙▄▟▌▐▙▄▖▘
▐▌ ▐▌ ▀▀█▖▐▌ ▐▌▐▙█▟▌▐▌█▐▌ ██▌ ▐▌ ▐▌▐▌ ▐▌ ▐▌   ▐▌    █   ▐▌  ▐▛▀▀▘ ▀▀█▖
▐▙▄▟▌▐▄▄▟▌▐█▄█▘▝█ █▘▐▌█▐▌     ▐▙▄█ ▝█▄█▘ ▐▙▄  ▐▌  ▗▄█▄▖ ▐▙▄ ▝█▄▄▌▐▄▄▟▌
▝▀▀▀  ▀▀▀ ▐▌▀▘  ▀ ▀ ▝▘▀▝▘     ▝▀▀   ▝▀▘   ▀▀  ▝▘  ▝▀▀▀▘  ▀▀  ▝▀▀  ▀▀▀ 
          ▐▌                                                          
                                                                      
EOF
}

banner () {
  clear
  printf "${BLUE}$(basebanner)${NC}\n"
  printf "                                                    ${MAGENTA}By: ${GREEN}AlphaTechnolog${NC}\n\n"
  printf "${MAGENTA}┌─>Notice: ${ORANGE}See more of my work in: ${BLUE}https://github.com/AlphaTechnolog${NC}\n"
  printf "${MAGENTA}└────────> ${ORANGE}This installer only works for an ${GREEN}arch-based system${ORANGE}, because dependencies are installed with ${BLUE}pacman${ORANGE} and ${BLUE}yay${ORANGE}.${NC}\n\n"
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
  info "Downloading dotfiles (using git)"
  if test -d $HOME/.bspwm-dotfiles; then
    warning "Found another installation of bspwm dotfiles, moving it to $HOME/.bspwm-dotfiles.old"
    mv $HOME/.bspwm-dotfiles $HOME/.bspwm-dotfiles.old
  fi
  cmd "git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2.git $HOME/.bspwm-dotfiles"
  success "Downloaded dotfiles successfully"
}

check_deps () {
  declare -a deps=('git')
  for dep in ${deps[@]}; do
    if ! command -v $dep; then
      error "Dependency $dep is required, you must install it"
    fi
  done
}

copy_files () {
  info "Copying the files to your system using the install_folders.sh script"
  cmd "bash $HOME/install-folders.sh"
  success "Command executed successfully"
}

install_dependencies () {
  info "Installing dependencies for the dotfiles using yay"
  cmd "yay -S ttf-iosevka-nerd nerd-fonts-source-code-pro nerd-fonts-jetbrains-mono kitty alacritty rofi sxhkd bspwm polybar picom feh bat exa dunst"
  success "Installed base dependencies successfully"
}

main () {
  banner
  check_deps
  banner
  download_dotfiles
  install_dependencies
  copy_files
  warning "More functionalities like auto shell setup coming soon..."
  success "Dotfiles installed successfully restart your system and login with bspwm to see changes"
}

main
