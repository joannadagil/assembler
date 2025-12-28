; Wpisa� do pami�ci warto�� sta��, przepisa� j� do rejestru i wy�wietli� na ekranie.
; Przyklad adresowania bezpo�redniego

org 100h                ; Okre�la punkt pocz�tkowy programu typu COM.
                        ; W plikach COM program zaczyna si� od offsetu 100h,
                        ; poniewa� pierwsze 256 bajt�w (00h�FFh) zajmuje PSP (Program Segment Prefix)
                        ; � struktura u�ywana przez DOS do zarz�dzania uruchomionym programem.

section .text           ; Sekcja kodu � tutaj znajduj� si� instrukcje wykonywalne programu.

start:                  ; Etykieta oznaczaj�ca pocz�tek programu.
                        ; Mo�e by� u�yta np. jako punkt wej�cia dla asemblera/linkera.

mov cx, [zmienna]       ; Zaladuj do rejestru CX wartosc bajtu znajdujacego sie pod etykieta "zmienna".
                        ; W tym wypadku [zmienna] oznacza odczyt z pami�ci (adres zmiennej).
                        ; Rejestr CX b�dzie przechowywa� t� warto�� (czyli 55 � kod ASCII znaku '7').

mov ah, 2               ; Ustaw kod funkcji DOS w rejestrze AH.
                        ; Funkcja 02h przerwania 21h � wy�wietlenie pojedynczego znaku na ekranie.
                        ; Znak, kt�ry ma zosta� wy�wietlony, musi by� w rejestrze DL.

mov dx, cx              ; Skopiuj zawarto�� rejestru CX do rejestru DX.
                        ; W ten spos�b znak, kt�ry by� w CX (czyli warto�� zmiennej), 
                        ; trafia do DL (ni�szej cz�ci DX), gdzie oczekuje go funkcja 02h.

int 21h                 ; Wywo�aj przerwanie systemowe DOS (INT 21h).
                        ; System DOS odczyta warto�� z DL i wy�wietli odpowiadaj�cy jej znak ASCII na ekranie.

mov ax, 4C00h           ; Przygotowanie do zako�czenia programu.
                        ; Funkcja 4Ch przerwania 21h s�u�y do zako�czenia programu z kodem wyj�cia w AL.
                        ; W tym przypadku AL = 00h, czyli zako�czenie bez b��d�w.

int 21h                 ; Wywo�anie przerwania DOS � zamkni�cie programu i powr�t do systemu.

section .data           ; Sekcja danych � tutaj znajduj� si� zmienne, sta�e i bufory programu.

zmienna db 55           ; Definicja bajtu o nazwie "zmienna" i warto�ci 55.
                        ; Warto�� 55 to kod ASCII znaku '7'.
                        ; Mo�na by te� zapisa�: zmienna db '7'  � efekt by�by identyczny.


; ENDIANESS
; 0x12345670

    ; LITTLE-ENDIAN - LSB significant byte pierwszy
        ; 78 56 34 12

    ; BIG-ENDIAN - MSB most significant byte pierwszy
        ; 12 34 56 78 
; W architekturze x86 stosowany jest format LITTLE-ENDIAN.