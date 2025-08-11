#!/bin/bash

selected=$(cliphist list | rofi -dmenu) || selected=$(cliphist list | head -n 1)
echo "$selected" | cliphist decode | wl-copy