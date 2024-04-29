# cpuidtest.s - An example of using the TEST instruction
.code64
.section .data
output_cpuid:
   .asciz "This processor supports the CPUID instruction\n"
output_nocpuid:
   .asciz "This processor does not support the CPUID instruction\n"
.section .text
.globl _start
_start:
   nop
   pushfq
   popq %rax
   movq %rax, %rdx
   xorq $0x00200000, %rax
   pushq %rax
   popfq
   pushfq
   popq %rax
   xorq %rdx, %rax
   test $0x00200000, %rax
   jnz cpuid
   movq $output_nocpuid, %rdi
   call printf
   movq $0, %rdi
   call exit
cpuid:
   movq $output_cpuid, %rdi
   call printf
   movq $0, %rdi
   call exit
