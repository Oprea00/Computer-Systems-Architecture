;c-(a+d)+(b+d)

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db 1
    b db 2
    c db 3
    d db 4
    
segment code use32 class=code
start:
        mov al,[a]
        add al,[d]
        
        mov bl,[b]
        add bl,[d]
        
        mov cl,[c]
        sub cl,al
        
        add cl,bl
    
push dword 0
call [exit]    