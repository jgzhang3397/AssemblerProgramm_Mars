# my first Procedure

.data
	message: .asciiz "hi everyone!\nmy name is Jingang\n"
.text
	main:
		jal printMessage
		
		addi $s0, $zero, 5
		
		# print 5
		li $v0, 1
		add $a0, $zero, $s0
		syscall
		
	
	# tell the system that the program is done! or died cycle
	li $v0, 10
	syscall
	
	printMessage:
		li $v0, 4
		la $a0, message
		syscall 
		
		jr $ra # go back to main

	
