# arrays Initializer

.data
	myArray: .word 100:3 # 3 elements, every elements is initialized 100
	newLine: .asciiz "\n"
.text
	main: 
	
	# clear $t0 = 0
	addi $t0, $zero, 0
	
	while:
		beq $t0, 12, exit
		
		lw $t4, myArray($t0)
		
		addi $t0, $t0, 4
		
		# print the number
		li $v0, 1
		move $a0, $t4
		syscall
		
		# print the newline
		li $v0, 4
		la $a0, newLine
		syscall
		
		j while
	exit:
		# end the program
		li $v0, 10
		syscall
