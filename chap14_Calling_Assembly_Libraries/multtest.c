/* multtest.c - An example of using multiple input values */
//gcc -o multtest multtest.c greater_x64.o
#include <stdio.h>
int greater(int a, int b);
int main()
{
        int i = 10;
        int j = 20;
        int k = greater(i, j);
        printf("The larger value is %d\n", k);
        return 0;
}
