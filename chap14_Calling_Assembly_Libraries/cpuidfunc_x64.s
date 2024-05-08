# cpuidfunc.s - An example of returning a string value
#as -o cpuidfunc_x64.o cpuidfunc_x64.s
.code64
.section .bss
   .comm outputcpuid, 13
.section .text
.type cpuidfunc, @function
.globl cpuidfunc
cpuidfunc:
   movq $0, %rax
   cpuid
   leaq outputcpuid(%rip), %rdi
   movl %ebx, (%rdi)
   movl %edx, 4(%rdi)
   movl %ecx, 8(%rdi)
   leaq outputcpuid(%rip), %rax
   ret
