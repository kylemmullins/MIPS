## Exercise 2
	.text
	.globl main

main: 
		
	ori $s0,$0,0	# init counter
	lw $s1,size		# end
	
	la $t6,array1
	la $t7,array2
	la $t5,result
	
Loop:
	beq $s0, $s1, exit

	lw $t1,0($t6)  # t1 = element of array1
	lw $t2,0($t7)  # t2 = element of array2
	nop
	
	add $t3,$t1,$t2
	sw $t3,0($t5)
	
NextElement:
	addiu $s0,$s0,1	# inc counter
	addiu $t6,$t6,4	# inc array1 index
	addiu $t7,$t7,4	# inc array2 index
	addiu $t5,$t5,4	# inc result index
	j Loop
	nop

	
exit:
	nop
	
	
	




	.data
size:     .word       7
array1:  .word     -30, -23, 56, -43, 72, -18, 71
array2:  .word      45,  23, 21, -23, -82,  0, 69
result:  .word       0,   0,  0,   0,   0,  0,  0