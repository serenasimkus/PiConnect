

import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def cat():
    img = mpimg.imread('cat.jpg')

    plt.imshow(img)

    plt.show()