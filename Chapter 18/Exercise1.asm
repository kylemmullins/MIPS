## Exercise 1
	.text
	.globl main

main: 
	ori $8,$0,0 	# sum of evens
	ori $9,$0,0	  	# sum of odds		
	ori $5,$0,1		# counter
	ori $7,$0,100	# end
	
loop:	
	add $9,$9,$5
	
	addiu $5,$5,1
	add $8,$8,$5	
	
	beq $5,$7, exit
	j loop
	addiu $5,$5,1	# increment counter
	
exit:
	add $10,$8,$9	# sum of all
