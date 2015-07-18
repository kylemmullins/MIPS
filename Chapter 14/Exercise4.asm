## Exercise 4
	.text
	.globl main

main: 
	ori $1,$0,0x186A # R1 = x = 1600000 
	#sll $1,$1,8
	
	ori $2,$0,0x1388 # R2 = y = 80000
	#sll $2,$2,4
	
	ori $3,$0,0x61A8 # R2 = y = 400000
	#sll $3,$3,4
	
	
	mult $1,$2
	mflo $4
	sll $0,$0,0
	sll $0,$0,0
	
	div $4,$3
	mflo $4
	sll $4,$4,8
	