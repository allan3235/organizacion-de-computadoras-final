section .data
product db 1
i db 1

section .text
global _start

_start:
mov al, [i]
cmp al, 5
jg end_loop

loop_start:
mov al, [product]
mov bl, [i]
mul bl
mov [product], al

inc byte [i]

cmp byte [i], 5
jle loop_start

end_loop:
; Código para finalizar el programa
mov eax, 1
xor ebx, ebx
int 0x80