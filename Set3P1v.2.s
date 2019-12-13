   # 
   # if (g >= h)
   #	g++;
   #  else 
   #    g--;

# Author ...
# Ashraf Samir Ali
# 20170053


     .data     # variable declarations follow this line
              output: .asciiz "Enter number:\n"
			  result: .asciiz "Answer : "
  
     .text

	 .globl main

	 main:	#variables	
			addi $s0, 0
			addi $s1, 0
			addi $t0, 1
			#print on screen
			li $v0, 4
			la $a0, output
			syscall
			#take input
			li $v0, 5
			syscall 
			add $s0,$s0,$v0
			#same
			li $v0, 4
			la $a0, output
			syscall
			#same
			li $v0, 5
			syscall
			add $s1,$s1,$v0
			#condition if g > h
			bge $s0, $s1, if
			#branch
			b else
			#return
			li $v0, 10
			syscall

	  if:
			addi $s0,$s0, 1
			
			li $v0, 4
			la $a0, result
			syscall
			#print integer
			li $v0 , 1
			move $a0, $s0
			syscall

			li $v0, 10
			syscall

	  else:
			sub $s0,$s0, $t0

			li $v0, 4
			la $a0, result
			syscall
			#print integer
			li $v0 , 1
			move $a0, $s0
			syscall

	  li $v0, 10
	  syscall
