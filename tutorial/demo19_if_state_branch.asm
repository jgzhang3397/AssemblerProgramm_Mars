# if statements branch

.data
	message1: .asciiz "The Numbers are equal."
	message2: .asciiz "The Numbers are different."
.text
	main:
		addi $t0, $zero, 20
		addi $t1, $zero, 20
	
		beq $t0, $t1, numbersEqual
		bne $t0, $t1, numbersDiff
		
	numbersEqual:
		li $v0, 4
		la $a0, message1
		syscall
		
		jal ende
	
	numbersDiff:
		li $v0, 4
		la $a0, message2
		syscall
		
		jal ende
	ende:
		li $v0, 10
		syscall
		
	
	
	
	
	
