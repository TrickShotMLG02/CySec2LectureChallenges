org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

section .bss
	password: resb 255

section .text
	global start

start:
    jmp main

puts:
    push si
    push ax
    push bx
    push di
    push dx

.loop:
    lodsb
    or al, al
    jz .done

    mov ah, 0x0E
    mov bh, 0
    int 0x10

    jmp .loop

.done:
    pop dx
    pop di
    pop bx
    pop ax
    pop si
	pop cx
    ret

main:
    mov ax, 0
    mov ds, ax
    mov es, ax

    mov ss, ax
    mov sp, 0x8000

    mov si, msg_Promt
    call puts

	; test puts function
	mov si, debug_Test
	call puts
	
	; grab user input
	mov dx, 255
	mov cx, password
	mov bx, 0
	mov ax, 3
	call puts
	push cx
	int 80h
	syscall
	
	; debug prints
	mov si, debug_Input
	call puts
	mov si, password
	call puts
	
	; validate input
	mov si, debug_Validate
	call puts
	mov si, password
	call puts
	mov si, debug_Input2
	call puts

    hlt

.halt:
    jmp .halt

msg_Promt: db 'Enter password...', ENDL, 0
debug_Test: db 'Testing puts function...', ENDL, 0
debug_Input: db 'Input: ', 0
debug_Validate: db 'Validating input...', ENDL, 0
debug_Input2: db 'Input after validation: ', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h
