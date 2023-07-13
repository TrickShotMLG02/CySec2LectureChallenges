import time
import win32gui
import win32con
import win32api

timeToPress = 0.05
timeToWait = 0.15

def bruteforce():
    # Define key codes for the keys we want to use
    W_KEY_CODE = 0x57
    D_KEY_CODE = 0x44
    RET_KEY_CODE = 0x0D
    SPACE_KEY_CODE = 0x20

    print("Select window for input")
    time.sleep(3)

    # get the window from the current active window
    hwndMain = win32gui.GetForegroundWindow()

    # since the program has a 6 digit pin, we need to loop through all possible combinations
    # However every digit needs to be adjusted on its oww.
    # Example: pin: 123456
    # Combination for first digit (1): W
    # Combination for second digit (2): DWW, where D means move one to the right and W means increase digit by one
    # Combination for third digit (3): DWWWW
    # Combination for fourth digit (4): DWWWWW
    # Combination for fifth digit (5): DWWWWWW
    # Combination for sixth digit (6): DWWWWWWW

    # Thus loop thorugh all possible pin combinations and 0 pad the number to 6 digits
    for i in range(0, 1000000):
        # add leading 0 to get length of 6
        pin = str(i).zfill(6)
        print("current pin: " + pin)

        # extract all digits from the pin into a list
        digits = []
        for digit in pin:
            digits.append(digit)

            #check if it is the first digit, since we don't need to move to the right
            if len(digits) == 1:
                simulateKey(W_KEY_CODE, int(digit))
            else:
                simulateKey(D_KEY_CODE, 1)
                simulateKey(W_KEY_CODE, int(digit))


        # send enter since code was entered completely
        simulateKey(RET_KEY_CODE, 1)

        # wait 0.5 seconds
        time.sleep(timeToWait)

        # send space key to speed up
        #simulateKey(SPACE_KEY_CODE)


        # save every 1000 pin combination into a file in current folder called "pins.txt"
        if i % 100 == 0:
            with open("pins.txt", "a") as file:
                file.write(str(i)  + "\n")

    time.sleep(1)

# Function to send specific key a specific amount of times to applica
#  tion
def simulateKey(key, amount):
    for i in range(0, amount):
        # Simulate pressing the key
        win32api.keybd_event(key, 0, 0, 0)

        time.sleep(timeToPress)

        # Simulate releasing the key
        win32api.keybd_event(key, 0, win32con.KEYEVENTF_KEYUP, 0)

        time.sleep(timeToWait)


def simulateLongKey(key):
    # Simulate pressing the key
    win32api.keybd_event(key, 0, 0, 0)

    time.sleep(timeToWait)

    # Simulate releasing the key
    win32api.keybd_event(key, 0, win32con.KEYEVENTF_KEYUP, 0)


if __name__ == '__main__':
    bruteforce()