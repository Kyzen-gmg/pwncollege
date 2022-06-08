#include <stdio.h>

void swap(int *x, int *y);

int main() {

    /* local var definition */
    int a = 100;
    int b = 200;

    /* calling a func to swap the values */
    printf("Before swap, value of a : %d\n", a);
    printf("Before swap, value of b : %d\n", b);

    swap(&a, &b);

    printf("After swap, value of a : %d\n", a);
    printf("After swap, value of b : %d\n", b);

    return 0;
}

/* func definition to swap the values */
void swap(int *x, int *y) {

    int temp;

    temp = *x;       // save the value of x
    *x = *y;          // mov x, y
    *y = temp;       // mov y, temp

    return;
}