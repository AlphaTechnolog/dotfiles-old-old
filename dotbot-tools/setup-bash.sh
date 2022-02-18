#!/bin/bash

# Go to bspwm dotfiles directory
cd $(dirname $0)/..

# Setup!
if test -f $HOME/.bashrc; then
  rm $HOME/.bashrc
fi
cat ./.bashrc | sed "s/gabriel/$USER/g" > .tmp-bashrc.sh
mv ./.tmp-bashrc.sh $HOME/.bashrc
echo "Done, bash is READY to START GIVING YOUR AWESOME COMMANDS!"
