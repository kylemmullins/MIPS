## Exercise 
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	
	ori $2,$0,0		# counter	
	lw $20,0($1)	# end
	
Loop:
	beq $2, $20, exit

	lw $3,4($1)	# R3 = current element
	
NextElement:
	addiu $2,$2,1
	addiu $1,$1,4
	j Loop
	sll $0,$0,0

	
exit:
	sll $0,$0,0
	
        .data
size :  .word 7                     # number of elements
        .word 1, 2, 3, 4, 5, 6, 7