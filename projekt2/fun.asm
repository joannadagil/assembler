; fun.asm
; double _fun(double x, unsigned long n)
; Liczy e^x przez sumowanie szeregu Taylora i ZWRACA wynik w ST(0)

BITS 32

; --- OMF segments for Borland ---
segment _DATA public class=DATA use32

segment _BSS public class=BSS use32
    xval   resq 1
    term   resq 1
    sum    resq 1
    k_int  resd 1

segment _TEXT public class=CODE use32
global _fun

_fun:
    push ebp
    mov  ebp, esp
    push ebx
    push esi
    push edi

    ; args:
    ; [ebp+8..15]  double x
    ; [ebp+16]     unsigned long n

    ; zapisz x
    fld  qword [ebp+8]
    fstp qword [xval]

    mov eax, [ebp+16]      ; n
    test eax, eax
    jnz  .init

    ; n == 0 -> return 0.0
    fldz
    jmp .ret

.init:
    ; term = 1.0, sum = 1.0
    fld1
    fst  qword [term]
    fstp qword [sum]

    cmp eax, 1
    jbe .load_sum

    mov ecx, 1
    mov edx, eax
    dec edx                ; edx = n-1

.loop:
    ; term = term * x / k
    fld  qword [term]
    fld  qword [xval]
    fmulp st1, st0

    mov  [k_int], ecx
    fild dword [k_int]
    fdivp st1, st0

    fst  qword [term]

    ; sum += term
    fld  qword [sum]
    faddp st1, st0
    fstp qword [sum]

    inc ecx
    cmp ecx, edx
    jbe .loop

.load_sum:
    fld qword [sum]        ; wynik w ST(0)

.ret:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
