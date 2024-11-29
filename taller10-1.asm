section .data
sum db 0

count db 1

section .text
global _start

_start:
mov al, [count]
cmp al, 10
jg end_loop

loop_start:
mov al, [sum]
add al, [count]
mov [sum], al

inc byte [count]

cmp byte [count], 10
jle loop_start

end_loop:
; Código para finalizar el programa
mov eax, 1
xor ebx, ebx
int 0x80