bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    S db 1,4,2,4,8,2,1,1 
    len_S equ $-S 
    D times len_S db 0 

; Se da un sir de octeti S. Sa se obtina in sirul D multimea elementelor din S.   
segment code use32 class=code
start:
    xor ecx,ecx 
    xor esi,esi 
    xor edi,edi 
    mov ecx,len_S 
    mov dh,len_S
    jecxz .end
    mov dl,[D+edi] ;initial adress of D
    
    .repeat1:
        mov al,[S+esi] ;put one element 
        .searchElementInD:   ;loop in the second string to see if the element has no duplicate
            mov bl,[D+edi]
            cmp al,bl        
            je .repeat1     
            inc edi 
        loop .searchElementInD 
        cmp ecx,0
        je .putElement
        
        .putElement:
            mov dl,al
            
    loop .repeat1
            
    .end:
    push dword 0
    call [exit] 