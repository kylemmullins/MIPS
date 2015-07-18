## Exercise 4
## Evaluate: ax^3 + bx^2 + cx + d
	.text
	.globl main

main: 
	lui $1,0x1000 # R1 is the base memory pointer
	
	lw $2,0x00,($1) # R2 = x
	lw $3,0x04,($1) # R3 = a
	lw $4,0x08,($1) # R4 = b
	lw $5,0x0C,($1) # R5 = c
	lw $6,0x10,($1) # R6 = d
	
	or $7,$0,$3 	# R7 = accumulator	
	mult $7,$2		
	mflo $7
	sll $0,$0,0
	
	add $7,$7,$4	
	mult $7,$2
	mflo $7
	sll $0,$0,0
	
	add $7,$7,$5
	mult $7,$2
	mflo $7
	sll $0,$0,0
	
	add $7,$7,$6


	.data
x:     .word    1
a:     .word   -3
b:     .word    3
c:     .word    9
d:     .word  -24
