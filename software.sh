# If user root
if [ "$EUID" = 0 ];
then 
	echo "Please,start this script without root";
	exit 1
fi

cd ~

sudo pacman -S xorg xorg-server xorg-xinit lxappearance papirus-icon-theme slim 
sudo pacman -S bspwm sxhkd

sudo pacman -S polkit-gnome keepassxc neofetch nitrogen flameshot kitty bottom tmux qalc
sudo pacman -S rofi rofi-qalc

sudo pacman -S neovim vim neovim-qt clang
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim 

sudo pacman -S ipython python python-pip

sudo pacman -S mpv yt-dlp
sudo pacman -S zsh bat lsd

sudo pacman -S qemu virt-manager ebtables dnsmasq firewalld 
sudo systemctl --now enable libvirtd
sudo systemctl --now enable firewalld
sudo sytemctl restart libvirtd

sudo pacman -S clang npm
pip3 install aiogram peewee requests

git clone https://aur.archlinux.org/paru.git 
cd paru
makepkg -si
cd 

paru -S librewolf-bin freetube-bin timeshift-bin kotatogram-desktop-bin 
paru -S polybar-git light-git picom-tryone-git betterlockscreen
paru -S nerd-fonts-jetbrains-mono nordic-darker-theme  
