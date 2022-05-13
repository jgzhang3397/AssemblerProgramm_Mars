# arrays with while loop

.data
	myArray: .space 12
	newLine: .asciiz "\n"
.text
	main: 
	addi $s0, $zero, 1
	addi $s1, $zero, 2
	addi $s2, $zero, 10
	
	# Index $t0 = 0
	addi $t0, $zero, 0
	
	# store the values to array
	sw $s0, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
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
