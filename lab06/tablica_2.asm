; To jdest procedura, która wypelnia tablicê wartoœci typu integer wartosciami o 1 wiêkszymi
section .text use32

global	_tablica

_tablica:
	;Tu standardowo tworzymy ramkê stosu
	push	ebp
	mov	ebp, esp
	push edi
	;[ebp+8] pokazuje adres przekazany do procedury (wskaŸnik)
	mov eax, [ebp+8] ; tu kopiujemy wartoœæ spod adresu przechowywanego w [ebp+8]
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
	
	;[eax] to wartoœæ przechowywana pod adresem [ebp+8]. 
	;Operacja zwiêksza o 1 wartoœæ argumentu przekazanego przez wskaŸnik
	;add [eax],ebx
	leave
	
	ret