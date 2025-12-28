;Wykona� arytmetyk� na rejestrach: zadeklarowa� tablic� znak�w drukowalnych i po kolei je wy�wietla�.

org 100h

mov cx, 4   ; licznik do loopa
mov bx, 0   ; 

start:

mov   ah, 2
mov   dx, [xxx] ; wypisze "6", xxx+2 wypisze "5" itd.
sub   dx, bx
add   bx, 1
dec   cx
int   21h
jnz   start

mov   ax, 4C00h     ;
int   21h           ; koniec programu

xxx         db    55,54,53,52