;c-(a+d)+(b+d)


bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db 0
    b db 0
    c db 0
    d db 0
    
segment code use32 class=code
start:
    
    
push dword 0
call [exit]    