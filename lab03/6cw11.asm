org 100h

start:

mov cx,[info]
sub cx, 32

mov	ah, 2
mov	dx, cx
int	21h

mov	ax, 4C00h
int	21h

info	db	"s"
