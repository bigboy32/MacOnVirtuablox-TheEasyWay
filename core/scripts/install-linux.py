import os
import argparse
import sysinfo

import subprocess
import colorama

def system_call(cmd):
    try:
        subprocess.check_call(cmd)
    except:
        print(colorama.Fore.RED + f"""FATAL ERROR: Command {cmd} exited with non zero exit code""" + colorama.Fore.RESET)
        exit()


def storage_attach(med, name):
    system_call(f'VBoxManage modifyvm "{name}" --hda "{med}"')

parser = argparse.ArgumentParser()
parser.add_argument("--use-python3-flag", action="store_true", dest="python3")

args = parser.parse_args()

pyflag = "python" if not args.python3 else "python3"
pipflag = "pip" if pyflag != "python3" else "pip3"

os.chdir("tools")
os.system(pipflag + " install -r requirements.txt")

os.system("clear")

print("[*] --- Libcheck complete ---")
nm = input("VM Name: ")


if args.python3:
    os.system(pyflag + " fetch-macos.py --use-python3-flag")
else:
    os.system(pyflag + " fetch-macos.py")
system_call("mv BaseSystem.dmg linux/")
os.chdir("linux")
system_call("./dmg2img BaseSystem.dmg")
system_call("./img2vdi.sh BaseSystem BaseSystem")

'''
system_call("mv tools/linux/BaseSystem.dmg trash/")
system_call("mv tools/linux/BaseSystem.iso $(pwd)")
'''


os.system("clear")

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

os.system("clear")

storage_attach("ESP.qcow2", nm)
storage_attach("BaseSystem.vdi", nm)

print("[+] All Downloads are Complete!")
print("[*] Creating VM")

system_call("./createvm.sh " + nm)
if sysinfo.is_amd():
    system_call("./commands-amd.sh " + nm)
else:
    system_call("./commands.sh " + nm)