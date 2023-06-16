# Challenge 01: Command & Control

- Find the flag that is hidden on one infected machine
- You found an unprotected C&C server at [http://cc.attacking.systems](http://cc.attacking.systems)
- One of the infected bots has a secret flag stored in a file
- The flag has the format CYSEC{[A-Za-z0-9\_!]+}
- Note: the connected bots change all the time, so be fast!

<br>


# Challenge 02: Tiny OS

- Write a tiny operating system
- It should read a password from the keyboard
- After pressing enter, check if the password is `caputdraconis`
- If it is, the OS should output the letter A on debug port 0xE9
- Otherwise, it should output the letter X on debug port 0xE9
- Hint: look at the `out` instruction to output data to a port
- Limitation: your OS must be <= 512 bytes and boot via `qemu-system-x86_64 -hda os -debugcon stdio` (where `os` is your binary)
- Upload your operating system to [https://challenge.attacking.systems/os/](https://challenge.attacking.systems/os/) - if the tests succeed, you get the flag

<br>


# Challenge 03: Mini ELF

- Write an ELF binary which outputs your matriculation number and exits
- Size of the binary must be <= 100 bytes
- Binary must be a 32-bit or 64-bit ELF binary
- Must run on Ubuntu 20.04
- Binary does not have to be 100% valid as specified in the standard
- Use whatever tool(s) you like, source code is not required
- Upload to [https://challenge.attacking.systems/elf](https://challenge.attacking.systems/elf) to get your flag

<br>


# Challenge 04: Weird Float

- I've invented my own 112-bit floating point format to encode very large numbers.
- It conforms to the IEEE 754 standard, with 69 significand bits, 42 exponent bits, 1 sign bit, and radix 2.
- Convert -1337.42421337 to this format. The binary representation of the underlying memory, i.e., a sequence of 112 0/1 values, is the solution.
- The flag is CYSEC{<solution>}.
- Example: for 127.5, the flag would be CYSEC{0100000000000000000000000000000000000000101111111100000000000000000000000000000000000000000000000000000000000}

<br>

  
# Challenge 05: Format String

- Find a format string to extract the binary's secret
- Your format string has to extract the secret key (`CYSEC{NOT_THE_ACTUAL_FLAG}`) in the attached binary
- Exploit the real binary running at `challenge.attacking.systems:5001` to get the real flag
- Hint: to connect to the binary, use `nc challenge.attacking.systems 5001`

<br>

  
# Challenge 06: Alphanumeric Shellcode

- Write a shellcode which outputs CySecII2023
- The shellcode must be x86 32-bit and <= 512 bytes
- It must be alphanumeric, i.e., only contain A-Z, a-z, and 0-9
- It might output anything else as well, as long as CySecII2023 is in the output
- It is also allowed to crash or hang afterwards
- The attached files are a "framework" to execute your shellcode
- To get the flag, submit your shellcode to [https://challenge.attacking.systems/shellcode

<br>


# Challenge 07: Needle
                                            
- You have a GIT repository with 100000 commits
- One commit introduced a bug which still exists in the latest version
- Find the bug, and identify the commit which first introduced the bug
- The flag is CYSEC{<commit_hash>}
