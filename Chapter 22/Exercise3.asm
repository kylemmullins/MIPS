## Exercise 3
	.text
	.globl main

main: 
	
	# Read integer from input as string
	li $v0,4	# print prompt
	la $a0,PromptForInteger
	syscall
	
	li $v0,8	# read input
	la $a0,InputBuffer
	li $a1,32
	syscall
	
	li $t0,0	# result
	li $t1,10	# base	
		
ConvertNextCharacter:
	lb $t5,0($a0)	# t5 = current char
	nop	
	nop	
	beq $t5,$t1,PrintResult	# exit on EOL	
	nop
	
	addiu $t2,$t5,-0x30	# convert the digit into an integer D
	mult $t0,$t1		# t4 = value * 10
	mflo $t4
	add $t0,$t4,$t2		# value = value * 10 + D

MoveToNextCharacter:
	addiu $a0,$a0,1
	j ConvertNextCharacter
	nop

PrintResult:
	li $v0,1
	move $a0, $t0
	syscall	
	
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.

	.data
PromptForInteger:	.asciiz "\nPlease enter a positive integer: "
InputBuffer:		.space 32
