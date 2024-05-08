# square.s - An example of a function that returns an integer value
.type square, @function
.globl square
square:
  movl %edi, %eax
  imull %eax, %eax
  ret
