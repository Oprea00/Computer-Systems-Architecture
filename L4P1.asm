;bitii 0-4 ai lui C coincid cu bitii 11-15 ai lui A
;bitii 5-11 ai lui C au valoarea 1
;bitii 12-15 ai lui C coincid cu bitii 8-11 ai lui B
;bitii 16-31 ai lui C coincid cu bitii lui A

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a dw  1111111111111111b
    b dw  01001101000100100b
    c dd  0
   
   
segment code use32 class=code
start:
    xor bx,bx 
    
    mov ax,[a]
    shr ax,11
    and ax,0000000000011111b
    or bx,ax  ;c[0-4]:=a[11-15]

    or bx,0000111111100000b  ;c[5-11]:=1

    mov ax,[b] 
    shl ax,4
    and ax,1111000000000000b
    or bx,ax  ;c[12-15]:=B[8-11] 
    
    xor cx,cx 
    
    mov ax,[a] 
    or cx,ax ;c[16-31]:=A
    
    mov [c],bx
    mov [c+2],cx 

push dword 0
call [exit]