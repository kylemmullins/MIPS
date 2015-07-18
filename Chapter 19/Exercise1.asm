## Exercise 1
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer	
	
	ori $8,$0,0		# counter	
	ori $10,$0,24	# end

loop:	
	sw $8,0($1)
	
	addiu $1,$1,4 	# increment base register by 4
		
	bne $8,$10, loop
	add $8,1 	# increment counter
	
exit: 
	sll $0,$0,0



	.data
arr:	.word 0