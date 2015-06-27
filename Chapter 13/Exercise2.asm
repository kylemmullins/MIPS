## Exercise 2
	.text
	.globl main

main: 
	or $8,$0,$0			# multiply by adding repeatedly
	addiu $8,$0,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	addiu $8,$8,0x1000
	
	ori $9,$0,0x1000	# multiply by shifting
	sll $9,$9,4
	
	ori $10,$0,0x1000	# multiply by adding successively higher values
	addu $10,$10,$10
	addu $10,$10,$10
	addu $10,$10,$10
	addu $10,$10,$10
	