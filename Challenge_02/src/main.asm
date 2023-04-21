org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

section .bss
	password resb 16				; reserve 16 bytes for password storage

section .text
	global start

start:								; entry point for os
    jmp main						; jump to main function

print:								; consists of pushing, .loop, .done
    push ax							; push ax to stack
    push bx							; push bx to stack
	push si							; push si to stack

.loop:
    lodsb							; iterates through every character in si
    or al, al						; checks if next character is termination
    jz .done						; if so, then text was printed completely, jump to done

    mov ah, 0x0E
    mov bh, 0
    int 0x10

    jmp .loop

.done:
    pop ax
    pop bx
    pop si
    ret								; return to program location where print function was called

main:								; main code of os
    mov ax, 0						; Setting ax to 0
    mov ds, ax						; Setting ds to 0
    mov es, ax						; Setting es to 0

    mov ss, ax						; Setting ss to 0
    mov sp, 0x7C00					; setting stack pointer to point to all addresses below os entry point 0x7C00

	; print message promt
    mov si, msg_Promt				; Move content of msg_Promt to si register
    call print						; Call print function to print content of si register
	

	
	
	
	
	
	; read user input
	xor bx, bx        				; BX = buffer index
	mov ah, 0x10      				; BIOS function 0x10 (read keyboard input)
	mov dx, 0x07C0    				; display input at the start of the text buffer
	mov cx, 16        				; maximum input length
input_loop:
	mov ah, 0						; Wait for next keystroke
	int 0x16          				; read a character from the keyboard
	cmp al, 0x0D      				; check if the character is the Enter key
	je input_done     				; if yes, terminate input
	cmp bx, 16        				; check if the buffer is full
	jae input_done    				; if yes, terminate input
	cmp al, 0x08      				; check if the character is the Backspace key
	je backspace      				; if yes, remove the last character from the buffer
	cmp al, 0x20      				; check if the character is a printable ASCII character
	jb input_loop     				; if not, ignore it and wait for the next character
	mov [password+bx], al 			; add the character to the buffer
	inc bx            				; increment the buffer index
	mov ah, 0x0E      				; BIOS function 0x0E (print character)
	int 0x10          				; print the character on the screen
	jmp input_loop
backspace:
	cmp bx, 0         				; check if the buffer is empty
	je input_loop     				; if yes, wait for the next character
	dec bx            				; decrement the buffer index
	mov si, backspace 				; print a backspace character
	call print
	mov byte [password+bx], 0 		; remove the last character from the buffer
	jmp input_loop
input_done:
	mov byte [password+bx], 0 		; terminate the input string with a null byte
	call print         				; print a newline character



; check if password is correct


	mov si, password  				; SI points to the start of the password buffer
	mov di, correct_password 		; DI points to the start of the correct password string
check_password_loop:
	mov al, [si]   					; load a character from the password buffer
	cmp al, [di]   					; compare it with the corresponding character from the correct password
	jne wrong_password  			; if they are not equal, jump to the wrong_password label
	inc si         					; move to the next character in the password buffer
	inc di         					; move to the next character in the correct password
	cmp al, 0      					; check if we have reached the end of the password string
	jne check_password_loop 		; if not, continue checking the next character
									; if we get here, the password is correct
	mov al, 'A'    					; set AL to the ASCII code for the letter A
	out 0xE9, al   					; output the letter A on debug port 0xE9
	jmp password_checked  			; jump to the end of the program
wrong_password:
	mov al, 'X'    					; set AL to the ASCII code for the letter X
	out 0xE9, al   					; output the letter X on debug port 0xE9
password_checked:






	
	
    ; print input
    mov si, password
    call print

    hlt

.halt:
    jmp .halt

msg_Promt: db 'Enter password...', ENDL, 0
correct_password db 'caputdraconis', 0


times 510-($-$$) db 0
dw 0AA55h
