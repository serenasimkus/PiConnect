

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import time

def cat():
    img = mpimg.imread('cat.jpg')

    plt.imshow(img)

    plt.show()

def dog():
    img = mpimg.imread('puppy.jpg')

    plt.imshow(img)

    plt.show()

def fox():
    img = mpimg.imread('fox.jpg')

    plt.imshow(img)

    plt.show()

def pic(name):
    fig = plt.figure()
    img = mpimg.imread(name)
    plt.imshow(img)
    plt.show()
    time.sleep(4)
    plt.close(fig)