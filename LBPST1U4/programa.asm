CR          EQU  0Dh
LF          EQU  0Ah
TERMINADOR  EQU  24h
ITERACIONES EQU  5

section .data
    bienvenida  db "=== Laboratorio NASM — Unidad 4 ===", CR, LF, TERMINADOR
    separador   db "----------------------------------------", CR, LF, TERMINADOR
    etiqueta_a  db "Variable A (word):  ", TERMINADOR
    fin_msg     db "Programa finalizado correctamente.", CR, LF, TERMINADOR

    var_byte    db  42
    var_word    dw  1234h
    tabla_bytes db  10, 20, 30, 40, 50

section .bss
    buffer      resb 80

section .text
    global main

main:
    ; Inicializar segmento de datos (CORREGIDO PARA NASM)
    mov ax, seg bienvenida
    mov ds, ax

    ; Mensaje de bienvenida
    mov ah, 09h
    mov dx, bienvenida
    int 21h

    mov dx, separador
    int 21h

    ; Mostrar etiqueta
    mov ah, 09h
    mov dx, etiqueta_a
    int 21h

    ; Mostrar valor de var_byte como carácter
    mov al, [var_byte]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    ; Salto de línea
    mov ah, 02h
    mov dl, CR
    int 21h
    mov dl, LF
    int 21h

    ; Recorrer tabla
    lea si, tabla_bytes
    mov cx, ITERACIONES

imprimir:
    mov al, [si]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    ; Espacio
    mov dl, 20h
    int 21h

    inc si
    loop imprimir

    ; Mensaje final
    mov ah, 09h
    mov dx, fin_msg
    int 21h

    ; Terminar programa
    mov ax, 4C00h
    int 21h
