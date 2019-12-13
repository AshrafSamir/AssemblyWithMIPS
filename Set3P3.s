# for(i = 0; i < a; i++) 
#    for(j = i; j >= 0; j--) 
 #       C[i] *= j; 

# Author ...
# Ashraf Samir Ali
# 20170053


     .data     # variable declarations follow this line
			  arr:	  .word 0,1,2,3,4,5,6,7,8,9
  
     .text

	 .globl main

	 main:	#variables	
			addi $s3,$0,1	#const 1
			addi $s0, 0		#index 0 (i)
			addi $s1, 10	#size of the array
			addi $t1, 0
			

	 loop: 
		#if (i >= 10) break;
	    bge  $s0, $s1, end_loop  

		add $s2,$0, $s0     #index  (j=i)
		loop2: 
		#if (j < 0) break;
	    blt  $s2, $0, end_loop2  

		lw $t3, arr($t1)
		mul $t0, $t3 , $s2
		sw $t0, arr($t1)

		#j--
		sub $s2, $s2, $s3
	    j    loop2
	 end_loop2:

		#i++
		addi $s0, $s0, 1
		addi $t1,$t1, 4
	    j    loop
	 end_loop:


	 addi $t6, 0
	 addi $t5, 0
	 #print arr
	 	 loop1: 
		 #if (i>=10) break;
	     bge  $t6, $s1, end_loop1  

		 #print
		 lw $t4, arr($t5)
		 add $a0, $t4, $0
		 li $v0, 1
		 syscall

		 #i++
		 addi $t6,$t6,1
		 addi $t5,$t5,4
		

	    j    loop1

	 end_loop1:

		   li $v0, 10
		   syscall
