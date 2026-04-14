# tarazona-post1-u4

## Descripción
Laboratorio de ensamblador NASM con uso de segmentos, datos y salida en DOS.
 
## Prerrequisitos
- DOSBox
- NASM
- ALINK
 
## Compilación
nasm -f obj programa.asm -o programa.obj

## Enlace
alink programa.obj -o programa.exe -entry main

## Ejecución
programa.exe
