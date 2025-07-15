#!/bin/sh
###
 # @Author: love-yuri yuri2078170658@gmail.com
 # @Date: 2025-07-02 22:31:21
 # @LastEditTime: 2025-07-13 11:31:35
 # @Description: 
### 
hyprpicker --format hex | head -c -1 | wl-copy
convert -size 100x100 xc:$(wl-paste) /tmp/color.png
dunstify --icon=/tmp/color.png "$(wl-paste)"  "Copied to your clipboard!"
