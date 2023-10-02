#!/bin/sh
xrandr --output DP-0 --mode 1920x1080 --rate 119.88 --left-of DP-2
xrandr --output DP-2 --mode 1920x1080 --rate 279.86 
xrandr --dpi 100
nitrogen --restore 
picom &