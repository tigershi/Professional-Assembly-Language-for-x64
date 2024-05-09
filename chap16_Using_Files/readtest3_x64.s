# readtest3.s - An example of modifying data read from a file and outputting it
.section .bss
   .lcomm infilehandle, 4
   .lcomm outfilehandle, 4
   .lcomm size, 8
   .lcomm buffer, 10
.section .text
.globl _start
_start:
   # open input file, specified by the first command line param
   movq %rsp, %rbp
   movq $2, %rax
   movq 16(%rbp), %rdi
   movq $00, %rsi
   movq $0444, %rdx
   syscall
   test %eax, %eax
   js badfile
   movl %eax, infilehandle



# open an output file, specified by the second command line param
   movq %rsp, %rbp
   movq $2, %rax
   movq 24(%rbp), %rdi
   movq $02101, %rsi
   movq $0644, %rdx
   syscall
   test %eax, %eax
   js badfile
   movl %eax, outfilehandle


# read one buffer’s worth of data from input file
read_loop:
   movq $0, %rax
   movl infilehandle, %edi
   movq $buffer, %rsi
   movq $10, %rdx
   syscall
   testq %rax, %rax
   jz done
   js badfile
   movq %rax, size
   
# send the buffer data to the conversion function
   movq $buffer, %rdi
   movq size, %rsi
   call convert
   
# write the converted data buffer to the output file
   movq $1, %rax
   movl outfilehandle, %edi
   movq $buffer, %rsi
   movq size, %rdx
   syscall
   testq %rax, %rax
   js badfile
   jmp read_loop
done:
# close the output file
   movq $3, %rax
   movl outfilehandle, %edi
   syscall

# close the input file
   movq $3, %rax
   movl infilehandle, %edi
   syscall
   xorq %rax, %rax
badfile:
   movq %rax, %rdi
   movq $60, %rax
   syscall


# convert lower case letters to upper case
.type convert, @function
convert:
   movq %rsi, %rcx
   movq %rdi, %rsi
convert_loop:
   lodsb
   cmpb $0x61, %al
   jl skip
   cmpb $0x7a, %al
   jg skip
   subb $0x20, %al
skip:
   stosb
   loop convert_loop
ret
