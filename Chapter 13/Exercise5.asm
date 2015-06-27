## Exercise 5
	.text
	.globl main

main: 
	add $8,$0,1	# Variable x
		
	addu $10,$0,$8		# Calculate 13x
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	addu $10,$10,$8
	
	nor $11,$10,$0		# Also calculate -13x
	addu $11,$11,1
	
	