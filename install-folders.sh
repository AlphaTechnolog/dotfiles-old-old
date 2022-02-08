#!/bin/bash
git clone https://github.com/AlphaTechnolog/bspwm-dotfiles-v2 ~/.bspwm-dotfiles
cd ~/.bspwm-dotfiles
declare -a folders=('.config' '.local/share' '.local/bin')
for folder in ${folders[@]}; do
  if ! test -d ~/$folder; then
    mkdir -p ~/$folder
  fi
  for subfolder in $(ls ./$folder); do
    if test -d ~/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv ~/$folder/$subfolder ~/$folder/$subfolder.old
    fi
    if test -f ~/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv ~/$folder/$subfolder ~/$folder/$subfolder.old
    fi
    cp -r ./$folder/$subfolder ~/$folder/
  done
done
