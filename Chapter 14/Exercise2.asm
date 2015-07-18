## Exercise 2
	.text
	.globl main

main: 
	ori $1,$0,0		# R1 = x
	add $1,$0,-4
	
	ori $2,$0,3 	# R2 = 3x + 7
	mult $2,$1
	mflo $2
	addi $2,$2,7
	
	ori $3,$0,2		# R3 = 2x + 8
	mult $3,$1
	mflo $3
	addi $3,$3,8
	sll $0,$0,0
	
	div $2,$3	# (3x+7) / (2x+8)
	
		
	