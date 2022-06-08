#include <stdio.h>

main() {

    unsigned int a = 60; /* 60 = 0011 1100 */
    unsigned int b = 13; /* 13 = 0000 1101 */
    int c = 0;

    c = a & b;          /* 12 = 0000 1100 */
    printf("                              a = 60     0011 1100\n");
    printf("                              b = 13     0000 1101\n");
    printf("c = a & b.  Line 1 - Value of c is %d  = 0000 1100\n", c);

    c = a | b;          /* 61 = 0011 1101 */
    printf("c = a | b.  Line 2 - Value of c is %d  = 0011 1101\n", c);

    c = a ^ b;          /* 49 = 0011 0001 */
    printf("c = a ^ b.  Line 3 - Value of c is %d  = 0011 0001\n", c);

    c = ~a;             /*-61 = 1100 0011 */
    printf("c = ~a.     Line 4 - Value of c is %d = 1100 0011\n", c);

    c = a << 2;         /* 240 = 1111 0000 */
    printf("c = a << 2. Line 5 - Value of c is %d = 1111 0000\n", c);

    c = a >> 2;         /* 15 = 0000 1111 */
    printf("c = a >> 2. Line 6 - Value of c is %d  = 0000 1111\n", c);

}
