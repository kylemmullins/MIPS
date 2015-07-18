## Exercise 3
	.text
	.globl main

main: 
	ori $8,$0,90	# temperature	
	ori $3,$0,0 	# temp is in allowed range
	
	ori $1,$0,1		# true
	
loop:
	slti $9,$8,81	# temp <= 80
	beq $9,$0, out
	sll $0,$0,0
	
	slti $9,$8,20	# temp >= 20
	beq $9,$1, out 
	sll $0,$0,0
	
	ori $3,$0,1		# in range
	
	slti $9,$8,60	# temp <= 60
	beq $9,$0, exit
	
	slti $9,$8,41	# temp <= 40
	beq $9,$0, out
	sll $0,$0,0	
	
	j exit 
	sll $0,$0,0
	
out: 	
	ori $3,$0,0 	# out of range
	j exit 
	sll $0,$0,0

exit:
	
