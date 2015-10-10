## Exercise 
	.text
	.globl main

main: 
	#lui $t0,0x1000	# base memory pointer
		
	lw $s0,x
	lw $s1,a
	lw $s2,B
	lw $s3,c
	lw $s4,d
	sll $0,$0,0
	
	mult $s0,$s1
	mflo $t0	
	add $t0,$t0,$s2	# add b
	
	mult $s0,$t0
	mflo $t0
	add $t0,$t0,$s3	# add c
	
	mult $s0,$t0
	mflo $t0
	add $t0,$t0,$s4 # add d
	
	sw $t0,result


	.data
x:      .word    7
a:      .word   -3
B:      .word    3
c:      .word    9
d:      .word  -24
result: .word    0