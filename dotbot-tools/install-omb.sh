#!/bin/bash

main () {
  echo "Configuring bash as default shell"
  sudo usermod --shell /bin/bash $(whoami)
  echo "Done, downloading oh my bash installer"
  curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -o ./.install-omb.sh
  echo "****Ok, executing installer... (if you get an interactive bash prompt, type exit and press enter to continue with the dotfiles installation)****"
  sleep 0.5
  bash .install-omb.sh
  rm .install-omb.sh
  echo "Done, oh my bash installed successfully, removing default oh my bash configuration"
  rm $HOME/.bashrc
  echo "OK"
}

main
