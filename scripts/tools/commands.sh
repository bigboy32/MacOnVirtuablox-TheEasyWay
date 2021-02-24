vm_nam=$1                  # name of the VirtualBox virtual machine
macOS_release_name="Catalina"    # install "HighSierra" "Mojave" or "Catalina"
storage_size=80000               # VM disk image size in MB, minimum 22000
storage_format="vdi"             # VM disk image file format, "vdi" or "vmdk"
cpu_count=2                      # VM CPU cores, minimum 2
memory_size=4096                 # VM RAM in MB, minimum 2048
gpu_vram=128                     # VM video RAM in MB, minimum 34, maximum 128
resolution="1280x800"            # VM display resolution

# The following commented commands, when executed on a genuine Mac,
# may provide the values for NVRAM and EFI parameters required by iCloud,
# iMessage, and other connected Apple applications.
# Parameters taken from a genuine Mac may result in a "Call customer support"
# message if they do not match the genuine Mac exactly.
# Non-genuine yet genuine-like parameters usually work.

#   system_profiler SPHardwareDataType
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
SYSTEM_INTEGRITY_PROTECTION='10

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
