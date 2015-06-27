## Exercise 4
	.text
	.globl main

main: 
	ori	$1,$0,0x5555 # Put 0x55555555 in R1
	sll $1,$1,16
	ori $1,$1,0x5555
	
	sll $2,$1,1
	
	or	$3,$2,$1
	and	$4,$2,$1
	xor $5,$2,$1
	
	