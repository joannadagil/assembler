#include <stdio.h>

extern double _fun(double x, unsigned long n);

extern double fun(double x, unsigned long n);


int main(void)
{
    double x;
    unsigned long n;
    double res;

    printf("This program computes e^x, given an argument x and the accuracy of the computation.\n");

    while (1) {

        printf("Enter the argument x (Ctrl+Z then Enter to exit): ");
        if (scanf("%lf", &x) != 1)
            break;

        printf("Enter the accuracy n (number of terms): ");
        if (scanf("%lu", &n) != 1)
            break;

        res = fun(x, n);

        printf("e^x (Taylor, n=%lu) = %.15f\n", n, res);

    }

    return 0;
}
