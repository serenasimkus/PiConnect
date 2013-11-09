# This program displays a label with text.
import Tkinter
import threading

class Window(threading.Thread):
    def __init__(self):
        #threading.Thread.__init__(self)
        #self.root = Tkinter.Tk()

        #self.root.mainloop()

        threading.Thread.__init__(self)

    #def change_color(self, color):
        #self.root.configure(background=color)

    def run(self):
        self.root = Tkinter.Tk()
        w, h = self.root.winfo_screenwidth(), self.root.winfo_screenheight()
        self.root.overrideredirect(1)
        self.root.geometry("%dx%d+0+0" % (w,h))

        self.root.configure(background="blue")

        self.root.focus_set()
        self.root.bind("<Escape>", lambda e: e.widget.quit())
        self.root.mainloop()

def main():
    app = Window()
    #app.start()
    app.run()
    #return app










#root = Tkinter.Tk()

#def change_color(color):
    #root.configure(background="blue")

#def main():
#    # Create the main window widget.
#    #self.main_window = Tkinter.Tk()
#    root = Tkinter.Tk()
#
#    w, h = root.winfo_screenwidth(), root.winfo_screenheight()
#    root.overrideredirect(1)
#    root.geometry("%dx%d+0+0" % (w,h))
#
#    root.configure(background="blue")
#
#    root.focus_set()
#    root.bind("<Escape>", lambda e: e.widget.quit())

    # Create a Label widget containing the
    # text 'Hello World!'
    #self.label = Tkinter.Label(self.main_window, text='Hey Dude!')

    # Call the Label widget's pack method.
    #self.label.pack()

    # Enter the Tkinter main loop.
    #root.mainloop()
    #return root

#Create an instance of the MyGUI class.
#main()