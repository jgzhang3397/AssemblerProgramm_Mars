# slt: shift less then

.data
	message1: .asciiz "the number is less than other."
	message2: .asciiz "the number is equal to other."
	message3: .asciiz "the number is more than other."
.text
	main:
		addi $t0, $zero, 3
		addi $t1, $zero, 2
		
		# if $t0 < $t1 set $s0 == 1, other == 0
		slt $s0, $t0, $t1
		
		bne $s0, $zero, printMessage1
		beq $t0, $t1, 	numbersEqual
		
		li $v0, 4
		la $a0, message3
		syscall
		
		# end of the program
		li $v0, 10
		syscall
	
	printMessage1:
		li $v0, 4
		la $a0, message1
		syscall
		
		li $v0, 10
		syscall
	
	numbersEqual:
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 10
		syscall
	
	
	
	
	