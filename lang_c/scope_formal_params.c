#include <stdio.h>

/* sum() func declaration */
int sum(int a, int b);

/* global var declaration */
int a = 20;

int main() {

    /* local vars declaration in main func */
    int a = 10;
    int b = 20;
    int c = 0;

    printf("Value of a in main() = %d\n", a);
    c = sum(a, b);
    printf("Value of c in main() = %d\n", c);

    return 0;
}

/* func to add two integers */
int sum(int a, int b) {

    printf("Value of a in sum() = %d\n", a);
    printf("Value of b in sum() = %d\n", b);
    return a + b;
}