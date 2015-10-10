## Exercise 3
	.text
	.globl main

main: 
	lw $a0, N
	lw $a1, K
	nop
	
# Input: N in a0, K in a1
# Result: NChooseK in v0
NChooseK:
	move $t0,$a0	# Load N
	move $t4,$a1	# Load K	
	
	move $t1,$t0		# counter (decrements)
	subu $t5,$t0,$t4	# (N - K + 1) as end
	addu $t5,$t5,1
	
	ori $t2,$0,1	# result
	
Loop:
	blt $t1,$t5,OutputNChooseK
	nop
	
	mul $t2,$t2,$t1	# multiply counter by running product
	
MoveNext: 
	addu $t1,$t1,-1	# dec counter
	j Loop
	nop
	
OutputNChooseK:
	move $a0,$t2
	
		
# Input: N in a1
# Result: Factorial in s0
Factorial:
	move $t8,$a1	# Load N
		
	move $t9,$t8	# counter (decrements)
	ori $t6,$0,1	# result
	
FactorialLoop:
	beq $t9,0,OutputFactorial
	nop
	
	mul $t6,$t6,$t9	# multiply counter by running product
	
FactorialMoveNext: 
	addu $t9,$t9,-1	# dec counter
	j FactorialLoop
	nop
	
OutputFactorial:
	move $s0,$t6


	divu $a0,$s0	# (N - K + 1)! / K!
	
	
exit:
	li      $v0,10      # code 10 == exit
    syscall             # Halt the program.


	.data
N:	.word	15
K:	.word 	5