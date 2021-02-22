import os
import argparse
import sysinfo

parser = argparse.ArgumentParser()
parser.add_argument("--use-python3-flag", action="store_true", dest="python3")

pyflag = "python" if not parser.parse_args().python3 else "python3"
pipflag = "pip" if pyflag != "python3" else "pip3"

os.chdir("tools")
os.system(pipflag + " install -r requirements.txt")

os.system("clear")

print("[*] You will be redirected to @Foxlet's script to get the macOS DMG-File")
input("Press enter to start...")

os.system(pyflag + " fetch-macos.py")
os.system("mv BaseSystem.dmg linux/")
os.chdir("linux")
os.system("./dmg2img BaseSystem.dmg")
os.chdir("..")
os.system("mv tools/linux/BaseSystem.dmg trash/")
os.system("mv tools/linux/BaseSystem.img $(pwd)")

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

os.system("clear")

print("[+] All Downloads are Complete!")
print("[*] Creating VM")

os.system("./createvm.sh")
if sysinfo.is_amd():
    os.system("./commands-amd.sh")
else:
    os.system("./commands.sh")