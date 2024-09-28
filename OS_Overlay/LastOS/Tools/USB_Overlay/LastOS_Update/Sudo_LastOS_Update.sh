#!/bin/bash

# Copy Update Overlay
cp -rf $(dirname "$0")/Sudo_OS_Overlay/* / 2> /dev/null

#Extract Sudo Overlays if they exist
tar -xf $(dirname "$0")/Sudo_OS_Overlay.tar -C /

#chmod -R 775 /LastOS

#Fix /LastOS Ownership (775 might be enough, but I'll go 777 until I know the bugs is fixed)
#chmod -R 777 "/LastOS" 2> /dev/null

