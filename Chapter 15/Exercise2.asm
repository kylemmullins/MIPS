## Exercise 2 
## Evaluate: 17xy - 12x - 6y + 12
	.text
	.globl main

main: 
	lui $1,0x1000	# R1 is is the data pointer
	
	lw $2,0($1) 	# Put x in R2
	lw $3,4($1) 	# Put y in R3
	
	or $5,$0,17		# Calculate 17xy	
	mult $5, $2
	mflo $4			# R4 is the accumulator
	sll $0,$0,0
	sll $0,$0,0
	mult $4, $3
	mflo $4
	
	or $5,$0,12		# Calculate 17xy - 12x
	mult $2, $5
	mflo $5
	sub $4,$4,$5
	
	or $5,$0,6 		# Calculate 17xy - 12x - 6y
	mult $5,$3
	mflo $5
	sub $4,$4,$5
	
	addiu $4,$4,12	# Calculate 17xy - 12x - 6y + 12
	
	sw $4,0x08($1)
	

	.data

x:	.word 1
y: 	.word 1
answer:	.word 0

