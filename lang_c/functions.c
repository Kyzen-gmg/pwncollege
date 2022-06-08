#include <stdio.h>

/* func declaration */
int max(int num1, int num2);

int main() {

    /* local var definition*/
    int a = 100;
    int b = 200;
    int ret;

    /* calling a func to get max value */
    ret = max(a, b);

    printf( "Max value is : %d\n", ret);
    return 0;
}

/* func returning the max between two numbers */
int max(int num1, int num2) {

    /* local var definition */
    int result;

    if( num1 > num2 )
        result = num1;
    else
        result = num2;

    return result;
}