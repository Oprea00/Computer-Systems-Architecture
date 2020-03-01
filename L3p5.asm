;1.c+(a*a-b+7)/(2+a), a-byte; b-doubleword; c-qword   cu semn 

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

    mov al,[a]
    imul byte[a] ;ax:=a*a 
    sub ax,[b]
    add ax,7 ;ax:=a*a-b+7

    cwd ; dx:ax:=ax 
    
    mov cx,ax 
    
    
    mov al,[a]
    add al,2  
    cbw
    mov bx,ax 
    mov ax,cx 
    idiv word bx 
    
    add ax,word[c]
    adc dx,word[c+2] ;dx:ax:=c+(a*a-b+7)
    
push dword 0
call [exit]