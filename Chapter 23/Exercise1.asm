## Exercise 1
	.text
	.globl main

main: 
	ori $v0,$0,7

# Accepts an integer in v0 and outputs 0x1 in a0 if it is prime
IsPrime:
	move $t0,$v0	# t0 = input integer
	
	ori $t1,$0,2	# counter
	
	srl $t2,$t0,1	# upper limit
	addu $t2,$t2,1
	
	ori $t3,$0,1 	# result
	
Loop:
	beq $t1,$t2,OutputIsPrimeResult		

	beq $t0,$0, NotPrime	# 0 is not prime	
	beq $t0, 1, NotPrime	# 1 is not prime	
	nop
	
	#remu $t4,$t0,$t1	# get remainder
	divu $t0,$t1	# get remainder
	mfhi $t4
	
	beq $t4,$0, NotPrime 	# prime numbers do not divide evenly
	nop
	
MoveNext:
	addu $t1,$t1,1 	# inc counter
	j Loop
	nop
	
NotPrime: 
	ori $t3,$0,0	# set result to false
	
OutputIsPrimeResult:
	move $a0,$t3
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
