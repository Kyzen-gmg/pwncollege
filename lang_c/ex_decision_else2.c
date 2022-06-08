#include <stdio.h>

main () 
{

    /* define local variable */
    int a = 100;

    /* check the boolean condition */
    if( a < 20 ) {
        /* if condition is true then print the following */
        printf("Value of a is less than 20\n");} 
    else {
        /* if condition is false then print the following */
        printf("Value of a is not less than 20\n");}

    printf("Value of a is : %d\n", a);

    return 0;
}
