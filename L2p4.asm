;((a-b)*4)/c

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db 5
    b db 2
    c db 3
    
segment code use32 class=code
start:
    mov al,[a]
    sub al,[b]
    mov ah,0
    mov bl,4
    mul bl ;al:=(a-b)*4
    div byte [c]
    

push dword 0
call [exit]