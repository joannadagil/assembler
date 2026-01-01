; fun.asm
; double _fun(double x, unsigned int n)
; This program computes e^x using nth-degree Taylor Polynomial, given an argument x and a degree n.
; e^x ~= 1 + x/1! + x^2/2! + x^3/3! + ... + x^n/n!
; returns result in ST(0)


; section .bss use32
segment _BSS public class=BSS use32

    x    resq 1
    term resq 1
    sum  resq 1
    k  	 resd 1

; section .text use32
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
    ; [ebp+16]     unsigned int n

    ; load x
    fld  qword [ebp+8]  ; push x onto the FPU stack
    fstp qword [x]  	; pop from FPU stack into x

	; load n
    mov eax, [ebp+16]   

.init:

    ; term = 1.0, sum = 1.0
    fld1				; push 1.0 onto the FPU stack
    fst  qword [term]	; load term from FPU stack
    fstp qword [sum]	; pop sum from FPU stack

    cmp eax, 0
    jbe .ret

    mov ecx, 1
    mov edx, eax

.loop:

    ; term = term * x
    fld  qword [term]
    fld  qword [x]
    fmulp st1, st0

    ; term = term / k
    mov  [k], ecx
    fild dword [k]		; load an integer onto the FPU stack (converting it to double)
    fdivp st1, st0      ; divide st1 by st0, pop st0

    fst  qword [term]   ; load term from FPU stack

    ; sum += term
    fld  qword [sum]    ; push sum onto the FPU stack
    faddp st1, st0      ; add st1 and st0, pop st0
    fstp qword [sum]    ; pop sum from FPU stack

    inc ecx        	
    cmp ecx, edx
    jbe .loop

.ret:

    fld qword [sum]        ; push sum onto the FPU stack

    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp

    ret
