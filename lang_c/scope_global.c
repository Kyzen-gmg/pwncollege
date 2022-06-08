#include <stdio.h>

/* global var declaration */
int g;

int main () {

    /* local var declarations */
    int a, b;

    /* actual definition */
    a = 10;
    b = 20;
    g = a + b;

    printf("Value of a = %d, b = %d, and g = %d\n", a, b, g);

    return 0;
}