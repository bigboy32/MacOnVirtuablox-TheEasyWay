@echo off

cd "C:Program Files\Oracle\VirtualBox"
VBoxmanage.exe createvm --name "$1" --ostype "MacOS1013_64"