;(c+b+a)-(d+d)

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a dw 5
    b dw 2
    c dw 3
    d dw 4
    
segment code use32 class=code
start:
        mov ax,[c]
        add ax,[b]
        add ax,[a]
        
        mov dx,[d]
        add dx,[d]
        
        sub ax,dx 
    
push dword 0
call [exit]    