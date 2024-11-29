section .data
num db 4 ; Ejemplo: número a verificar
result_even db "Even", 0
result_odd db "Odd", 0

section .text
global _start

_start:
mov al, [num]
and al, 1
jz is_even

is_odd:
; Código para manejar el caso impar
mov eax, 1
mov ebx, 1
mov ecx, result_odd

mov edx, 3
int 0x80
jmp end_program

is_even:
; Código para manejar el caso par
mov eax, 1
mov ebx, 1
mov ecx, result_even
mov edx, 4
int 0x80

end_program:
; Código para finalizar el programa
mov eax, 1
xor ebx, ebx
int 0x80
Ejercicio 5: Bucle for con decremento (Imprimir Números del 10 al 1)
section .data
count db 10

section .text
global _start

_start:
mov al, [count]

cmp al, 1
jl end_loop

loop_start:
; Código para imprimir el valor de count (ejemplo)
; Esto normalmente requeriría una rutina de impresión
dec byte [count]

cmp byte [count], 1
jge loop_start

end_loop:
; Código para finalizar el programa
mov eax, 1
xor ebx, ebx
int 0x80
Programa para Sumar dos Números y Verificar si el Resultado es Cero
section .data
num1 db 3 ; Primer número
num2 db 6 ; Segundo número
result db 0
msg db "Resultado: ", 0
resultStr db "00", 10 ; Cadena para el resultado en ASCII y salto de línea
zeroMsg db "Esto es un cero", 10 ; Mensaje "Esto es un cero" con salto de línea

section .text

global _start

_start:
; Realizar la suma
mov al, [num1]
add al, [num2]
mov [result], al

; Salto para verificar si el resultado es mayor a 0
cmp al, 0
je print_zero

; Si el resultado es mayor que 0, convertir a ASCII y mostrarlo
add al, 30h
mov [resultStr], al

print_message:
; Imprimir mensaje de texto
mov eax, 4 ; Syscall para escribir
mov ebx, 1 ; Salida estándar (stdout)
mov ecx, msg ; Dirección del mensaje
mov edx, 11 ; Longitud del mensaje
int 0x80 ; Llamada al sistema

; Imprimir el resultado de la suma
mov eax, 4 ; Syscall para escribir

mov ebx, 1 ; Salida estándar (stdout)
mov ecx, resultStr ; Dirección de la cadena del resultado
mov edx, 2 ; Longitud de la cadena (1 dígito y nueva línea)
int 0x80 ; Llamada al sistema
jmp exit_program

print_zero:
; Imprimir "Esto es un cero"
mov eax, 4
mov ebx, 1
mov ecx, zeroMsg
mov edx, 16
int 0x80

exit_program:
; Terminar el programa
mov eax, 1
xor ebx, ebx
int 0x80