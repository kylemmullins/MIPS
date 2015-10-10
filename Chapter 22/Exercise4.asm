## Exercise 4
	.text
	.globl main

main: 
	li $t0,0x46	# F
	li $t1,0x43 # C
	li $t2,0x51 # Q
	li $t3,0	# Scale
	li $t4,0	# Temperature
	li $t5,0 	# Result
	
	li $t6,32
	li $t7,5
	li $t8,9

PromptForScale:
	li $v0,4
	la $a0,EnterScale
	syscall
	
	li $v0,8
	la $a0,Scale
	li $a1,2
	syscall
	
	lb $t3,0($a0)	# store scale

PromptForTemp:
	li $v0,4
	la $a0,EnterTemp
	syscall
	
	li $v0,5
	syscall
	
	move $t4,$v0	# store temp

ChooseConversion:
	beq $t3,$t0, ConvertToCelcius
	nop	
	beq $t3,$t1, ConvertToFahrenheit	
	nop
	beq $t3,$t2, exit # break on 'Q'
	nop
	j exit	# exit on invalid input
	nop
	
ConvertToCelcius:
	# C = (5/9)(F - 32)
	sub $t9,$t4,$t6
	mult $t9,$t7
	mflo $t9
	
	div $t9,$t8
	mflo $t5
	
	# Print temperature in Fahrenheit
	li $v0,4
	la $a0,CelciusTemp
	syscall	
	li $v0,1
	move $a0,$t5
	syscall	
	li $v0,4
	la $a0,C
	syscall
	
	j PromptForScale
	nop

ConvertToFahrenheit:
	# F = (9/5)C + 32
	mult $t8,$t4
	mflo $t5
	div $t5,$t7
	mflo $t5
	add $t5,$t5,$t6
	
	# Print temperature in Celsius
	li $v0,4
	la $a0,FahrenheitTemp
	syscall	
	li $v0,1
	move $a0,$t5
	syscall	
	li $v0,4
	la $a0,F
	syscall	
	
	j PromptForScale
	nop
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
EnterScale: 	.asciiz "\n\nEnter Scale: "
Scale:			.space	2
EnterTemp:		.asciiz "\nEnter Temperature: "
CelciusTemp:	.asciiz "Celsius Temperature: "
FahrenheitTemp: .asciiz "Fahrenheit Temperature: "
F:				.asciiz "F"
C:				.asciiz "C"
Q:				.asciiz "Q"
