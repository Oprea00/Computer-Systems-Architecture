;29.(a+b)/(c-2)-d+2-x; a,b,c-byte; d-doubleword; x-qword   fara semn 

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
    
    mov ah,0 ;ax:=a+b 
    div bl ; al:=a+b)/(c-2),  ah:=(a+b)%(c-2) 
    
    mov dx,0
    push dx 
    push ax 
    pop eax 
    sub eax,[d] 
    add eax,2
    
    mov edx,0
    sub eax,dword[x]
    sbb edx,dword[x+4]
    
    
    

push dword 0
call [exit]