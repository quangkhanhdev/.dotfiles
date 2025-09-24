#!/usr/bin/env bash
dir="$HOME/.config/rofi"

## Run
rofi \
    -modi emoji \
    -show emoji \
    -emoji-format '{emoji}' \
    -theme ${dir}/emoji.rasi