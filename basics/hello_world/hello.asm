bits 64							; specify 64-bit mode
section .data
    msg db "Hello, World!", 10	; String with newline and null terminator
	msglen equ $ - msg			; calculate msg length

section .text
    global _start            	; Make the entry point visible (tells the assembler _start: symbol should be visible outside of this file)
								; this is very useful for linker

_start:							; this is _start: label it marks entry point for the progam (it works like main() in c)

    ; Write the message to stdout
    mov rax, 1                      ; syscall number for write
    mov rdi, 1                      ; file descriptor 1 is stdout
    mov rsi, msg                    ; message to write
    mov rdx, msglen					; message length
    syscall                         ; call kernel

    ; Exit the program
    mov rax, 60                     ; syscall number for exit
    xor rdi, rdi 						; exit code 0
    syscall                         ; call kernel
