;Wpisac do rejestru wartosc stałej, a nastepnie zaktualizowa�śjej wartość (na dwa sposoby).

;pierwszy sposób, od razu do pamięci
org 100h

start:

mov  byte   [liczba], 0x1235
mov	cx, [liczba]  ; tu wypisujemy zmienną na ekran
mov	ah, 2
mov	dx, cx
int	21h

mov	ax, 4C00h
int	21h

liczba		dd	0x345655


; adres    0 +1 +2 +3
; wartosc 35 12 24 00


; cmp ax, bx ; ax-bx=0

; FLAGS:
; ZF - zero flag
; CF - carry flag
; SF - sign flag
; OF - overflow flag
; PF - parity flag (parzystosc)
