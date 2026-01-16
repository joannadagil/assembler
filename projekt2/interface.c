#include <stdio.h>

extern double _fun(double x, unsigned int n);

extern double fun(double x, unsigned int n);


int main(void)
{
    double x;
    unsigned int n;
    double res;

    printf("This program computes e^x using nth-degree Taylor Polynomial, given an argument x and the degree n.\n");

    printf("Press Ctrl+Z and then Enter to exit.\n");

    while (1) {

        printf("----------------------------------------\n");

        printf("Enter the argument x: ");
        if (scanf("%lf", &x) != 1)
            break;

        printf("Enter the degree n: ");
        if (scanf("%u", &n) != 1)
            break;

        res = fun(x, n);

        printf("e^x (Taylor, n=%lu) = %.15f\n", n, res);

    }

    printf("Program terminated.\n");

    return 0;
}

/* 
To compile and run:

.\nasm.exe -f obj -o fun.obj fun.asm
.\bcc32.exe interface.c fun.obj
.\interface.exe
*/