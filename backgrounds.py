import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import time
import sys, os

def pic(name):
    fig = plt.figure()
    img = mpimg.imread(os.path.dirname(os.path.abspath(sys.argv[0]))+ "/" + name)
    plt.imshow(img)
    plt.show()
    time.sleep(4)
    plt.close(fig)
