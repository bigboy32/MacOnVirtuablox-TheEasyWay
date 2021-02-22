MACHINENAME = "MacOS"
VBoxManage createvm --name $MACHINENAME --register --basefolder `pwd`
#Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory 1024 --vram 128
VBoxManage modifyvm $MACHINENAME --nic1 nat
#Create Disk and connect Debian Iso
VBoxManage createhd --filename `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium `pwd`/BaseImage.img
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 2 --device 0 --type dvddrive --medium `pwd`/TheTechBlogger_APFSEfi.iso
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 3 --device 0 --type hdd `pwd`/Clover.qcow2
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 4 --device 0 --type dvddrive `pwd`/BaseSystem.img
