# pushpop.s - An example of using the PUSH and POP instructions
.code64
.section .data
data:
   .int 125

.section .text
.globl _start
_start:
   nop
   movl $24420, %ecx
   movw $350, %bx
   movb $100, %al
   #the x86_64 the push only 8 bytes
   pushq %rcx
   pushq %rbx
   pushq %rax
   movl  data, %edx
   pushq %rdx
   pushq $data

   popq %rax
   popq %rax
   popq %rax
   popq %rax
   popq %rax
   #pushaq `pushaq' is not supported in 64-bit mode
   #popad `popaq' is not supported in 64-bit mode
  movq $0, %rdi
   movq $60, %rax
   syscall
