## Exercise 
	.text
	.globl main

main: 
	
	lui $1,0x1000	# base memory pointer
	
	ori $2,$0,0	#counter
	
	ori $8,$0,0xFFFF	# min
	ori $9,$0,0			# max
	
	lw $20,0($1)	# end

FindMinMax:
	lw $3,4($1)	# R3 = current value
	sll $0,$0,0
	sll $0,$0,0
	
	slt $4,$3,$8 	# R4 = isLess
	bne $4,$0, SetMin	# is less
	sll $0,$0,0
	
	slt $5,$9,$3	# R5 = is more
	bne $5,$0, SetMax	# is more
	sll $0,$0,0	
	
	j NextElement
	sll $0,$0,0
	
SetMin:
	ori $8,$3,0
	j NextElement
	sll $0,$0,0

SetMax:
	ori $9,$3,0
	j NextElement
	sll $0,$0,0
	
NextElement:
	beq $2, $20, exit
	addiu $2,$2,1
	addiu $1,$1,4
	j FindMinMax
	sll $0,$0,0

exit:


	.data
size:   .word 8
array:  .word 23, -12, 45, -32, 52, -72, 8, 13
