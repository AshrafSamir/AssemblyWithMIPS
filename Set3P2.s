   # a MIPS program that takes an array of characters, then reverses it in memory and prints the reversed version.
# Author ...
# Ashraf Samir Ali
# 20170053


     .data     # variable declarations follow this line
			  arr:	  .byte '1','2','3','4','5','6','7','8','9','A' 	
  
     .text

	 .globl main

	 main:	#variables	
			addi $s3,$0,1	#const 1
			addi $s0, 0		#index 0
			addi $s1, 10	#size of the array
			addi $s2, 1		#size of char
			addi $t0, 0		#start
			addi $t1, 9 	#end
	 loop: 
		#if (start >= end) break;
	    bge  $t0, $t1, end_loop  
		#swap start with end
	    lb  $t3, arr($t0) 
		lb  $t4, arr($t1)

	    sb  $t4, arr($t0)
		sb  $t3, arr($t1)
		#start++ ,end--
		addi $t0, $t0, 1
		sub $t1, $t1, $s3

	    j    loop

	 end_loop:

	 #print arr
	 	 loop1: 
		 #if (i>=10) break;
	     bge  $s0, $s1, end_loop1  

		 #print
		 lb $a0, arr($s0)
		 li $v0, 11
		 syscall

		 #i++
		 addi $s0,$s0,1
		

	    j    loop1

	 end_loop1:

		   li $v0, 10
		   syscall
