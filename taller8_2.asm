Direccionamiento inmediato:
section .data
msg db 'Resultado: @', 0 ; Mensaje con '@'
section .bss
buffer resb 4
section .text
global _start
_start:
; Imprimir el mensaje
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 11
int 0x80
; Terminar el programa
mov eax, 1
xor ebx, ebx
int 0x80