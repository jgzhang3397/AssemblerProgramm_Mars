# function arguments and return values

.data

.text
	main: 
		addi $a1, $zero, 20
		addi $a2, $zero, 10
		
		jal addNumbers
		
		# print result
		li  $v0, 1
		add $a0, $zero, $v1
		syscall
		
	
	# ende the cycle
	li $v0, 10
	syscall
	
	addNumbers:
		
		add $v1, $a1, $a2
		
		jr $ra

