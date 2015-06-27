## Exercise 5
	.text
	.globl main

main: 
	ori $1,$0,0xFACE
	
	srl $3,$1,4		# Create 0xC000 mask
	sll $3,$3,28
	srl $3,$3,18
	
	srl $4,$1,12	# Create 0xF0 mask
	sll	$4,$4,4
	
	xor $2,$1,$3	# Apply 0xC000 mask
	or  $2,$2,$4	# Apply 0xF0 mask
	