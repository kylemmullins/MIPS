## Exercise 2
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
	
	li $t3,100	# multiply by 100 store in t0
	mult $t3,$v0 
	mflo $t0	
		
	# Prompt for gallons consumed, store in t1
	li $v0,4
	la $a0,GallonsPrompt
	syscall
	
	li $v0,5	# read input
	syscall
	
	move $t1,$v0 # store in t1
	
	# Calculate mpg 
	div $t0,$t1 
	mflo $t2
	div $t2,$t3	# div answer by 100
	mflo $t4	# whole  
	mfhi $t5	# hundredths
	
	# display result
	li $v0,4
	la $a0,MPG
	syscall	
	
	li $v0,1	# print whole
	move $a0,$t4
	syscall
	
	li $v0,4	# print period
	la $a0,Period
	syscall
	
	li $v0,1	# print whole
	move $a0,$t5
	syscall
	
	j Prompt # repeat
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
MilesPrompt:	.asciiz "\nHow many miles were traveled? "
GallonsPrompt:	.asciiz "How many gallon consumed? "
MPG:			.asciiz "MPG: "
Period:			.asciiz "."