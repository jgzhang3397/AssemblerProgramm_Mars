# if statements branch

.data
	message1: .asciiz "The Numbers are equal."
	message2: .asciiz "The Numbers are different."
.text
	main:
		addi $t0, $zero, 2
		addi $t1, $zero, 20
	
		beq $t0, $t1, numbersEqual
		bne $t0, $t1, numbersDiff
	
		# system call to end the Program
		li $v0, 10
		syscall
		
	numbersEqual:
		li $v0, 4
		la $a0, message1
		syscall
		
		li $v0, 10
		syscall
	
	numbersDiff:
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 10
		syscall
		
	
	
	
	
	