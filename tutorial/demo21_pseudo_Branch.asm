# pseudo Branch

.data
	message: .asciiz "Hello, World!"
.text
	main:
		addi $t0, $zero, 3
		addi $t1, $zero, 2
		
		# bgtz $t0, printMessage
		bgt  $t0, $t1, printMessage
		
	# end of the program
	li $v0, 10
	syscall
	
	printMessage:
		li $v0, 4
		la $a0, message
		syscall
		
	
	