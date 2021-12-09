#
#
# @title: Quantum NET
# @since: 5/18/21
# @creator: Quantum Security Team (vl0b(Ashlee), Exo, clever, Max, Beta)
#
#

# Modules
import socket, sys, os, time, threading, requests, random, datetime


buffer_length = 1024 # We Set The Buffer Over Here So It Can Be Reused So Use It Stop Typing 1024
host = requests.get("https://api.ipify.org").text
timenow = datetime.datetime.now()
port = random.randint(0, 65535)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Try To Reuse Port Bypass TIME_WAIT Sometimes
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind((host, port))
sock.listen()


print(f"[{datetime.datetime.now()}] | Quantum Started | {host} | {port} |") # Added Date And Time So You Can See When Was The Last Time The Net Started !

def handle_connection(client, addr):
        while(True):
                Current.CurrentInfo['Username'] = username
                client.send(Strings.hostname(username).encode())
                data = str(client.recv(buffer_length).decode()).strip().replace("\r\n", "")

                # Command Handling
                if data != "\r\n" or data != "":
                        if data == "test":
                            client.send("working".encode())


def listener():
        while True:
                client, address = sock.accept()
                try:
                        threading.Thread(target=handle_connection, args=(client, address)).start()
                except:
                        print("Client Disconnected!")
                print("TCP Connection From " + address[0] + ":" + str(address[1]))


threading.Thread(target=listener).start()