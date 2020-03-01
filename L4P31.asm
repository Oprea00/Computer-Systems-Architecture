;biţii de pe poziţiile 1-5 ai lui A
;biţii de pe poziţiile 6-10 ai lui B
;biţii de pe poziţiile 11-15 ai lui C

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    a dw  0000000000000010b
    b dw  0000000010000000b
    c dw  0001100000000000b
    d dw  0
   
segment code use32 class=code
start:

    mov ax,[a]
    shr ax,1 ;ax[0-4]:=A[1-5] 
    and ax,0000000000011111b
    
    mov bx,[b]
    shr bx,6 ;bx[0-4]:=B[6-10]
    and bx,0000000000011111b
    
    mov cx,[c]
    shr cx,11 ;cx[0-4]:=C[11-15]
    and cx,0000000000011111b 
    
    add [d],ax 
    add [d],bx 
    add [d],cx 

push dword 0
call [exit]