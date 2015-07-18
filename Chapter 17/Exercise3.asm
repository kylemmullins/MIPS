## Exercise 3
	.text
	.globl main

main: 
	ori $8,$0,0		# sum
	ori $9,$0,0		# counter
	ori $10,$0,100
	
sum:
	add $8,$8,$9
	beq $9,$10, exit
	j sum
	add $9,$9,1
exit:
	
