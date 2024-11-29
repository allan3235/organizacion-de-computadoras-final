section .data
letras db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
numeros db '0123456789'
curp db 17 dup(0) ; Espacio para la CURP

section .bss
i resb 1

section .text
global _start

_start:
; Inicializar el generador de numeros aleatorios
call init_random

; Bucle infinito para generar CURP
generate_curp:
; Generar las primeras 4 letras
mov ecx, 4
call generate_letters

; Generar la fecha de nacimiento (6 digitos)
mov ecx, 6
call generate_numbers

; Generar el sexo (1 letra: H o M)

call generate_sex

; Generar la entidad federativa (2 letras)
mov ecx, 2
call generate_letters

; Generar los ultimos 3 caracteres (2 letras y 1 digito)
mov ecx, 2
call generate_letters
call generate_numbers

; Imprimir la CURP generada
mov eax, 4
mov ebx, 1
mov ecx, curp
mov edx, 16
int 0x80

; Esperar 1 segundo
mov eax, 162
mov ebx, 1
int 0x80

; Repetir el bucle
jmp generate_curp

; Subrutina para inicializar el generador de numeros aleatorios
init_random:
; Obtener la hora actual
mov eax, 13
int 0x80
; Usar la hora como semilla para el generador de numeros aleatorios
mov eax, 25
int 0x80
ret

; Subrutina para generar letras aleatorias
generate_letters:
mov esi, letras
generate_letter_loop:
; Generar un indice aleatorio
call random
xor edx, edx
div byte [ecx]
; Almacenar la letra en la CURP
mov [curp + ecx - 1], byte [esi + edx]
loop generate_letter_loop
ret

; Subrutina para generar numeros aleatorios
generate_numbers:
mov esi, numeros

generate_number_loop:
; Generar un indice aleatorio
call random
xor edx, edx
div byte [ecx]
; Almacenar el numero en la CURP
mov [curp + ecx - 1], byte [esi + edx]
loop generate_number_loop
ret

; Subrutina para generar el sexo aleatorio
generate_sex:
call random
and eax, 1
add al, 'H'
mov [curp + 10], al
ret

; Subrutina para generar un numero aleatorio
random:
; Llamar a la interrupcion del sistema para obtener un numero aleatorio
mov eax, 45
int 0x80
ret