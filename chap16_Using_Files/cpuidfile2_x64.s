# cpuidfile.s - An example of writing data to a file
.code64
.section .data

filename:
   .asciz "cpuid2.txt"
output:
   .asciz "The processor Vendor ID is 'xxxxxxxxxxxx'\n"

.section .text
.globl _start
_start:
   movl $0, %eax
   cpuid
   movl $output, %edi
   movl %ebx, 28(%edi)
   movl %edx, 32(%edi)
   movl %ecx, 36(%edi)

   movq $2, %rax
   movq $filename, %rdi
   movq $02101, %rsi
   movq $0644, %rdx
   syscall
   testq %rax, %rax
   js badfile
   
   movq %rax, %rbx

   movq $1, %rax
   movq %rbx, %rdi
   movq $output, %rsi
   movq $42, %rdx
   syscall

   testq %rax, %rax
   js badfile

   movq %rbx, %rdi
   movq $3, %rax
   syscall

badfile:
   movq %rax, %rdi
   movq $60, %rax
   syscall
