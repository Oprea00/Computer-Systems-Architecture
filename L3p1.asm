;c-(a+d)+(b+d) fara semn 

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
    
    mov eax,0
    mov al,[a]
    mov edx,0
    add eax,dword[d]  ;eax:=low dwords
    adc edx,dword[d+4] ;edx:=high dwords
    
    mov ebx,[c]
    mov ecx,0  
    sub ebx,eax  ;ebx:=low dwords
    sbb ecx,edx  ;ecx:=high dwords 
    
    mov eax, 0
    mov ax,[b]
    mov edx,0
    add eax,dword[d]
    adc edx,dword[d+4]
    
    add eax,ebx
    adc edx,ecx 
    
push dword 0
call [exit]