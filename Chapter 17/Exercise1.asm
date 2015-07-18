## Exercise 1
	.text
	.globl main

main: 
	ori $8,$0,0 	# counter
	ori $9,$0,0		# sum
	
sum: 
	add $9,$8,$9
	j sum
	addiu $8,$8,1
	