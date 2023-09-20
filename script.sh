#!/bin/bash

#Download essentials
sudo apt install -y libxinerama1 libxinerama-dev build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install -y make cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting

#plugin zsh autocomplete
cd ~/Descargas
sudo mkdir /usr/share/zsh-autocomplete/
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
cd zsh-autocomplete/
sudo cp zsh-autocomplete.plugin.zsh /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
sleep 2
cd ..
rm -rf zsh-autocomplete

#Wallpaper
https://wallpapercave.com/wp/wp8148899.png

#Download programs
sudo apt install -y 7zip bspwm sxhkd rofi picom feh ranger

#Update and upgrade
sudo apt update
sudo apt upgrade

#kitty updated
cd ~/Descargas
mkdir kitty
cd kitty
wget https://github.com/kovidgoyal/kitty/releases/download/v0.30.0/kitty-0.30.0-x86_64.txz
7z x kitty-0.30.0-x86_64.txz
rm -f kitty-0.30.0-x86_64.txz
tar -xf kitty-0.30.0-x86_64.tar
rm -f kitty-0.30.0-x86_64.tar
cd ..
sudo mv kitty/ /opt/
sudo su
cd
mkdir .config/
mkdir .config/kitty
cp /home/alexey/.config/kitty/* .config/kitty/

#picom:
#cd ~/Descargas
#git clone https://github.com/ibhagwan/picom.git
#cd picom
#git submodule update --init --recursive
#meson --buildtype=release . build
#ninja -C build
#sudo ninja -C build install
#sleep 2
#cd 
#rm -rf ~/Descargas/picom

#My config
cd Descargas/Linux
mkdir ~/.config/picom/picom.conf
cp picom.conf ~/.config/picom/picom.conf
mkdir ~/.config/bspwm
mkdir ~/.config/bspwm/scripts
cp bspwm_resize ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bspwm/scripts/bspwm_resize
mkdir ~/.config/sxhkd
cp sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/sxhkd/sxhkdrc
cp bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc
mkdir ~/.config/kitty
cp color.ini kitty.conf ~/.config/kitty
#https://www.gnome-look.org/p/https%3A%2F%2Fgithub.com%2Fshvchk%2Fpoly-dark%2Farchive%2Fmaster.zip

#Fonts
#Hack Nerd font
cd
cd Documentos
mkdir hack
cd hack
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
7z x Hack.zip
sleep 1
rm Hack.zip *.md -f
sudo mv * /usr/share/fonts
cd ..
rm -rf hack/

#CaskaydiaCoveNerdFont
cd ~/Documentos
mkdir cascadia
cd cascadia/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
7z x CascadiaCode.zip
sleep 1
rm LICENSE *.md *.zip -f
sudo mv * /usr/share/fonts
cd ..
rm -rf cascadia
#end fonts

#lsd
curl https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd_1.0.0_amd64.deb > lsd.deb
sudo dpkg -i lsd.deb

#batcat
curl https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb > bat.deb
sudo dpkg -i bat.deb
sleep 1
rm *.deb

#polybar
cd ~/Documentos/
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build/
cmake ..
make -j$(nproc)
sudo make install
sleep 2
rm -rf ~/Documentos/polybar
