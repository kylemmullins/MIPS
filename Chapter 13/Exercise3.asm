## Exercise 3
	.text
	.globl main

main: 
	ori $9,$0,0x7000
	sll $9,$9,16
	add $10,$9,$9
		
	ori $10,$0,0x7000 	#OVERFLOW 
	sll $10,$10,16
	add $10,$9,$9
	