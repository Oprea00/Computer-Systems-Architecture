bits 32
global start
extern exit,printf 
import exit msvcrt.dll
import printf msvcrt.dll 

;6.Two natural numbers a and b (a: dword, b: dword, defined in the data segment) are given. Calculate a/b and display the quotient in the following format: "<a>/<b> = <quotient>". Example: for a = 200, b = 5 it will display: "200/5 = 40".
;The values will be displayed in decimal format (base 10) with sign.

segment data use32 class=data
    A dd 200  
    B dw 5
    format db "%d / %d = %d ",0
    B1 dd 0
    
segment code use32 class=code
start:
    mov ax,word[A]
    mov dx,word[A+2]
    idiv word[B]
    cwde 
    push dword eax 
    
    mov ax,[B]
    cwde 
    mov [B1],eax
    
    pop eax 
    
    ;printf(format,A,B,C)
    push eax 
    push dword [B1]
    push dword [A]
    push dword format 
    call [printf]
    add esp,4*4
    
push dword 0
call [exit]     
    
    

    