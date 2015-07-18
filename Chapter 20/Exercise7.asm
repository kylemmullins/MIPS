## Exercise 
	.text
	.globl main

main: 	
	lui $1,0x1000	# base memory pointer
	
	ori $3,$0,0		# counter	
	lw $20,0($1)	# end
	
	# init end of arra pointer
	lui $2,0x1000	# end of array pointer
	ori $22,$0,4
	mult $20,$22
	mflo $21
	add $2,$2,$21
	addiu $2,$2,-4
	
Reverse:
	beq $3, $20, exit
	lw $4,4($1)	# R3 = start element
	lw $5,4($2)	# R3 = end element
	
	beq $1,$2, exit # pointing at same elment in center
	
	slt $23,$2,$1
	bne $23,$0, exit	# all elements processed
	sll $0,$0,0
		
	sw $4,4($2)	# swap in memory
	sw $5,4($1)
	
NextElement:
	addiu $3,$3,1	# inc counter
	addiu $1,$1,4	# inc start pointer
	addiu $2,$2,-4	# dec end pointer 
	j Reverse
	sll $0,$0,0

	
exit:
	sll $0,$0,0

	.data        
size :  .word 7                    # number of elements
        .word 1, 2, 3, 4, 5, 6, 7