section .data
character db '@' ; Almacena '@'
msg db 'Resultado: ', 0
section .bss
buffer resb 4
section .text
global _start
_start:
; Moviendo '@' al buffer
mov al, [character]
mov [buffer], al
; Imprimir el mensaje
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 11
int 0x80
; Imprimir el buffer
mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, 1
int 0x80
; Terminar el programa
mov eax, 1
xor ebx, ebx
int 0x80