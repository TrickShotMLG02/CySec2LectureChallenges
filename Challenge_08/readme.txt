1. Installed ghidra with brew
2. Downloaded GhidraBoy extension for GameBoy support from https://github.com/Gekkio/GhidraBoy
3. Built the extension with gradle
4. Installed the extension in Ghidra
5. Opened the ROM in Ghidra
6. Ran the auto-analyzer with the option "Decompiler Parameter ID" enabled
7. Searched for the string "flag"
8. found it at address 054e
9. There are also some other strings which are good to know
10. opened the disassembled code in an editor
11. looked for the use of the flag address and found it in line 668 in bank_000.asm
12. looked for the other strings
13. reverse engineered some functions and renamed the labels of jumps, function calls ect
14. This code can be found in the PatchedApproach folder
