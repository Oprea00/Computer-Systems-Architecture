bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    A db 2,1,-3,0 
    len_A equ $-A 
    B db 4,5,7,6,2,1
    len_B equ $-B
    R times len_A+len_B dw 0 

;Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina elementele lui B in ordine inversa urmate de elementele in ordine inversa ale lui A.
   
segment code use32 class=code
start:
    xor ecx,ecx
    xor esi,esi 
    xor edi,edi 
    mov ecx,len_B 
    mov esi,len_B-1     
    ;std ;DF=1,to take the elements in reverse order 
    .putFromB:
        mov al,[B+esi]   
        mov [R+edi],al 
        dec esi          ;decrease because we parse from right to left 
        inc edi 
    loop .putFromB

    mov ecx,len_A
    jecxz .end 
    mov esi,len_A-1
   .putFromA:
        mov al,[A+esi]
        mov [R+edi],al 
        dec esi 
        inc edi 
    loop .putFromA
    
    .end:
push dword 0
call [exit]    

    