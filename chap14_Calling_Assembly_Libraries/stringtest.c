/* stringtest.c - An example of returning a string value */
//gcc -o stringtest stringtest.c cpuidfunc_x64.o
#include <stdio.h>

char *cpuidfunc(void);

int main()
{
        char *spValue;
        spValue = cpuidfunc();
        printf("The CPUID is: '%s'\n", spValue);
        return 0;
}
