## Exercise 
	.text
	.globl main

main: 
	lui $1,0x1000	# base memory pointer
	ori $4,$1,0		# dest pointer
	
	ori $2,$0,0		# R2 = counter	
	ori $5,$0,0x20	# R5 = space

RemoveSpaces:
	lb $3,0($1)		# R3 = current character 
	sll $0,$0,0
	sll $0,$0,0	
	
	sb $3,0($4)
	
	beq $3,$5, NextCharacter # current character is a space
	sll $0,$0,0		
		
	addiu $4,$4,1	# inc dest pointer
	
NextCharacter:
	beq $3,$0, exit		# end on NUL char
	addiu $2,$2,1	# inc counter
	addiu $1,$1,1	# inc memory pointer
	j RemoveSpaces
	sll $0,$0,0

	
exit:


	.data
#string:  .asciiz    "aaaa bbbb  cccc   dddd    eeee"
string:   .asciiz    "Is  this a dagger    which I see before me?"
