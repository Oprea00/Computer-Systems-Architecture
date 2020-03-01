;1+9

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=data
    
segment code use32 class=code
start:
    
    mov AL,1
    add AL,9
    
push dword 0
call[exit]