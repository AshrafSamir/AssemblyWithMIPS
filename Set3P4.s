# int main() {
# ...
# t1 = fact(8);
# t2 = fact(3);
# t3 = t1 + t2;
# ...
# }
# int fact(int n) {
# int i, result = 1;
# for (i = n; i > 1; i--)
# result  = result * i;
# return result;
# }


# Author ...
# Ashraf Samir Ali
# 20170053


     .data     
			  
  
     .text

	 .globl main

	 main:		
		#FIRST	CALL WITH argument 8
		addi $a1,$0, 8
		jal fac
		move $t1, $v0
		#SECOND	CALL WITH argument 3
		addi $a1,$0, 3
		jal fac
		move $t2, $v0
		#print t1 + t2
		li $v0, 1
		add $a0, $t1, $t2
		syscall

		#return
		li $v0, 10
		syscall

	 fac:
		
		add $s0, $0, $a1				# i = n
		addi $t0,$0, 1					# c = 1
		addi $v0,$0, 1					# result = 1
		loop:
	
			ble $s0, $t0, end_loop	#if(i=<1)break;

			mul $v0, $v0, $s0		#result*=i

			sub $s0, $s0, $t0		#i--
			j loop

		end_loop:
			jr $ra					#return
			


