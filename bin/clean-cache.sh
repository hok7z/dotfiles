rm -rf ~/.cache/yay/
yay -Scc
sudo pacman -Rns $(pacman -Qtdq)
