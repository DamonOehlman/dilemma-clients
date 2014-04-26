import zmq
import time
import sys

my_responses = []
opponent_responses = []

def ping(payload):
    socket.send_multipart(["pong"])

def iterate(payload):
    if (payload[0] != ""):
        opponent_responses.append(payload[0])

    # run the strategy
    response = run_strategy()

    # add the new response to my responses array
    my_responses.append(response)

    # send back the response to the server
    socket.send_multipart(["result", response])

def run_strategy():
    return "C"

# define the handlers
handlers = { 'ping': ping, 'iterate': iterate }

# initialise the zmq context
context = zmq.Context()

# create a REQ socket, and set the socket identity
socket = context.socket(zmq.REQ)
socket.set_string(zmq.IDENTITY, u"py-client:1")

# connect
socket.connect("tcp://localhost:1441")

# register our strategy
socket.send_multipart(["reg", "test"])

while True:
    message = socket.recv_multipart()
    handler = handlers[message[0]]

    print "handler for message: ", message, handler
    handler(message[1:])