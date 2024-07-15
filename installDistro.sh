#!/bin/bash

#sudo chmod +x /home/$USER/Descargas/Linux/installKaliDependencies.sh
#sudo /home/$USER/Descargas/Linux/installKaliDependencies.sh

#sudo chmod +x /home/$USER/Descargas/Linux/paquetes.sh
#sudo /home/$USER/Descargas/Linux/paquetes.sh
#sudo echo "$USER ALL=(ALL) NOPASSWD: /sbin/shutdown" >> /etc/sudoers

sudo apt install zip nmap curl gobuster wfuzz burpsuite build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install dolphin libxinerama1 libxinerama-dev bspwm -y

git clone https://github.com/baskerville/bspwm.git /home/$USER/Descargas/
git clone https://github.com/baskerville/sxhkd.git /home/$USER/Descargas/

firefox https://code.visualstudio.com/docs/?dv=linux64_deb
sudo dpkg -i /home/$USER/Descargas/code_*.deb; rm /home/$USER/Descargas/code_*.deb

make /home/$USER/Descargas/bspwm/ && sudo make install /home/$USER/Descargas/bspwm/
make /home/$USER/Descargas/sxhkd/ && sudo make install /home/$USER/Descargas/sxhkd/
mkdir  /home/$USER/.config/{bspwm,sxhkd}
cp /home/$USER/Descargas/Linux/bspwmrc /home/$USER/.config/bspwm/ && sudo chmod +x /home/$USER/.config/bspwm/bspwmrc && mkdir /home/$USER/.config/bspwm/scripts
cp /home/$USER/Descargas/Linux/bspwm_resize /home/$USER/.config/bspwm/scripts/ && sudo chmod +x /home/$USER/.config/bspwm/scripts/bspwm_resize
cp /home/$USER/Descargas/Linux/sxhkdrc /home/$USER/.config/sxhkd/ && sudo chmod +x /home/$USER/.config/sxhkd/sxhkdrc

#Docker:
sudo apt install docker.io -y && sudo service docker start
sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Polybar:
sudo apt install cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev -y
git clone --recursive https://github.com/polybar/polybar /home/$USER/Descargas/
mkdir /home/$USER/Descargas/polybar/build
cmake /home/$USER/Descargas/polybar/build/..
make -j$(nproc) /home/$USER/Descargas/polybar/build
sudo make install /home/$USER/Descargas/polybar/build

#Picom:
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
git clone https://github.com/ibhagwan/picom.git /home/$USER/Descargas/

git submodule update --init --recursive /home/$USER/Descargas/picom/
meson --buildtype=release /home/$USER/Descargas/picom/ build 
ninja -C build /home/$USER/Descargas/picom/
sudo ninja -C build install /home/$USER/Descargas/picom/

#Fonts:

#HACK
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -P /home/$USER/Descargas/
sudo cp /home/$USER/Descargas/Hack.zip /usr/share/fonts/
sudo cp /home/$USER/Descargas/Hack.zip /usr/local/share/fonts/
rm /home/$USER/Descargas/Hack.zip
sudo unzip /usr/share/fonts/Hack.zip -d /usr/share/fonts/
sudo unzip /usr/local/share/fonts/Hack.zip -d /usr/local/share/fonts/
sudo rm /usr/share/fonts/Hack.zip
sudo rm /usr/local/share/fonts/Hack.zip
sudo rm /usr/share/fonts/*md
sudo rm /usr/local/share/fonts/*md
rm /home/$USER/Descargas/Hack.zip 2>/dev/null

#CascadiaCode:
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip -P /home/$USER/Descargas/
sudo cp /home/$USER/Descargas/CascadiaCode.zip /usr/share/fonts/
sudo cp /home/$USER/Descargas/CascadiaCode.zip /usr/local/share/fonts/
rm /home/$USER/Descargas/CascadiaCode.zip
sudo unzip /usr/share/fonts/CascadiaCode.zip -d /usr/share/fonts/
sudo unzip /usr/local/share/fonts/CascadiaCode.zip -d /usr/local/share/fonts/
sudo rm /usr/share/fonts/CascadiaCode.zip
sudo rm /usr/local/share/fonts/CascadiaCode.zip
sudo rm /usr/share/fonts/*md && sudo rm /usr/share/fonts/LICENSE
sudo rm /usr/local/share/fonts/*md && sudo rm /usr/local/share/fonts/LICENSE
rm /home/$USER/Descargas/CascadiaCode.zip 2>/dev/null

#Kitty:
mkdir /home/$USER/.config/kitty
cp ./kitty.conf /home/$USER/.config/kitty/
cp ./color.ini /home/$USER/.config/kitty/
sudo mkdir /opt/kitty
sudo wget https://github.com/kovidgoyal/kitty/releases/download/v0.35.2/kitty-0.35.2-x86_64.txz -P /opt/kitty
sudo tar -xf /opt/kitty/kitty-0.35.2-x86_64.txz -C /opt/kitty
sudo rm /opt/kitty/kitty-0.35.2-x86_64.txz
sudo cp /home/$USER/.config/kitty/* /home/root/.config/kitty/
sudo apt install imagemagick feh -y 

#Images:
unzip /home/$USER/Descargas/Linux/images.zip -d /home/$USER/Descargas/Linux/
cp /home/$USER/Descargas/Linux/*.jpg /home/$USER/Imágenes/
cp /home/$USER/Descargas/Linux/*.png /home/$USER/Imágenes/
rm /home/$USER/Descargas/Linux/images.zip


#ZSH:
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete picom -y
cp .zshrc /home/$USER/.zshrc

#Polybar
git clone https://github.com/VaughnValle/blue-sky /home/$USER/Descargas/blue-sky
mkdir /home/$USER/.config/polybar/
cp -r /home/$USER/Descargas/blue-sky /home/$USER/.config/polybar/
sudo cp -r /home/$USER/.config/polybar/fonts/* /usr/share/fonts/truetype
fc-cache -v

#Rofi:
sudo apt install rofi -y
mkdir -p /home/$USER/.config/rofi/themes
cp /home/$USER/Descargas/blue-sky/nord.rasi /home/$USER/.config/rofi/themes
rofi-theme-selector


#Picom:
mkdir /home/$USER/.config/picom/
cp picom.conf /home/$USER/.config/picom/picom.conf 

#PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$USER/powerlevel10k
zsh
#p10k configure
#para reconfigurarlo
cp .p10k.zsh /home/$USER/.p10k.zsh
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/root/powerlevel10k
sudo compaudit
sudo chown root:root /usr/local/share/zsh/site-functions/_bspc
sudo zsh
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $USER
sudo ln -s -f /home/$USER/.zshrc /home/root/.zshrc
cp .p10k.zsh /home/root/.p10k.zsh

#Bat Cat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -P /home/$USER/Descargas/
sudo dpkg -i /home/$USER/Descargas/bat_0.24.0_amd64.deb
rm /home/$USER/Descargas/bat_0.24.0_amd64.deb

#Lsd
wget https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64.deb -P /home/$USER/Descargas/
sudo dpkg -i /home/$USER/Descargas/lsd_1.1.2_amd64.deb
rm /home/$USER/Descargas/lsd_1.1.2_amd64.deb
sudo umount /run/user/1000/doc
sudo updatedb

#Zsh extensions:
#sudo
sudo mkdir /usr/share/zsh-sudo
sudo mkdir /usr/share/zsh-autosuggestions/
sudo mkdir /usr/share/zsh-syntax-highlighting/

sudo chown $USER:$USER /usr/share/zsh-sudo
sudo chown $USER:$USER /usr/share/zsh-autosuggestions/
sudo chown $USER:$USER /usr/share/zsh-syntax-highlighting/

sudo cp /home/$USER/Descargas/Linux/sudo.plugin.zsh /usr/share/zsh-sudo
sudo chmod +x /usr/share/zsh-sudo

sudo cp /home/$USER/Descargas/Linux/sudo.plugin.zsh /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sudo chmod +x /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

sudo cp /home/$USER/Descargas/Linux/zsh-autosuggestions.zsh /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sudo chmod +x /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#nvim chad:
sudo mkdir /opt/nvim/
sudo wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz -P /opt/nvim/
sudo tar -xf /opt/nvim/nvim-linux64.tar.gz -C /opt/nvim/
git clone https://github.com/NvChad/starter ~/.config/nvim
sudo rm /opt/nvim/nvim-linux64.tar.gz
nvim
sudo cp -rf /home/$USER/.config/kitty/* /home/root/.config/kitty/
sudo nvim

#Flameshot
sudo apt install flameshot -y
