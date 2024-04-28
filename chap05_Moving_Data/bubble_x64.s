# bubble.s - An example of the XCHG instruction
#build and output(编译和输出)
#as -gstabs -o bubble_x64.o bubble_x64.s 
#ld -o cpuid_x64 cpuid_x64.o
#gdb -q bubble_x64
.code64
.section .data
values:
   .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
   movq $values, %rsi
   movq $9, %rcx
   movq $9, %rbx
loop:
   movl (%rsi), %eax
   cmp %eax, 4(%rsi)
   jge skip
   xchg %eax, 4(%rsi)
   movl %eax, (%rsi)
skip:
   addq $4, %rsi
   dec %rbx
   jnz loop
   dec %rcx
   jz end
   movq $values, %rsi
   movq %rcx, %rbx
   jmp loop
end:
  
# SYS_EXIT syscall
   movq $0, %rdi
   movq $60,%rax
   syscall

