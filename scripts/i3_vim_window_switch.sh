#!/usr/bin/env bash
direction=$1
active=$(xprop -id $(xdotool getwindowfocus) WM_NAME)

shopt -s nocasematch;

if [[ $active =~ "vim" ]]; then
  key=''
  case $direction in
    up) key='k' ;;
    down) key='j' ;;
    left) key='h' ;;
    right) key='l' ;;
  esac
  cmd="g+w+l+${key}"
  xdotool getactivewindow key "$cmd"
else
  i3-msg focus $direction
fi

shopt -u nocasematch;
