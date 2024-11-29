section .data
    mensaje db 'Hola mundo', 0
    tecla db 0xa

section .bss
    res resb 1         ; Espacio para el carácter actual

section .text
    global _start

_start:
    ; Ahora programamos para imprimir 'H'
    mov [res], 'H'     ; Cargar 'H' en res (ASCII 100)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'H' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'o'
    mov [res], 'o'     ; Cargar 'o' en res (ASCII 6f)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'o' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'l'
    mov [res], 'l'     ; Cargar 'l' en res (ASCII 6c)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'l' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'a'
    mov [res], 'a'     ; Cargar 'a' en res (ASCII 61)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'a' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir ' '
    mov [res], ' '     ; Cargar ' ' en res (ASCII 20)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar ' ' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'm'
    mov [res], 'm'     ; Cargar 'm' en res (ASCII 6d)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'm' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'u'
    mov [res], 'u'     ; Cargar 'u' en res (ASCII 75)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'u' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'n'
    mov [res], 'n'     ; Cargar 'n' en res (ASCII 6e)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'n' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'd'
    mov [res], 'd'     ; Cargar 'd' en res (ASCII 64)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'd' en res
    mov edx, 1
    int 0x80

    ; Ahora programamos para imprimir 'o'
    mov [res], 'o'     ; Cargar 'o' en res (ASCII 6f)
    mov eax, 4         ; syscall 'write'
    mov ebx, 1         ; stdout
    mov ecx, res       ; Guardar 'o' en res
    mov edx, 1
    int 0x80

    ; Terminar el programa
    mov eax, 1         ; syscall 'exit'
    xor ebx, ebx
    int 0x80
