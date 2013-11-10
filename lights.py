import subprocess

def functions():
    func = [["on"],["off"]]
    
    return func
    
def on():
    subprocess.call(["light.sh", "1"])
    return "Gabe sucks"
    
def off():
    subprocess.call(["light.sh", "0"])
    return "Gabe sucks a lot"