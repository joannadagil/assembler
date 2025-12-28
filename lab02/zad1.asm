; w dosbox options na samym koncu dodac:
; mount d d:\Users\a231008

; d: /enter/


	; To jest komentarz
	; tu mo�na wstawi�:
	; section .text
	; aby da� zna� NASMowi, �e to b�dzie w sekcji kodu.

	section .text   ; poczatek sekcji kodu


	org 100h	; Ta linia jest informacj� dla kompilatora, �e program wynikowy b�dzie typu .com. 
			; Informuje ona r�wnie� o tym, �e nasz kod znajdowa� si� b�dzie po uruchomieniu pod adresem 100h (256 dziesi�tnie).

	start:		; Start: mo�e by� to dowolna nazwa z dwukropkiem. Okre�la ona pocz�tek kodu w programie.			
		
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

	section .bss    ; pocz�tek sekcji deklaracji zmiennych, np:
			; liczba: resb 1 ; REServe 1 Byte


;nasm -o zad1.com -f bin zad1.asm