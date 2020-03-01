;((a+b-c)*2 + d-5)*d

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db 5
    b db 2
    c db 3
    d dw 4
    
segment code use32 class=code
start:
    mov al,[a]
    add al,[b]
    sub al,[c]
    mov bl,2
    mov ah,0
    mul bl
    add ax,[d]
    sub ax,5
    mul word [d] ;dx:ax:=
    

push dword 0
call [exit]