### saving Registers to the Stack

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
		
		#print the value of $s1 = 10
		li $v0, 1
		add $a0, $zero, $s1
		syscall
		
	# The end of program return 0
	li $v0, 10
	syscall
	
	increaseMyRegister:
		addi $sp, $sp, -4 # used 1 word = 4 bytes form stack
		sw $s1, 0($sp) # s1 = 10 stored in Stack $sp->0
		
		addi $s1, $s1, 20 # s1 = s1 + 20 = 30
		
		li $v0, 1 # print of the value of s1 = 30
		move $a0, $s1
		syscall
		
		lw $s1, 0($sp) # load word from stack to $s1
		addi $sp, $sp, 4 # free/restore the used stack 
		
		jr $ra