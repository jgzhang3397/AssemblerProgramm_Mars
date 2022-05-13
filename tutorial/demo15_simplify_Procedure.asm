### simplify program and nested Procedure

.data
	newline: .asciiz "\n"
.text
	main:
		addi $s1, $zero, 10
		
		jal increaseMyRegister
		
		#print newLine
		li $v0, 4
		la $a0, newline
		syscall
		
		jal printValue
		
	# The end of program return 0
	li $v0, 10
	syscall
	
	increaseMyRegister:
		
		addi $sp, $sp, -8 # used 2 words = 8 bytes form stack
		sw $s1, 0($sp) # s1 = 10 stored in Stack $sp->0
		sw $ra, 4($sp) # $ra will be stored in Stack $sp->4
		
		addi $s1, $s1, 20 # s1 = s1 + 20 = 30
		
		# nested Procedure
		jal printValue
		
		lw $s1, 0($sp) # load the word from stack $sp->0 to $s1
		lw $ra, 4($sp) # load the word form stack $sp->4 to $ra
		addi $sp, $sp, 8 # free/restore the used stack 
		
		jr $ra # go back itself not the main
		
	printValue:
	
		li $v0, 1
		move $a0, $s1
		syscall
		
		jr $ra