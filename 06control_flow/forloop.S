#for test
#build and run
#as -o forloop.o forloop.S 
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o forloop -lc forloop.o
#./forloop

.section .data
  output:
   .asciz "the value is %d \n"

.section .text
.globl _start
_start:
nop
movq $0, %rbx

for:
cmp $10, %rbx
jle forcode
jmp for_end
forcode:
movq $output, %rdi
movq %rbx, %rsi
call printf
inc %rbx
jmp for
for_end:

movq $1, %rax
movq $0, %rbx
int $0x80
