# If user root
if [ "$EUID" = 0 ];
then 
	echo "Please,start this script without root";
	exit 1
fi

cd ~

# Base graphics
sudo pacman -S xorg xorg-server xorg-xinit lxappearance papirus-icon-theme
sudo pacman -S bspwm sxhkd

# Shell utils
sudo pacman -S mpv yt-dlp
sudo pacman -S zsh bat lsd fzf 

sudo pacman -S polkit-gnome keepassxc neofetch nitrogen flameshot kitty bottom tmux 
sudo pacman -S rofi libqalculate xsel 

sudo pacman -S tor && sudo systemctl enable --now tor

# Python 
sudo pacman -S ipython python python-pip
pip3 install aiogram peewee requests

# NeoVim
sudo pacman -S vim neovim neovim-qt
sudo pacman -S clang npm ninja
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
pip3 install black nvim

# Virtual Machine tool
sudo pacman -S qemu virt-manager ebtables dnsmasq firewalld nmap  
sudo systemctl --now enable libvirtd
sudo systemctl --now enable firewalld
sudo sytemctl restart libvirtd

git clone https://aur.archlinux.org/paru.git && cd paru
makepkg -si 
cd 

sudo pacman -S mtpfs gvfs-mtp gvfs-gphoto2
paru -S jmtpfs

paru -S librewolf-bin timeshift-bin kotatogram-desktop-bin 
paru -S polybar-git light-git picom-tryone-git betterlockscreen
paru -S ttf-iosevka nordic-darker-theme  
