@echo off

cd "C:Program Files\Oracle\VirtualBox"

$MN = "MacOS"
VBoxManage.exe modifyvm $1 --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff 
VBoxManage.exe setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3" 
VBoxManage.exe setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0" 
VBoxmanage.exe setextradata $1 "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple" 
VBoxmanage.exe setextradata $1 "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" 
VBoxmanage.exe setextradata $1 "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
