#!/bin/bash

#Restart Cinnamon (hopefully Fixes Text error)
nemo -q # Stop nemo
nemo --no-default-window &
cinnamon --replace
# &