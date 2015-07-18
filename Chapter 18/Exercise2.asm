## Exercise 2
	.text
	.globl main

main: 
	lui $8,0xFFFF
	ori $8,$8,0xFFFF
	
	ori $6,$0,0		# total number of significant bits
	ori $7,$0,1		# bit mask
		
	ori $1,$0,0		# counter
	ori $2,$0,32	# end	
	
loop:
	# get first significant bit from R8, put it in R9
	and $9,$8,$7
	
	# if R9 = 1, set total number to counter value
	bne $9,$7, continue	
	sll $0,$0,0
	addi $6,$1,1

continue:
	# right shift R8 by 1
	srl $8,$8,1
	
	beq $1,$2, exit # exit after 32 iterations
	
	j loop
	addiu $1,$1,1
	
exit: