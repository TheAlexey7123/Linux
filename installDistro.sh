#!/bin/bash

#sudo chmod +x /home/alexey/Descargas/Linux/installKaliDependencies.sh
#sudo /home/alexey/Descargas/Linux/installKaliDependencies.sh

#sudo chmod +x /home/alexey/Descargas/Linux/paquetes.sh
#sudo /home/alexey/Descargas/Linux/paquetes.sh
#sudo echo "alexey ALL=(ALL) NOPASSWD: /sbin/shutdown" >> /etc/sudoers

sudo apt-get update -y

sudo apt install zip nmap net-tools libuv1-dev curl gobuster wfuzz burpsuite build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install dolphin libxinerama1 zsh libxinerama-dev bspwm -y
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
sudo apt install acpi wmname scrub meson caja tmux xclip libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y


git clone https://github.com/baskerville/bspwm.git /home/alexey/Descargas/
git clone https://github.com/baskerville/sxhkd.git /home/alexey/Descargas/

firefox

#BSPWM

make /home/alexey/Descargas/bspwm/ && sudo make install /home/alexey/Descargas/bspwm/
make /home/alexey/Descargas/sxhkd/ && sudo make install /home/alexey/Descargas/sxhkd/
mkdir  /home/alexey/.config/{bspwm,sxhkd}
cp /home/alexey/Descargas/Linux/bspwmrc /home/alexey/.config/bspwm/ && sudo chmod +x /home/alexey/.config/bspwm/bspwmrc && mkdir /home/alexey/.config/bspwm/scripts
cp /home/alexey/Descargas/Linux/bspwm_resize /home/alexey/.config/bspwm/scripts/ && sudo chmod +x /home/alexey/.config/bspwm/scripts/bspwm_resize
cp /home/alexey/Descargas/Linux/sxhkdrc /home/alexey/.config/sxhkd/ && sudo chmod +x /home/alexey/.config/sxhkd/sxhkdrc

#Docker:
sudo apt install docker.io -y && sudo service docker start
sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Polybar:
sudo apt install cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev -y
git clone --recursive https://github.com/polybar/polybar /home/alexey/Descargas/
mkdir /home/alexey/Descargas/polybar/build
cmake /home/alexey/Descargas/polybar/build/..
make -j$(nproc) /home/alexey/Descargas/polybar/build
sudo make install /home/alexey/Descargas/polybar/build

#Picom:
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
git clone https://github.com/ibhagwan/picom.git /home/alexey/Descargas/

#Picom:
mkdir /home/alexey/.config/picom/
sudo mkdir /home/root/.config/picom/

git submodule update --init --recursive /home/alexey/Descargas/picom/
meson --buildtype=release /home/alexey/Descargas/picom/ build 
ninja -C build /home/alexey/Descargas/picom/
sudo ninja -C build install /home/alexey/Descargas/picom/

cp /home/alexey/Descargas/Linux/picom.conf /home/alexey/.config/picom/picom.conf 
sudo cp /home/alexey/Descargas/Linux/picom.conf /home/alexey/.config/picom/picom.conf 
sudo ln -s -f /home/alexey/.config/picom/picom.conf /home/root/.config/picom/picom.conf

#Fonts:

#HACK
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -P /home/alexey/Descargas/
sudo cp /home/alexey/Descargas/Hack.zip /usr/share/fonts/
sudo cp /home/alexey/Descargas/Hack.zip /usr/local/share/fonts/
rm /home/alexey/Descargas/Hack.zip
sudo unzip /usr/share/fonts/Hack.zip -d /usr/share/fonts/
sudo unzip /usr/local/share/fonts/Hack.zip -d /usr/local/share/fonts/
sudo rm /usr/share/fonts/Hack.zip
sudo rm /usr/local/share/fonts/Hack.zip
sudo rm /usr/share/fonts/*md
sudo rm /usr/local/share/fonts/*md
rm /home/alexey/Descargas/Hack.zip 2>/dev/null

#CascadiaCode:
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip -P /home/alexey/Descargas/
sudo cp /home/alexey/Descargas/CascadiaCode.zip /usr/share/fonts/
sudo cp /home/alexey/Descargas/CascadiaCode.zip /usr/local/share/fonts/
rm /home/alexey/Descargas/CascadiaCode.zip
sudo unzip /usr/share/fonts/CascadiaCode.zip -d /usr/share/fonts/
sudo unzip /usr/local/share/fonts/CascadiaCode.zip -d /usr/local/share/fonts/
sudo rm /usr/share/fonts/CascadiaCode.zip
sudo rm /usr/local/share/fonts/CascadiaCode.zip
sudo rm /usr/share/fonts/*md && sudo rm /usr/share/fonts/LICENSE
sudo rm /usr/local/share/fonts/*md && sudo rm /usr/local/share/fonts/LICENSE
rm /home/alexey/Descargas/CascadiaCode.zip 2>/dev/null

#Kitty:
mkdir /home/alexey/.config/kitty
cp ./kitty.conf /home/alexey/.config/kitty/
cp ./color.ini /home/alexey/.config/kitty/
sudo mkdir /opt/kitty
sudo wget https://github.com/kovidgoyal/kitty/releases/download/v0.35.2/kitty-0.35.2-x86_64.txz -P /opt/kitty
sudo tar -xf /opt/kitty/kitty-0.35.2-x86_64.txz -C /opt/kitty
sudo rm /opt/kitty/kitty-0.35.2-x86_64.txz
sudo cp /home/alexey/.config/kitty/* /home/root/.config/kitty/
sudo apt install imagemagick feh -y 

#Images:
unzip /home/alexey/Descargas/Linux/images.zip -d /home/alexey/Descargas/Linux/
cp /home/alexey/Descargas/Linux/*.jpg /home/alexey/Imágenes/
cp /home/alexey/Descargas/Linux/*.png /home/alexey/Imágenes/
rm /home/alexey/Descargas/Linux/images.zip

#Code:
firefox https://code.visualstudio.com/docs/?dv=linux64_deb -O /home/alexey/Descargas/
sudo dpkg -i /home/alexey/Descargas/code_*.deb; rm /home/alexey/Descargas/code_*.deb

#ZSH:
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete picom -y
cp .zshrc /home/alexey/.zshrc

#Polybar
git clone https://github.com/VaughnValle/blue-sky /home/alexey/Descargas/blue-sky
mkdir /home/alexey/.config/polybar/
cp -r /home/alexey/Descargas/blue-sky /home/alexey/.config/polybar/
sudo cp -r /home/alexey/.config/polybar/fonts/* /usr/share/fonts/truetype
fc-cache -v

#Rofi:
sudo apt install rofi -y
mkdir -p /home/alexey/.config/rofi/themes
cp /home/alexey/Descargas/blue-sky/nord.rasi /home/alexey/.config/rofi/themes
rofi-theme-selector

#PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/alexey/powerlevel10k
zsh
#p10k configure
#para reconfigurarlo
cp .p10k.zsh /home/alexey/.p10k.zsh
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/root/powerlevel10k
sudo compaudit
sudo chown root:root /usr/local/share/zsh/site-functions/_bspc
sudo zsh
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh alexey
sudo ln -s -f /home/alexey/.zshrc /home/root/.zshrc
cp .p10k.zsh /home/root/.p10k.zsh

#Bat Cat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -P /home/alexey/Descargas/
sudo dpkg -i /home/alexey/Descargas/bat_0.24.0_amd64.deb
rm /home/alexey/Descargas/bat_0.24.0_amd64.deb

#Lsd
wget https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64.deb -P /home/alexey/Descargas/
sudo dpkg -i /home/alexey/Descargas/lsd_1.1.2_amd64.deb
rm /home/alexey/Descargas/lsd_1.1.2_amd64.deb
sudo umount /run/user/1000/doc
sudo updatedb

#Zsh extensions:
#sudo
sudo mkdir /usr/share/zsh-sudo
sudo mkdir /usr/share/zsh-autosuggestions/
sudo mkdir /usr/share/zsh-syntax-highlighting/

sudo chown alexey:alexey /usr/share/zsh-sudo
sudo chown alexey:alexey /usr/share/zsh-autosuggestions/
sudo chown alexey:alexey /usr/share/zsh-syntax-highlighting/

sudo cp /home/alexey/Descargas/Linux/sudo.plugin.zsh /usr/share/zsh-sudo
sudo chmod +x /usr/share/zsh-sudo

sudo cp /home/alexey/Descargas/Linux/sudo.plugin.zsh /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sudo chmod +x /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

sudo cp /home/alexey/Descargas/Linux/zsh-autosuggestions.zsh /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sudo chmod +x /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#nvim chad:
sudo mkdir /opt/nvim/
sudo wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz -P /opt/nvim/
sudo tar -xf /opt/nvim/nvim-linux64.tar.gz -C /opt/nvim/
git clone https://github.com/NvChad/starter ~/.config/nvim
sudo rm /opt/nvim/nvim-linux64.tar.gz
nvim
sudo cp -rf /home/alexey/.config/kitty/* /home/root/.config/kitty/
sudo nvim

#Flameshot
sudo apt install flameshot -y
