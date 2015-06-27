## Exercise 3
	.text
	.globl main

main: 
	# Put 0xFFFFFFFF into R1
	ori $1,$0,0x01
	
	sll $2,$1,1		# Shift left and double in next instruction
	xor $1,$2,$1 	
	
	sll $2,$1,2
	xor	$1,$2,$1
	
	sll $2,$1,4
	xor	$1,$2,$1
	
	sll $2,$1,8
	xor	$1,$2,$1
	
	sll $2,$1,16
	xor	$1,$2,$1
	