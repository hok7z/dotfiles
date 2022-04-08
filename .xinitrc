xsetroot -cursor_name left_ptr
picom --experimental-backends &
nitrogen --restore & 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
deadd-notification-center &
exec ssh-agent & 
sxhkd &
exec dbus-launch bspwm 
