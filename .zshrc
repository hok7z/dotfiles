source "$HOME/.config/zsh/zshenv.zsh"
zshfiles=("alias" "prompt" "keybinds")
for zshfile in $zshfiles
do
    source "$zshconfigs/${zshfile}.zsh"
done

path+=('/home/q/bin')
path+=('~/bin/lua-language-server/bin')
export PATH

alias luamake=/home/q/bin/lua-language-server/3rd/luamake/luamake
