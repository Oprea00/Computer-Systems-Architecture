;20.Sa se citeasca de la tastatura in baza 16 doua numere a si b de tip dword si sa se afiseze suma partilor low si diferenta partilor high. Exemplu:
;a = 00101A35h, b = 00023219h
;suma = 4C4Eh
;diferenta = Eh

bits 32 
global start 
extern exit, scanf, printf
import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll

segment data use 32 class=data 
    a dd 0
    b dd 0
    format1 db 'a=',0
    format2 db 'b=',0
    readformat db '%x', 0
    sumaformat db 'suma=%xh  ',0
    diferentaformat db 'diferenta =%xh',0

segment code use 32 class=code 
start:
    ;call printf('a=')
    push dword format1
    call [printf]    
    add esp,4*1      

    ;call scanf('%x,a)    
    push dword a		
	push dword readformat
	call [scanf]
	add esp, 4*2

    ;call printf('b=')
    push dword format2
    call [printf]
    add esp,4*1
    
    ;call scanf('%x,b)    
    push dword b		
	push dword readformat
	call [scanf]
	add esp, 4*2
    
    xor eax,eax 
    xor ebx,ebx
    mov ax,[a]
    mov bx,[b]
    add ax,bx 
    
    push eax 
    push dword sumaformat
    call[printf]
    add esp,4*2
    
    xor eax,eax 
    xor ebx,ebx
    mov ax,[a+2]
    mov bx,[b+2]
    sub ax,bx 
    
    push eax 
    push dword diferentaformat
    call[printf]
    add esp,4*2
    
    push dword 0
    call [exit]