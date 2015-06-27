## Exercise 4
	.text
	.globl main

main: 
	ori $8,$0,50
	ori $9,$0,25
	
	addu $6,$8,$8 	# mutiply R8 by 3
	addu $6,$6,$8
	
	sll  $7,$9,2	# multiply R9 by 5
	addu $7,$7,$9
	
	subu $10,$6,$7	# subtract
	
	