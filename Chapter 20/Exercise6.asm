## Exercise 6
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	
	ori $2,$0,0		# counter	
	lw $20,0($1)	# end
	
	ori $5,$0,0 	# R5 = height sum
	ori $6,$0,0		# R6 = weight sum

PairAverage:
	beq $2, $20, ComputerAverage

	lw $3,4($1)	# R3 = height
	lw $4,8($1)	# R3 = weight
	sll $0,$0,0
	
	add $5,$5,$3	# add height to sum
	add $6,$6,$4	# add weight to sum
	
NextPair:	
	addiu $2,$2,1
	addiu $1,$1,8
	j PairAverage
	sll $0,$0,0

ComputerAverage:
	div $5,$20
	mflo $10
	sll $0,$0,0
	
	div $6,$20
	mflo $11

	.data
pairs:  .word 5                  # number of pairs
        .word 60, 90             # first pair: height, weight
        .word 65, 105
        .word 72, 256
        .word 68, 270
        .word 62, 115