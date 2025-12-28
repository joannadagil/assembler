;Wykonaæ arytmetykê na rejestrach: zadeklarowaæ tablicê znaków drukowalnych i po kolei je wyœwietlaæ.

org 100h

start:

mov	ah, 2
mov	dx, [xxx+1] ;wypisze "6", xxx+2 wypisze "5" itd.
int	21h

mov	ax, 4C00h
int	21h

xxx		db	55,54,53,52