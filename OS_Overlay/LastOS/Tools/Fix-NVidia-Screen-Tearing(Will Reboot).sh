#!/bin/bash

nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"

sleep 2

reboot
