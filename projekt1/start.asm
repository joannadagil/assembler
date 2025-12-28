section .text

org 100h

start:	
    mov ah, 9          ; print start message
    mov dx, start_msg   
    int 21h

    
    mov ax, cs         ; stack initialization
    mov ss, ax
    mov sp, 0FFFEh 

    xor cx, cx         ; setting character counter to 0

    read_loop:
        mov ah, 1      ; read character from keyboard
        int 21h
      
        cmp al, 13     ; ENTER?
        je end
                        
        cmp al, ' '    ; SPACE?
        je print_loop

        push ax        ; save to stack
        inc cx         ; increase counter

        jmp read_loop

    print_loop:

        cmp cx, 0      ; check if there are characters to print
        je next        ;   if not, go to next

        mov ah, 2      ; print character
        pop dx         ;   from stack
        int 21h

        dec cx         ; decrease counter

        jmp print_loop

    next:

        mov ah, 2       ; print new line
        mov dl, 13      ;   carriage return
        int 21h
        mov dl, 10      ;   line feed
        int 21h

        jmp read_loop

end:
    mov ah, 9           ; print end message
    mov dx, end_msg    
    int 21h
    
    mov ah, 4Ch         ; exit program
    xor al, al          ;   with return code 0
    int 21h


section .data 

    start_msg db "Enter your characters. Press SPACE to finish. Press ENTER to end the program.", 13, 10, "$"
    end_msg db "Program ended.$"

section .bss