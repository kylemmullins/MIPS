## Exercise 3
	.text
	.globl main

main: 
	ori $1,$0,0xFF00
	ori $2,$0,0x0000FFFF
	
	mult $1,$1
	mflo $3
	