section .data
list db 1, 2, 3, -1, 4 ; Lista de números
sum db 0
index db 0

section .text
global _start

_start:
mov al, [list + index]
add [sum], al

test al, al
js end_loop

inc byte [index]
jmp _start

end_loop:
; Código para finalizar el programa
mov eax, 1
xor ebx, ebx
int 0x80