/* floattest.c - An example of using floating point return values */
// gcc -o floattest floattest.c areafunc_x64.o
#include <stdio.h>

float areafunc(int);

int main()
{
        int radius = 10;
        float result;
        result = areafunc(radius);
        printf("The result is %f\n", result);

        result = areafunc(2);
        printf("The result is %f\n", result);
        return 0;
}
