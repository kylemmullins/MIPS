## Exercise 5
	.text
	.globl main

main: 
	
	lui $1,0x1000	# base memory pointer
	
	ori $2,$0,0		# counter	
	lw $20,0($1)	# end
	
	ori $5,$0,1 	# isAscending
		
IsIncreasingSeq:	
	#beq $20,$0, exit	# empty array	
	beq $2, $20, exit	
	sll $0,$0,0
	
	lw $3,4($1)	# R3 = current value	
	lw $4,0($1)	# R3 = left value	
	sll $0,$0,0
	sll $0,$0,0
		
	beq $2,$0 NextElement # is first element
	sll $0,$0,0
	
	slt $5,$4,$3
	
	beq $5,$0, exit		# array is not ascending	
	sll $0,$0,0
	
NextElement:	
	addiu $2,$2,1
	addiu $1,$1,4	
	j IsIncreasingSeq
	sll $0,$0,0

exit:



	.data
size:   .word 10
array:  .word 2, 4, 7, 12, 34, 36, 42, 43, 57, 78