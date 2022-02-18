#!/bin/bash
declare -a folders=('.config' '.local/share' '.local/bin')
for folder in ${folders[@]}; do
  if ! test -d $HOME/$folder; then
    mkdir -p $HOME/$folder
  fi
  for subfolder in $(ls ./$folder); do
    if test -d $HOME/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv $HOME/$folder/$subfolder $HOME/$folder/$subfolder.old
    fi
    if test -f $HOME/$folder/$subfolder; then
      echo "Moving $HOME/$folder/$subfolder -> $HOME/$folder/$subfolder.old"
      mv $HOME/$folder/$subfolder $HOME/$folder/$subfolder.old
    fi
  done
done
declare -a files=('.bashrc' '.zshrc' '.p10k.zsh')
for file in ${files[@]}; do
  if test -f $HOME/$file; then
    echo "Moving $HOME/$file to $HOME/$file.old"
    mv $HOME/$file $HOME/$file.old
  fi
  cp -r ./$file $HOME/$file
done
