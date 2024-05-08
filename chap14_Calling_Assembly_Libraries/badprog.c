/* badprog.c - An example of passing input values in the wrong order */
//gcc -o badprog badprog.c testfunc_x64.o
//because of the x64 use register pass the parameters, it can work
#include <stdio.h>

double testfunc(int, double);

int main()
{
        int data1 = 10;
        double data2 = 3.14159;
        double result;

        result = testfunc(data1, data2);
        printf("The bad result is %gf\n", result);
        return 0;
}
