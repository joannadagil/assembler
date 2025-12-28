; w dosbox options na samym koncu dodac:
; mount d d:\Users\a231008

; d: /enter/


	section .text   ; poczatek sekcji kodu


	org 100h	; Ta linia jest informacja dla kompilatora, ze program wynikowy bedzie typu .com. 
			; Informuje ona rowniez o tym, ze nasz kod znajdowac sie bedzie po uruchomieniu pod adresem 100h (256 dziesietnie).

	start:		
		
		mov ah, 9
		mov dx, label
		int 21h

		mov ah, 0
		int 16h

		mov ax, 4c00h
		int 21h

	section .data   ; poczatek sekcji danych zainicjowanych

		label db "Czesc$"
		; $ oznacza breakline

	section .bss    ; poczatek sekcji deklaracji zmiennych, np:
			; liczba: resb 1 ; REServe 1 Byte


;nasm -o naszplik.com -f bin naszplik.asm