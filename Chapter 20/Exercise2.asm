## Exercise 2
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	

	ori $2,$0,0		# R2 = counter	
	ori $4,$0,0x20	# R4 = space number
	ori $7,$0,0x60	# R7 = lower case threshold
	ori $8,$0,0x21 	# R8 = space threshold
	
	# This starts as true so the first letter is capitalized
	ori $5,$0,1		# R5 = previousCharWasSpace	
	
	
CapitalizeFirst:
	lb $3,0($1)		# R3 = current character 
	sll $0,$0,0
	sll $0,$0,0
	beq $3,$0, exit		# end on NUL char
	
	slt $9,$3,$8 		# R9 = current char is space
	
	beq $5,$0, nextCharacter 	# does not follow space	
	sll $0,$0,0
	
	beq $3,$4, nextCharacter 	# is a space char
	sll $0,$0,0
		
	slt $6,$7,$3	# R6 = isLowerCase	
	beq $6,$0, nextCharacter	# is not lowercase
	sll $0,$0,0
	
ToUpper:
	addiu $3,$3,-0x20	# convert char to uppercase
	sb $3,0($1)

nextCharacter:
	addiu $2,$2,1	# inc counter
	addiu $1,$1,1	# inc memory pointer
	ori $5,$9,0	# set R5
	j CapitalizeFirst
	sll $0,$0,0

	
exit:

	.data
string:   .asciiz    "in a  hole in the   ground there lived a hobbit"