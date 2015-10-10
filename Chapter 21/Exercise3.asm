## Exercise 3
	.text
	.globl main

main: 
	ori $s0,$zero,1	# s0 = 1
	ori $s1,$zero,0x5b # upper case threshold
	
	la $t0,string1
	la $t1,string2
	
Loop:
	lb $t2,0($t0)	# t2 = letter in string1
	lb $t3,0($t1)	# t3 = letter in string2
	nop 
	nop
	nop
	
	slt $t6,$t2,$s1	# t2 is uppercase
	slt $t7,$t3,$s1	# t3 is uppercase
	
	# convert both chars to lower case
	bne $t6,$zero, ConvertSecondChar	# s2 is uppercase
	nop
	addiu $t2,$t2,-0x20
	
ConvertSecondChar:
	bne $t7,$zero, CharsAreSame	# s3 is uppercase
	nop
	addiu $t3,$t3,-0x20
	
CharsAreSame:
	bne $t2,$t3,exit # exit if the two chars are not the same
	
AreNull:
	slt $t4,$t2,$s0	# string1 points to NUL char
	slt $t5,$t3,$s0	# string2 points to NUL char
	
	beq $t4,$zero, NextElement # not last element in arrays	
	beq $t4,$t5, SameString	# both strings are the same length and have the same chars
	nop
	
NextElement:
	addiu $t0,$t0,1	# inc string1 index
	addiu $t1,$t1,1 # inc string2 index
	j Loop
	nop

SameString:
	nop
	ori $t9,$zero,1 # they are the same word
	sw $t9,result
	nop
	
	
exit:
	nop
	


	.data
result:  .word     0
string1: .asciiz   "PuffiN"
string2: .asciiz   "puFfin"