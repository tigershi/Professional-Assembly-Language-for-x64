# sysinfo.s - Retrieving system information via kernel system calls
#as -gstabs sysinfo_x64.s -o sysinfo_x64.o
#ld sysinfo_x64.o -o sysinfo_x64
.section .data
result:
uptime:
   .long 0
load1:
   .long 0
load5:
   .long 0
load15:
   .long 0
totalram:
   .long 0
freeram:
   .long 0
sharedram:
   .long 0
bufferram:
   .long 0
totalswap:
   .long 0
freeswap:
   .long 0
procs:
   .short 0
totalhigh:
   .long 0
memunit:
   .int 0
.section .text
.globl _start
_start:
   nop
   movq $result, %rdi
   movq $99, %rax
   syscall

   movq $60, %rax
   movq $0, %rdi
   syscall
