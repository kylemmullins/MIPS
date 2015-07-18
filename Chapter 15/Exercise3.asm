## Exercise 3
## Evaluate: 6x^3 - 3x^2 + 7x + 2
	.text
	.globl main

main: 
	lui $1,0x1000	# R1 is base memory pointer
	
	lw $2,0($1)		# R2 = x
	
	ori $3,$0,6		# R3 = accumulator
	mult $3,$2	
	mflo $3
	sll $0,$0,0
	
	addiu $3,$3,-3	
	
	mult $3,$2
	mflo $3
	sll $0,$0,0	
	
	addiu $3,$3,7
	
	mult $3,$2
	mflo $3
	sll $0,$0,0
	
	addiu $3,$3,2

	.data
	
x: 	.word -1