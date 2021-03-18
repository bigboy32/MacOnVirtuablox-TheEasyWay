import os
import argparse
import sysinfo

def storage_attach(med, name):
    os.system(r'C:Program Files\Oracle\VirtualBox\VBoxManage.exe modifyvm "{}" --hda "{}"'.format(name, med))

parser = argparse.ArgumentParser()
parser.add_argument("--use-python3-flag", action="store_true", dest="python3")

args = parser.parse_args()

pyflag = "python" if not args.python3 else "python3"
pipflag = "pip" if pyflag != "python3" else "pip3"

os.chdir("tools")
os.system(pipflag + " install -r requirements.txt")

os.system("cls")

print("[*] --- Libcheck complete ---")
nm = input("VM Name: ")


if args.python3:
    os.system(pyflag + " fetch-macos.py --use-python3-flag")
else:
    os.system(pyflag + " fetch-macos.py")
os.system("mv BaseSystem.dmg linux/")
os.chdir("windows")
os.system("dmg2img.exe BaseSystem.dmg")
os.system("img2vdi.bat BaseSystem BaseSystem")

'''
os.system("move tools/linux/BaseSystem.dmg trash/")
os.system("move tools/linux/BaseSystem.iso $(pwd)")
'''


os.system("cls")

print("[+] OS Download complete!")
print("[*] Starting to get Clover files...")

from tqdm import tqdm
import requests

url = "https://github.com/foxlet/macOS-Simple-KVM/blob/master/ESP.qcow2?raw=true"
response = requests.get(url, stream=True)
total_size_in_bytes= int(response.headers.get('content-length', 0))
block_size = 1024
progress_bar = tqdm(total=total_size_in_bytes, unit='iB', unit_scale=True)
with open('Clover.qcow2', 'wb') as file:
    for data in response.iter_content(block_size):
        progress_bar.update(len(data))
        file.write(data)
progress_bar.close()
if total_size_in_bytes != 0 and progress_bar.n != total_size_in_bytes:
    print("ERROR, something went wrong")
    exit()

os.system("cls")

storage_attach("ESP.qcow2", nm)
storage_attach("BaseSystem.vdi", nm)

print("[+] All Downloads are Complete!")
print("[*] Creating VM")

os.system("./createvm.sh " + nm)
if sysinfo.is_amd():
    os.system("./commands-amd.sh " + nm)
else:
    os.system("./commands.sh " + nm)