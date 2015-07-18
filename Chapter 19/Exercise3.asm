## Exercise 3
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer	

	ori $15,$0,2	# outer loop counter
	ori $16,$0,496 	# end	
PerfectNumberSearch:

	# Put divisors in array
	ori $11,$0,1 	# counter
	ori $13,$0,0	# divisor sum
StoreDivisors:
	beq $11,$15, IsPerfectNumber
	
	div $15,$11
	mfhi $12
	
	bne $12,$0, NextPossibleDivisor # not a divisor
	sll $0,$0,0	
	add $13,$13,$11	
NextPossibleDivisor: 
	add $11,$11,1	
	j StoreDivisors
	sll $0,$0,0	
	
IsPerfectNumber:
	ori $9,$0,0		# Result of IsPerfectNumber
	bne $15,$13, NextPerfectNumber
	sll $0,$0,0
	ori $9,$0,1		# true	
	sw $15,0($1)
	addiu $1,$1,4	# increment memory pointer
	
	
NextPerfectNumber:
	beq $15,$16, exit
	sll $0,$0,0
	
	addiu $15,$15,1	
	j PerfectNumberSearch
	sll $0,$0,0
	
exit:
	sll $0,$0,0

	.data
Divisors: 	.word 0
