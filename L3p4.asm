;29.(a+b)/(c-2)-d+2-x; a,b,c-byte; d-doubleword; x-qword   cu semn 

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a db  1
    b db  2
    c db  3
    d dd  4
    x dq  1 
    
segment code use32 class=code
start:
    
    mov al,[a]
    add al,[b] ;al:=a+b 
    
    mov bl,[c]
    sub bl,2 ;bl:=c-2 
    
    cbw ;ax:=a+b 
    idiv bl ; al:=a+b)/(c-2),  ah:=(a+b)%(c-2) 
    
    cbw
    cwde
    sbb eax,[d] 
    add eax,2
    
    cdq 
    sub eax,dword[x]
    sbb edx,dword[x+4]
    
    
    

push dword 0
call [exit]