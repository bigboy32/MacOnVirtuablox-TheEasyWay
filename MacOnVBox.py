import os
import sys

banner = """
                 ,xNMM.
               .OMMMMo
               OMMM0,
     .;loddo:' loolloddol;.
   cKMMMMMMMMMMNWMMMMMMMMMM0:
.KMMMMMMMMMMMMMMMMMMMMMMMWd.
 XMMMMMMMMMMMMMMMMMMMMMMMX.                           
;MMMMMMMMMMMMMMMMMMMMMMMM:           MAC ON VIRTUALBOX! 
:MMMMMMMMMMMMMMMMMMMMMMMM:                          
MMMMMMMMMMMMMMMMMMMMMMMMX.
 kMMMMMMMMMMMMMMMMMMMMMMMMWd.
 .XMMMMMMMMMMMMMMMMMMMMMMMMMMk
  .XMMMMMMMMMMMMMMMMMMMMMMMMK.
    kMMMMMMMMMMMMMMMMMMMMMMd
     ;KMMMMMMMWXXWMMMMMMMk.
       .cooc,.    .,coo:.
"""


class MainMenu(object):
  def __init__(self):
    self.menu = f"""{'='*10} MAIN MENU {'='*10}
1. Install a new version of mac
2. Update tools
    """

    print(self.menu)
    
    while True:
      opt = input("Installer> ")
      try:
        if int(opt) == 1:
          self._opt_1()
          break
        else:
          continue
      except:
        continue

  
  def _opt_1(self):
    try:
      os.chdir("core")
    except:
      print("Directory not found!")
      exit()
    try:
      sys.argv[1]
      os.system("python3 install.py --use-python3-flag")
    except:
      os.system("python install.py")
  

print(banner)
MainMenu()