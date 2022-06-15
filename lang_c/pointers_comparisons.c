#include <stdio.h>

int main() {

    const int MAX =3;

    int var[] = {10, 100, 200};
    int i, *ptr;

    /* let us have address of the first element in pointer */
    ptr = var;
    i = 0;

    while( ptr <= &var[MAX - 1]) {

        printf("Address of var[%d] = %x\n", i, ptr);
        printf("Value of var[%d] = %x\n", i, *ptr);

        /* point to the next location */
        ptr++;
        i++;
    }

    return 0; //check
}