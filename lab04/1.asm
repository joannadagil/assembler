;--------------------------------------------------------
; Program: Por�wnywanie dw�ch cyfr wprowadzonych z klawiatury
; Autor: [tu mo�esz wpisa� swoje imi�]
; �rodowisko: DOS (.COM), asembler NASM
; Cel: pobra� dwie cyfry, sprawdzi� poprawno��, por�wna� je i
;      wypisa� odpowiedni komunikat.
;--------------------------------------------------------

org 100h                 ; plik COM �adowany od adresu 100h

section .text
start:

    ; --- Wy�wietlenie komunikatu tytu�owego ---
    mov dx, label         ; DX � adres napisu
    mov ah, 9             ; funkcja 09h DOS � wypisanie �a�cucha zako�czonego '$'
    int 21h

    ; --- Wczytanie pierwszego znaku z klawiatury ---
    mov ah, 1             ; funkcja 01h DOS � pobranie znaku (z echem)
    int 21h               ; po wykonaniu AL = kod ASCII znaku
    mov [pierwsza], al    ; zapisz pierwszy znak do pami�ci (zmienna 'pierwsza')
    mov bl, [pierwsza]    ; przenie� go r�wnie� do rejestru BL

    ; --- Sprawdzenie czy pierwszy znak to cyfra (kod ASCII 48�57) ---
    cmp bl, 48            ; por�wnaj z '0' (48 dziesi�tnie)
    jl zla                ; je�li mniejszy � to nie cyfra
    cmp bl, 57            ; por�wnaj z '9' (57 dziesi�tnie)
    jg zla                ; je�li wi�kszy � to nie cyfra

    ; --- Wczytanie drugiego znaku z klawiatury ---
    mov ah, 1             ; ponownie funkcja 01h � pobranie znaku
    int 21h
    mov [druga], al       ; zapisz w pami�ci
    mov cl, [druga]       ; przenie� do rejestru CL

    ; --- Sprawdzenie czy drugi znak to cyfra (48�57) ---
    cmp cl, 48
    jl zla
    cmp cl, 57
    jg zla

    ; ----------------------------------------------------------
    ; Por�wnanie dw�ch wczytanych znak�w (kod�w ASCII cyfr)
    ; Dla cyfr '0'..'9' porz�dek ASCII odpowiada porz�dkowi liczbowemu
    ; ----------------------------------------------------------
    cmp bl, cl            ; por�wnaj pierwszy znak z drugim
    jg wieksza            ; je�li BL > CL � pierwsza cyfra wi�ksza
    je rowna              ; je�li BL = CL � liczby r�wne
    jl mniejsza           ; je�li BL < CL � druga cyfra wi�ksza

; --- Etykiety dla poszczeg�lnych wynik�w ---

wieksza:
    mov dx, wieksza_t     ; adres napisu "Wieksza"
    jmp wypisz            ; przejd� do wypisania tekstu

rowna:
    mov dx, rowna_t       ; adres napisu "Rowna"
    jmp wypisz

mniejsza:
    mov dx, mniejsza_t    ; adres napisu "Mniejsza"
    jmp wypisz

; --- Obs�uga b��dnego znaku ---

zla:
    mov dx, zla_t         ; adres komunikatu "Podano zly znak"
    jmp wypisz

; --- Wsp�lna procedura wypisywania komunikatu ---

wypisz:
    mov ah, 9             ; funkcja DOS � wy�wietl �a�cuch znak�w
    int 21h

    ; --- Zako�czenie programu ---
    mov ax, 4C00h         ; funkcja 4Ch � zako�czenie programu z kodem 0
    int 21h


;========================================================
section .data

label db "Porownywanie liczb", 10, 13, "$"   ; komunikat tytu�owy (CR/LF + '$')
zla_t db "Podano zly znak", 10, 13, "$"      ; komunikat b��du
wieksza_t db "Wieksza$", 10, 13, "$"         ; wynik: pierwsza wi�ksza
rowna_t db "Rowna$", 10, 13, "$"             ; wynik: liczby r�wne
mniejsza_t db "Mniejsza$", 10, 13, "$"       ; wynik: druga wi�ksza

pierwsza db 0        ; miejsce na pierwsz� cyfr� (pocz�tkowa warto�� nieistotna)
druga db 0           ; miejsce na drug� cyfr�

section .bss
; nieu�ywana sekcja � brak zmiennych dynamicznych

;========================================================
; Kompilacja (NASM, plik .COM):
; nasm -f bin program.asm -o program.com
;========================================================


; POLECANIA 1 ARGUMENTOWE:

;  INC AX
;  DEC AX
;  NEG AX


; POLECENIA 2 ARGUMENTOWE:

;  ADD AX, BX
;  SUB AX, BX
;  IMUL BX, 5
;  XCHG AX, BX
;  XOR AX, BX
;  CMP AX, BX
;  MOV AX, BX
;  MOV AX, [zmienna]
;  MOV [zmienna], AX
;  MOV AX, 1234h
;  

; WEJSCIOWKA (3-5 pytań):

/* alokacja pamięci

w section .bss lub .data

[variable-name]

*/

; zarezerwuj w pamieci miejsce na ileś bajtów

; instrukcje skoków warunkowych
;       int 21h

; wyświetlenie kodu asci, stringa

; do czego służy org 100h

; instrukcje artmetyczne na liczbach

;mov	cx, [zmienna]
;mov	ah, 2
;mov	dx, cx

; adres    0 +1 +2 +3
; wartosc 35 12 24 00


; cmp ax, bx ; ax-bx=0

; FLAGS:
; ZF - zero flag
; CF - carry flag
; SF - sign flag
; OF - overflow flag
; PF - parity flag (parzystosc)

; ENDIANESS
; 0x12345670

    ; LITTLE-ENDIAN - LSB significant byte pierwszy
        ; 78 56 34 12

    ; BIG-ENDIAN - MSB most significant byte pierwszy
        ; 12 34 56 78 
; W architekturze x86 stosowany jest format LITTLE-ENDIAN.