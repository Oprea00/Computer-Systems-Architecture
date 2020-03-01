;1.c+(a*a-b+7)/(2+a), a-byte; b-doubleword; c-qword   fara semn 

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
    mul byte[a] ;ax:=a*a 
    sub ax,[b]
    add ax,7 ;ax:=a*a-b+7

    mov dx,0 ; dx:ax:=ax 
    
    
    mov bl,[a]
    add bl,2  ;bl :=2+a
    
    mov bh,0
    
    div word bx 
    
    add ax,word[c]
    add dx,word[c+2] ;dx:ax:=c+(a*a-b+7)
    
push dword 0
call [exit]