# Mac on Virtuablox The Easy Way

## This script is under active development! Please Raise an issue imediately if something Fails!

### Quick Notes
Sorry for the slow dev speed, i have to work on multiple projects at once

### What is this?
This is a script, that will setup mac on virtualbox, the easy way!

### How to download?
On the right side, there is a tab for releases. Get the lates release from there. Download the source code appropriate for your system (.zip for all, .tar.gz for linux and mac).
Or just follow this link, to get the latest release https://github.com/bigboy32/MacOnVirtuablox-TheEasyWay/releases

### Credits
Thanks to @Foxlet for fetch-macos.py and ESP.qcow2

### How con i contribute?
* Currently, i need a litle help with testing on linux. My virtualbox has a bug, it won't boot if i will inject the AMD Code
* CONTRIBUTING. md

### What got added?
* Modified Mac Install Script

### Requirements
* Python3

### Some python Requirements not met, how to fix that?
```
Linux/Mac:
cd core/scripts
python3 -m pip install -r requirements.txt

Windows:
cd core\scripts
python -m pip install -r requirements.txt
```

### How to fix sh: command python3 not found?
Run the script like this:
```
python3 MacOnVBox.py --use-python3-flag
```
