bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    S db 1,2,4,6,10,20,25 
    len_S equ $-S 
    D times len_S-1 db 0 

;Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 astfel incat elementele din D sa reprezinte diferenta dintre fiecare 2 elemente consecutive din S.
segment code use32 class=code
start:
    xor ecx,ecx 
    xor esi,esi 
    xor edi,edi 
    mov ecx,len_S
    sub ecx , 1   ;because we take 2 elements and we need to stop at len_S-1 
    jecxz .end
    
    .repeat1:
        mov al,[S+esi]    ;first element
        mov bl,[S+esi+1]  ;second element 
        sub bl,al         ;make the difference  
        mov [D+edi],bl    ;put the difference in edi   
        inc esi           ;move to the next byte in S 
        inc edi           ;move to the next byte in D  
    loop .repeat1 ; while ecx>0    
    
    
    .end:
    push dword 0
    call [exit] 