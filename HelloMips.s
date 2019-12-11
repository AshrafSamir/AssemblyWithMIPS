# hello.s ... print "Hello, MIPS"

.data          # the data segment
	msg:   .asciiz "Hello, MIPS\n"

.text          # the code segment
	.globl main
	main:  
        la $a0, msg   # load the argument string
        li $v0, 4     # load the system call (print)
        syscall       # print the string
		
        jr $ra        # return to caller (__start)










		# start of function
FuncName:
   # function prologue
   #   set up stack frame ($fp, $sp)
   #   save relevant registers (incl. $ra)
   ...
   # function body
   #   perform computation using $a0, etc.
   #   leaving result in $v0
   ...
   # function epilogue
   #   restore saved registers (esp. $ra)
   #   clean up stack frame ($fp, $sp)
   jr  $ra