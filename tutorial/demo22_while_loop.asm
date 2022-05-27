# while loop

.data
	message: .asciiz "after the while loop is done"
	space: 	 .asciiz ","
.text
	main:
		# i = 0
		addi $t0, $zero, 1
		
		while:
			bgt $t0, 10, exit
			
			jal printNumbers
			addi $t0, $t0, 1 # i++
			
			j while
		
		exit:
			li $v0, 4
			la $a0, message
			syscall
		
		# end of the program
		li $v0, 10
		syscall
	
	printNumbers:
		# print number i = 1 2 3 . . .
		li $v0, 1
		addi $a0, $t0, 0
		syscall
		
		# print space , , ,
		li $v0, 4
		la $a0, space
		syscall
	
		jr $ra
		
	
	
		
	
	