;(c+b+a)-(d+d)  cu semn 

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db  1
    b dw  2
    c dd  3
    d dq  4
    
segment code use32 class=code
start:
    
    mov ax,[b]
    cwde
    mov ebx,eax
    add ebx,[c] ;ebx:=c+b 
    
    mov al,[a]
    cbw
    cwde
    add eax,ebx ;eax:=c+b+a 
    
    mov edx,[d]
    adc edx,[d] ;edx:=d+d 
    
    sub eax,edx  ;eax:=(c+b+a)-(d+d)
    

push dword 0
call [exit]