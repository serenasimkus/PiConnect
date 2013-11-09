# This program displays a label with text.
import Tkinter
import threading

class Window:
    def __init__(self):
        self.root = Tkinter.Tk()

        w, h = self.root.winfo_screenwidth(), self.root.winfo_screenheight()
        self.root.overrideredirect(1)
        self.root.geometry("%dx%d+0+0" % (w,h))

        self.root.configure(background="green")

        self.root.focus_set()
        self.root.bind("<Escape>", lambda e: e.widget.quit())

        #self.root.mainloop()

        #threading.Thread.__init__(self)

    #def change_color(self, color):
        #self.root.configure(background=color)

    def run(self):
        self.root.mainloop()

def main():
    app = Window()
    app.start()
    #app.run()
    return app