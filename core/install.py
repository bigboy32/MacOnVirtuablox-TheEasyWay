import os
import platform
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--use-python3-flag", action="store_true", dest="python3")
args = parser.parse_args()

os.chdir("scripts")

if platform.system() == "Linux":
    if args.python3:
        os.system("python3 install-linux.py --use-python3-flag")
    else:
        os.system("python install-linux.py")

elif platform.system() == "Windows":
    if args.python3:
        os.system("python3 install-windows.py --use-python3-flag")
    else:
        os.system("python install-windows.py")

else:
    if args.python3:
        #os.system("python3 install-darwin.py --use-python3-flag")
        os.system("python3 install-linux.py --use-python3-flag")
    else:
        #os.system("python install-darwin.py")
        os.system("python install-linux.py")