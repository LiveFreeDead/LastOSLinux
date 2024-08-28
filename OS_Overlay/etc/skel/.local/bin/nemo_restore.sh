#!/bin/bash

IFS=$'\n'; read -d '' -r -a dirs < ~/.config/nemo/nemo.openwindows

for dir in "${dirs[@]}"; do
    nemo "$dir" &
    sleep 0.5
done
