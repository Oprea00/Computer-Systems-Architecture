;Sa se citeasca de la tastatura un nume de fisier si un text. Sa se creeze un fisier cu numele dat in directorul curent si sa se scrie textul in acel fisier. Observatii: Numele de fisier este de maxim 30 de caractere. Textul este de maxim 120 de caractere.

bits 32
global start
extern exit,scanf,fopen,fprintf,fclose,printf
import exit msvcrt.dll
import scanf msvcrt.dll
import fopen msvcrt.dll 
import fprintf msvcrt.dll
import fclose msvcrt.dll 
import printf msvcrt.dll 

segment data use 32 class=data
    nume_fisier times 30 db 0
    text times 120 db 0
    mod_acces db "w",0
    descriptor_fisier dd -1
    read_format db "%s",0

segment code use 32 class=code 
start:
    push dword nume_fisier
    push dword read_format
    call [scanf]
    add esp,4*2
    
    push dword text
    push dword read_format
    call [scanf]
    add esp,4*2
    
    push dword mod_acces
    push dword nume_fisier
    call [fopen]
    add esp,4*2 
    
    cmp eax,0
    je .final
    mov [descriptor_fisier],eax 
    
    push dword text
    push dword [descriptor_fisier]
    call [fprintf]
    add esp,4*2
    
    .final:
    push dword 0
    call [exit]