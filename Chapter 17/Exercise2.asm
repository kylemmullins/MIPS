## Exercise 2
	.text
	.globl main

main: 
	ori $8,$0,1
	
sum: 
	addu $8,$8,$8
	j sum
	sll $0,$0,0
	
	
	
	
