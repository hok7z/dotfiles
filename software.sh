# If user root
if [ "$EUID" = 0 ];
then 
	echo "Please,start this script without root";
	exit 1
fi

cd ~
mkdir ~/Pictures ~/Documents ~/bin

# Software
sudo pacman -S kitty tmux bottom flameshot keepassxc gnupg nitrogen pulseaudio polkit-gnome
sudo pacman -S rofi xsel neofetch libqalculate

sudo pacman -S tor
sudo systemctl enable --now tor

# Shell utils
sudo pacman -S zsh bat lsd fzf 
sudo pacman -S mpv jq feh yt-dlp

# Graphics
sudo pacman -S xorg xorg-server xorg-xinit lxappearance papirus-icon-theme
sudo pacman -S bspwm sxhkd

# Python 
sudo pacman -S ipython python python-pip
pip3 install aiogram numpy matplotlib peewee requests

# NeoVim
sudo pacman -S neovim neovim-qt
sudo pacman -S clang gopls python-black cargo npm ninja
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
sudo npm i -g pyright

# Install lua-language-server
cd ~/bin
git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server

cd lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
chmod +x compile/install.sh && bash !$
cd ../../
./3rd/luamake/luamake rebuild
cd

# nnn file manager
cd ~/bin
git clone https://github.com/jarun/nnn
cd nnn
make O_NERD=1 O_EMOJI=1
cd

# Install paru
git clone https://aur.archlinux.org/paru.git 
cd paru
makepkg -si 
cd 
rm -rf paru

# Virtual Machine tool
sudo pacman -S qemu virt-manager ebtables dnsmasq firewalld nmap  
sudo systemctl --now enable libvirtd
sudo systemctl --now enable firewalld
sudo sytemctl restart libvirtd

sudo pacman -S mtpfs gvfs-mtp gvfs-gphoto2
paru -S jmtpfs

paru -S librewolf-bin timeshift-bin kotatogram-desktop-bin 
paru -S polybar-git light-git picom-tryone-git betterlockscreen
paru -S ttf-iosevka nordic-darker-theme  
