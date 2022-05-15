# if statements with floats and doubles

.data
	num1: .float 2.17
	num2: .float 3.14
	
	message1: .asciiz "it was true\n"
	message2: .asciiz "it was false\n"
.text
	main:
		lwc1 $f0, num1
		lwc1 $f2, num2
		
		# Compare equal single precision : 
		# If $f0 is equal to $f1, 
		# set Coprocessor 1 condition flag 0 true else set it false
		c.eq.s $f0, $f2
		
		# Branch if FP condition flag 0 true (BC1T, not BCLT) :
		# If Coprocessor 1 condition flag 0 is true (one) 
		# then branch to statement at label's address
		bc1t exit
		
		li $v0, 4
		la $a0, message2
		syscall
	# syscall for end the program
	li $v0, 10
	syscall
	
	exit:
		li $v0, 4
		la $a0, message1
		syscall
	
	
	
	