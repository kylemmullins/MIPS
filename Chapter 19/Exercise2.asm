## Exercise 2
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	lw $8,0($1) 	# possible perfect number
	
	ori $12,$0,0	# divisor sum	
	
	# Put divisors in array
	ori $11,$0,1 	# counter	
StoreDivisors:
	beq $11,$8, IsPerfectNumber
	
	div $8,$11
	mfhi $12
	
	bne $12,$0, NextPossibleDivisor # not a divisor
	sll $0,$0,0	
	add $12,$12,$11	
NextPossibleDivisor: 
	add $11,$11,1	
	j StoreDivisors
	sll $0,$0,0
	

	
IsPerfectNumber:
	ori $9,$0,0		# Result of IsPerfectNumber
	bne $8,$11, exit
	sll $0,$0,0
	ori $9,$0,1		# true	
	
exit:


	.data
PerfectNum:	.word 6
Result:		.word 0
Divisors: 	.word 0
