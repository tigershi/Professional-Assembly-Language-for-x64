/* inttest.c - An example of returning an integer value */
//gcc -o inttest inttest..c square_x64.s -no-pie
//dynamic libary build
// gcc -shared  -o libchap14.so square_x64.o areafunc_x64.o greater_x64.o fpmathfunc_x64.o
// gcc -o inttest  inttest.c -L./ -lchap14
//export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
//ldd ./inttest
//./inttest 
#include <stdio.h>
extern int square(int a);
int main()
{
        int i = 2;
        int j = square(i);
        printf("The square of %d is %d\n", i, j);

        j = square(10);
        printf("The square of 10 is %d\n", j);
        return 0;
}
