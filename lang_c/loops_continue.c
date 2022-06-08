#include <stdio.h>

int main() {

    /* local var definition */
    int a = 10;


    do {
        if( a == 15 ) {
            a++;
            continue;
        }

    printf("Value of a: %d\n", a);
    a++;    
    
    } while( a < 20 );

    return 0;
}