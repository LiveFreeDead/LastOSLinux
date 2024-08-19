# wine-launcher.py
# 
# Script created by Ivan Filho (ivanslf@gmail.com)
# 
# Put into your home folder (~) and edit/create a new .desktop file
# 
# Usage:
#
#   Exec=python3 /LastOS/Scripts-Wine/wine-launcher.py App.exe %F [arg1] [...]
#
# Each Unix file path (/) will be converted into Wine path format (Z:\)
#

import sys
import os.path

args = sys.argv

cmd = ""
app = args[1]

args.pop(0)
args.pop(0)

for arg in args:
    if os.path.isfile(arg):
        arg = '"' + os.popen('winepath -w "' + arg + '"').read().strip() + '"'
    cmd += ' ' + arg

os.system('wine "' + app + '"' + cmd)
sys.exit(0)
