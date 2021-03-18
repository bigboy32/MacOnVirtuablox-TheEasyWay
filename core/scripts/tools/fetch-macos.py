import os
import argparse


parser = argparse.ArgumentParser()
parser.add_argument("--use-python3-flag", action="store_true", dest="python3")

pyflag = "python" if not parser.parse_args().python3 else "python3"

items = {

    "Lion_1":"-b Mac-2E6FAB96566FE58C -m 00000000000F25Y00 download", 
    "Lion_2":"-b Mac-C3EC7CD22292981F -m 00000000000F0HM00 download", 
    "Mountain_Lion":"-b Mac-7DF2A3B5E5D671ED -m 00000000000F65100 download",
    "Mavericks":"-b Mac-F60DEB81FF30ACF6 -m 00000000000FNN100 download",
    "Yosmite":"-b Mac-E43C1C25D4880AD6 -m 00000000000GDVW00 download",
    "El Captian":"-b Mac-FFE5EF870D7BA81A -m 00000000000GQRX00 download",
    "Sierra":"-b Mac-77F17D7DA9285301 -m 00000000000J0DX00 download",
    "High Sierra_1":"-b Mac-7BA5B2D9E42DDD94 -m 00000000000J80300 download",
    "High Sierra_2":"-b Mac-BE088AF8C5EB4FA2 -m 00000000000J80300 download",
    "Mojave":"-b Mac-7BA5B2DFE22DDD8C -m 00000000000KXPG00 download",
    "Catalina_1":"-b Mac-CFF7D910A743CAAF -m 00000000000PHCD00 download",
    "Catalina_2":"-b Mac-00BE6ED71E35EB86 -m 00000000000000000 download",
    "Big Sur":"-b Mac-E43C1C25D4880AD6 -m 00000000000000000 download"

    }

print("--- Choose a Version ---\n")

for item in list(items.keys()):
    print(item)

print("\n------------------------")

choice = input("Choose MacOS Version (Default/Invalid: Catalina_1)> ")
try:
    flag = items[choice]
except:
    print("Invalid option! Using Catalina_1\n")
    flag = items["Catalina_1"]


os.system(pyflag + " macrecovery.py " + flag)