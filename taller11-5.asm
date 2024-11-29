section .data
num1 db 5 ; Define el primer número con valor 5
num2 db 11 ; Define el segundo número con valor 11
result db 0 ; Define una variable para almacenar el resultado
message db "Resultado: ", 0 ; Define un mensaje de texto

section .bss
buffer resb 4 ; Reserva 4 bytes para un buffer

section .text
global _start ; Define el punto de entrada del programa

%macro PRINT_STRING 1
mov eax, 4 ; Llamada al sistema para escribir
mov ebx, 1 ; File descriptor 1 (stdout)
mov ecx, %1 ; Dirección del mensaje a imprimir
mov edx, 13 ; Longitud del mensaje
int 0x80 ; Interrupción para llamar al kernel
%endmacro

%macro PRINT_NUMBER 1
mov eax, %1 ; Mueve el número al registro eax
add eax, '0' ; Convierte el número a su equivalente ASCII
mov [buffer], eax ; Almacena el carácter ASCII en el buffer

mov eax, 4 ; Llamada al sistema para escribir
mov ebx, 1 ; File descriptor 1 (stdout)
mov ecx, buffer ; Dirección del buffer
mov edx, 1 ; Longitud del carácter
int 0x80 ; Interrupción para llamar al kernel
%endmacro

_start:
mov al, [num1] ; Carga el valor de num1 en al
add al, [num2] ; Suma el valor de num2 a al
mov [result], al ; Almacena el resultado en result

PRINT_STRING message ; Imprime el mensaje "Resultado: "
PRINT_NUMBER [result] ; Imprime el resultado de la suma

; Salir del programa
mov eax, 1 ; Llamada al sistema para salir
mov ebx, 0 ; Código de salida 0
int 0x80 ; Interrupción para llamar al kernel