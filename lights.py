import subprocess
import sys, os

def functions():
    func = [["on"],["off"]]
    
    return func
    
def on():
    subprocess.call([os.path.dirname(os.path.abspath(sys.argv[0]))+ "/" + "light.sh", "1"])
    return "Ready for input: "
    
def off():
    subprocess.call([os.path.dirname(os.path.abspath(sys.argv[0]))+ "/" + "light.sh", "0"])
    return "Ready for input: "
