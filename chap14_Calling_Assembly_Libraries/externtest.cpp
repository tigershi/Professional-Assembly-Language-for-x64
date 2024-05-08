/* externtest.cpp - An example of using assembly language functions with C++ */
//g++ -o externtest externtest.cpp square_x64.s areafunc_x64.s cpuidfunc_x64.s -no-pie
#include <iostream>
using namespace std;

extern "C" {
   int square(int);
   float areafunc(int);
   char *cpuidfunc(void);
}


int main()
{
   int radius = 10;
   int radsquare = square(radius);
   cout << "The radius squared is " << radsquare << endl;
   float result;
   result = areafunc(radius);
   char *cpp  = cpuidfunc();
   cout << "The area is " << result << endl;
   cout << "The CPUID is " << cpp << endl;
   return 0;
}
