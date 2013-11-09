import backgrounds as b
import green as g
import threading

def functions():
    func = [["blue"],["green"],["orange"]]
    
    return func
    
def blue():
    th = threading.Thread(target=b.main().start())
    #b.main()
    return "Gabe sucks"
    
def green():
    #threading.Thread(target=g.main())
    return "Gabe is mean"
    
def orange():
    return "Gabe can sometimes maybe be nice"