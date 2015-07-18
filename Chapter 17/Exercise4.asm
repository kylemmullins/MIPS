## Exercise 4
	.text
	.globl main

main: 
	ori $8,$0,1		# current term
	ori $9,$0,1		# previous term
	ori $10,$0,0	# counter
	ori $11,$0,10
		
fib: 	
	add $7,$8,$9	# new term
	ori $9,$8,0		# swap old
	ori $8,$7,0		# swap new
	beq $10,$11, exit
	j fib
	add $10,$10,1
	
exit:
