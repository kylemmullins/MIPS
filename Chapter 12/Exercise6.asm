## Exercise 6
	.text
	.globl main

main: 
	ori $1,$0,0xDEC0
	sll $1,$1,16
	ori $1,$1,0xDED0
	
	#Copy each nibble into a register
	andi $3,$1,0x000F	# nibble 1, place all 1's in correct nibble
	sll  $3,$3,28		# shift into final position
	andi $4,$1,0x00F0	# nibble 2
	sll	 $4,$4,20	
	andi $5,$1,0x0F00	# nibble 3
	sll  $5,$5,12
	andi $6,$1,0xF000	# nibble 4
	sll  $6,$6,4
	
	ori $7,$0,0x000F	# nibble 5, place all 1's in correct nibble
	sll $7,$7,16		# shift to correct position
	and $7,$1,$7		# copy nibble from R1
	srl $7,$7,4			# shift into final position
	
	ori $8,$0,0x00F0	# nibble 6
	sll $8,$8,16
	and $8,$1,$8
	srl $8,$8,12

	ori $9,$0,0x0F00	# nibble 7
	sll $9,$9,16
	and $9,$1,$9
	srl $9,$9,20
	
	ori $10,$0,0xF000	# nibble 8
	sll $10,$10,16
	and $10,$1,$10
	srl $10,$10,28
	
	# Load all nibbles into R2
	or $2,$0,$3
	or $2,$2,$4
	or $2,$2,$5
	or $2,$2,$6
	or $2,$2,$7
	or $2,$2,$8
	or $2,$2,$9
	or $2,$2,$10
	