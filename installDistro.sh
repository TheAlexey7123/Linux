#!/bin/bash

#sudo chmod +x /home/alexey/Descargas/Linux/installKaliDependencies.sh
#sudo /home/alexey/Descargas/Linux/installKaliDependencies.sh

#sudo chmod +x /home/alexey/Descargas/Linux/paquetes.sh
#sudo /home/alexey/Descargas/Linux/paquetes.sh

if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root" 
   exit 1
fi

echo "alexey ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "alexey ALL=(ALL) NOPASSWD: /sbin/shutdown" >> /etc/sudoers
usermod -aG root alexey
su - alexey

sudo apt-get update -y
sudo setxkbmap es

sudo apt install apache2 php python3 nano gparted thunar lxappearance neofetch htop zip tree nmap x11-xserver-utils net-tools libuv1-dev curl gobuster wfuzz build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install dolphin libxinerama1 zsh libxinerama-dev bspwm -y
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
sudo apt install acpi wmname scrub meson caja tmux xclip libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y

#BSPWM
git clone https://github.com/baskerville/bspwm.git /home/alexey/Descargas/
git clone https://github.com/baskerville/sxhkd.git /home/alexey/Descargas/

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
git clone --recursive https://github.com/polybar/polybar
mkdir /home/alexey/Descargas/Linux/polybar/build
cmake .
make -j$(nproc)
sudo make install /home/alexey/Descargas//Linux/polybar/build

#Picom:
sudo apt install picom meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
#git clone https://github.com/ibhagwan/picom.git /home/alexey/Descargas/

mkdir /home/alexey/.config/picom/
sudo mkdir -p /home/root/.config/picom/

#git submodule update --init --recursive /home/alexey/Descargas/picom/
#meson --buildtype=release /home/alexey/Descargas/picom/ build 
#ninja -C build /home/alexey/Descargas/picom/
#sudo ninja -C build install /home/alexey/Descargas/picom/

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
firefox https://code.visualstudio.com/docs/?dv=linux64_deb && sleep 25
sudo dpkg -i /home/alexey/Descargas/Linux/code_*.deb

#ZSH:
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting picom -y

#Polybar
git clone https://github.com/VaughnValle/blue-sky /home/alexey/Descargas/blue-sky
mkdir /home/alexey/.config/polybar/
cp -r /home/alexey/Descargas/blue-sky/* /home/alexey/.config/polybar/
sudo cp -r /home/alexey/.config/polybar/fonts/* /usr/share/fonts/truetype/
fc-cache -v
sudo mkdir /root/.config/polybar

#Rofi:
sudo apt install rofi -y
mkdir -p /home/alexey/.config/rofi/themes
cp /home/alexey/Descargas/blue-sky/nord.rasi /home/alexey/.config/rofi/themes
git clone https://github.com/davatorium/rofi-themes
sudo cp -rf /home/alexey/Descargas/Linux/rofi-themes/User\ Themes/* /usr/share/rofi/themes
chown -R alexey:alexey /usr/share/rofi/themes/

git clone https://github.com/lr-tech/rofi-themes-collection.git
mkdir -p /home/alexey/.local/share/rofi/themes/
cp -r /home/alexey/Descargas/Linux/rofi-themes-collection/themes/* /home/alexey/.local/share/rofi/themes/

#Papirus-icons:
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'
sudo apt-get update -y
sudo apt-get install papirus-icon-theme -y

#PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/alexey/powerlevel10k

#p10k configure
#para reconfigurarlo
cp /home/alexey/Descargas/Linux/.p10k.zsh /home/alexey/.p10k.zsh
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/root/powerlevel10k
sudo compaudit
sudo chown root:root /usr/local/share/zsh/site-functions/_bspc

sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh alexey
cp /home/alexey/Descargas/Linux/.p10k.zsh /home/root/.p10k.zsh

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

sudo cp /home/alexey/Descargas/Linux/sudo.plugin.zsh /usr/share/zsh-sudo
sudo chmod +x /usr/share/zsh-sudo

sudo cp /home/alexey/Descargas/Linux/zsh-syntax-highlighting.zsh /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sudo chmod +x /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

sudo cp /home/alexey/Descargas/Linux/zsh-autosuggestions.zsh /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sudo chmod +x /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

sudo chown -R alexey:alexey /usr/share/zsh-sudo
sudo chown -R alexey:alexey /usr/share/zsh-autosuggestions/
sudo chown -R alexey:alexey /usr/share/zsh-syntax-highlighting/

#nvim chad:
sudo mkdir /opt/nvim/
sudo wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz -P /opt/nvim/
sudo tar -xf /opt/nvim/nvim-linux64.tar.gz -C /opt/nvim/
git clone https://github.com/NvChad/starter ~/.config/nvim
sudo rm /opt/nvim/nvim-linux64.tar.gz
wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotus.vim
wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotusbar.vim
wget https://raw.githubusercontent.com/Necros1s/lotus/master/init.vim

# Mover archivos descargados al directorio de configuración de nvim
mv lotus.vim lotusbar.vim init.vim ~/.config/nvim

# Añadir configuraciones al archivo init.vim
echo 'colorscheme nord' >> ~/.config/nvim/init.vim
echo 'syntax on' >> ~/.config/nvim/init.vim

nvim
sudo cp -rf /home/alexey/.config/kitty/* /home/root/.config/kitty/
sudo nvim

#Flameshot
sudo apt install flameshot -y

#Obsidian:
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.5/obsidian-1.6.5-amd64.deb -P /home/alexey/Descargas/
sudo dpkg -i /home/alexey/Descargas/obsidian*.deb
rm /home/alexey/Descargas/obsidian*.deb

#Material-Black-Blueberry
sudo unzip /home/alexey/Descargas/Linux/Material-Black-Blueberry-LA-2.9.9-07.zip -d /usr/share/themes/
sudo unzip /home/alexey/Descargas/Linux/Material-Black-Blueberry-Suru_1.9.3.zip -d /usr/share/icons/

#Neofetch:
mkdir -p /home/alexey/.config/neofetch
sed -i 's/ascii_distro=.*/ascii_distro="arch"/' ~/.config/neofetch/config.conf
sed -i 's/ascii_colors=(.*/ascii_colors=(6 6 6 6 6 6)/' ~/.config/neofetch/config.conf

#Grub theme:
unzip /home/alexey/Descargas/Linux/poly-dark-master.zip
sudo /home/alexey/Descargas/Linux/poly-dark-master/install.sh
sudo apt install xclip -y
echo 'GRUB_CMDLINE_LINUX=""
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"' | xclip -sel clip
sudo nano /etc/default/grub
sudo update-grub
sudo nano /boot/grub/grub.cfg

#Final:
cp /home/alexey/Descargas/Linux/.zshrc /home/alexey/.zshrc
cp /home/alexey/Descargas/Linux/.zshrc /home/root/.zshrc
sudo ln -s -f /home/alexey/.zshrc /home/root/.zshrc
sudo chown -R alexey:alexey /home/alexey/
sudo chmod -R 755 /usr/local/bin
xrandr -s 1920x1080
rofi-theme-selector
lxappearance &>/dev/null & disown
