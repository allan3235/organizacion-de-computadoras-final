section .data
num1 db 'A' ; Carácter ASCII de 'A'
num2 db '\' ; Carácter ASCII de '\'
result db 0 ; Espacio para almacenar el resultado de la suma (que no será usada
porque A y \ no se suman)
msg db 'Resultado: ', 0 ; Mensaje a imprimir con terminación nula
section .bss
buffer resb 4 ; Reserva 4 bytes para el buffer
section .text
global _start
_start:
; Añadiendo caracteres al buffer
mov al, 'A'
mov [buffer], al ; A
mov al, '\'
mov [buffer+1], al ; \
mov al, '$'
mov [buffer+2], al ; $
mov al, '&'
mov [buffer+3], al ; &
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
mov edx, 4
int 0x80
; Terminar el programa
mov eax, 1
xor ebx, ebx
int 0x80