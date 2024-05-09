# fileconvert.s - Memory map a file and convert it
# as fileconvert_x64.s convert_x64.s sizefunc_x64.s -o fileconvert_x64.o
# ld -o fileconvert_x64 fileconvert_x64.o
#./fileconvert_x64 cpuid2.txt

.code64
.section .bss
   .lcomm filehandle, 4
   .lcomm size, 8
   .lcomm mappedfile, 8
.section .text
.globl _start
_start:
    #get the file name and open it in read/write mode
   movl $2, %eax;//打开系统调用
   movq 16(%rsp), %rdi;//获取第一个参数，前两个是参数数量和程序名字
   movq $0102, %rsi;//读写访问权限
   movq $0644, %rdx;//644文件权限
   syscall
   test %eax, %eax
   js badfile
   movl %eax, filehandle;//保存到filehandle中
 
   # find the size of the file
   movl filehandle, %edi
   call sizefunc;//调用函数sizefunc
   movl %eax,size;//通过eax返回，并赋值给size中。

   # map file to memory uss syscall 9
   # 映射文件到内存中，void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
 
   movq $0,%rdi;//由系统分配内存空间
   movq size,%rsi;//长度length
   movq $3,%rdx;//prot是 PROT_READ | PROT_WRITE
   movq $1,%r10;// flags是MAP_SHARED，函数调用的第四个参数是rcx的，但是系统调用的话就是r10。
   movq filehandle,%r8;//句柄
   movq $0,%r9;//offset
   movq $9, %rax;//系统调用mmap
   syscall
   test %rax, %rax
   js badfile
   movq %rax, mappedfile;//文件句柄是指针类型

   ## convert the memory mapped file to all uppers
   # 将内存映射文件中的字符变为大写的
   movq mappedfile,%rdi
   movq size,%rsi
   call convert;//调用convert函数
   
   # use munmap to send the changes to the file syscall 11
   # 使用munmap将修改的文件同步到原来文件中。
   movl $11, %eax
   movq mappedfile, %rdi
   movq size, %rsi
   syscall
   test %eax, %eax
   jnz badfile

  # close the open file handle
  # 关闭文件句柄
   movl $3, %eax
   movl filehandle, %edi
   syscall
 
badfile:
   movl %eax, %edi
   movl $60, %eax
   syscall
