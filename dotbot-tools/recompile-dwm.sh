echo "Recompiling..."
cd $HOME/.config/chadwm/chadwm
sudo make clean install
echo "Done, installing fonts"
cd ../
mkdir -p $HOME/.local/share/fonts
cp -r ./fonts/* $HOME/.local/share/fonts
echo "Done"
