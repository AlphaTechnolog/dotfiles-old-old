#!/bin/bash
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
  done
done
