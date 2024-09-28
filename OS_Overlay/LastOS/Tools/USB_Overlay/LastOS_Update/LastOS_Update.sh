#!/bin/bash

# Copy Update Overlay
cp -rf $(dirname "$0")/OS_Overlay/LastOS/* /LastOS 2> /dev/null
#chmod -R 775 /LastOS

#Fix /LastOS Ownership (775 might be enough, but I'll go 777 until I know the bugs is fixed)
chmod -R 777 "/LastOS" 2> /dev/null

