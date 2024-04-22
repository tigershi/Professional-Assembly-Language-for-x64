# bubble.s - An example of the XCHG instruction
#build and output(编译和输出)
#as -o bubbletest.o bubbletest.s
#ld -o bubbletest bubbletest.o

.section .data
values:
.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
movl $values, %esi
movl $9, %ecx
movl $9, %ebx

loop:
movl (%esi), %eax
cmp %eax, 4(%esi)
jge skip
xchg %eax, 4(%esi)
movl %eax, (%esi)

skip:
add $4, %esi
dec %ebx
jnz loop
dec %ecx
jz end

movl $values, %esi
movl %ecx, %ebx
jmp loop

end:
movq $1, %rax
movq $0, %rbx
int $0x80
