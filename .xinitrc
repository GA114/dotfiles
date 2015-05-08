#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Zap X if it misbehaves with Ctrl-Alt-Bksp
setxkbmap -option terminate:ctrl_alt_bksp

xmodmap ~/.xmodmaprc

xrdb ~/.Xresources
xrdb -merge ~/.Xresources.local

exec /usr/bin/i3 # -V -d all >> /tmp/i3.log-$(date +'%F-%k-%M-%S') 2>&1

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
