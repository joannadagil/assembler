; To jdest procedura, kt�ra wypelnia tablic� warto�ci typu integer wartosciami o 1 wi�kszymi
section .text use32

global	_tablica

_tablica:
	;Tu standardowo tworzymy ramk� stosu
	push	ebp
	mov	ebp, esp
	push edi
	;[ebp+8] pokazuje adres przekazany do procedury (wska�nik)
	mov eax, [ebp+8] ; tu kopiujemy warto�� spod adresu przechowywanego w [ebp+8]
	xor ebx, ebx
	xor edx, edx
	mov ecx, 4
petla:
	mov ebx, [eax+edx]
	push eax
	push edx
	mov eax, ebx
	mul ebx
	mov ebx, eax
	pop edx
	pop eax
	;inc dword [eax+edx] ;ebx
	; Tu robimy adresowanie rejestrowe z indeksowaiem
	mov [eax+edx], ebx
	add edx, 4
	loop petla
	
	;[eax] to warto�� przechowywana pod adresem [ebp+8]. 
	;Operacja zwi�ksza o 1 warto�� argumentu przekazanego przez wska�nik
	;add [eax],ebx
	leave
	
	ret

	; nasm -f win32 tablica_2.asm -o tablica_2.o

	; gcc -m32 -c tablica_interface1.c -o tablica_interface1.o

	; gcc -m32 tablica_interface1.o tablica_2.o -o tablica.exe

