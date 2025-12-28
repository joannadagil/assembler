;Wpisaæ do pamiêci wartoœæ sta³¹, przepisaæ j¹ do rejestru i wyœwietliæ na ekranie.

org 100h

section .text

start

;mov	cx, [zmienna]
;mov	ah, 2
;mov	dx, cx

mov cx, [zmienna]
sub cx, 32
mov ah, 2
mov dx, cx
int	21h

mov	ax, 4C00h
int	21h

section .data

zmienna db 55 ; lub np. zmienna db s - patrz kod ASCII