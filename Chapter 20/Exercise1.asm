## Exercise 1
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	

	ori $2,$0,0		# counter	
ToLowerCase:
	lb $3,0($1)		# R3 = current character 
	sll $0,$0,0
	sll $0,$0,0
	
	beq $3,$0, exit		# exit on nul char
	
	addiu $3,$3,0x20	# convert char to lowercase	
	sb $3,0($1)		# put char back in memory
	sll $0,$0,0
	
nextCharacter:
	addiu $2,$2,1	# inc counter
	addiu $1,$1,1	# inc memory pointer
	j ToLowerCase
	sll $0,$0,0
	
	
exit:
	sll $0,$0,0
	
	
	.data
string:   .asciiz    "ABCDEFG"