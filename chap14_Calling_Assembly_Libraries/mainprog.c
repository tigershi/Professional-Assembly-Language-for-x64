/* mainprog.c - An example of calling an assembly function */
//gcc -o mainprog mainprog.c asmfunc_x64.s -no-pie
#include <stdio.h>
extern int asmfunc();
int main()
{
        printf("This is a test.\n");
        asmfunc();
        printf("Now for the second time.\n");
        asmfunc();
        printf("This completes the test.\n");
        return 0;
}
