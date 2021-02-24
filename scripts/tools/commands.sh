vm_name=$1 vm_name="$1"
resolution="1280x800"           
DmiSystemFamily="MacBook Pro"        # Model Name
DmiSystemProduct="MacBookPro11,2"    # Model Identifier
DmiSystemSerial="NO_DEVICE_SN"       # Serial Number (system)
DmiSystemUuid="CAFECAFE-CAFE-CAFE-CAFE-DECAFFDECAFF" # Hardware UUID
DmiBIOSVersion="string:MBP7.89"      # Boot ROM Version
DmiOEMVBoxVer="string:1"             # Apple ROM Info - left of the first dot
DmiOEMVBoxRev="string:.23.45.6"      # Apple ROM Info - first dot and onward
#   ioreg -l | grep -m 1 board-id
DmiBoardProduct="Mac-3CBD00234E554E41"
#   nvram 4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14:MLB
DmiBoardSerial="NO_LOGIC_BOARD_SN"    # stored in EFI
MLB="${DmiBoardSerial}"               # stored in NVRAM
#   nvram 4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14:ROM
ROM='%aa*%bbg%cc%dd'
#   ioreg -l -p IODeviceTree | grep \"system-id
SYSTEM_UUID="aabbccddeeff00112233445566778899"
#   csrutil status
SYSTEM_INTEGRITY_PROTECTION='10'
resolution="1280x800"


DmiSystemFamily="MacBook Pro"        # Model Name
DmiSystemProduct="MacBookPro11,2"    # Model Identifier
DmiSystemSerial="NO_DEVICE_SN"       # Serial Number (system)
DmiSystemUuid="CAFECAFE-CAFE-CAFE-CAFE-DECAFFDECAFF" # Hardware UUID
DmiBIOSVersion="string:MBP7.89"      # Boot ROM Version
DmiOEMVBoxVer="string:1"             # Apple ROM Info - left of the first dot
DmiOEMVBoxRev="string:.23.45.6"      # Apple ROM Info - first dot and onward
DmiBoardProduct="Mac-3CBD00234E554E41"
DmiBoardSerial="NO_LOGIC_BOARD_SN"    # stored in EFI
MLB="${DmiBoardSerial}"               # stored in NVRAM
ROM='%aa*%bbg%cc%dd'
SYSTEM_UUID="aabbccddeeff00112233445566778899"
SYSTEM_INTEGRITY_PROTECTION='10'

VBoxManage setextradata "${vm_name}" \
 "VBoxInternal2/EfiGraphicsResolution" "${resolution}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemFamily" "${DmiSystemFamily}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "${DmiSystemProduct}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemSerial" "${DmiSystemSerial}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemUuid" "${DmiSystemUuid}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiOEMVBoxVer" "${DmiOEMVBoxVer}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiOEMVBoxRev" "${DmiOEMVBoxRev}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiBIOSVersion" "${DmiBIOSVersion}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "${DmiBoardProduct}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiBoardSerial" "${DmiBoardSerial}"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemVendor" "Apple Inc."
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/smc/0/Config/DeviceKey" \
  "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "${vm_name}" \
 "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 0
