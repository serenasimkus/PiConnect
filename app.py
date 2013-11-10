import Tkinter
import threading

import socket
import json
import sys
import threading
import connect as c

host = ''
port = 8899
backlog = 10
size = 1024

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host,port))
s.listen(backlog)

class App(threading.Thread):
    def __init__(self):
        #threading.Thread.__init__(self)
        #self.root = Tkinter.Tk()


        threading.Thread.__init__(self)
        self.start()

    def callback(self):
        self.root.quit()

    def change_color(self, color):
        self.root.configure(background=color)

    def run(self):
        #self.root.after(500, network())
        self.root = Tkinter.Tk()

        self.root.protocol("WM_DELETE_WINDOW", self.callback)

        w, h = self.root.winfo_screenwidth(), self.root.winfo_screenheight()
        self.root.overrideredirect(1)
        self.root.geometry("%dx%d+0+0" % (w,h))

        self.root.configure(background="blue")

        self.root.focus_set()
        self.root.bind("<Escape>", lambda e: e.widget.quit())
        self.root.mainloop()


def options(mod):
    respC = client.recv(size)
    respC = respC.rstrip("\n")
    if cmp(respC, "exit") == 0:
        apps("connect")

    threading.Thread(target=call(respC, mod))

def apps(data):
    if cmp(data, "connect") == 0:
        app.root.configure(background="blue")
        client.send(json.dumps(c.connect()))

    resp = client.recv(size)
    resp = resp.rstrip("\n")
    if cmp(resp, "exit") == 0:
        client.close()

    if cmp(data, resp) == 0:
        mod = sys.modules[resp]
        threading.Thread(target=call("functions", mod))

    else:
        mod = sys.modules[resp]
        threading.Thread(target=call("functions", mod))

    while 1:
        options(mod)

def call(func, mod):
    a = getattr(mod, func)
    client.send(json.dumps(a()))

def network():
    #while 1:
        #client, address = s.accept()

    data = client.recv(size)
    data = data.rstrip("\n")

    while 1:
        apps(data)

    client.close()

while 1:
    client, address = s.accept()
    app = App()
    threading.Thread(target=network())
