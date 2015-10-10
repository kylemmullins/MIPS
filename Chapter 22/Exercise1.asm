## Exercise 1
## Write a program that repeatedly prompts the user for the number of miles traveled and the 
## gallons of gasoline consumed, and then prints out the miles per gallon. Use integer math. 
## Exit when the user enters 0 for the number of miles.
	.text
	.globl main

main: 
	
Prompt:
	# Prompt for miles traveled, and store in t0
	li $v0,4
	la $a0,MilesPrompt
	syscall
	
	li $v0,5	# read input
	syscall
		
	beq $v0,$zero,exit # exit if 0
	
	move $t0,$v0	# store in t0
		
	# Prompt for gallons consumed, store in t1
	li $v0,4
	la $a0,GallonsPrompt
	syscall
	
	li $v0,5	# read input
	syscall
	
	move $t1,$v0 # store in t1
	
	# Calculate mpg, store in t2
	div $t0,$t1
	mflo $t2
	
	# display result
	li $v0,4
	la $a0,MPG
	syscall	
	li $v0,1
	move $a0,$t2
	syscall
	
	j Prompt # repeat
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
MilesPrompt:	.asciiz "\nHow many miles were traveled? "
GallonsPrompt:	.asciiz "How many gallon consumed? "
MPG:			.asciiz "MPG: "