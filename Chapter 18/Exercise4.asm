## Exercise 4
	.text
	.globl main

main: 
	lui $1,0x1000	# main memory module
	lw $2,0($1) 	# R2 = A
	lw $3,4($1) 	# R3 = B
	lw $4,8($1) 	# R4 = C
	sll $0,$0,0	
	
	ori $5,$0,1 	# true 
	
	# if B <= A <= C OR C <= A <= B
	slt $6,$3,$2
	slt $7,$2,$4
	and $8,$6,$7
	beq $8,$5, setA
	sll $0,$0,0
	
	slt $6,$2,$3
	slt $7,$4,$2
	and $8,$6,$7
	beq $8,$5, setA
	sll $0,$0,0
	
	# A = B
	beq $2,$3, setA
	sll $0,$0,0
	
next:	
	# if A <= B <= C OR C <= B <= A
	slt $6,$2,$3
	slt $7,$3,$4
	and $8,$6,$7
	beq $8,$5, setB
	sll $0,$0,0

	slt $6,$4,$3
	slt $7,$3,$2
	and $8,$6,$7
	beq $8,$5, setB
	sll $0,$0,0
	
	# if we got this far, C is the median
	j setC	
	sll $0,$0,0
	
setA:
	sw $2,0xC($1)
	j exit 
	sll $0,$0,0
	
setB: 
	sw $3,0xC($1)
	j exit 
	sll $0,$0,0
	
setC: 
	# if A <= C <= B OR B <= C <= A
	sw $4,0xC($1)
	j exit 
	sll $0,$0,0
	
exit:
	sll $0,$0,0
	
	.data
	
A:		.word 98
B:		.word 9
C: 		.word 9
median:	.word 0
