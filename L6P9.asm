bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    S DD 12345678h, 1A2C3C4Dh, 98FCDD76h, 12783A2Bh
    lenS equ ($-S)/4
    D times lenS db 0
    
;9.A list of doublewords is given. Starting from the low part of the doubleword, obtain the doubleword made of the high even bytes of the low words of each doubleword from the given list. If there are not enough bytes, the remaining bytes of the doubleword will be filled with the byte FFh.   
segment code use32 class=code
start:
    mov esi,S
    cld 
    xor eax,eax 
    mov  ecx,lenS
    xor ebx,ebx 
    mov edi,D
    .repeta:
        lodsb
        lodsb ;this is the byte that we want
        test al,1  ;check the last bit
        jnz .skip  ;0=even , 1=odd 
        stosb      ;put the even byte in destination
        add ebx,1
        
        .skip:
        lodsb 
        lodsb     
    loop .repeta 

    mov ecx,lenS
    cmp ecx,ebx  ;to see if we had remaining bytes of the doubleword 
    jz .sfarsit
    sub ecx,ebx
    .fill:
        mov al,0FFh
        stosb
    loop .fill
    
    .sfarsit:
    push dword 0
    call [exit]   