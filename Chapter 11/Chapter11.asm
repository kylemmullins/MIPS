## program to add two plus three
	.text
	.globl main

main: 
	#Chapter 11-1
	#ori		$8,$0,0x2	# put two's comp. two into register 8
	#ori 	$9,$0,0x3 	# put two's comp. three into register 9
	#addu	$10,$8,$9	# add registers 8 and 9, put the result in register 10
	
	#Chapter 11-6
	#ori 	$8,$0,0x0FA5
	#ori 	$10,$8,0x368F
	
	#Chapter 11-13
	ori		$15,$0,0x0FA5	# put bit pattern into R15
	ori		$8,$15,0x368F	# or a pattern and R15, put in R8
	andi 	$9,$15,0x368F 	# and a pattern and R15, put in R9
	xori	$10,$15,0x368F	# xor a pattern and R15, put in R10
	
	#jr $ra				# end execution
	
## End of file