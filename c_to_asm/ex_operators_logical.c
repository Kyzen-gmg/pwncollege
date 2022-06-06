#include <stdio.h>

main() {

    int a = 1;
    int b = 0;
    int c;

    if ( a && b ) {
        printf("Line 1 - Condition is true\n"); 
    }

    if ( a || b ) {
        printf("Line 2 - Condition is true\n");
    }

    /* lets change the value of a and b */
    a = 0;
    b = 10;

    if ( a && b) {
        printf("Line 3 - Condition is true\n");
    } else {
        printf("line 3 - Condition is not true\n");
    }

    if ( !(a && b) ) {
        printf("Line 4 - Condition is true\n");
    }

}
