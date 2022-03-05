main () {
  if ! test -f $HOME/.actual-theme; then
    echo catppuccin > $HOME/.actual-theme
  fi
}

wall_catppuccin () {
  echo $HOME/.dotfiles/.sample-wallpapers/catppuccin-cat.png
}

wall_tokyonight () {
  echo $HOME/.dotfiles/.sample-wallpapers/tokyonight-techno.png
}

wall_gruvbox () {
  echo $HOME/.dotfiles/.sample-wallpapers/gruvbox-city.png
}

wall_material_ocean () {
  echo $HOME/.dotfiles/.sample-wallpapers/material-ocean.jpg
}

wall_onedark () {
  echo $HOME/.dotfiles/.sample-wallpapers/onedark.png
}

wall_everforest () {
  echo $HOME/.dotfiles/.sample-wallpapers/everforest.jpg
}

wall_everblush () {
  echo $HOME/.dotfiles/.sample-wallpapers/everblush.png
}

load_wallpaper () {
  theme=$(cat $HOME/.actual-theme)
  wall=$(wall_$theme)
  feh --bg-fill $wall
}

main
