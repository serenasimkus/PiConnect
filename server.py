##!/Desktop/PiConnect python 

""" 
A server that receives commands from the client and uses them to call 
functions dynamically. 
""" 
import socket
import json
import sys
import threading
import connect as c

host = ''
port = 5555
backlog = 10
size = 1024

def options(app, resp):
    respC = client.recv(size)
    respC = respC.rstrip("\n")
    if cmp(respC, "exit") == 0:
        apps("connect")

    threading.Thread(target=call(respC, app))

def apps(data):

    print(data)

    if cmp(data, "connect") == 0:
        client.send(json.dumps(c.connect()))

    resp = client.recv(size)
    resp = resp.rstrip("\n")
    if cmp(resp, "exit") == 0:
        client.close()

    if cmp(data, resp) == 0:
        app = sys.modules[resp]
        threading.Thread(target=call("functions", app))

    else:
        app = sys.modules[resp]
        threading.Thread(target=call("functions", app))

    while 1:
        options(app, resp)

def call(func, mod):
    a = getattr(mod, func)
    client.send(json.dumps(a()))

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host,port))
s.listen(backlog)

while 1:
    client, address = s.accept()

    data = client.recv(size)
    data = data.rstrip("\n")

    while 1:
        apps(data)

    client.close()