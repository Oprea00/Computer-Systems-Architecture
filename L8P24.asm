;24. file name and a text (defined in data segment) are given. The text contains lowercase letters, uppercase letters, digits and special characters. Replace all digits from the text with character 'C'. Create a file with the given name and write the generated text to file.

bits 32
global start
extern exit,fopen ,fprintf ,fclose 
import exit msvcrt.dll
import fopen msvcrt.dll 
import fprintf msvcrt.dll 
import fclose msvcrt.dll 

segment data use32 class=data
    text db "aA5&7b8",0
    len_text equ $-text
    nume_fisier db "lab8.txt",0
    mod_acces db "w",0
    descriptor_fis dd -1
    format_C db "C",0
    no_digit times 2 db 0
    
segment code use32 class=code
start:
    push dword mod_acces
    push dword nume_fisier
    call [fopen]
    add esp, 4*2
    
    mov [descriptor_fis],eax 
    
    cmp eax,0 
    je final
    
    mov esi,text
    mov ecx,len_text
    
    .check_digit:
        lodsb 
        cmp al,"0"
        je .replace
        cmp al,"1"
        je .replace 
        cmp al,"2"
        je .replace
        cmp al,"3"
        je .replace
        cmp al,"4"
        je .replace
        cmp al,"5"
        je .replace
        cmp al,"6"
        je .replace
        cmp al,"7"
        je .replace
        cmp al,"8"
        je .replace
        cmp al,"9"
        jne .NOdigit
        
        .replace:
            pushad
            push dword format_C
            push dword [descriptor_fis]
            call [fprintf]
            add esp,4*2
            popad
            jmp .next
        
        .NOdigit:
            pushad 
            mov [no_digit],al 
            push dword no_digit
            push dword [descriptor_fis]
            call [fprintf]
            add esp,4*2
            popad 
            
        .next:
    loop .check_digit
    
    final:
    push dword [descriptor_fis]
    call [fclose]
    add esp ,4
    
    push dword 0
    call [exit]