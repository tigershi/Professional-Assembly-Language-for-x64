# features.s - Determine MMX, SSE, SSE2, and SSE3 capabilities
#as -gstabs features_x64.s -o features_x64.o
#ld -o features_x64  features_x64.o -lc -I /lib64/ld-linux-x86-64.so.2
#./features_x64 
.code64
.section .data
gotmmx:
   .asciz "Supports MMX"
gotsse:
   .asciz "Supports SSE"
gotsse2:
   .asciz "Supports SSE2"
gotsse3:
   .asciz "Supports SSE3"
output:
   .asciz "%s\n"
.section .bss
   .lcomm ecxdata, 4
   .lcomm edxdata, 4
.section .text
.globl _start
_start:
   nop
   movl $1, %eax
   cpuid
   movl %ecx, ecxdata
   movl %edx, edxdata

   test $0x00800000, %edx
   jz done

   movq $gotmmx, %rsi
   movq $output, %rdi
   call printf


   movl edxdata, %edx
   test $0x02000000, %edx
   jz done

   movq $gotsse, %rsi
   movq $output, %rdi
   call printf

   movl edxdata, %edx
   test $0x04000000, %edx
   jz done

   movq $gotsse2, %rsi
   movq $output, %rdi
   call printf
   movl ecxdata, %ecx
   test $0x00000001, %ecx
   jz done

   movq $gotsse3, %rsi
   movq $output, %rdi
   call printf

done:
   movq $0, %rdi
   call exit
