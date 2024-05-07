# syscalltest2.s - An example of getting a return value from a system call
#as -gstabs syscalltest2_x64.s -o syscalltest2_x64.o
# ld syscalltest2_x64.o -o syscalltest2_x6
.code64
.section .bss
   .lcomm pid, 8
   .lcomm uid, 8
   .lcomm gid, 8
.section .text
.globl _start
_start:
   movq $39, %rax
   syscall
   movq %rax, pid

   movq $102, %rax
   syscall
   movq %rax, uid

   movl $104, %eax
   syscall
   movq %rax, gid
end:
   movq $60, %rax
   movq $0, %rdi
   syscall
