import os
import platform
import argparse


if platform.system() == "Linux":
    os.system("./fix-requirements.sh")

elif platform.system() == "Windows":
    os.system("fix-requirements.bat")

else:
    os.system("./fix-requirements.sh")