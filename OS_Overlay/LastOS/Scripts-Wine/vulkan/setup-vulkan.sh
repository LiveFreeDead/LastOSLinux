#!/usr/bin/env bash
cd "$(dirname "$(readlink -f "$0")")" || exit

wineboot -i
wineserver -w
bash "$PWD/dxvk/setup_dxvk.sh" install
bash "$PWD/vkd3d/setup_vkd3d_proton.sh" install

cp -r -f "$PWD/dxvk-nvapi/x64/nvapi64.dll" "$WINEPREFIX/drive_c/windows/system32"
cp -r -f "$PWD/dxvk-nvapi/x32/nvapi.dll" "$WINEPREFIX/drive_c/windows/syswow64"
winecfg -v win11
wineserver -w
