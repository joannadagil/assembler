;Odczytaæ z klawiatury znak, a nastêpnie go wypisaæ na ekranie.

org 100h

start:

mov	ah,1 ; odczytuje znak z klawiatury i wypisuje na ekran
int	21h

mov 	dl, al ; przepisanie znaku do wyœwietlenia

mov	ah, 2
int	21h

mov	ax, 4C00h
int	21h