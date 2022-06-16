#include <stdio.h>
#include <time.h>

/* func to generate and return random numbers. */
int * getRandom() {

    static int r[10];
    int i;

    /* set the seed */
    srand( (unsigned)time( NULL ) );

    for( i = 0; i < 10; i++) {
        r[i] = rand();
        printf("%d\n", r[i]);
    }

    return r;
}

/* main func to call above defined func */
int main () {

    /* a pointer to an int */
    int *p, i;

    p = getRandom();

    for( i = 0; i < 10; i++) {
        printf("*(p + [%d]) : %d\n", i, *(p + i));
    }

    return 0;
}