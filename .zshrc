source "$HOME/.config/zsh/zshenv.zsh"

zshfiles=("alias" "prompt" "keybinds")
for zshfile in $zshfiles
do
    source "$zshconfigs/${zshfile}.zsh"
done
