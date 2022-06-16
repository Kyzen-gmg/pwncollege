#include <stdio.h>

int main() {

    int var = 3000, *ptr, **pptr;

    /* take the address of var using operator & */
    ptr = &var;

    /* take the addres of ptr using operator & */
    pptr = &ptr;

    /* take the value using pptr */
    printf("Value of var = %d\n", var);
    printf("Address at *ptr = %x\n", ptr);
    printf("Address at **pptr = %x\n", pptr);

    printf("Value available at *ptr = %d\n", *ptr);
    printf("Value available at **pptr = %d\n", **pptr);

    return 0;
}