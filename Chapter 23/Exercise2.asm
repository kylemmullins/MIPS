## Exercise 2
	.text
	.globl main

main: 
	ori $v0,$0,30

# Accepts an integer in a0 and outputs the sqrt in v0
SquareRoot:
	move $t0,$v0	# t0 = input integer
	
	ori $t1,$0,0 	# counter
	
	
Loop:
	mul $t2,$t1,$t1 # square counter
	
	blt $t2,$t0, NextInt
	nop
	
	beq $t2,$t0, SetSquareRootResult	# found exact square root
	nop	
	
	# must be greater
	addu $t1,$t1,-1			# dec counter
	j SetSquareRootResult	# set result
	nop

NextInt:
	addu $t1,$t1,1	# inc counter
	j Loop
	nop
	
SetSquareRootResult:
	move $a0,$t1

	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
