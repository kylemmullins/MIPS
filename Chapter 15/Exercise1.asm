## Exercise 1
	.text
	.globl main

main: 
	lui $1,0x1000	# R1 holds base memory pointer
	lw $8,0($1)
	
	mult $8,$8 		# R9 = x^2
	mflo $9
	
	ori $10,$0,3	# R10 = 3x^2
	mult $9,$10
	mflo $10
	sll $0,$0,0		# no-op
	
	ori $11,$0,5 	# R11 = 5	
	mult $11,$8		# R12 = 5x
	mflo $12

	ori $13,$0,12 	# R13 = -12
	nor $13,$0,$13
	addi $13,$13,1
	
	addu $7,$10,$12 # R7 = 3x^2 + 5x - 12
	addu $7,$7,$13
	
	sw $7,0x04($1)
	
	
	
	.data
	
x:		.word 1
poly: 	.word 0

