## Exercise 1
	.text
	.globl main

main: 
	
	lui $1,0x1000
	
	lbu $2,0($1)
	lbu $3,1($1)
	lbu $4,2($1)
	lbu $5,3($1)
	lbu $6,4($1)
	
	ori $8,$0,5  # R8 = Total values
	
	add $7,$0,$2 # R7 = accumulator
	add $7,$7,$3
	add $7,$7,$4
	add $7,$7,$5
	add $7,$7,$6	
	div $7,$8
	mflo $7

	sw $7,8($1)

	.data
	
.byte   12
.byte   97
.byte  133
.byte   82
.byte  236
answer: .word 0
